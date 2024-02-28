Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318379B9A
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143948; cv=none; b=bN6icDuFdMjEjYOE5RaT/2uHufSL6nCpOZo/yM9s0uEzuVFvzvXZOrVpbmbhSYg3e4ynqPoIztH8MI847vcZtljVDOBhzUtJFvkYKmcHHTI8iSkF5daMaF0g/Yog3BXFx6Dbp2tIWqPMJeB/MP2cliSy3n0ZFhwE7V2Ogm7WeAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143948; c=relaxed/simple;
	bh=P1IQoLg+1u6O1VcyFcUqUmjOUsccbnvghmMWt+p9Ahk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P2/fhXdz67bV7xyNvGHkxUcS6yypu0opS1oa9Z2EqUHNBFfEvKtU2POLoegRqptF7tUfNMKXr3Tkv25nN4Sok+AvSpwtAzRHuhKXXZAsAQFG3w4wIzDYnNl76eFwusYeePk4wSbmgnYk4e65mfJZmRun5Pu7ZC8OFbLc6NaIH6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=icsBAzN9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="icsBAzN9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Hc0irG4v816AcBdPZAtLZLJPfPs5zn555CLxOuE/KbQ=; b=icsBAzN9lp8/AmBSt2L4paMQdO
	4U7TVwpQGUW1VnV+xcXfVZNNUz7MNbWgbkUIK41INO/hrLT+HvAhCOSu37jpxGtHTkaLzIc8r4olc
	ghHbtYq9C/z516OlqZhC5/qCfXjVEWa6EFQaVKWmO3PSmMGLElkdm6CQ0WSGYb2paENqTie+ga2ke
	n2Yom8TuhZTN9zFsp1OrlSHVJWhSUM2iOJddCYrObxyfXw6oRpQqXe7xzjf4LoA+isZ6aShpCT3qT
	DtTHhUw+s5CckP9oo4OmeZEoF9fJKtY0zZyhWCE6+TGN0XXY152cWovidHYJYZ00AhhO0I+arw2UY
	4NIclfXw==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPm-0000000ARFz-2Z65;
	Wed, 28 Feb 2024 18:12:22 +0000
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
Subject: [PATCH 12/21] nvme: move common logic into nvme_update_ns_info
Date: Wed, 28 Feb 2024 10:12:06 -0800
Message-Id: <20240228181215.873854-13-hch@lst.de>
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

nvme_update_ns_info_generic and nvme_update_ns_info_block share a
fair amount of logic related to not fully supported namespace
formats and updating the multipath information.  Move this logic
into the common caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 79 +++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index dcb8d0590ed0f3..78667ba89ec491 100644
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
@@ -2162,54 +2149,62 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
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
+	}
+
+	/*
+	 * If probing fails due an unsupported feature, hide the block device,
+	 * but still allow other access.
+	 */
+	if (ret == -ENODEV) {
+		ns->disk->flags |= GENHD_FL_HIDDEN;
+		set_bit(NVME_NS_READY, &ns->flags);
+		ret = 0;
+	}
+
+	if (!ret && nvme_ns_head_multipath(ns->head)) {
+		blk_mq_freeze_queue(ns->head->disk->queue);
+		if (!(ns->disk->flags & GENHD_FL_HIDDEN))
+			nvme_init_integrity(ns->head->disk, ns->head);
+		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
+		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
+		nvme_mpath_revalidate_paths(ns);
+		blk_stack_limits(&ns->head->disk->queue->limits,
+				 &ns->queue->limits, 0);
+		disk_update_readahead(ns->head->disk);
+		blk_mq_unfreeze_queue(ns->head->disk->queue);
 	}
+
+	return ret;
 }
 
 #ifdef CONFIG_BLK_SED_OPAL
-- 
2.39.2

