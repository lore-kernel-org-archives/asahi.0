Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB692224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561205; cv=none; b=aYKJ/EMzPAoFZOvQt2W0j3nV9mC5ucWyIlcclRMVgYB9MAGblkXaOt2jO0tgV+LeHhV4Md3EMC2TWUrh1egtVNMJL7N48n0OGYW3qaZJcgEeba4Tt2N1uaQiGuNXH8OcZf3EDvAns1TzmMPencL8n6n+7DknTo72CDQDJ7XaqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561205; c=relaxed/simple;
	bh=dnjwLNKsSYxHs7SqLfY+UREvnXXLXEQIbdvn83OOclc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jDW6aexJ4iXflwx5zAp6+YGWpxjtan+iFzEEn+DZrXUTtqkshcyLkDHQib+NKR9mdWTUXzOLZPiLKfoZ+p3IEADNJgto9r7zIdXsTvTJbLfavnFdTGY8T6ZTDZvOqRw+fBxHOphHm0S43RgcwLDFzCuPskrqHo4o75WPuOiFqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EOlV2MSX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EOlV2MSX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fAfN2af5jtAk4J06WzedZD1OoJhGAyL9gXSoILZXeJ0=; b=EOlV2MSX9Ma5erZou2SJ7vvIdc
	n0cz5pI1TJvvap9mlbuWkFEc4HfBbzn2e4WJhVRFJ/29chUh4aQ/4w+M0mw2sqzl2dTFFZnxGtAEX
	/wv3mQRAsMJH1UhS8ZZRbtipK31f+LoAr0volrSOuU1Xp8pM32qGwPwvSYBxlDkyPhy4DGXkkhrtn
	U4MSdBY5HpO+OlemE+pzOJGtCqkzexyDMJVW+3kwPDIHrKi5qc5IrMpsZWCdIAl9TI6cJXfj+EZ8U
	X17G0aqpOuCY9kglRsxgaRriTN0c/aOkqJ597T63cuIyZwqkTDznSeZHpmIDCs+1aFVBy5cks5hI6
	hKQVBqcA==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8xh-00000009ISB-1a0j;
	Mon, 04 Mar 2024 14:06:39 +0000
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
Subject: [PATCH 16/16] nvme-multipath: use atomic queue limits API for stacking limits
Date: Mon,  4 Mar 2024 07:05:00 -0700
Message-Id: <20240304140500.78583-17-hch@lst.de>
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

Switch to the queue_limits_* helpers to stack the bdev limits, which also
includes updating the readahead settings.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 6413ce24fb4b1c..3f985b93a19f98 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2188,6 +2188,8 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 	}
 
 	if (!ret && nvme_ns_head_multipath(ns->head)) {
+		struct queue_limits lim;
+
 		blk_mq_freeze_queue(ns->head->disk->queue);
 		if (unsupported)
 			ns->head->disk->flags |= GENHD_FL_HIDDEN;
@@ -2196,10 +2198,11 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
 		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
 		nvme_mpath_revalidate_paths(ns);
-		blk_stack_limits(&ns->head->disk->queue->limits,
-				 &ns->queue->limits, 0);
 
-		disk_update_readahead(ns->head->disk);
+		lim = queue_limits_start_update(ns->head->disk->queue);
+		queue_limits_stack_bdev(&lim, ns->disk->part0, 0,
+					ns->head->disk->disk_name);
+		ret = queue_limits_commit_update(ns->head->disk->queue, &lim);
 		blk_mq_unfreeze_queue(ns->head->disk->queue);
 	}
 
-- 
2.39.2

