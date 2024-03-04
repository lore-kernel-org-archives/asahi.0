Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFC23F9C7
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561166; cv=none; b=LnthZ6Wiam2abObk0TSeiYphc7Bhp5MWutCiCqKvKbTAib+KTIDS8qgWmUaTN23U781HvS212G0puyJ3KI/LVNg5IQaVmXDYicrvUNPYLRJgecsyYmsgEGokVCQJm39G4SJ1UyRejuEtIJ+FFAmBq5pzJ2xsxKjBoF8swlx6XpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561166; c=relaxed/simple;
	bh=TiklothWDWLBUfX0iBxPInFtQnuo7S2vq/V09QKqs9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bj9E8FD1vzjjGba2dW/QIfHBdlnJRcgEcH3wwPZ5+8yckl3tvcajUfi4+7uG3+1iNFaspxZbWCbcqjvIt1LLYXtOk8KP/S677H5iSx/tjcyEb2m7pnRCbUuRKU6aBKNo1RPyNpRioEjYuUgA5gvqpTUpnVRKNRed8qr7BQbVkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GMZ59e+k; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GMZ59e+k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=PaxvdzeXYPC7l7Hheb7uDK4UpY+OSwRghgbria6VQWc=; b=GMZ59e+kcVbkAdZUpw6MKeA63R
	/YKuEW2pppqj+lpnwZWKJNzubHEpmjgyvfswrTvdSe3HWw0XQaSZGeebt/ai/tDvIb6i6TkWqSHhU
	NFXna7okd0GtbEwYgpbyQDJDlxMDyojvN30DgR9bzLFHq5aKlsVPkVqi3AxYs0OZQc4hq9Nkyi7c5
	2e6DtVS4frl4O+vNxIC7xjaPnDj4U4fxiRiPxEtMYi9JGIrj1yKXWt7asLypFobTecQKZyToEygqo
	UA1dkugHChdCguYE4lqcuO4L9tQhj+nHgrUyP6cYdOMliy5C5YVN4Y0R5vRhlkzRQM+E0p8npSRj/
	ldk4aK8g==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8x0-00000009HxE-2JNc;
	Mon, 04 Mar 2024 14:05:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [PATCH 09/16] nvme: move setting the write cache flags out of nvme_set_queue_limits
Date: Mon,  4 Mar 2024 07:04:53 -0700
Message-Id: <20240304140500.78583-10-hch@lst.de>
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

nvme_set_queue_limits is used on the admin queue and all gendisks
including hidden ones that don't support block I/O.  The write cache
setting on the other hand only makes sense for block I/O.  Move the
blk_queue_write_cache call to nvme_update_ns_info_block instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 63c2b581f7859e..ce70bfb66242e2 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1954,15 +1954,12 @@ static u32 nvme_max_drv_segments(struct nvme_ctrl *ctrl)
 static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
 		struct request_queue *q)
 {
-	bool vwc = ctrl->vwc & NVME_CTRL_VWC_PRESENT;
-
 	blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
 	blk_queue_max_segments(q, min_t(u32, USHRT_MAX,
 		min_not_zero(nvme_max_drv_segments(ctrl), ctrl->max_segments)));
 	blk_queue_max_integrity_segments(q, ctrl->max_integrity_segments);
 	blk_queue_virt_boundary(q, NVME_CTRL_PAGE_SIZE - 1);
 	blk_queue_dma_alignment(q, 3);
-	blk_queue_write_cache(q, vwc, vwc);
 }
 
 static bool nvme_update_disk_info(struct nvme_ns *ns, struct nvme_id_ns *id)
@@ -2093,6 +2090,7 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
 static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		struct nvme_ns_info *info)
 {
+	bool vwc = ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT;
 	struct nvme_id_ns *id;
 	sector_t capacity;
 	unsigned lbaf;
@@ -2154,6 +2152,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	if ((id->dlfeat & 0x7) == 0x1 && (id->dlfeat & (1 << 3)))
 		ns->head->features |= NVME_NS_DEAC;
 	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
+	blk_queue_write_cache(ns->disk->queue, vwc, vwc);
 	set_bit(NVME_NS_READY, &ns->flags);
 	blk_mq_unfreeze_queue(ns->disk->queue);
 
-- 
2.39.2

