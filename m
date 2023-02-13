Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E51C26
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 06:06:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF98068BFE; Mon, 13 Feb 2023 06:59:45 +0100 (CET)
Date: Mon, 13 Feb 2023 06:59:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Subject: Re: max_hw_sectors error caused by recent NVMe driver commit
Message-ID: <20230213055945.GA13648@lst.de>
References: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Hi Michael,

does this fix the problem for you?

commit 0467e96bafd2e84b67ba5c122bbbbac5e3f267e9
Author: Christoph Hellwig <hch@lst.de>
Date:   Mon Feb 13 06:58:33 2023 +0100

    nvme dma_mask

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index c734934c407ccf..cb068f92bd597e 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2509,18 +2509,12 @@ static int nvme_pci_enable(struct nvme_dev *dev)
 {
 	int result = -ENOMEM;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	int dma_address_bits = 64;
 
 	if (pci_enable_device_mem(pdev))
 		return result;
 
 	pci_set_master(pdev);
 
-	if (dev->ctrl.quirks & NVME_QUIRK_DMA_ADDRESS_BITS_48)
-		dma_address_bits = 48;
-	if (dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(dma_address_bits)))
-		goto disable;
-
 	if (readl(dev->bar + NVME_REG_CSTS) == -1) {
 		result = -ENODEV;
 		goto disable;
@@ -2998,7 +2992,11 @@ static struct nvme_dev *nvme_pci_alloc_dev(struct pci_dev *pdev,
 			     quirks);
 	if (ret)
 		goto out_put_device;
-	
+
+	if (dev->ctrl.quirks & NVME_QUIRK_DMA_ADDRESS_BITS_48)
+		dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(48));
+	else
+		dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(64));
 	dma_set_min_align_mask(&pdev->dev, NVME_CTRL_PAGE_SIZE - 1);
 	dma_set_max_seg_size(&pdev->dev, 0xffffffff);
 
