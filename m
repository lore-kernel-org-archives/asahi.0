Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFDB24F28
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=tdhX9v7AJD/H5YPJtsmtpqrKqOr13jzEpQfZYNXRTgQ=; b=1DGUnegNTIQ6dba7VcOF5kQD8E
	gxPeEqR2wYcV6JbCWS+6uNsSGpGv2M3LzdXhZFrnGULZZ6sYEf2xFLk0DEvVm8kHrYHcTycQfOYJG
	DK2ZyeOr2TRiR2QuII9r4D0h31avfGjeKcOz+nsJViPKS0Zgh38A1ZuziGQ7fKZLhEsaP8uRokv07
	cB6Mabr9LNN7OUj4T2u2PwJoSX1fen6ONj4SvckI+dxiXRPVkoIOBb7o8cZJi+1sJHHGwJPgds8hv
	kvcw9DK9EAQXZVnqbD79h4YP+zdZYzIHSMGAf1CnfqwtcBe9GesmlpiM/z6BmFySnlgYn8y3rRwDR
	xczOWiOw==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ8D-006Brz-Oz; Tue, 08 Nov 2022 15:03:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 08/12] nvme-pci: set constant paramters in nvme_pci_alloc_ctrl
Date: Tue,  8 Nov 2022 16:02:48 +0100
Message-Id: <20221108150252.2123727-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221108150252.2123727-1-hch@lst.de>
References: <20221108150252.2123727-1-hch@lst.de>
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
---
 drivers/nvme/host/pci.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index e1f60b1c6918f..87f7c8f5699ec 100644
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
@@ -3133,6 +3112,23 @@ static struct nvme_dev *nvme_pci_alloc_ctrl(struct pci_dev *pdev,
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

