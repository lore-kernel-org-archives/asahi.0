Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973E1850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JskPbanT7ns+OWNy0b/lpfB1mdd2cepy0iLXfthLb7w=; b=JVLlCzuVjaMomYV1LRHvum6fvN
	c8cxtU/rp1JRO8Pe5A32BjR4Vv2/4jv6Jhz1N2IB/7HAh5og9QD0JmDMNGqnGLs5dxqskC2c0zPxf
	yvmzo6aV91nWv6AA8U/lYm1oVcMHgBa/C3jEGvxtB0QiVC56uT8ASCj+Z1wkQZD2pyzHGhrhY3bJC
	uWk4mYPfnmHIxtHCQdpp/aje1T6quZfwy5oWCOOd2aptsh9BJ7NgryJa3puduwIo0HtYiWA9WuV7F
	pYGY2AaKzcl1kIPe2pSirRpu9BY2eERNmVZBUHiG35pd6Bok6x/lU496nWuyZ9ZLHtsGcppYMW8Id
	YgXth3lg==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFaf-00CBzw-Pn; Sun, 13 Nov 2022 16:12:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 08/13] nvme-pci: set constant paramters in nvme_pci_alloc_ctrl
Date: Sun, 13 Nov 2022 17:11:33 +0100
Message-Id: <20221113161138.883195-9-hch@lst.de>
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

Move setting of low-level constant parameters from nvme_reset_work to
nvme_pci_alloc_ctrl.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Tested-by Gerd Bayer <gbayer@linxu.ibm.com>
---
 drivers/nvme/host/pci.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 03c83cd724ec5..9dcb35f148009 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2841,21 +2841,6 @@ static void nvme_reset_work(struct work_struct *work)
 		nvme_start_admin_queue(&dev->ctrl);
 	}
 
-	dma_set_min_align_mask(dev->dev, NVME_CTRL_PAGE_SIZE - 1);
-
-	/*
-	 * Limit the max command size to prevent iod->sg allocations going
-	 * over a single page.
-	 */
-	dev->ctrl.max_hw_sectors = min_t(u32,
-		NVME_MAX_KB_SZ << 1, dma_max_mapping_size(dev->dev) >> 9);
-	dev->ctrl.max_segments = NVME_MAX_SEGS;
-
-	/*
-	 * Don't limit the IOMMU merged segment size.
-	 */
-	dma_set_max_seg_size(dev->dev, 0xffffffff);
-
 	mutex_unlock(&dev->shutdown_lock);
 
 	/*
@@ -2869,12 +2854,6 @@ static void nvme_reset_work(struct work_struct *work)
 		goto out;
 	}
 
-	/*
-	 * We do not support an SGL for metadata (yet), so we are limited to a
-	 * single integrity segment for the separate metadata pointer.
-	 */
-	dev->ctrl.max_integrity_segments = 1;
-
 	result = nvme_init_ctrl_finish(&dev->ctrl, was_suspend);
 	if (result)
 		goto out;
@@ -3133,6 +3112,23 @@ static struct nvme_dev *nvme_pci_alloc_dev(struct pci_dev *pdev,
 			     quirks);
 	if (ret)
 		goto out_put_device;
+	
+	dma_set_min_align_mask(&pdev->dev, NVME_CTRL_PAGE_SIZE - 1);
+	dma_set_max_seg_size(&pdev->dev, 0xffffffff);
+
+	/*
+	 * Limit the max command size to prevent iod->sg allocations going
+	 * over a single page.
+	 */
+	dev->ctrl.max_hw_sectors = min_t(u32,
+		NVME_MAX_KB_SZ << 1, dma_max_mapping_size(&pdev->dev) >> 9);
+	dev->ctrl.max_segments = NVME_MAX_SEGS;
+
+	/*
+	 * There is no support for SGLs for metadata (yet), so we are limited to
+	 * a single integrity segment for the separate metadata pointer.
+	 */
+	dev->ctrl.max_integrity_segments = 1;
 	return dev;
 
 out_put_device:
-- 
2.30.2

