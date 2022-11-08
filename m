Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA2E17CA5
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=krGMcQNOr8//70FN+z2fPN5rZ6A7CYIsLaGXDNQdp2g=; b=H/ovPrLx8v30tmqTI1m/TeNJnx
	NF19A+nIBNjfYIiWY0cEWPKqhR7zGmIrsRXf/VcQF1AwrwEHcTtCB+u/jF29j4EzceSwf5mwdEoAW
	0XBE4A2gXY3Vv1vtjUhQ1xb1Tpa9M3Vz/PZj6R0xII2TU/op5gk0qdOutkjpKpiwc0aqydBSHNRWl
	6/u2HqsxQuQwtGpIAULBWKDXEJQGrRBS3whJXj8vq6SWLbepVOcO0d9b50J+SuQebLZlkMmtm/J07
	yRCd1+EriK+I6P4KZxmkitxx99md9WNyOwv8PvbGjTNJCNSEpyzhnQpXPedfg8UM3ORlwe3VofGB3
	w4YEuvUA==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ8B-006Br9-1F; Tue, 08 Nov 2022 15:03:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 07/12] nvme-pci: factor out a nvme_pci_alloc_ctrl helper
Date: Tue,  8 Nov 2022 16:02:47 +0100
Message-Id: <20221108150252.2123727-8-hch@lst.de>
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

Add a helper that allocates the nvme_dev structure up to the point where
we can call nvme_init_ctrl.  This pairs with the free_ctrl method and can
thus be used to cleanup the teardown path and make it more symmetric.

Note that this now calls nvme_init_ctrl a lot earlier during probing,
which also means the per-controller character device shows up earlier.
Due to the controller state no commnds can be send on it, but it might
make sense to delay the cdev registration until nvme_init_ctrl_finish.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 81 +++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index f7dab65bf5042..e1f60b1c6918f 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2777,6 +2777,7 @@ static void nvme_free_tagset(struct nvme_dev *dev)
 	dev->ctrl.tagset = NULL;
 }
 
+/* pairs with nvme_pci_alloc_ctrl */
 static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
 {
 	struct nvme_dev *dev = to_nvme_dev(ctrl);
@@ -3090,19 +3091,23 @@ static void nvme_async_probe(void *data, async_cookie_t cookie)
 	nvme_put_ctrl(&dev->ctrl);
 }
 
-static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+static struct nvme_dev *nvme_pci_alloc_ctrl(struct pci_dev *pdev,
+		const struct pci_device_id *id)
 {
-	int node, result = -ENOMEM;
-	struct nvme_dev *dev;
 	unsigned long quirks = id->driver_data;
+	int node = dev_to_node(&pdev->dev);
+	struct nvme_dev *dev;
+	int ret = -ENOMEM;
 
-	node = dev_to_node(&pdev->dev);
 	if (node == NUMA_NO_NODE)
 		set_dev_node(&pdev->dev, first_memory_node);
 
 	dev = kzalloc_node(sizeof(*dev), GFP_KERNEL, node);
 	if (!dev)
-		return -ENOMEM;
+		return NULL;
+	INIT_WORK(&dev->ctrl.reset_work, nvme_reset_work);
+	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
+	mutex_init(&dev->shutdown_lock);
 
 	dev->nr_write_queues = write_queues;
 	dev->nr_poll_queues = poll_queues;
@@ -3110,25 +3115,11 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	dev->queues = kcalloc_node(dev->nr_allocated_queues,
 			sizeof(struct nvme_queue), GFP_KERNEL, node);
 	if (!dev->queues)
-		goto free;
+		goto out_free_dev;
 
 	dev->dev = get_device(&pdev->dev);
-	pci_set_drvdata(pdev, dev);
-
-	result = nvme_dev_map(dev);
-	if (result)
-		goto put_pci;
-
-	INIT_WORK(&dev->ctrl.reset_work, nvme_reset_work);
-	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
-	mutex_init(&dev->shutdown_lock);
-
-	result = nvme_setup_prp_pools(dev);
-	if (result)
-		goto unmap;
 
 	quirks |= check_vendor_combination_bug(pdev);
-
 	if (!noacpi && acpi_storage_d3(&pdev->dev)) {
 		/*
 		 * Some systems use a bios work around to ask for D3 on
@@ -3138,34 +3129,54 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			 "platform quirk: setting simple suspend\n");
 		quirks |= NVME_QUIRK_SIMPLE_SUSPEND;
 	}
+	ret = nvme_init_ctrl(&dev->ctrl, &pdev->dev, &nvme_pci_ctrl_ops,
+			     quirks);
+	if (ret)
+		goto out_put_device;
+	return dev;
 
-	result = nvme_pci_alloc_iod_mempool(dev);
+out_put_device:
+	put_device(dev->dev);
+	kfree(dev->queues);
+out_free_dev:
+	kfree(dev);
+	return ERR_PTR(ret);
+}
+
+static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct nvme_dev *dev;
+	int result = -ENOMEM;
+
+	dev = nvme_pci_alloc_ctrl(pdev, id);
+	if (!dev)
+		return -ENOMEM;
+
+	result = nvme_dev_map(dev);
 	if (result)
-		goto release_pools;
+		goto out_uninit_ctrl;
 
-	result = nvme_init_ctrl(&dev->ctrl, &pdev->dev, &nvme_pci_ctrl_ops,
-			quirks);
+	result = nvme_setup_prp_pools(dev);
+	if (result)
+		goto out_dev_unmap;
+
+	result = nvme_pci_alloc_iod_mempool(dev);
 	if (result)
-		goto release_mempool;
+		goto out_release_prp_pools;
 
 	dev_info(dev->ctrl.device, "pci function %s\n", dev_name(&pdev->dev));
+	pci_set_drvdata(pdev, dev);
 
 	nvme_reset_ctrl(&dev->ctrl);
 	async_schedule(nvme_async_probe, dev);
-
 	return 0;
 
- release_mempool:
-	mempool_destroy(dev->iod_mempool);
- release_pools:
+out_release_prp_pools:
 	nvme_release_prp_pools(dev);
- unmap:
+out_dev_unmap:
 	nvme_dev_unmap(dev);
- put_pci:
-	put_device(dev->dev);
- free:
-	kfree(dev->queues);
-	kfree(dev);
+out_uninit_ctrl:
+	nvme_uninit_ctrl(&dev->ctrl);
 	return result;
 }
 
-- 
2.30.2

