Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156AA17CA5
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=LnfgR/PhAMf/s66NrHVe/x3qXrzZnFQYIQqcZxXaOdI=; b=nIv+N+6FMZLSTHml3QZ6Hs1YJS
	vxeBSo0VWOpKFWgh1FsQyy/QkzVrNnmQnXWkxKjwM/onox89JnrCoXfKDW5i2dZGilUfR2N5t1Kj4
	Z+O5Jmhxh8JhqGbNc6S3wtiouirzHh7qxQMWqfwLIdXu5YZL5bLqR3jqfUyBpcSgUSCMsd9nmeW83
	1EgIst4mtp6B5luQm5clJNNLh0d5C9FyFwvKtQm6nQhXkAaKI7tJg+ISn2k5Tn2LjQvRsC/bCCYuA
	VSgmgmIWq0myc6ELsLhVBXpzy7OYAj1jAJHIN/2k9+DwK4VOG6UaMhY1GTTKWvmYfZS+p4c26uBIA
	BTg6XE0A==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ82-006Bog-W2; Tue, 08 Nov 2022 15:03:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 04/12] nvme-pci: put the admin queue in nvme_dev_remove_admin
Date: Tue,  8 Nov 2022 16:02:44 +0100
Message-Id: <20221108150252.2123727-5-hch@lst.de>
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

Once the controller is shutdown no one can access the admin queue.  Tear
it down in nvme_dev_remove_admin, which matches the flow in the other
drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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

