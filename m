Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47579B83
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143951; cv=none; b=H8oKpijjjRwVgWn9GbF8Z7j4rT02IIwy2ZgoUAI6jlNq05i/APCZds1/FZ1/YR6xVabJLPxp5QmfqukEZHYy3I+vErDP9yN2NGyEgugnZc4GPZ8TBRTVCL09aasxOI1Ywu3rgvz9J6xcf/L/S5c94xq92FlqoqBUkHVQzbNjC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143951; c=relaxed/simple;
	bh=EGo4s94jFEOqAGfIgcocZK6CoMwfmnyh56YKj3ZaI5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qLPQ8PjRYjWDlrWuGSvkWsXqztGYrk4lNGd5nsFNMTF2TaxJ8Mv6MSWYHfW1+425I+UqOKEwkfJDkKC9qArB3aQ8oNhbqfaiAOKVv0UPhTwFqqadfy87sl2iPChl/UpFR2yGw0qIyIwXZsc0AOHhEcu1FH7tGr06liZxIoFZbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S1BoNehV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S1BoNehV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=BgRNaIwjHujMzOoPtisXH78aw/jURoq8krZi1GdG5lY=; b=S1BoNehVPr4ZDJC5CIFxQKvMfM
	WMbh2E96t04O7CCnOoeJJbMc8ovrSgk+XKX/wJt3uiAH8N5TOUbD9EHd+nNTRynYhV3hAB2fqtKHu
	lKC7fZBbfUOiPB1aHpYblEQ3ww5jOzo62NylkFLDzy4Z1DZkbzohumH0cJtO2pWi42rFfrkoLeuf8
	KF7wg0sGV6zSIQGAbJRf4abHvqnQYPUxrKSjZW0NCrLskDzOKm5qzJpoLbeQsvpjlC2DJ+bU+eL34
	XIlGIDpFlegSW6InXpVbReBqRIy8v0zAGU7XHz45OxqIBr2Oz5+kBFSL0TsZ5IL6AwCEjnBjlYH3i
	tozOj2nA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPq-0000000ARIb-0vRa;
	Wed, 28 Feb 2024 18:12:26 +0000
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
Subject: [PATCH 19/21] nvme-apple: initialize max_hw_sectors earlier
Date: Wed, 28 Feb 2024 10:12:13 -0800
Message-Id: <20240228181215.873854-20-hch@lst.de>
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

Initialize max_hw_sectors and max_sectors a little earlier so they
can be passed directly to blk_mq_alloc_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/apple.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index a480cdeac2883c..12281fc6932d40 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1046,14 +1046,6 @@ static void apple_nvme_reset_work(struct work_struct *work)
 
 	dev_dbg(anv->dev, "ANS booted successfully.");
 
-	/*
-	 * Limit the max command size to prevent iod->sg allocations going
-	 * over a single page.
-	 */
-	anv->ctrl.max_hw_sectors = min_t(u32, NVME_MAX_KB_SZ << 1,
-					 dma_max_mapping_size(anv->dev) >> 9);
-	anv->ctrl.max_segments = NVME_MAX_SEGS;
-
 	dma_set_max_seg_size(anv->dev, 0xffffffff);
 
 	/*
@@ -1516,6 +1508,14 @@ static int apple_nvme_probe(struct platform_device *pdev)
 		goto put_dev;
 	}
 
+	/*
+	 * Limit the max command size to prevent iod->sg allocations going
+	 * over a single page.
+	 */
+	anv->ctrl.max_hw_sectors = min_t(u32, NVME_MAX_KB_SZ << 1,
+					 dma_max_mapping_size(anv->dev) >> 9);
+	anv->ctrl.max_segments = NVME_MAX_SEGS;
+
 	anv->ctrl.admin_q = blk_mq_alloc_queue(&anv->admin_tagset, NULL, NULL);
 	if (IS_ERR(anv->ctrl.admin_q)) {
 		ret = -ENOMEM;
-- 
2.39.2

