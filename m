Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72160322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sqS4+cdSfq8GA9u9N8JhTlrYWXrnR2DXm+HcP1+L8Ic=; b=hiwmsv4Jk7/VwqjnnNHxXKFUni
	SUzPLk8jUkxPyr141aFmf9bYJArULfFAYuFzI9Er7NgyD/VjPe1244ggVFtmnMAcR/mFc7DRTxtxX
	YfjlKuIYDMrX6HGMFvoz/65Z17wLHqtCdd4XDo9gHw/r/GxpBGzK4ZaNlFs46bcng5SJmo8F/he9C
	jFAiGzQsGMpmhBjDRoG6zm2R/VeProQYF5zpHTcuipfYfqjzzZQt/w0k6c3uciDYH5xubKfCFJmju
	B//s0i2PwDILuqriGsZez5P50hJxH0V4aHwBiP02uJ+NINvCj2LykSQILmbF+Y+0ugprEavvkRcNM
	xXT7rA9g==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00Z6-008lZr-OX; Tue, 29 Nov 2022 13:22:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 4/9] nvme-pci: remove nvme_disable_admin_queue
Date: Tue, 29 Nov 2022 14:22:03 +0100
Message-Id: <20221129132208.4337-5-hch@lst.de>
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

nvme_disable_admin_queue has only a single caller, and just calls two
other funtions, so remove it to clean up the remove path a little more.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 84226dce9b3b92..c6a02210d22b46 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1496,14 +1496,6 @@ static void nvme_suspend_io_queues(struct nvme_dev *dev)
 		nvme_suspend_queue(&dev->queues[i]);
 }
 
-static void nvme_disable_admin_queue(struct nvme_dev *dev, bool shutdown)
-{
-	struct nvme_queue *nvmeq = &dev->queues[0];
-
-	nvme_disable_ctrl(&dev->ctrl, shutdown);
-	nvme_poll_irqdisable(nvmeq);
-}
-
 /*
  * Called only on a device that has been disabled and after all other threads
  * that can check this device's completion queues have synced, except
@@ -2711,7 +2703,8 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
 
 	if (!dead && dev->ctrl.queue_count > 0) {
 		nvme_disable_io_queues(dev);
-		nvme_disable_admin_queue(dev, shutdown);
+		nvme_disable_ctrl(&dev->ctrl, shutdown);
+		nvme_poll_irqdisable(&dev->queues[0]);
 	}
 	nvme_suspend_io_queues(dev);
 	nvme_suspend_queue(&dev->queues[0]);
-- 
2.30.2

