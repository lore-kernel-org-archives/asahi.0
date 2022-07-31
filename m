Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFE3161
	for <asahi@lists.linux.dev>; Sun, 31 Jul 2022 06:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id EED9F42597;
	Sun, 31 Jul 2022 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1659249107; bh=2hXXWs5JLLtsyruajZ51FahhbkgrBkoeG+ThccptLTs=;
	h=From:To:Cc:Subject:Date;
	b=hn8GGBl348yBKks0PK05D/WKjQfN50xurvFW5d5HSskRnBuAHcGbM/kCAzvpGKisH
	 eEPUpIABng5GhCERhPl2kUu9ES1etcCez/tVMmNyp8PaxL6ZxUNCiyfgS3KeOL9tE+
	 fUQathyIbJUyvriHil+t6v89fCbPc4r8MDu7eJ7QvK/5Mks/noCEwOVm7o9EUJtlOn
	 N3/YM6ew0dWj3p+HZOF9I8oolU5elTZDhAahHga/QmWG30nklpoc0xqF2xSPyPDDXq
	 zH99B2rTouQFD389N33Yg8XPqJGZHirktPatf4VX2gPZye+CFvmlrtiLlxBwhajJNt
	 uLaUnBT1gyPhA==
From: Hector Martin <marcan@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	Mark Kettenis <kettenis@openbsd.org>,
	u-boot@lists.denx.de,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH] nvme: Do a clean NVMe shutdown
Date: Sun, 31 Jul 2022 15:31:31 +0900
Message-Id: <20220731063131.38271-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brute-force controller disable method can end up racing controller
initilization and causing a crash when we shut down Apple ANS2 NVMe
controllers. Do a proper controlled shutdown, which does block until
things are quiesced properly. This is nicer in general for all
controllers.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/nvme/nvme.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/nvme.c b/drivers/nvme/nvme.c
index a305305885ec..5fd2fb9ed6a6 100644
--- a/drivers/nvme/nvme.c
+++ b/drivers/nvme/nvme.c
@@ -27,9 +27,8 @@
 #define IO_TIMEOUT		30
 #define MAX_PRP_POOL		512
 
-static int nvme_wait_ready(struct nvme_dev *dev, bool enabled)
+static int nvme_wait_csts(struct nvme_dev *dev, u32 mask, u32 val)
 {
-	u32 bit = enabled ? NVME_CSTS_RDY : 0;
 	int timeout;
 	ulong start;
 
@@ -38,7 +37,7 @@ static int nvme_wait_ready(struct nvme_dev *dev, bool enabled)
 
 	start = get_timer(0);
 	while (get_timer(start) < timeout) {
-		if ((readl(&dev->bar->csts) & NVME_CSTS_RDY) == bit)
+		if ((readl(&dev->bar->csts) & mask) == val)
 			return 0;
 	}
 
@@ -295,7 +294,7 @@ static int nvme_enable_ctrl(struct nvme_dev *dev)
 	dev->ctrl_config |= NVME_CC_ENABLE;
 	writel(dev->ctrl_config, &dev->bar->cc);
 
-	return nvme_wait_ready(dev, true);
+	return nvme_wait_csts(dev, NVME_CSTS_RDY, NVME_CSTS_RDY);
 }
 
 static int nvme_disable_ctrl(struct nvme_dev *dev)
@@ -304,7 +303,16 @@ static int nvme_disable_ctrl(struct nvme_dev *dev)
 	dev->ctrl_config &= ~NVME_CC_ENABLE;
 	writel(dev->ctrl_config, &dev->bar->cc);
 
-	return nvme_wait_ready(dev, false);
+	return nvme_wait_csts(dev, NVME_CSTS_RDY, 0);
+}
+
+static int nvme_shutdown_ctrl(struct nvme_dev *dev)
+{
+	dev->ctrl_config &= ~NVME_CC_SHN_MASK;
+	dev->ctrl_config |= NVME_CC_SHN_NORMAL;
+	writel(dev->ctrl_config, &dev->bar->cc);
+
+	return nvme_wait_csts(dev, NVME_CSTS_SHST_MASK, NVME_CSTS_SHST_CMPLT);
 }
 
 static void nvme_free_queue(struct nvme_queue *nvmeq)
@@ -904,6 +912,13 @@ free_nvme:
 int nvme_shutdown(struct udevice *udev)
 {
 	struct nvme_dev *ndev = dev_get_priv(udev);
+	int ret;
+
+	ret = nvme_shutdown_ctrl(ndev);
+	if (ret < 0) {
+		printf("Error: %s: Shutdown timed out!\n", udev->name);
+		return ret;
+	}
 
 	return nvme_disable_ctrl(ndev);
 }
-- 
2.35.1

