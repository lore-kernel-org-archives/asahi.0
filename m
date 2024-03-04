Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE91224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561128; cv=none; b=uxVZAr85snlJ6MQ8oy/eRVh0AUWb8Y1JNamZzI6cxpnigHYkmxpRFpcnIolPzDE51kB7Q0OLT6TG2Am7TZUBS+5yR3V4A3Z8es+i2hEre2ciR+Nm2ZLIDHi+1PyYmyGWQKr2Bo6IehPe/y5ksBwGq+6N9keoiU9Hlav+O065ULE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561128; c=relaxed/simple;
	bh=+TjHvHYWESl32tFJoCJ09NQ0f8ovWI87OlUAxEsM4ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jxpCfTx7pb8XRw1ge9eMrl7A037H4ZC74ND9JJ4kPnioXIm1IN1f1nyB3E/mUMPYFryfw0P4NQ/U1BFEPW1FINhcILoosxOYcvt9LvHp9oNwgPZ7T5O7rKLJ6JaTrOsWYGNTLVvKGAWeExzu8iMpxCVa/EX35qPOnQIgIm0EkUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pYzLyi+s; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pYzLyi+s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=n4waFSVlAIyzX5aRXU9CzyIn4fH9mLAI+aTGoMdaST0=; b=pYzLyi+snFr40a5CVW1Ri0FUTD
	x5NBl6DSavrBH6COmFD2z0QvQ8fEcbqj0Wj2I9irbdfVHmj+c1RGJ/zwq+gA/4yiUAAn+rMpUGZsI
	jevCzX7HI/sH3i7yZkBwUIZPFWTAnN1Ad7j2ZbFGCh2YAGBs/ojqTOqzaHYU5dB3ESFrBNPcDDBNh
	E4Su8yuILfSfN7btu6fmAkSryOC7KEbow4K9FfpmdzQf3gc+1LdSxU27qzff6jyu0OJtyGV7j3u+C
	+q7iQQ+S7gFNgg3bhX8IOiW2lOk4qXcdJ4m9+sslUceegX3Mf+0f8L4dEdqIgFndQ0a3vYZjJuKeP
	ZqKPfdpw==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wU-00000009Hh4-2qh8;
	Mon, 04 Mar 2024 14:05:23 +0000
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
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 03/16] nvme: remove nvme_revalidate_zones
Date: Mon,  4 Mar 2024 07:04:47 -0700
Message-Id: <20240304140500.78583-4-hch@lst.de>
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

Handle setting the zone size / chunk_sectors and max_append_sectors
limits together with the other ZNS limits, and just open code the
call to blk_revalidate_zones in the current place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/nvme/host/core.c |  2 +-
 drivers/nvme/host/nvme.h |  1 -
 drivers/nvme/host/zns.c  | 12 ++----------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a6c0b2f4cf796e..2817eea07e967d 100644
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

