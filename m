Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758CC3F9CB
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561169; cv=none; b=QygULzGiX+1Xxt4TFk3alROSJbMSr8MGek704dDWyGgP9s7osw2Lm/AqbPrGprrJB2msFVxun44Eyte8zVmNGWdSzkDSKJxnZGYK7zExetvNF8pgKZxXvP5uPIPfpXJxv9yQiKgyJqjLujHi0CRgeI/VsV/PXuR9PfVnzwJg91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561169; c=relaxed/simple;
	bh=QeFrb+pUy5wdQI7LU3lfwXXHfsn6Zg0yblK98drRcTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iLywQw49Q1U9i+pzNWXAEeLE3saLrfpLtsfmAHtGbtC6fNa4CFzmmk4dOfYSQj34jFWphRvKx/obLH4TRTRRJr79gyrdWL2qcwyHZN6IH/zqlkEkYH5ITAZdoiv2DhyrezDibA5Uo8TxxNRXep1uT6P4wKyC7dej498Rh3mMKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d+gVlAuB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d+gVlAuB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nws8FVYyqVVHYQigD+iaNJTps5x65HkcwfreKJD4bI0=; b=d+gVlAuB2OGiTJp2sHbpkzs0Rr
	eAUvGUyBZKquzgvdsBjuk+QLjyTQOc/KFNYFjdU2unosj2yOXvbLS16+4iSdeAVKv/8eum8BhAQiU
	HXdC+DXPFDcBL5IzOqlQvpmrjtwpxeJPMkntwH7in+dSgfkYdWZ0OaD6d/NjswNy0gjFvfC0Dw+Fv
	q9lz4pelIEdUuAvrwhF13krLZ/v9icv2G1c6gv66zjaJzNblSa5CspD+8TAZiXE7E7/99rGLeIM5A
	q5qGB32TRmlP6bgdjJLhNwA2AnxwuUsoEL/klCOMPxGAXwUdvXHiBd12RhLia6D4uwWGT3IS/eXky
	CFEFCOtQ==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8x9-00000009Hzz-0Yph;
	Mon, 04 Mar 2024 14:06:04 +0000
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
Subject: [PATCH 10/16] nvme: move common logic into nvme_update_ns_info
Date: Mon,  4 Mar 2024 07:04:54 -0700
Message-Id: <20240304140500.78583-11-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240304140500.78583-1-hch@lst.de>
References: <20240304140500.78583-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

nvme_update_ns_info_generic and nvme_update_ns_info_block share a
fair amount of logic related to not fully supported namespace
formats and updating the multipath information.  Move this logic
into the common caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 84 ++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index ce70bfb66242e2..f0686a872d0e30 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2070,21 +2070,8 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
 	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
 	blk_mq_unfreeze_queue(ns->disk->queue);
 
-	if (nvme_ns_head_multipath(ns->head)) {
-		blk_mq_freeze_queue(ns->head->disk->queue);
-		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
-		nvme_mpath_revalidate_paths(ns);
-		blk_stack_limits(&ns->head->disk->queue->limits,
-				 &ns->queue->limits, 0);
-		ns->head->disk->flags |= GENHD_FL_HIDDEN;
-		blk_mq_unfreeze_queue(ns->head->disk->queue);
-	}
-
 	/* Hide the block-interface for these devices */
-	ns->disk->flags |= GENHD_FL_HIDDEN;
-	set_bit(NVME_NS_READY, &ns->flags);
-
-	return 0;
+	return -ENODEV;
 }
 
 static int nvme_update_ns_info_block(struct nvme_ns *ns,
@@ -2104,7 +2091,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		/* namespace not allocated or attached */
 		info->is_removed = true;
 		ret = -ENODEV;
-		goto error;
+		goto out;
 	}
 
 	blk_mq_freeze_queue(ns->disk->queue);
@@ -2162,54 +2149,67 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 			goto out;
 	}
 
-	if (nvme_ns_head_multipath(ns->head)) {
-		blk_mq_freeze_queue(ns->head->disk->queue);
-		nvme_init_integrity(ns->head->disk, ns->head);
-		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
-		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
-		nvme_mpath_revalidate_paths(ns);
-		blk_stack_limits(&ns->head->disk->queue->limits,
-				 &ns->queue->limits, 0);
-		disk_update_readahead(ns->head->disk);
-		blk_mq_unfreeze_queue(ns->head->disk->queue);
-	}
-
 	ret = 0;
 out:
-	/*
-	 * If probing fails due an unsupported feature, hide the block device,
-	 * but still allow other access.
-	 */
-	if (ret == -ENODEV) {
-		ns->disk->flags |= GENHD_FL_HIDDEN;
-		set_bit(NVME_NS_READY, &ns->flags);
-		ret = 0;
-	}
-
-error:
 	kfree(id);
 	return ret;
 }
 
 static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 {
+	bool unsupported = false;
+	int ret;
+
 	switch (info->ids.csi) {
 	case NVME_CSI_ZNS:
 		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED)) {
 			dev_info(ns->ctrl->device,
 	"block device for nsid %u not supported without CONFIG_BLK_DEV_ZONED\n",
 				info->nsid);
-			return nvme_update_ns_info_generic(ns, info);
+			ret = nvme_update_ns_info_generic(ns, info);
+			break;
 		}
-		return nvme_update_ns_info_block(ns, info);
+		ret = nvme_update_ns_info_block(ns, info);
+		break;
 	case NVME_CSI_NVM:
-		return nvme_update_ns_info_block(ns, info);
+		ret = nvme_update_ns_info_block(ns, info);
+		break;
 	default:
 		dev_info(ns->ctrl->device,
 			"block device for nsid %u not supported (csi %u)\n",
 			info->nsid, info->ids.csi);
-		return nvme_update_ns_info_generic(ns, info);
+		ret = nvme_update_ns_info_generic(ns, info);
+		break;
 	}
+
+	/*
+	 * If probing fails due an unsupported feature, hide the block device,
+	 * but still allow other access.
+	 */
+	if (ret == -ENODEV) {
+		ns->disk->flags |= GENHD_FL_HIDDEN;
+		set_bit(NVME_NS_READY, &ns->flags);
+		unsupported = true;
+		ret = 0;
+	}
+
+	if (!ret && nvme_ns_head_multipath(ns->head)) {
+		blk_mq_freeze_queue(ns->head->disk->queue);
+		if (unsupported)
+			ns->head->disk->flags |= GENHD_FL_HIDDEN;
+		else
+			nvme_init_integrity(ns->head->disk, ns->head);
+		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
+		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
+		nvme_mpath_revalidate_paths(ns);
+		blk_stack_limits(&ns->head->disk->queue->limits,
+				 &ns->queue->limits, 0);
+
+		disk_update_readahead(ns->head->disk);
+		blk_mq_unfreeze_queue(ns->head->disk->queue);
+	}
+
+	return ret;
 }
 
 #ifdef CONFIG_BLK_SED_OPAL
-- 
2.39.2

