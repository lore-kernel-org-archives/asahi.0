Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B034379B8B
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143945; cv=none; b=FEhhsS3qUp8m5heWEJ6waTERBvYaqoPtth3K6C5NYYPoSma9cORLIrAjrW3WwHGhfM4RerQJGIq1hqQu6yrbi8/ViammHSJv/mzGVK0kcAqiTgy7tVGBTkGuK/gDNJxI7QANFz1SaKyVHeZWlFnLwsBu/xynMNvScZHposTvSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143945; c=relaxed/simple;
	bh=EF0KmupwCU81vELl1AYYh/Fj4+fd0kIBoPBdXOAMDBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=us0UXd54eX16YCqzCcxxODvYf1nlAGtMDOHRFhjUSLESGJEWP8ItVxESZOQnj5kW59anoPiFmDn/AhQyhRRSSNt6+spEbpYOAvc+TytZftMLYLat7ITq/y9F8ARcJRK7ZiR7DFSLUWTLUchKW1vgOTWa6PVWrYEFzYhLqpfYUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WrJv1efg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WrJv1efg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NXAbdD8CMNQ53MD8CHkDfC00JOZu8SZy2rSj/nwLb6g=; b=WrJv1efgKfWsGXmiApoQVCKV41
	M8jVDclUyu9ebXK7rGh7tlWoknlqM4d7e3Wbq9aZXg77jos4k9RexaOkYg1IwKdkepfDMTLxI8BZd
	QncxO+3BQHvfSkNzFXKZgSq8EuIV+IkEIvhrJ9ld6Qb3WuF10gOwCQPhr7Yxz5z+LvmenSLe2x55x
	bj/9YAog778n0AxPeAa+eXlxukhSOXuiHOKCtVtd1HcQtR9zWDYN9rGWOjwvXSyYF32Up494/rMX2
	TdFeJFFDBYLRF5qTUsQKYOgojRYUTwESM5Ke7OHGJJJUZWwhneuqtqbXk8ZCv5ScCM1tPHLee3TuA
	JOpJHGDg==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPk-0000000ARDw-2OFi;
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
Subject: [PATCH 07/21] nvme: cleanup the nvme_init_integrity calling conventions
Date: Wed, 28 Feb 2024 10:12:01 -0800
Message-Id: <20240228181215.873854-8-hch@lst.de>
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

Handle the no metadata support case in nvme_init_integrity as well to
simplify the calling convention and prepare for future changes in the
area.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 94d835f9dc90e9..76e548902ec33e 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1723,11 +1723,21 @@ int nvme_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	return 0;
 }
 
-#ifdef CONFIG_BLK_DEV_INTEGRITY
-static void nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
+static bool nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
 {
 	struct blk_integrity integrity = { };
 
+	if (!head->ms)
+		return true;
+
+	/*
+	 * PI can always be supported as we can ask the controller to simply
+	 * insert/strip it, which is not possible for other kinds of metadata.
+	 */
+	if (!IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) ||
+	    !(head->features & NVME_NS_METADATA_SUPPORTED))
+		return nvme_ns_has_pi(head);
+
 	switch (head->pi_type) {
 	case NVME_NS_DPS_PI_TYPE3:
 		switch (head->guard_type) {
@@ -1772,12 +1782,8 @@ static void nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
 	integrity.tuple_size = head->ms;
 	integrity.pi_offset = head->pi_offset;
 	blk_integrity_register(disk, &integrity);
+	return true;
 }
-#else
-static void nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
-{
-}
-#endif /* CONFIG_BLK_DEV_INTEGRITY */
 
 static void nvme_config_discard(struct nvme_ctrl *ctrl, struct gendisk *disk,
 		struct nvme_ns_head *head)
@@ -2012,13 +2018,8 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 	 * I/O to namespaces with metadata except when the namespace supports
 	 * PI, as it can strip/insert in that case.
 	 */
-	if (head->ms) {
-		if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
-		    (head->features & NVME_NS_METADATA_SUPPORTED))
-			nvme_init_integrity(disk, head);
-		else if (!nvme_ns_has_pi(head))
-			capacity = 0;
-	}
+	if (!nvme_init_integrity(disk, head))
+		capacity = 0;
 
 	set_capacity_and_notify(disk, capacity);
 
-- 
2.39.2

