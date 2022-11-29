Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C5322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KKBmeYqsbzZo6HcXsM4V/24vGrVwbM7W2COZA8MhMTU=; b=wG30fC9GrzRvdkuCUmGJn5oiJf
	XAAUiJPiVHi5YIiOGXsIlKuH7EsigH9ZsLOyM2b5Mf7Vd6rOqLIe//TVweeU36h3+Y/Zjp7/1iPxD
	EgH8cen2zAIUNUxgIlOsCjNmI9JTdtpWOiIz9uzzgZ3J9IFtpFjU6IvcpmlxtB5FQMTeK7kltKg1F
	dDVCkHeVYiyxuKDcsMkwJE+PHUuJqn5sDCL7xKLBo4c34poTp6vyz/7P+J5wJDaaFmSsywZCMFaUU
	2Ry7Tnij9KuTVydU0/1q4mm/mGNiqatSqAFOamyg6FLFjgMW23/NP2D8sbjmAEELPa9lP1V3NtUT7
	eRPTszVw==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00ZG-008ldO-1s; Tue, 29 Nov 2022 13:22:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 7/9] nvme-pci: rename nvme_disable_io_queues
Date: Tue, 29 Nov 2022 14:22:06 +0100
Message-Id: <20221129132208.4337-8-hch@lst.de>
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

This function really deletes the I/O queues, so rename it to match
the functionality.  Also move the main wrapper right next to the
actual underlying implementation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 2c8dd0f7ef463b..1b527377e35197 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -109,7 +109,7 @@ struct nvme_dev;
 struct nvme_queue;
 
 static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown);
-static bool __nvme_disable_io_queues(struct nvme_dev *dev, u8 opcode);
+static void nvme_delete_io_queues(struct nvme_dev *dev);
 
 /*
  * Represents an NVM Express device.  Each nvme_dev is a PCI function.
@@ -2310,12 +2310,6 @@ static int nvme_setup_irqs(struct nvme_dev *dev, unsigned int nr_io_queues)
 			      PCI_IRQ_ALL_TYPES | PCI_IRQ_AFFINITY, &affd);
 }
 
-static void nvme_disable_io_queues(struct nvme_dev *dev)
-{
-	if (__nvme_disable_io_queues(dev, nvme_admin_delete_sq))
-		__nvme_disable_io_queues(dev, nvme_admin_delete_cq);
-}
-
 static unsigned int nvme_max_io_queues(struct nvme_dev *dev)
 {
 	/*
@@ -2423,7 +2417,7 @@ static int nvme_setup_io_queues(struct nvme_dev *dev)
 
 	if (dev->online_queues - 1 < dev->max_qid) {
 		nr_io_queues = dev->online_queues - 1;
-		nvme_disable_io_queues(dev);
+		nvme_delete_io_queues(dev);
 		result = nvme_setup_io_queues_trylock(dev);
 		if (result)
 			return result;
@@ -2487,7 +2481,7 @@ static int nvme_delete_queue(struct nvme_queue *nvmeq, u8 opcode)
 	return 0;
 }
 
-static bool __nvme_disable_io_queues(struct nvme_dev *dev, u8 opcode)
+static bool __nvme_delete_io_queues(struct nvme_dev *dev, u8 opcode)
 {
 	int nr_queues = dev->online_queues - 1, sent = 0;
 	unsigned long timeout;
@@ -2515,6 +2509,12 @@ static bool __nvme_disable_io_queues(struct nvme_dev *dev, u8 opcode)
 	return true;
 }
 
+static void nvme_delete_io_queues(struct nvme_dev *dev)
+{
+	if (__nvme_delete_io_queues(dev, nvme_admin_delete_sq))
+		__nvme_delete_io_queues(dev, nvme_admin_delete_cq);
+}
+
 static void nvme_pci_alloc_tag_set(struct nvme_dev *dev)
 {
 	struct blk_mq_tag_set * set = &dev->tagset;
@@ -2687,7 +2687,7 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
 	nvme_quiesce_io_queues(&dev->ctrl);
 
 	if (!dead && dev->ctrl.queue_count > 0) {
-		nvme_disable_io_queues(dev);
+		nvme_delete_io_queues(dev);
 		nvme_disable_ctrl(&dev->ctrl, shutdown);
 		nvme_poll_irqdisable(&dev->queues[0]);
 	}
-- 
2.30.2

