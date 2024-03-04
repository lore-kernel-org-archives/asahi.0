Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764763F8D0
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561144; cv=none; b=RKDzeYp0jvBs+UqLMvpRSI7v6EB1MgYqb58pKzihttBwp8H43ntDItwBRqfF946DTir/38T2HC8FexNq8EpvgwDyw/ergOTQfD6IEX2l7vFsGQMu6LQDQItM9fJWk9oP96KgeLo7WkD5KwFqOi1hJqaLnXtWJNlvNycXeKM3b+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561144; c=relaxed/simple;
	bh=uIJjg1WE+EcmDFm4tHYEQkfCOJbhYU1msJm3OFP+1ek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kyH8XT8tf3AxxLKVsa7raLLHKsHTRWkORzcsC8KkSl2X3547rhW9hu8PP7JN1TKU8APezI+etzbOV5B8QmutoYOtzieE2EDlTJi40WR0ONW9dDp5dnG5KdvYphv9LGCzoHtbSSJXXlxIGn2stwDzG/X7unbJVkV+hN8h6xLkgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yrhAcs31; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yrhAcs31"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CdAdTrJK0mHHqv53cYp5SY8i6/LmLTzTv4WzZNNbBWo=; b=yrhAcs31n/mYY29dX42Fqs/AO8
	c5p+h7goAadrhP/b2nD2Cyna1S5fe7t7+lbzxm37gCnDIuR3UeCijCkCK4mseOs3WLtXkDGWn27Cc
	cd06A3xg57Kz3K99G6tw2JbHHx9qZR4yoi9iFL43Chp4ZAfHBCuRIDV9EGaevMV961jsFEGKc2iAb
	lH9Ulb9egoWws2EM3/E6k/l6zzbTQETGDnuwRVpD+E0q97//8z916j0pGtj/c34zJVoQsKkj5aIyW
	Om0lMgL8qwJwcCV5euDrVVnLn0kMeSdzi1vrBQrdMZFtLcDougfsrDE1KgxJxtVtUffi/Z5NT3QTG
	jf8AK50g==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wl-00000009Hp6-2QEI;
	Mon, 04 Mar 2024 14:05:40 +0000
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
Subject: [PATCH 06/16] nvme: move blk_integrity_unregister into nvme_init_integrity
Date: Mon,  4 Mar 2024 07:04:50 -0700
Message-Id: <20240304140500.78583-7-hch@lst.de>
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

Move uneregistering the existing integrity profile into the helper
dealing with all the other integrity / metadata setup.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 1ecddb6f5ad9eb..40fab7c47eae24 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1727,6 +1727,8 @@ static bool nvme_init_integrity(struct gendisk *disk, struct nvme_ns_head *head)
 {
 	struct blk_integrity integrity = { };
 
+	blk_integrity_unregister(disk);
+
 	if (!head->ms)
 		return true;
 
@@ -1980,8 +1982,6 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 		bs = (1 << 9);
 	}
 
-	blk_integrity_unregister(disk);
-
 	atomic_bs = phys_bs = bs;
 	if (id->nabo == 0) {
 		/*
-- 
2.39.2

