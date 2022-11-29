Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43D322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/Bb8tjufSZjQLxxGjWnqmE3dgJu7ezrwgS/IO6o6Xus=; b=sPIVK+2DEJBhVBdXVj7Eisxef3
	uMqSv/m56qRCUx5UKKkoIOEVumKAR04QF+QdSMZbJOwuX29OcPrLFQQjcNUKBrTR3pjrBppHd3SC1
	dKjqMDc5A9FtL2xiGyAqgGCJ3a3fwiOzi1lzor4a5q2gy3JRigHNcvoxMm9HEkYeUdnB2fTH4F8Gf
	J6rkRswy/dgB2bOsps4aTJkJcNthOJvmsGM2WatrKxwZ2cGTxgRrhsCIGVrr/x8c6IoySOVP9celh
	d3W8uEgNX521gqmVq4yw0czgVdBHSMY0Q6Lp+V7HJh8snrEm2DjmCA052T3dpoMeys1E1jOykwqu9
	kldGeduQ==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00ZA-008las-5r; Tue, 29 Nov 2022 13:22:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 5/9] nvme-pci: remove nvme_pci_disable
Date: Tue, 29 Nov 2022 14:22:04 +0100
Message-Id: <20221129132208.4337-6-hch@lst.de>
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

nvme_pci_disable has a single caller, fold it into that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index c6a02210d22b46..c3d9b23699d3f3 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2657,18 +2657,6 @@ static void nvme_dev_unmap(struct nvme_dev *dev)
 	pci_release_mem_regions(to_pci_dev(dev->dev));
 }
 
-static void nvme_pci_disable(struct nvme_dev *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
-	pci_free_irq_vectors(pdev);
-
-	if (pci_is_enabled(pdev)) {
-		pci_disable_pcie_error_reporting(pdev);
-		pci_disable_device(pdev);
-	}
-}
-
 static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
 {
 	bool dead = true, freeze = false;
@@ -2708,7 +2696,11 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
 	}
 	nvme_suspend_io_queues(dev);
 	nvme_suspend_queue(&dev->queues[0]);
-	nvme_pci_disable(dev);
+	pci_free_irq_vectors(pdev);
+	if (pci_is_enabled(pdev)) {
+		pci_disable_pcie_error_reporting(pdev);
+		pci_disable_device(pdev);
+	}
 	nvme_reap_pending_cqes(dev);
 
 	nvme_cancel_tagset(&dev->ctrl);
-- 
2.30.2

