Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB23F8D0
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561139; cv=none; b=dea75gPV8r8bKYJmIt08enODTpVYBl+1PscvsIq114vOrNPQBqI4gElCsTgtNbnnG7FFsX8FOWb03+pMZFkg9yoVHnQnwqW7nrDuCxn9dXbcOh9rAgxlHYKk70MjhpD9cKAImDONMv/JxgyNFsCxHo5exfneDFaufMtP+QE6CUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561139; c=relaxed/simple;
	bh=cGTwtJvyV3b3it8cldbb6AbejT4JNP3VvzX+0QcmHFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X+vsjJXWSnZ+16R+glFFz5r0YZqNyGPsrsJAXpd3Nq+DzfixXcYjmwFTa73BI0sk/uVaFL+nYSydIO+4B2OQtWJJ1O55sCPuswTLuoh7X5FAlTxPqjxUjDbDOcxKa4FDPHDL/BT1vHK+UADQdtUp8xpgqw9vkhw9ujG5Kpquiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NcgxoOyj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NcgxoOyj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IZDtqgT9p9ajBIoxW04+0P0yCN1vWbQv9MJZOYsDvTM=; b=NcgxoOyjwKoxEz7DuFDSWZHZwu
	TubRla3Os2bACxzxRcUNVoxJ35OjOGRlDk5GoAXvIqavADJfnwlI2eU3yXS4Q5WTDgSzm1JahKDG/
	guiInFH4yBv6R9zss8HB8lNsAJYvQ8MXW1++cEcW1zKBu2rYSBBlM14AjwrXhdBhPHZ47+xMEua3D
	tu3gMd+uL4X5PssFStHLQzDfrwFoIzziuJ08bH37OtLkvqYlwJDS9M9nEgCbMTNsFBsozJpFGiDCw
	uDM+U+ulBLzUxTSJDLotrYtVzuuW0Bx1pwJMj+KV9arKRQxPRJTOlumeS7qIWFMyuPIWHhZQjkpYJ
	WM8qEQ1Q==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wg-00000009Hm5-2W0Q;
	Mon, 04 Mar 2024 14:05:35 +0000
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
Subject: [PATCH 05/16] nvme: cleanup the nvme_init_integrity calling conventions
Date: Mon,  4 Mar 2024 07:04:49 -0700
Message-Id: <20240304140500.78583-6-hch@lst.de>
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

Handle the no metadata support case in nvme_init_integrity as well to
simplify the calling convention and prepare for future changes in the
area.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c4a268d91796f2..1ecddb6f5ad9eb 100644
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

