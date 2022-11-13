Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277E1850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KE6NcInukbfZDCibBSQLpU+dxxMwcKGFFKuMbhvjw8E=; b=4U/mCNu1KHnPLNIlsjMnnr7dhk
	XcKcHSQhtLtVVJ+YvCGXr8V+tB53fAAyhcPgOaNdPKGnPLUuFjQESzzVySRUMLmgPP1zbUjTEgH3W
	iHa+9AEMUkpUqjlyZKGKOMqvo2b9B3FCufdOhcH54KJ5m2LbdKz+9jrhUkMsi1R66u5400hZQmZhK
	LwzNATApMjhz1H6owQGbpYnudRlhdQvp0QFj0jq6qTPnSBhA17k2uzMVfIaP8XS9R1peqtA2jtI5s
	Cgypaoz1rMIHn9waYtgmdagHtN0ESP2W5QbQKzoZHN15pR07vYMAePwy1NlCXSaDc/NGI9naLPwuf
	ZUfJCGjw==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFan-00CC5F-Ip; Sun, 13 Nov 2022 16:12:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 10/13] nvme-pci: simplify nvme_dbbuf_dma_alloc
Date: Sun, 13 Nov 2022 17:11:35 +0100
Message-Id: <20221113161138.883195-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221113161138.883195-1-hch@lst.de>
References: <20221113161138.883195-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the OACS check and the error checking into nvme_dbbuf_dma_alloc so
that an upcoming second caller doesn't have to duplicate this boilerplate
code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index c2e3a87237da8..4da339690ec67 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -239,10 +239,13 @@ static inline unsigned int nvme_dbbuf_size(struct nvme_dev *dev)
 	return dev->nr_allocated_queues * 8 * dev->db_stride;
 }
 
-static int nvme_dbbuf_dma_alloc(struct nvme_dev *dev)
+static void nvme_dbbuf_dma_alloc(struct nvme_dev *dev)
 {
 	unsigned int mem_size = nvme_dbbuf_size(dev);
 
+	if (!(dev->ctrl.oacs & NVME_CTRL_OACS_DBBUF_SUPP))
+		return;
+
 	if (dev->dbbuf_dbs) {
 		/*
 		 * Clear the dbbuf memory so the driver doesn't observe stale
@@ -250,25 +253,27 @@ static int nvme_dbbuf_dma_alloc(struct nvme_dev *dev)
 		 */
 		memset(dev->dbbuf_dbs, 0, mem_size);
 		memset(dev->dbbuf_eis, 0, mem_size);
-		return 0;
+		return;
 	}
 
 	dev->dbbuf_dbs = dma_alloc_coherent(dev->dev, mem_size,
 					    &dev->dbbuf_dbs_dma_addr,
 					    GFP_KERNEL);
 	if (!dev->dbbuf_dbs)
-		return -ENOMEM;
+		goto fail;
 	dev->dbbuf_eis = dma_alloc_coherent(dev->dev, mem_size,
 					    &dev->dbbuf_eis_dma_addr,
 					    GFP_KERNEL);
-	if (!dev->dbbuf_eis) {
-		dma_free_coherent(dev->dev, mem_size,
-				  dev->dbbuf_dbs, dev->dbbuf_dbs_dma_addr);
-		dev->dbbuf_dbs = NULL;
-		return -ENOMEM;
-	}
+	if (!dev->dbbuf_eis)
+		goto fail_free_dbbuf_dbs;
+	return;
 
-	return 0;
+fail_free_dbbuf_dbs:
+	dma_free_coherent(dev->dev, mem_size, dev->dbbuf_dbs,
+			  dev->dbbuf_dbs_dma_addr);
+	dev->dbbuf_dbs = NULL;
+fail:
+	dev_warn(dev->dev, "unable to allocate dma for dbbuf\n");
 }
 
 static void nvme_dbbuf_dma_free(struct nvme_dev *dev)
@@ -2855,12 +2860,7 @@ static void nvme_reset_work(struct work_struct *work)
 	if (result)
 		goto out;
 
-	if (dev->ctrl.oacs & NVME_CTRL_OACS_DBBUF_SUPP) {
-		result = nvme_dbbuf_dma_alloc(dev);
-		if (result)
-			dev_warn(dev->dev,
-				 "unable to allocate dma for dbbuf\n");
-	}
+	nvme_dbbuf_dma_alloc(dev);
 
 	if (dev->ctrl.hmpre) {
 		result = nvme_setup_host_mem(dev);
-- 
2.30.2

