Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F0B79B83
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143950; cv=none; b=eq0CsMp9x7z2IT9qk/77cDcie+Ewgjz3xPSKqVLV9r/MX98uxjEyir0ljgYp3s1ChG4xPmfjpc38GMriFAUB1B5UOrc5hig2rOQuHqBvuMVrjqeG4aXTo3ZAgw2TCpCH6xYsK7rAxB0rBTcfkqiPIA1iHsqp1/cZu89G4gvgWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143950; c=relaxed/simple;
	bh=whQNU30LFo/oW1qIcRhJiJLppMUq42ATCxpyV7um9wU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOTg3HzZQ4ImaldTY4EFt19Z8Z7vQvbnczeQd2JK731xAU5SjNilMFwUu7qK5F8eDhdnZv6aPPdMXdxKDeMWUxSbiR+0fYvUe81NmGGaNmL3AYfibBkLiHOUgG8JwnDkOnq5XBQjbjH/rZUjyX3eImRJ5ew8VWXDbfcz62/Ax1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cHREQS3u; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cHREQS3u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vMKntaVlWYvqqF+zfvj+uEPQ08MXrJRoeNI86ZuB31Q=; b=cHREQS3uDoJituIKvnnYwz9Fsu
	UQ+v0f1D05RVlZmX8CBSBdAvWT9ryViOsErGkftqSb3XKKO7YGqyxd5eSx2P6A2/7C/i9FzHSflhA
	Qp0+1/JIWj2BIWqN2L97sdfBC7zs8H4hbLs6rAhC3/a1I9y5cp0Le94Mwhgi6mQyJPHjGCbiUK0pL
	B9vfd2A1DWuGtDIoI4D+f9rfM382uUqetBxp1iqyE76QLe0MKx4Msf5AkXs69wng8Vtp+ehMfMmRC
	kpiDT1THp4p6UmRfIXFZpq3789rcBpm3QdXsWjXxo+RfTfP4kRW6IYB8MzdQfnQIyuY6gTYlmwT/w
	38caOmQA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPn-0000000ARGx-3lIW;
	Wed, 28 Feb 2024 18:12:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 14/21] nvme: don't query identify data in configure_metadata
Date: Wed, 28 Feb 2024 10:12:08 -0800
Message-Id: <20240228181215.873854-15-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228181215.873854-1-hch@lst.de>
References: <20240228181215.873854-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move reading the Identify Namespace Data Structure, NVM Command Set out
of configure_metadata into the caller.  This allows doing the identify
call outside the frozen I/O queues, and prepares for using data from
the Identify data structure for other purposes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 49 ++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 30 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index adcd11720d1bb4..531230ccd12210 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1855,32 +1855,26 @@ static int nvme_identify_ns_nvm(struct nvme_ctrl *ctrl, unsigned int nsid,
 	return ret;
 }
 
