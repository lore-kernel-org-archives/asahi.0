Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E817CA4
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VjWAMhSsguhs9fHc3E5clZhNAa4snnF0Rwn7jtks+O0=; b=U3EMrPjvHdhP+a2RTJ4spd69iM
	lyTrc4Mbyz1gbwsYwRgkYJrSzsjt2xPrsh73sX8HK4IpIPAHr2v2zGBt+J/5JYK9gNyHUkYEUQo/3
	QHtyWxa7Bfw+X2W3SjegmnW6q/ivPYDCS7ctjwu4IUKMCAQ4bWs/cudGeTHgEQsillMpQAKWrmApP
	zQF9T45Tpb4SFkyotlRkkRcRd1pnSoIkiSticrUpVmG7SWpwMx2S7Rz20rAAFLSfGldOphHoqJDqI
	O8fbK6tsFpdc6a8c4z0p+N/lT//eHznR9vAQzSr1S7EHIwTL8A4oIFhbfyCeSpiytdCgRdZF9bzee
	zyi5hNPQ==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ80-006Bnk-9N; Tue, 08 Nov 2022 15:03:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 03/12] nvme: simplify transport specific device attribute handling
Date: Tue,  8 Nov 2022 16:02:43 +0100
Message-Id: <20221108150252.2123727-4-hch@lst.de>
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

Allow the transport driver to override the attribute groups for the
control device, so that the PCIe driver doesn't manually have to add a
group after device creation and keep track of it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c |  8 ++++++--
 drivers/nvme/host/nvme.h |  2 ++
 drivers/nvme/host/pci.c  | 23 ++++++++---------------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 887d1aefbc49f..d356f84c1bb91 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3891,10 +3891,11 @@ static umode_t nvme_dev_attrs_are_visible(struct kobject *kobj,
 	return a->mode;
 }
 
-static const struct attribute_group nvme_dev_attrs_group = {
+const struct attribute_group nvme_dev_attrs_group = {
 	.attrs		= nvme_dev_attrs,
 	.is_visible	= nvme_dev_attrs_are_visible,
 };
+EXPORT_SYMBOL_GPL(nvme_dev_attrs_group);
 
 static const struct attribute_group *nvme_dev_attr_groups[] = {
 	&nvme_dev_attrs_group,
@@ -5076,7 +5077,10 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 			ctrl->instance);
 	ctrl->device->class = nvme_class;
 	ctrl->device->parent = ctrl->dev;
-	ctrl->device->groups = nvme_dev_attr_groups;
+	if (ops->dev_attr_groups)
+		ctrl->device->groups = ops->dev_attr_groups;
+	else
+		ctrl->device->groups = nvme_dev_attr_groups;
 	ctrl->device->release = nvme_free_ctrl;
 	dev_set_drvdata(ctrl->device, ctrl);
 	ret = dev_set_name(ctrl->device, "nvme%d", ctrl->instance);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 124a6412cc5c3..ac60f28349be0 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -507,6 +507,7 @@ struct nvme_ctrl_ops {
 	unsigned int flags;
 #define NVME_F_FABRICS			(1 << 0)
 #define NVME_F_METADATA_SUPPORTED	(1 << 1)
+	const struct attribute_group **dev_attr_groups;
 	int (*reg_read32)(struct nvme_ctrl *ctrl, u32 off, u32 *val);
 	int (*reg_write32)(struct nvme_ctrl *ctrl, u32 off, u32 val);
 	int (*reg_read64)(struct nvme_ctrl *ctrl, u32 off, u64 *val);
@@ -853,6 +854,7 @@ int nvme_dev_uring_cmd(struct io_uring_cmd *ioucmd, unsigned int issue_flags);
 extern const struct attribute_group *nvme_ns_id_attr_groups[];
 extern const struct pr_ops nvme_pr_ops;
 extern const struct block_device_operations nvme_ns_head_ops;
+extern const struct attribute_group nvme_dev_attrs_group;
 
 struct nvme_ns *nvme_find_path(struct nvme_ns_head *head);
 #ifdef CONFIG_NVME_MULTIPATH
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index e4f084e12b966..c8f6ce5eee1c2 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -158,8 +158,6 @@ struct nvme_dev {
 	unsigned int nr_allocated_queues;
 	unsigned int nr_write_queues;
 	unsigned int nr_poll_queues;
-
-	bool attrs_added;
 };
 
 static int io_queue_depth_set(const char *val, const struct kernel_param *kp)
@@ -2234,11 +2232,17 @@ static struct attribute *nvme_pci_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group nvme_pci_attr_group = {
+static const struct attribute_group nvme_pci_dev_attrs_group = {
 	.attrs		= nvme_pci_attrs,
 	.is_visible	= nvme_pci_attrs_are_visible,
 };
 
+static const struct attribute_group *nvme_pci_dev_attr_groups[] = {
+	&nvme_dev_attrs_group,
+	&nvme_pci_dev_attrs_group,
+	NULL,
+};
+
 /*
  * nirqs is the number of interrupts available for write and read
  * queues. The core already reserved an interrupt for the admin queue.
@@ -2930,10 +2934,6 @@ static void nvme_reset_work(struct work_struct *work)
 		goto out;
 	}
 
-	if (!dev->attrs_added && !sysfs_create_group(&dev->ctrl.device->kobj,
-			&nvme_pci_attr_group))
-		dev->attrs_added = true;
-
 	nvme_start_ctrl(&dev->ctrl);
 	return;
 
@@ -3006,6 +3006,7 @@ static const struct nvme_ctrl_ops nvme_pci_ctrl_ops = {
 	.name			= "pcie",
 	.module			= THIS_MODULE,
 	.flags			= NVME_F_METADATA_SUPPORTED,
+	.dev_attr_groups	= nvme_pci_dev_attr_groups,
 	.reg_read32		= nvme_pci_reg_read32,
 	.reg_write32		= nvme_pci_reg_write32,
 	.reg_read64		= nvme_pci_reg_read64,
@@ -3204,13 +3205,6 @@ static void nvme_shutdown(struct pci_dev *pdev)
 	nvme_disable_prepare_reset(dev, true);
 }
 
-static void nvme_remove_attrs(struct nvme_dev *dev)
-{
-	if (dev->attrs_added)
-		sysfs_remove_group(&dev->ctrl.device->kobj,
-				   &nvme_pci_attr_group);
-}
-
 /*
  * The driver's remove may be called on a device in a partially initialized
  * state. This function must not have any dependencies on the device state in
@@ -3232,7 +3226,6 @@ static void nvme_remove(struct pci_dev *pdev)
 	nvme_stop_ctrl(&dev->ctrl);
 	nvme_remove_namespaces(&dev->ctrl);
 	nvme_dev_disable(dev, true);
-	nvme_remove_attrs(dev);
 	nvme_free_host_mem(dev);
 	nvme_dev_remove_admin(dev);
 	nvme_free_queues(dev, 0);
-- 
2.30.2

