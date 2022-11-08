Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53A17CA5
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3NJdEwMIuRZb08nHOAvQtOg+lx3fzQPcB610bVLxc18=; b=zWd1YX250c3LpP8Cfd/MwphLVX
	SZoszQ4SF8P5z/Swf+xS+hO03KXr/bHPxgssUuqd9kTaLxvy3GEfoEIUn8OzifPfCAV8lsC6b9ZmE
	iqQSa/QtZdezIWRBSPazcqUCGJy48Ze/EezOsbhx4rO8LKavInE+QpT0f+TEiGGf9dDBFf6OfS1K/
	E7U+e9gPuIZOYrzXVtxJft9C7wpnvAWMi2dX6h1HcL379wPI2wpZtvZPl804cb9Rbt809fFS4n6Lw
	5o/m8EMCfrIzKbY+E1aAIO9ap/ebYkE+SJyNYM7jlHYcCrQxXow/N7PyuV/JpyEH5fFBgZEgqpDDx
	XseG03hA==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ85-006BpP-KW; Tue, 08 Nov 2022 15:03:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 05/12] nvme-pci: move more teardown work to nvme_remove
Date: Tue,  8 Nov 2022 16:02:45 +0100
Message-Id: <20221108150252.2123727-6-hch@lst.de>
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

nvme_dbbuf_dma_free frees dma coherent memory, so it must not be called
after ->remove has returned.  Fortunately there is no way to use it
after shutdown as no more I/O is possible so it can be moved.  Similarly
the iod_mempool can't be used for a device kept alive after shutdown, so
move it next to freeing the PRP pools.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index f526ad578088a..b638f43f2df26 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2773,9 +2773,7 @@ static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
 {
 	struct nvme_dev *dev = to_nvme_dev(ctrl);
 
-	nvme_dbbuf_dma_free(dev);
 	nvme_free_tagset(dev);
-	mempool_destroy(dev->iod_mempool);
 	put_device(dev->dev);
 	kfree(dev->queues);
 	kfree(dev);
@@ -3227,7 +3225,9 @@ static void nvme_remove(struct pci_dev *pdev)
 	nvme_dev_disable(dev, true);
 	nvme_free_host_mem(dev);
 	nvme_dev_remove_admin(dev);
+	nvme_dbbuf_dma_free(dev);
 	nvme_free_queues(dev, 0);
+	mempool_destroy(dev->iod_mempool);
 	nvme_release_prp_pools(dev);
 	nvme_dev_unmap(dev);
 	nvme_uninit_ctrl(&dev->ctrl);
-- 
2.30.2

