Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF62224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561159; cv=none; b=IWtuDyKuE5W0okpS4Q/x8Rl3fqf/t9YWBF33QuZlVrwF4IPaI6UX04dGOXOVNpIQGuArl/lnOGFSCQm9ZKeRPgSI+tA6Solb4MuQKMArUhgzDUUuqAqLK/TT0GNAI3Efut5JL1vSqVGigp2SgP8VPsVHai/vjzem4bNsLzW/Ne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561159; c=relaxed/simple;
	bh=gJxDFRwVX7djrrbpz2EeMAEfcf9bvbiNAUW8ccmVzew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A0wFmu4FTuKac/gq2F5sRdS1PuOGHKB7FvAdlVPTsufa6KNh+g3dyHdlfgRknlpwBM+m9BsVSYuonpVPb1tfqtrgPC4iV3FV7dS1VdR+HH4T7/Eca+99J3K2mBxALZGRPra000bYc7B9qh3wXvURzaGXA6rIeBQMNGXGiirlwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wmUPWkWh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wmUPWkWh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ycn6WxJyb+SvrOi5azfp7SOfA9OrxlxpsJfCVYd6NOY=; b=wmUPWkWhCB6Yw8PaqbaZ9+cAc9
	OX51y8NHmnrAu7vXzuCk+BzKKKYlPGP9sAiROcFPCPONtm4lsMXugeP8k1T97CYTZUsOQjRzn7adU
	NjM/k0QEexX4ClJd6m//KalzUnJ6iFBWMM48WwTC8uOn3Iicqkz8gAceG6WHf9YqjGNQjmalyHLFA
	mChJvGzVtfzczp189hoZEC6FJnjlruw4K1fAMndQ+hNHpyQ2EawpGrjHlk2enw2HFU5v3dZ6alQK2
	NIH1A5tEN9a06x6U13egylmaXqsV0hHLIjVResJXScJEn37V/UkrCpglxx5Igm8Ph5H9Y6Pe3AfnV
	LsVYNz/g==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wv-00000009HuC-0rra;
	Mon, 04 Mar 2024 14:05:50 +0000
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
Subject: [PATCH 08/16] nvme: move a few things out of nvme_update_disk_info
Date: Mon,  4 Mar 2024 07:04:52 -0700
Message-Id: <20240304140500.78583-9-hch@lst.de>
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

Move setting up the integrity profile and setting the disk capacity out
of nvme_update_disk_info to get nvme_update_disk_info into a shape where
it just sets queue_limits eventually.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 46 +++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index d356f3fa2cf8eb..63c2b581f7859e 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1965,12 +1965,13 @@ static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
 	blk_queue_write_cache(q, vwc, vwc);
 }
 
-static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
-		struct nvme_ns_head *head, struct nvme_id_ns *id)
+static bool nvme_update_disk_info(struct nvme_ns *ns, struct nvme_id_ns *id)
 {
-	sector_t capacity = nvme_lba_to_sect(head, le64_to_cpu(id->nsze));
+	struct gendisk *disk = ns->disk;
+	struct nvme_ns_head *head = ns->head;
 	u32 bs = 1U << head->lba_shift;
 	u32 atomic_bs, phys_bs, io_opt = 0;
+	bool valid = true;
 
 	/*
 	 * The block layer can't support LBA sizes larger than the page size
@@ -1978,8 +1979,8 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 	 * allow block I/O.
 	 */
 	if (head->lba_shift > PAGE_SHIFT || head->lba_shift < SECTOR_SHIFT) {
-		capacity = 0;
 		bs = (1 << 9);
+		valid = false;
 	}
 
 	atomic_bs = phys_bs = bs;
@@ -1992,7 +1993,7 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 		if (id->nsfeat & NVME_NS_FEAT_ATOMICS && id->nawupf)
 			atomic_bs = (1 + le16_to_cpu(id->nawupf)) * bs;
 		else
-			atomic_bs = (1 + ctrl->subsys->awupf) * bs;
+			atomic_bs = (1 + ns->ctrl->subsys->awupf) * bs;
 	}
 
 	if (id->nsfeat & NVME_NS_FEAT_IO_OPT) {
@@ -2012,24 +2013,14 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 	blk_queue_io_min(disk->queue, phys_bs);
 	blk_queue_io_opt(disk->queue, io_opt);
 
-	/*
-	 * Register a metadata profile for PI, or the plain non-integrity NVMe
-	 * metadata masquerading as Type 0 if supported, otherwise reject block
-	 * I/O to namespaces with metadata except when the namespace supports
-	 * PI, as it can strip/insert in that case.
-	 */
-	if (!nvme_init_integrity(disk, head))
-		capacity = 0;
-
-	set_capacity_and_notify(disk, capacity);
-
-	nvme_config_discard(ctrl, disk, head);
+	nvme_config_discard(ns->ctrl, disk, head);
 
-	if (ctrl->quirks & NVME_QUIRK_DEALLOCATE_ZEROES)
+	if (ns->ctrl->quirks & NVME_QUIRK_DEALLOCATE_ZEROES)
 		blk_queue_max_write_zeroes_sectors(disk->queue, UINT_MAX);
 	else
 		blk_queue_max_write_zeroes_sectors(disk->queue,
-				ctrl->max_zeroes_sectors);
+				ns->ctrl->max_zeroes_sectors);
+	return valid;
 }
 
 static bool nvme_ns_is_readonly(struct nvme_ns *ns, struct nvme_ns_info *info)
@@ -2103,6 +2094,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		struct nvme_ns_info *info)
 {
 	struct nvme_id_ns *id;
+	sector_t capacity;
 	unsigned lbaf;
 	int ret;
 
@@ -2121,6 +2113,8 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	lbaf = nvme_lbaf_index(id->flbas);
 	ns->head->lba_shift = id->lbaf[lbaf].ds;
 	ns->head->nuse = le64_to_cpu(id->nuse);
+	capacity = nvme_lba_to_sect(ns->head, le64_to_cpu(id->nsze));
+
 	nvme_set_queue_limits(ns->ctrl, ns->queue);
 
 	ret = nvme_configure_metadata(ns->ctrl, ns->head, id);
@@ -2129,7 +2123,19 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		goto out;
 	}
 	nvme_set_chunk_sectors(ns, id);
-	nvme_update_disk_info(ns->ctrl, ns->disk, ns->head, id);
+	if (!nvme_update_disk_info(ns, id))
+		capacity = 0;
+
+	/*
+	 * Register a metadata profile for PI, or the plain non-integrity NVMe
+	 * metadata masquerading as Type 0 if supported, otherwise reject block
+	 * I/O to namespaces with metadata except when the namespace supports
+	 * PI, as it can strip/insert in that case.
+	 */
+	if (!nvme_init_integrity(ns->disk, ns->head))
+		capacity = 0;
+
+	set_capacity_and_notify(ns->disk, capacity);
 
 	if (ns->head->ids.csi == NVME_CSI_ZNS) {
 		ret = nvme_update_zone_info(ns, lbaf);
-- 
2.39.2

