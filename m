Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F06179B7E
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143942; cv=none; b=Hon/k5xjqiT8wdGKQNIMImQFVFFl0y0VF/JWs32Wb+IfeRODeuDjJ+HWPPdZvGpZZ+zsnanAep7Xq0VcVHn9TIx/5MsA5y+17m8o1Cd0F5z1auADsH+69DJQOfZQ/A1R1ai0hUDO+ibd8RHI68hlBKCrt3Q40YnA2gSIHFoSIgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143942; c=relaxed/simple;
	bh=Yr884w3gRhIkUcrkO7iPb9alAoxqN1T7r99JPoCCW48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQ1MyH6TPiYznPZmYUSKnz6kkXrbj2ORUkGVDdSFx26by/QR/cGd/560KxcQnT1IFQUlaErTNPx+YL+1E7df9XHc4TLI7hMFbDZOGnRuQ+TJQ9PHQeatND9zaBoJzKW4UybKQkhkaaEUGmKR/rsrcEgg30FGiABuQkEnIQuepgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C5zs0B1/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C5zs0B1/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Vp6cPOGmx7IsY/Gom3ohdEDfNj/bokcwTvb4p5mmNMM=; b=C5zs0B1/cM6U8xsakGJPdG6417
	wPcFHu98c3WNk4qeLfYCPWlzqEg0E1Fg1/oUZ+q/tggPocXRD+oPIL1D31h0YyBvj7Vb6V8Clw3mq
	BavmONwx3Qcn+8psdn+glUGk/Ku0utUlvkVOIl3DMN/E5AUGg61YDU38+/9Rl4NoSGpnYvBwU74Ov
	TrbDQF0YT4jUamaGBcN9uvtFhg9Soi0M2KXuFyotoQu+4XdS2ObIUsmhZX8I3iICefKMQvJobfi1m
	daAZOo/b4U8RxiLCEJO/706yq4RA8JzPBs6hbgIvqH7xd0NB0SVS/2GXcwRF/4aiKkDLmqCu/fkOc
	rSoQZIDQ==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPf-0000000ARCA-2JrS;
	Wed, 28 Feb 2024 18:12:15 +0000
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
Subject: [PATCH 01/21] block: add a queue_limits_set helper
Date: Wed, 28 Feb 2024 10:11:55 -0800
Message-Id: <20240228181215.873854-2-hch@lst.de>
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

Add a small wrapper around queue_limits_commit_update for stacking
drivers that don't want to update existing limits, but set an
entirely new set.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 18 ++++++++++++++++++
 include/linux/blkdev.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index b6bbe683d218fa..1989a177be201b 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -266,6 +266,24 @@ int queue_limits_commit_update(struct request_queue *q,
 }
 EXPORT_SYMBOL_GPL(queue_limits_commit_update);
 
+/**
+ * queue_limits_commit_set - apply queue limits to queue
+ * @q:		queue to update
+ * @lim:	limits to apply
+ *
+ * Apply the limits in @lim that were freshly initialized to @q.
+ * To update existing limits use queue_limits_start_update() and
+ * queue_limits_commit_update() instead.
+ *
+ * Returns 0 if successful, else a negative error code.
+ */
+int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
+{
+	mutex_lock(&q->limits_lock);
+	return queue_limits_commit_update(q, lim);
+}
+EXPORT_SYMBOL_GPL(queue_limits_set);
+
 /**
  * blk_queue_bounce_limit - set bounce buffer limit for queue
  * @q: the request queue for the device
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index a14ea934413850..dd510ad7ce4b45 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -889,6 +889,7 @@ queue_limits_start_update(struct request_queue *q)
 }
 int queue_limits_commit_update(struct request_queue *q,
 		struct queue_limits *lim);
+int queue_limits_set(struct request_queue *q, struct queue_limits *lim);
 
 /*
  * Access functions for manipulating queue properties
-- 
2.39.2

