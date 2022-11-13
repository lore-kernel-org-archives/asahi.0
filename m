Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E561850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cloPt7koLEyYsNjXQs44VUd375C1XUM65qbGoaBa4Yc=; b=WHXz3b4pRS94akpEFB4P043bgz
	XpDGu2qkTNsZi5KpQqkZUHVvOF0oJpp3VtsSe8wXP5rp7hKVKssonIrrfB8BBtR+7OzQ4F5sjr5VS
	Pp85/MwVx1wAnkG46shBAuXZ8hs5Qb3DpbqS9cxxwVBRFSIrKjh0f5/loaM2gqf2jafAAdmI43zjX
	ElBx3x+bAvpbLvnhw66geHwg5supbCAeN6+Os+s57TAVHq5ucw1KcNa2PZhE4AQoUJRpOLHkVzZUW
	ie+ZP/+aIN++V0l3IxN3N0RH7C0GdA8BdowbpLgc6WKIRsu0gv7DGFGavhduJbVA406IhIRxSpWtD
	g6Lu+h2g==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFaz-00CCEV-SE; Sun, 13 Nov 2022 16:12:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 13/13] nvme-pci: don't unbind the driver on reset failure
Date: Sun, 13 Nov 2022 17:11:38 +0100
Message-Id: <20221113161138.883195-14-hch@lst.de>
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

Unbind a device driver when a reset fails is very unusual behavior.
Just shut the controller down and leave it in dead state if we fail
to reset it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 40 ++++++++++------------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 6a5b661084509..fe21c9c153128 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -130,7 +130,6 @@ struct nvme_dev {
 	u32 db_stride;
 	void __iomem *bar;
 	unsigned long bar_mapped_size;
-	struct work_struct remove_work;
 	struct mutex shutdown_lock;
 	bool subsystem;
 	u64 cmb_size;
@@ -2797,20 +2796,6 @@ static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
 	kfree(dev);
 }
 
-static void nvme_remove_dead_ctrl(struct nvme_dev *dev)
-{
-	/*
-	 * Set state to deleting now to avoid blocking nvme_wait_reset(), which
-	 * may be holding this pci_dev's device lock.
-	 */
-	nvme_change_ctrl_state(&dev->ctrl, NVME_CTRL_DELETING);
-	nvme_get_ctrl(&dev->ctrl);
-	nvme_dev_disable(dev, false);
-	nvme_mark_namespaces_dead(&dev->ctrl);
-	if (!queue_work(nvme_wq, &dev->remove_work))
-		nvme_put_ctrl(&dev->ctrl);
-}
-
 static void nvme_reset_work(struct work_struct *work)
 {
 	struct nvme_dev *dev =
@@ -2901,20 +2886,16 @@ static void nvme_reset_work(struct work_struct *work)
  out_unlock:
 	mutex_unlock(&dev->shutdown_lock);
  out:
-	if (result)
-		dev_warn(dev->ctrl.device,
-			 "Removing after probe failure status: %d\n", result);
-	nvme_remove_dead_ctrl(dev);
-}
-
-static void nvme_remove_dead_ctrl_work(struct work_struct *work)
-{
-	struct nvme_dev *dev = container_of(work, struct nvme_dev, remove_work);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
-	if (pci_get_drvdata(pdev))
-		device_release_driver(&pdev->dev);
-	nvme_put_ctrl(&dev->ctrl);
+	/*
+	 * Set state to deleting now to avoid blocking nvme_wait_reset(), which
+	 * may be holding this pci_dev's device lock.
+	 */
+	dev_warn(dev->ctrl.device, "Disabling device after reset failure: %d\n",
+		 result);
+	nvme_change_ctrl_state(&dev->ctrl, NVME_CTRL_DELETING);
+	nvme_dev_disable(dev, true);
+	nvme_mark_namespaces_dead(&dev->ctrl);
+	nvme_change_ctrl_state(&dev->ctrl, NVME_CTRL_DEAD);
 }
 
 static int nvme_pci_reg_read32(struct nvme_ctrl *ctrl, u32 off, u32 *val)
@@ -3052,7 +3033,6 @@ static struct nvme_dev *nvme_pci_alloc_dev(struct pci_dev *pdev,
 	if (!dev)
 		return NULL;
 	INIT_WORK(&dev->ctrl.reset_work, nvme_reset_work);
-	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
 	mutex_init(&dev->shutdown_lock);
 
 	dev->nr_write_queues = write_queues;
-- 
2.30.2

