Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4000224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561200; cv=none; b=qf1gWPcUtQotJcInedIQtHDO3aowEGt0igUdlio9mz2RTrRlIUF0m+U/1PXH/YflAbqJ6UKN4CH5FZbpBJfookFUdaiCfl4uQBphUzc/mQB5BExQhvPFOgP7Th/6xCeDX1qJT1DPFfb/EVLQHkvOaOXXH4luiwn8U62I3nZDTSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561200; c=relaxed/simple;
	bh=531ztc2pd7tGN4/9nzJ5pfybuqttHplMt6XWQwbzR4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O0A6oBTz1y4faWnOOXvce8pmQLQgDtgc0X6C0G9qEWN99B0GkMVRqNRKX4M+epyie8QxQwqbbhX3xKrBOT2WzmAjsNivlE9xU4ZBy422TH50uEhA84kIgQNdV6VJZST50zgD/R2ZdNIANpZwQBwnIcjU4E+orCHG9FTb+OW6nd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aoaaSIWX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aoaaSIWX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NgNSe+v3GZ1ofs/l7mw6pEzUPqYvYaFb7ZgcuivXAXw=; b=aoaaSIWXAh2vhg4rqnb+is0sOd
	Z8GoLuE3GsGo/JOsvMWPMmeHcqX7JyDmMxWg42POLCgjtthijWBGKjP95U1aSBKGUMoUZwpQCgCC/
	RhyXw3yJOpwyGP37Rh/db6vM/DqALBMYpItHklXz6o96TGZ7d0aUJYCXZ9l12hrQM4KoogTlz65X1
	1fpnxsrO7NBOgPq9TaaQWAcWXlK3W4yrjPUVqQEO+SuZ3Ntq7OKUMphIWFVshX8cFu804CL+mqNWW
	TiQI26TF5IfFaemSCA0qe3NBB1CK0dec6CzRnCC0PYF4T12UoKa0HD0JOQUBgwFOq/3s3RO4lNjFf
	/SaSRKxQ==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8xc-00000009IPU-3nlV;
	Mon, 04 Mar 2024 14:06:33 +0000
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
Subject: [PATCH 15/16] nvme-multipath: pass queue_limits to blk_alloc_disk
Date: Mon,  4 Mar 2024 07:04:59 -0700
Message-Id: <20240304140500.78583-16-hch@lst.de>
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

