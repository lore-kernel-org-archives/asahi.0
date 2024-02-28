Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6833F79B89
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143944; cv=none; b=c5r0AFofKDz4YLBeJ7EfnMRckChpMHRiGhnhAMsZo+HUvqz0nIKl9bQRJcFat76tfOWkOS/USp83nyKzggQFvhyWffD4ra+cNwAaBZ1bZxRNJm8Avb87WEfTTnwyYkQpDiemst4VG1EVkFJd09t3r/Cl2uW8sPLsduYHxeAnQns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143944; c=relaxed/simple;
	bh=jES3SuP0iVReDhw0vbBanCh38V/n4GUTwt1ztqzElno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hrbpTSssoqIxNJvdEdN/atUNrHYR/y+19aVXmOs3xLHfSJdstbaEwh0cCLFlk5MhhhWV8gyXfawX15NPlMfwvrGeO9LUZ0bi4U4YbhHQYmA856w/RDBSnS0zOPlx1pjDRUaZ/mLloH4Ml8SCgTfnnYGdoLIygDhFjNX+tu6u1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HfATHBvC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HfATHBvC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jJIG5/x6zL5P7G24W7g6yicPEwlqXXMnHroF2LLRUzA=; b=HfATHBvCTSBQCBKi6BaYXPDxlX
	FkZXjHpoEcsWJX1Uj815L0jBZfIZ/unBchG0lVmAj37gX2Ou2cmglDGrxVp5aOoiNVVwaJOQH52eO
	F3krXQmLWDCbxZvKrEa9z8030uQjGxvyvIrF2hNQZKSK+TAC93siTEM8WF37PH+vmnDafmEvWT32c
	C0cIWjXK111gjokdqlVnlD/E9DGy9/5/qTqD9f9kIOJjsv0YZtvWzjyqDXGxgLjeu2vcx45/JsUt+
	P8WNCukHc45Ybi98Bzei6cqs/AQ6prSimRiCoEIGK1hrc+3n/zA6RUZ5BugFaYjJTEBPk+spCnQLZ
	bwBOPdNw==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPj-0000000ARDU-3GLl;
	Wed, 28 Feb 2024 18:12:19 +0000
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
Subject: [PATCH 05/21] nvme: remove nvme_revalidate_zones
Date: Wed, 28 Feb 2024 10:11:59 -0800
Message-Id: <20240228181215.873854-6-hch@lst.de>
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

Handle setting the zone size / chunk_sectors and max_append_sectors
limits together with the other ZNS limits, and just open code the
call to blk_revalidate_zones in the current place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c |  2 +-
 drivers/nvme/host/nvme.h |  1 -
 drivers/nvme/host/zns.c  | 12 ++----------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index ee1e13a658c314..4a05045e409904 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2154,7 +2154,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	blk_mq_unfreeze_queue(ns->disk->queue);
 
 	if (blk_queue_is_zoned(ns->queue)) {
-		ret = nvme_revalidate_zones(ns);
+		ret = blk_revalidate_disk_zones(ns->disk, NULL);
 		if (ret && !nvme_first_scan(ns->disk))
 			goto out;
 	}
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 4a484fc8a073c8..01e8bae7886584 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -1036,7 +1036,6 @@ static inline bool nvme_disk_is_ns_head(struct gendisk *disk)
 }
 #endif /* CONFIG_NVME_MULTIPATH */
 
-int nvme_revalidate_zones(struct nvme_ns *ns);
 int nvme_ns_report_zones(struct nvme_ns *ns, sector_t sector,
 		unsigned int nr_zones, report_zones_cb cb, void *data);
 #ifdef CONFIG_BLK_DEV_ZONED
diff --git a/drivers/nvme/host/zns.c b/drivers/nvme/host/zns.c
index 499bbb0eee8d09..852261d7891362 100644
--- a/drivers/nvme/host/zns.c
+++ b/drivers/nvme/host/zns.c
@@ -7,16 +7,6 @@
 #include <linux/vmalloc.h>
 #include "nvme.h"
 
-int nvme_revalidate_zones(struct nvme_ns *ns)
-{
-	struct request_queue *q = ns->queue;
-
-	blk_queue_chunk_sectors(q, ns->head->zsze);
-	blk_queue_max_zone_append_sectors(q, ns->ctrl->max_zone_append);
-
-	return blk_revalidate_disk_zones(ns->disk, NULL);
-}
-
 static int nvme_set_max_append(struct nvme_ctrl *ctrl)
 {
 	struct nvme_command c = { };
@@ -113,6 +103,8 @@ int nvme_update_zone_info(struct nvme_ns *ns, unsigned lbaf)
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	disk_set_max_open_zones(ns->disk, le32_to_cpu(id->mor) + 1);
 	disk_set_max_active_zones(ns->disk, le32_to_cpu(id->mar) + 1);
+	blk_queue_chunk_sectors(ns->queue, ns->head->zsze);
+	blk_queue_max_zone_append_sectors(ns->queue, ns->ctrl->max_zone_append);
 free_data:
 	kfree(id);
 	return status;
-- 
2.39.2

