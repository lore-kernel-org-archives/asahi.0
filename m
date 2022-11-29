Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF4322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JDG7vM/8NNOflqy1G5WXsrxazrDkPcumfsjKP4vQD2Y=; b=mgIra+t5kGggcFnYP3gI+zaGUp
	OHym+d5RjaHK/e9ZQeVMESaYrGQ+xjfyTDZ8+DW+8hB0ijOGxTwWvSQBVmAYIkWnsOfL5WM9uBHNX
	1BXvJKcd/L4HIzzC+REt0HuS65YebS93gExorQOx1spHdpbZK6FArz0zX6ii+hUHVisjjHhQM5F0Z
	qmljpNodzjaVTgRASyJD5zxCcyBMryhHKPWirGbDHAj0JPVAXDzo9sZdLqprNfnYqHvSO+Tp80gC5
	mP/a3fRu9j8DdEq3Tu7pMpEZNcrkCGMqi187jRzHTOY7PG9L7Wj7ujhYMuV21rsLQ6ZytnNYepXni
	zvZgkZVw==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00ZM-008lhO-KE; Tue, 29 Nov 2022 13:22:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 9/9] nvme-pci: split out a nvme_pci_ctrl_is_dead helper
Date: Tue, 29 Nov 2022 14:22:08 +0100
Message-Id: <20221129132208.4337-10-hch@lst.de>
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

Clean up nvme_dev_disable by splitting the logic to detect if a
controller is dead into a separate helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 47 ++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 02940b4f42b104..d613b4292c0f95 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2654,36 +2654,39 @@ static void nvme_dev_unmap(struct nvme_dev *dev)
 	pci_release_mem_regions(to_pci_dev(dev->dev));
 }
 
-static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
+static bool nvme_pci_ctrl_is_dead(struct nvme_dev *dev)
 {
-	bool dead = true, freeze = false;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	u32 csts;
 
-	mutex_lock(&dev->shutdown_lock);
-	if (pci_is_enabled(pdev)) {
-		u32 csts;
+	if (!pci_is_enabled(pdev) || !pci_device_is_present(pdev))
+		return true;
+	if (pdev->error_state != pci_channel_io_normal)
+		return true;
 
-		if (pci_device_is_present(pdev))
-			csts = readl(dev->bar + NVME_REG_CSTS);
-		else
-			csts = ~0;
+	csts = readl(dev->bar + NVME_REG_CSTS);
+	return (csts & NVME_CSTS_CFS) || !(csts & NVME_CSTS_RDY);
+}
+
+static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
+{
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	bool dead;
 
-		if (dev->ctrl.state == NVME_CTRL_LIVE ||
-		    dev->ctrl.state == NVME_CTRL_RESETTING) {
-			freeze = true;
+	mutex_lock(&dev->shutdown_lock);
+	dead = nvme_pci_ctrl_is_dead(dev);
+	if (dev->ctrl.state == NVME_CTRL_LIVE ||
+	    dev->ctrl.state == NVME_CTRL_RESETTING) {
+		if (pci_is_enabled(pdev))
 			nvme_start_freeze(&dev->ctrl);
-		}
-		dead = !!((csts & NVME_CSTS_CFS) || !(csts & NVME_CSTS_RDY) ||
-			pdev->error_state  != pci_channel_io_normal);
+		/*
+		 * Give the controller a chance to complete all entered requests
+		 * if doing a safe shutdown.
+		 */
+		if (!dead && shutdown)
+			nvme_wait_freeze_timeout(&dev->ctrl, NVME_IO_TIMEOUT);
 	}
 
-	/*
-	 * Give the controller a chance to complete all entered requests if
-	 * doing a safe shutdown.
-	 */
-	if (!dead && shutdown && freeze)
-		nvme_wait_freeze_timeout(&dev->ctrl, NVME_IO_TIMEOUT);
-
 	nvme_quiesce_io_queues(&dev->ctrl);
 
 	if (!dead && dev->ctrl.queue_count > 0) {
-- 
2.30.2

