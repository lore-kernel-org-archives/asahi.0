Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE363A8
	for <asahi@lists.linux.dev>; Wed, 30 Nov 2022 13:57:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id EDB9368AFE; Wed, 30 Nov 2022 14:57:49 +0100 (CET)
Date: Wed, 30 Nov 2022 14:57:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Pankaj Raghav <pankydev8@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH 2/9] nvme: use nvme_wait_ready in nvme_shutdown_ctrl
Message-ID: <20221130135749.GA4786@lst.de>
References: <20221129132208.4337-1-hch@lst.de> <20221129132208.4337-3-hch@lst.de> <20221129155718.poqztp4zudt47zmq@quentin>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129155718.poqztp4zudt47zmq@quentin>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 29, 2022 at 04:57:18PM +0100, Pankaj Raghav wrote:
> The timeout_jiffies calculation in nvme_shutdown_ctrl is:
> unsigned long timeout = jiffies + (ctrl->shutdown_timeout * HZ);
> 
> Aren't we changing the timeout with this change to something
> different compared to what it was before for shutdown?

Indeed.  the timeout fields in the spec are in a different granularity
than the shutdown_timeout field.  This version should fix that:

---
From 2f862232c4428d57dcfdc3b332866a9b2743711d Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Wed, 16 Nov 2022 08:54:26 +0100
Subject: nvme: use nvme_wait_ready in nvme_shutdown_ctrl

Refactor the code to wait for CSTS state changes so that it can be reused
by nvme_shutdown_ctrl.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 7961e146bbb163..03b2e34dcf7249 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2252,16 +2252,17 @@ static const struct block_device_operations nvme_bdev_ops = {
 	.pr_ops		= &nvme_pr_ops,
 };
 
-static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 timeout, bool enabled)
+static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 mask, u32 val,
+		u32 timeout, const char *op)
 {
-	unsigned long timeout_jiffies = ((timeout + 1) * HZ / 2) + jiffies;
-	u32 csts, bit = enabled ? NVME_CSTS_RDY : 0;
+	unsigned long timeout_jiffies = jiffies + timeout * HZ;
+	u32 csts;
 	int ret;
 
 	while ((ret = ctrl->ops->reg_read32(ctrl, NVME_REG_CSTS, &csts)) == 0) {
 		if (csts == ~0)
 			return -ENODEV;
-		if ((csts & NVME_CSTS_RDY) == bit)
+		if ((csts & mask) == val)
 			break;
 
 		usleep_range(1000, 2000);
@@ -2270,7 +2271,7 @@ static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 timeout, bool enabled)
 		if (time_after(jiffies, timeout_jiffies)) {
 			dev_err(ctrl->device,
 				"Device not ready; aborting %s, CSTS=0x%x\n",
-				enabled ? "initialisation" : "reset", csts);
+				op, csts);
 			return -ENODEV;
 		}
 	}
@@ -2297,8 +2298,8 @@ int nvme_disable_ctrl(struct nvme_ctrl *ctrl)
 
 	if (ctrl->quirks & NVME_QUIRK_DELAY_BEFORE_CHK_RDY)
 		msleep(NVME_QUIRK_DELAY_AMOUNT);
-
-	return nvme_wait_ready(ctrl, NVME_CAP_TIMEOUT(ctrl->cap), false);
+	return nvme_wait_ready(ctrl, NVME_CSTS_RDY, 0,
+			       (NVME_CAP_TIMEOUT(ctrl->cap) + 1) / 2, "reset");
 }
 EXPORT_SYMBOL_GPL(nvme_disable_ctrl);
 
@@ -2363,14 +2364,13 @@ int nvme_enable_ctrl(struct nvme_ctrl *ctrl)
 	ret = ctrl->ops->reg_write32(ctrl, NVME_REG_CC, ctrl->ctrl_config);
 	if (ret)
 		return ret;
-	return nvme_wait_ready(ctrl, timeout, true);
+	return nvme_wait_ready(ctrl, NVME_CSTS_RDY, NVME_CSTS_RDY,
+			       (timeout + 1) / 2, "initialisation");
 }
 EXPORT_SYMBOL_GPL(nvme_enable_ctrl);
 
 int nvme_shutdown_ctrl(struct nvme_ctrl *ctrl)
 {
-	unsigned long timeout = jiffies + (ctrl->shutdown_timeout * HZ);
-	u32 csts;
 	int ret;
 
 	ctrl->ctrl_config &= ~NVME_CC_SHN_MASK;
@@ -2379,22 +2379,8 @@ int nvme_shutdown_ctrl(struct nvme_ctrl *ctrl)
 	ret = ctrl->ops->reg_write32(ctrl, NVME_REG_CC, ctrl->ctrl_config);
 	if (ret)
 		return ret;
-
-	while ((ret = ctrl->ops->reg_read32(ctrl, NVME_REG_CSTS, &csts)) == 0) {
-		if ((csts & NVME_CSTS_SHST_MASK) == NVME_CSTS_SHST_CMPLT)
-			break;
-
-		msleep(100);
-		if (fatal_signal_pending(current))
-			return -EINTR;
-		if (time_after(jiffies, timeout)) {
-			dev_err(ctrl->device,
-				"Device shutdown incomplete; abort shutdown\n");
-			return -ENODEV;
-		}
-	}
-
-	return ret;
+	return nvme_wait_ready(ctrl, NVME_CSTS_SHST_MASK, NVME_CSTS_SHST_CMPLT,
+			       ctrl->shutdown_timeout, "shutdown");
 }
 EXPORT_SYMBOL_GPL(nvme_shutdown_ctrl);
 
-- 
2.30.2

