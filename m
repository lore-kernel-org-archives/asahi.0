Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13914224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561134; cv=none; b=i3lBBmGjqUQZLY2+o6FyM2HAro5H3pCqr6ObS34ZSuvSqu0o3Tt+0Onsmt9/17szmzyDWGVnJ1gD30Nnb4Stadqb7w71z/61v9IoUFmq+sPqQ0Zs/vbf+xuTDoGAI98tR7xbSqX4CnV70zSFaeaQ42N2HcHVYLUduYo9omq8htg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561134; c=relaxed/simple;
	bh=qWrSvTzi2/H2aomEemo6skR8tIBQljgfg6I4s947Qaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FkhpcKi1CUM8eLsZ1Hkxxdrufg+EqzJtSJFM08EgxXAUM08p5bbtyzC+B0+vDcD4CLMq3+Sco7iu2pEuk00M8AxDdNrSWKVfiolYjLyQdUnAIQlPmgazjV6K9eyE9orntEm2Qu3NTUZOGZv6+hRR0CMZ7cxhc2HoBr/HdCMTJ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DcuSkH6T; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DcuSkH6T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dOyMK2ptrXEWDJpz38lQqSuW+FjtDHYyLwOrq25LntQ=; b=DcuSkH6Tl2yp0+pKkyMrGDJpNo
	zjwCsXf8A/BdHVYetmlWuAcc6GXk9iqxYyPNSokcjARNKH6hiJ82nwXvhH5j41dsLhjudBC8WcNuu
	pKsUx/eltr/0Kp+s0ePGFR40WMygXxggfNsiWn23M8fdZcNMJSxEiHPjTzndKA1ir4LnDHZURT0fq
	pnV3zBLihIotzgcyFfDUeweoDyNxsEXSns6oxXuS0JdafUQAqh753qTDaRP4dnPR22dVBhj9welzi
	nhSE76NkAqen2X26LTSxp0j9Lg00YSdURKuabaMwtHTJLoXgShnk3ChHUPLwzAkEVhLpe8VTSJRbB
	wXohRUww==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wa-00000009HjK-48p7;
	Mon, 04 Mar 2024 14:05:30 +0000
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
Subject: [PATCH 04/16] nvme: move max_integrity_segments handling out of nvme_init_integrity
Date: Mon,  4 Mar 2024 07:04:48 -0700
Message-Id: <20240304140500.78583-5-hch@lst.de>
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

max_integrity_segments is just a hardware limit and doesn't need to be
in nvme_init_integrity with the PI setup.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 2817eea07e967d..c4a268d91796f2 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1724,8 +1724,7 @@ int nvme_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 }
 
 #ifdef CONFIG_BLK_DEV_INTEGRITY
-static void nvme_init_integrity(struct gendisk *disk,
-		struct nvme_ns_head *head, u32 max_integrity_segments)
+static void nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
 {
 	struct blk_integrity integrity = { };
 
@@ -1773,11 +1772,9 @@ static void nvme_init_integrity(struct gendisk *disk,
 	integrity.tuple_size = head->ms;
 	integrity.pi_offset = head->pi_offset;
 	blk_integrity_register(disk, &integrity);
-	blk_queue_max_integrity_segments(disk->queue, max_integrity_segments);
 }
 #else
-static void nvme_init_integrity(struct gendisk *disk,
-		struct nvme_ns_head *head, u32 max_integrity_segments)
+static void nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
 {
 }
 #endif /* CONFIG_BLK_DEV_INTEGRITY */
@@ -1954,6 +1951,7 @@ static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
 	blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
 	blk_queue_max_segments(q, min_t(u32, USHRT_MAX,
 		min_not_zero(nvme_max_drv_segments(ctrl), ctrl->max_segments)));
+	blk_queue_max_integrity_segments(q, ctrl->max_integrity_segments);
 	blk_queue_virt_boundary(q, NVME_CTRL_PAGE_SIZE - 1);
 	blk_queue_dma_alignment(q, 3);
 	blk_queue_write_cache(q, vwc, vwc);
@@ -2017,8 +2015,7 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 	if (head->ms) {
 		if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
 		    (head->features & NVME_NS_METADATA_SUPPORTED))
-			nvme_init_integrity(disk, head,
-					    ctrl->max_integrity_segments);
+			nvme_init_integrity(disk, head);
 		else if (!nvme_ns_has_pi(head))
 			capacity = 0;
 	}
-- 
2.39.2

