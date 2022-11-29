Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEAC322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GRzLf+gJoOWMucHJbkoYafl/ZNcaBs6KXR+V6AKah+Q=; b=HxWyH7KdZhdW82uQL8PfJwK8bq
	kgkThLOjnI/DNd5hBlbzlP+QMqVPUAqZ/h5FUN3/RUp7v1TWkQ9gKigVKQF3ShzNNCD5SWDcymSEG
	NVYTIBCjFw4rIMStVheQb5oZKNbn0GM1dddduDjwwi7bo3Y3Yi0SN23CO7hgzu8S0xlbP1XlLRmra
	9ILpjxfy/yLvS4LTo9ZZu8to5RQQe5HkHkThTgGun6sGZfBrwxkso2So6QPM3slM47guwpOd8tOa8
	bAR+Ot7mqeQAZDd5/0lqunLAVijSZ0QxyUsY5Dftf8RiHXSMGDUJ0iFKwG0ZxN7An8YbrhqiwYSgk
	KtyNqSTA==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00Z0-008lX6-CN; Tue, 29 Nov 2022 13:22:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 2/9] nvme: use nvme_wait_ready in nvme_shutdown_ctrl
Date: Tue, 29 Nov 2022 14:22:01 +0100
Message-Id: <20221129132208.4337-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221129132208.4337-1-hch@lst.de>
References: <20221129132208.4337-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Refactor the code to wait for CSTS state changes so that it can be reused
by nvme_shutdown_ctrl.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 02cc8dfc9f0b59..9f20af2406dcc8 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2260,16 +2260,17 @@ static const struct block_device_operations nvme_bdev_ops = {
 	.pr_ops		= &nvme_pr_ops,
 };
 
-static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 timeout, bool enabled)
+static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 mask, u32 val,
+		u32 timeout, const char *op)
 {
 	unsigned long timeout_jiffies = ((timeout + 1) * HZ / 2) + jiffies;
-	u32 csts, bit = enabled ? NVME_CSTS_RDY : 0;
+	u32 csts;
 	int ret;
 
 	while ((ret = ctrl->ops->reg_read32(ctrl, NVME_REG_CSTS, &csts)) == 0) {
 		if (csts == ~0)
 			return -ENODEV;
-		if ((csts & NVME_CSTS_RDY) == bit)
+		if ((csts & mask) == val)
 			break;
 
 		usleep_range(1000, 2000);
@@ -2278,7 +2279,7 @@ static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 timeout, bool enabled)
 		if (time_after(jiffies, timeout_jiffies)) {
 			dev_err(ctrl->device,
 				"Device not ready; aborting %s, CSTS=0x%x\n",
-				enabled ? "initialisation" : "reset", csts);
+				op, csts);
 			return -ENODEV;
 		}
 	}
@@ -2305,8 +2306,8 @@ int nvme_disable_ctrl(struct nvme_ctrl *ctrl)
 
 	if (ctrl->quirks & NVME_QUIRK_DELAY_BEFORE_CHK_RDY)
 		msleep(NVME_QUIRK_DELAY_AMOUNT);
-
-	return nvme_wait_ready(ctrl, NVME_CAP_TIMEOUT(ctrl->cap), false);
+	return nvme_wait_ready(ctrl, NVME_CSTS_RDY, 0,
+			       NVME_CAP_TIMEOUT(ctrl->cap), "reset");
 }
 EXPORT_SYMBOL_GPL(nvme_disable_ctrl);
 
@@ -2371,14 +2372,13 @@ int nvme_enable_ctrl(struct nvme_ctrl *ctrl)
 	ret = ctrl->ops->reg_write32(ctrl, NVME_REG_CC, ctrl->ctrl_config);
 	if (ret)
 		return ret;
-	return nvme_wait_ready(ctrl, timeout, true);
+	return nvme_wait_ready(ctrl, NVME_CSTS_RDY, NVME_CSTS_RDY, timeout,
+			       "initialisation");
 }
 EXPORT_SYMBOL_GPL(nvme_enable_ctrl);
 
 int nvme_shutdown_ctrl(struct nvme_ctrl *ctrl)
 {
-	unsigned long timeout = jiffies + (ctrl->shutdown_timeout * HZ);
-	u32 csts;
 	int ret;
 
 	ctrl->ctrl_config &= ~NVME_CC_SHN_MASK;
@@ -2387,22 +2387,8 @@ int nvme_shutdown_ctrl(struct nvme_ctrl *ctrl)
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

