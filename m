Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077E17CA5
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Mv9bQ7ZmAARDju/NAsXvF40fcOwLRcYL+Jwo+Wq3egA=; b=uwf55r19BcRC91fvdm3rTXuzAl
	h/iIriPCs+9l1+TMf8f7jWis98x2x1Wv16YcvG+ta//yV8OBgKPPa2uA3ZM9kEjslJbTn4yUDOO/L
	GEt1OPcH8ty9rU/mHfnY9yiwAY50qakwU6S1p8GSsq4xNLGvq435yDUECuDuQA9Pg9VG3SEb/yFbj
	s5msArMcLJHil5mZupBtRiE1vgtZjGUXEsbq2lzDZcNHK0+NGN7WC2MgMKlfDkfnhVITQ7B/tJIEg
	pRBNr8fn6HJ55C3drkbfn9XMxzTMtHifK4qRbpk5kzldKvDrgsltGmuwh+19qhidgJgQhLmYv17Qe
	fT2ly2wg==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ8G-006Bsv-Ia; Tue, 08 Nov 2022 15:03:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 09/12] nvme-pci: call nvme_pci_configure_admin_queue from nvme_pci_enable
Date: Tue,  8 Nov 2022 16:02:49 +0100
Message-Id: <20221108150252.2123727-10-hch@lst.de>
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

nvme_pci_configure_admin_queue is called right after nvme_pci_enable, and
it's work is undone by nvme_dev_disable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 87f7c8f5699ec..64e2bd2d4f61e 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2639,7 +2639,8 @@ static int nvme_pci_enable(struct nvme_dev *dev)
 
 	pci_enable_pcie_error_reporting(pdev);
 	pci_save_state(pdev);
-	return 0;
+
+	return nvme_pci_configure_admin_queue(dev);
 
  disable:
 	pci_disable_device(pdev);
@@ -2829,10 +2830,6 @@ static void nvme_reset_work(struct work_struct *work)
 	if (result)
 		goto out_unlock;
 
-	result = nvme_pci_configure_admin_queue(dev);
-	if (result)
-		goto out_unlock;
-
 	if (!dev->ctrl.admin_q) {
 		result = nvme_pci_alloc_admin_tag_set(dev);
 		if (result)
-- 
2.30.2

