Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB151850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7Iir3nj/A52Mj3FCRpj0ivK23sByQbBL6XAFcSZK+KU=; b=wjJ+kFXNMsfM1FVLxADGrxEhEm
	445v7Scjqb2us1B/9xj3j1R9nr9HQr3giImiYoq+kM5+pj4bgs22NXsq8Xm6PJ3UyT/FlS8j2kHmI
	h7DlqjLQqrW3kRrmMz1f2nVnAS7LPCmg+XUwOOt2azWRLAmV0xxNv63fCwCjpTPrUOz6X83Ki6zUg
	U6aWjg8Qh8RkiQYza1j+99TFE9A18fRYkqNg7tUmIlo/0WUlDpGi+GpsL/Qy0d6bwjAMZXYmOrTb3
	Ykjjtz4A5mYK037F53MZpw14rP+IQSa88gRDDUn086h/t4ty23Al70C5t4vb2NdC0Oaq56ndDf3Mn
	FVmPQdXQ==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFaP-00CBrH-Ju; Sun, 13 Nov 2022 16:11:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 04/13] nvme-pci: put the admin queue in nvme_dev_remove_admin
Date: Sun, 13 Nov 2022 17:11:29 +0100
Message-Id: <20221113161138.883195-5-hch@lst.de>
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

Once the controller is shutdown no one can access the admin queue.  Tear
it down in nvme_dev_remove_admin, which matches the flow in the other
drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Tested-by Gerd Bayer <gbayer@linxu.ibm.com>
---
 drivers/nvme/host/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index c8f6ce5eee1c2..f526ad578088a 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1747,6 +1747,7 @@ static void nvme_dev_remove_admin(struct nvme_dev *dev)
 		 */
 		nvme_start_admin_queue(&dev->ctrl);
 		blk_mq_destroy_queue(dev->ctrl.admin_q);
+		blk_put_queue(dev->ctrl.admin_q);
 		blk_mq_free_tag_set(&dev->admin_tagset);
 	}
 }
@@ -2774,8 +2775,6 @@ static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
 
 	nvme_dbbuf_dma_free(dev);
 	nvme_free_tagset(dev);
-	if (dev->ctrl.admin_q)
-		blk_put_queue(dev->ctrl.admin_q);
 	mempool_destroy(dev->iod_mempool);
 	put_device(dev->dev);
 	kfree(dev->queues);
-- 
2.30.2