-static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
-		struct nvme_id_ns *id)
+static void nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
+		struct nvme_id_ns *id, struct nvme_id_ns_nvm *nvm)
 {
 	bool first = id->dps & NVME_NS_DPS_PI_FIRST;
 	unsigned lbaf = nvme_lbaf_index(id->flbas);
-	struct nvme_id_ns_nvm *nvm;
-	int ret = 0;
 	u32 elbaf;
 
 	head->pi_size = 0;
 	head->ms = le16_to_cpu(id->lbaf[lbaf].ms);
-	if (!(ctrl->ctratt & NVME_CTRL_ATTR_ELBAS)) {
+	if (!nvm || !(ctrl->ctratt & NVME_CTRL_ATTR_ELBAS)) {
 		head->pi_size = sizeof(struct t10_pi_tuple);
 		head->guard_type = NVME_NVM_NS_16B_GUARD;
 		goto set_pi;
 	}
 
-	ret = nvme_identify_ns_nvm(ctrl, head->ns_id, &nvm);
-	if (ret)
-		goto set_pi;
-
 	elbaf = le32_to_cpu(nvm->elbaf[lbaf]);
 
 	/* no support for storage tag formats right now */
 	if (nvme_elbaf_sts(elbaf))
-		goto free_data;
+		goto set_pi;
 
 	head->guard_type = nvme_elbaf_guard_type(elbaf);
 	switch (head->guard_type) {
@@ -1894,8 +1888,6 @@ static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
 		break;
 	}
 
-free_data:
-	kfree(nvm);
 set_pi:
 	if (head->pi_size && head->ms >= head->pi_size)
 		head->pi_type = id->dps & NVME_NS_DPS_PI_MASK;
@@ -1906,22 +1898,17 @@ static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
 		head->pi_offset = 0;
 	else
 		head->pi_offset = head->ms - head->pi_size;
-
-	return ret;
 }
 
-static int nvme_configure_metadata(struct nvme_ctrl *ctrl,
-		struct nvme_ns_head *head, struct nvme_id_ns *id)
+static void nvme_configure_metadata(struct nvme_ctrl *ctrl,
+		struct nvme_ns_head *head, struct nvme_id_ns *id,
+		struct nvme_id_ns_nvm *nvm)
 {
-	int ret;
-
-	ret = nvme_init_ms(ctrl, head, id);
-	if (ret)
-		return ret;
+	nvme_init_ms(ctrl, head, id, nvm);
 
 	head->features &= ~(NVME_NS_METADATA_SUPPORTED | NVME_NS_EXT_LBAS);
 	if (!head->ms || !(ctrl->ops->flags & NVME_F_METADATA_SUPPORTED))
-		return 0;
+		return;
 
 	if (ctrl->ops->flags & NVME_F_FABRICS) {
 		/*
@@ -1930,7 +1917,7 @@ static int nvme_configure_metadata(struct nvme_ctrl *ctrl,
 		 * remap the separate metadata buffer from the block layer.
 		 */
 		if (WARN_ON_ONCE(!(id->flbas & NVME_NS_FLBAS_META_EXT)))
-			return 0;
+			return;
 
 		head->features |= NVME_NS_EXT_LBAS;
 
@@ -1957,7 +1944,6 @@ static int nvme_configure_metadata(struct nvme_ctrl *ctrl,
 		else
 			head->features |= NVME_NS_METADATA_SUPPORTED;
 	}
-	return 0;
 }
 
 static u32 nvme_max_drv_segments(struct nvme_ctrl *ctrl)
@@ -2092,6 +2078,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		struct nvme_ns_info *info)
 {
 	bool vwc = ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT;
+	struct nvme_id_ns_nvm *nvm = NULL;
 	struct nvme_id_ns *id;
 	sector_t capacity;
 	unsigned lbaf;
@@ -2108,6 +2095,12 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		goto out;
 	}
 
+	if (ns->ctrl->ctratt & NVME_CTRL_ATTR_ELBAS) {
+		ret = nvme_identify_ns_nvm(ns->ctrl, info->nsid, &nvm);
+		if (ret < 0)
+			goto out;
+	}
+
 	blk_mq_freeze_queue(ns->disk->queue);
 	lbaf = nvme_lbaf_index(id->flbas);
 	ns->head->lba_shift = id->lbaf[lbaf].ds;
@@ -2115,12 +2108,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	capacity = nvme_lba_to_sect(ns->head, le64_to_cpu(id->nsze));
 
 	nvme_set_queue_limits(ns->ctrl, ns->queue);
-
-	ret = nvme_configure_metadata(ns->ctrl, ns->head, id);
-	if (ret < 0) {
-		blk_mq_unfreeze_queue(ns->disk->queue);
-		goto out;
-	}
+	nvme_configure_metadata(ns->ctrl, ns->head, id, nvm);
 	nvme_set_chunk_sectors(ns, id);
 	if (!nvme_update_disk_info(ns, id))
 		capacity = 0;
@@ -2165,6 +2153,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 
 	ret = 0;
 out:
+	kfree(nvm);
 	kfree(id);
 	return ret;
 }
-- 
2.39.2

