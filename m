Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460279B95
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143944; cv=none; b=BijeX1YZhBJnVeDX/rFO2Zw8WkzrCBOum9zzdxUyBD/NO9Eb6nCffdtUDbNQlaFA6OeVyQHbqOPg4vQkdtRpwIwpLUMKykwWYFUTKDGEpX+5R2hCH98K7e/LMJACfzqmD7BfnFMwURm4r42BAJY1yT0jE1E1OK3xrNJebvaPLuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143944; c=relaxed/simple;
	bh=WoP63uRBYdRZ1OIema1ppXT493C57UwiUwioWCofG58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hID7laeCStA6b2yM14i9BCOjtPslOvgmDwv1k0qxQhyhz38zWCRoicbYzRch9BzM0TrHnQ7b7WStovNCMNl3/DyhfMqL1yPHKNo0QKwhtYnLMfqJDEPV2icflY7bOFq/3CR4VJyjMj1291kLC0C2MOTaX7pLNSw5x+YFdfQQxlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uTxgtdqB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uTxgtdqB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Zm4JLbDZWW3cDD71wNL5k2UJHQkkbzAlAsf9BMN7mGQ=; b=uTxgtdqBWK+FDBFF3FE+7QDjJu
	71Tux2KwPk4+VNdFRK3IKgGPdkQ2UjoNLsSeToVCVBDVyILUqgw9TejsU5yKZzur9oX2CfMrZUZ65
	TgZrLNgqIpaeEce5hxTFXoqlyBxQ9n8a8xlfdLvOPiEbjwLjr2durK3MeOCEr7omtGatFfAsFPJoO
	Zu2oKDxCY1CsZcAhTWxiH8gcjV4hle4ttXxdTk2PxINXNrgISL/7Ci3qElsh2tZUJohwIIS+U/IKs
	ZbkBkZ1aPrbLB1OhgYdDLKZmwEZqNVzFN7wdad6ynw10RjPAhXkgr07YDVhpxmVhrPjbJi7y89/LC
	WP/FSV7A==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPk-0000000ARDg-0wGq;
	Wed, 28 Feb 2024 18:12:20 +0000
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
Subject: [PATCH 06/21] nvme: move max_integrity_segments handling out of nvme_init_integrity
Date: Wed, 28 Feb 2024 10:12:00 -0800
Message-Id: <20240228181215.873854-7-hch@lst.de>
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

max_integrity_segments is just a hardware limit and doesn't need to be
in nvme_init_integrity with the PI setup.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 4a05045e409904..94d835f9dc90e9 100644
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

