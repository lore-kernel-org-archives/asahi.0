Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4440840
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143953; cv=none; b=opvJCeGZhC5VKQdw0pvVYmVFLcfjhQ8JcRMghUtfHN9zRC6Hz/GqxzTJnPKSctdG+ZmFoW1qLJ5Ggak5Cr2RmV0v6yEy24wzkuQlY1mTp6AdOS36nyNdQdu/lIEkCjkgsuArw0PxvKzdSHHOp3H5JTDidUlPL/5jGqXWQPNeJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143953; c=relaxed/simple;
	bh=531ztc2pd7tGN4/9nzJ5pfybuqttHplMt6XWQwbzR4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mwzn7znVDTMZHeCDyAPIP168nmKJCfUAFzKq7vpog7+aO5Z3PBNbDK/H7rDUW0OEMR+ebh3qIgxEYzLMlPAtJLIguC8Uu2YRlcWckAOFwzrmc3ZLtOQMnYF5GkgSZH4AgIFAewggLAjW1kxtPq+1zM+P3BrysX0WnGCWV/xmxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BC4tKrVQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BC4tKrVQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NgNSe+v3GZ1ofs/l7mw6pEzUPqYvYaFb7ZgcuivXAXw=; b=BC4tKrVQrj07mVBdr0rqZUkOEQ
	fWDMWeSIAW1aOZX9FC4fJKOL6EyGFnTyOY2353ou1MnFvp0xaoqyAwGIfBXwz/ExqZJ4e1di4FR6Y
	fng5C6X4kUcVY9UjBdMEt8UH8MNYmYor9VjAkbmiWbamXsDLn6EeSYbXzZLGu55Jl7rj7XsmM0oHV
	n/K3YkNSk2P82HQV5Q1CZE7ZposU8YnoP0xdU/edZmBjfhrXsMEfx7xhJZKMgn0f3YprtY1g+SY3b
	dEeK67OfKO4lbjbud5CWXXakmWsAGstBHI3rN1/kK7O6jruuSkgi42taU+v7x1Fkf/lYnwmDC+8u1
	bdwLXmjQ==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPr-0000000ARJS-2xT1;
	Wed, 28 Feb 2024 18:12:27 +0000
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
Subject: [PATCH 21/21] nvme-multipath: pass queue_limits to blk_alloc_disk
Date: Wed, 28 Feb 2024 10:12:15 -0800
Message-Id: <20240228181215.873854-22-hch@lst.de>
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

The multipath disk starts out with the stacking default limits.
The one interesting part here is that blk_set_stacking_limits
sets the max_zone_append_sectorts to UINT_MAX, which fails the
validation for non-zoned devices.  With the old one call per
limit scheme this was fine because no one verified this weird
mismatch and it was fixed by blk_stack_limits a little later
before I/O could be issued.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/multipath.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index dc5d0d0a82d0e2..5397fb428b242c 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -516,6 +516,7 @@ static void nvme_requeue_work(struct work_struct *work)
 
 int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 {
+	struct queue_limits lim;
 	bool vwc = false;
 
 	mutex_init(&head->lock);
@@ -532,7 +533,12 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	    !nvme_is_unique_nsid(ctrl, head) || !multipath)
 		return 0;
 
-	head->disk = blk_alloc_disk(NULL, ctrl->numa_node);
+	blk_set_stacking_limits(&lim);
+	lim.dma_alignment = 3;
+	if (head->ids.csi != NVME_CSI_ZNS)
+		lim.max_zone_append_sectors = 0;
+
+	head->disk = blk_alloc_disk(&lim, ctrl->numa_node);
 	if (IS_ERR(head->disk))
 		return PTR_ERR(head->disk);
 	head->disk->fops = &nvme_ns_head_ops;
@@ -553,11 +559,6 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	    ctrl->tagset->map[HCTX_TYPE_POLL].nr_queues)
 		blk_queue_flag_set(QUEUE_FLAG_POLL, head->disk->queue);
 
-	/* set to a default value of 512 until the disk is validated */
-	blk_queue_logical_block_size(head->disk->queue, 512);
-	blk_set_stacking_limits(&head->disk->queue->limits);
-	blk_queue_dma_alignment(head->disk->queue, 3);
-
 	/* we need to propagate up the VMC settings */
 	if (ctrl->vwc & NVME_CTRL_VWC_PRESENT)
 		vwc = true;
-- 
2.39.2

