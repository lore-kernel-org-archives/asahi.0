Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B402979B95
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143950; cv=none; b=QDMemz7qh35CuWDRCacOLxYOiwuVrOJPovMKnbCzi8udR9jy2jKakc6fKSu+gqlspVtgmmHSo20t1nnrlXbODYQWJdcms9azZSo/Roa4WPWf6+RHeIAmgM+qYMOg0nhjkVfjw2NuLzSVqr33stDFkQK7va6yYEfxQHElBiKQc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143950; c=relaxed/simple;
	bh=Uk41XzRtTIYp6qTeDRkPHdIV6CJuwO766xFzB8g+DIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UIStCYWc2qUjC+2OyTrlWkeGpY+tMvyM7EGvodagEmBxvOIzyrmqj9+6aL7d3kHAdeu6yE1ZPCtFJElqLyYfZ1aUk67y0jISpVRVkSa9bl8Bd9jLg9ASAeMHaC330mixGevYN23kYtQPuqVHzg/ClNhit7Q4BC8qtE3FKKoJneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eT01wZ/N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eT01wZ/N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=bP1BMOdz5eRXCtql9e1ghRRopFUjHFxglKPL1jDlH0I=; b=eT01wZ/NBNb23Vnm+MwIVhJgG3
	mJweFisxHTr/sVWbTPQXh4r2pFNna014FDqqubF1JqnYODA22CXBWUwLmWwYJ94YT9rXFisWuXNNd
	yxlzoPPQuDB8g+lhlwt7rnWh7vLiM5bGtomux64Wut9kC63aBJBhGZDPZKHJsfsBTnlHVDSeW7LDV
	nNZWoeMbzBnsYEzjMHMp/vwLnMZfizOmzrZU/Rxa9kG6lps+0on3M5HosqPVFMaPZBiYtmdue5/nL
	kcF/LTUs/mql7k99tHzWDX9euwOpddOmifUnKwY1ol2Y6znBgTWkviVSvGDVMe+qahlOOsXGR52uR
	rTMriZmA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPp-0000000ARI3-1j3V;
	Wed, 28 Feb 2024 18:12:25 +0000
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
Subject: [PATCH 17/21] nvme-loop: initialize max_hw_sectors earlier
Date: Wed, 28 Feb 2024 10:12:11 -0800
Message-Id: <20240228181215.873854-18-hch@lst.de>
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

Initialize max_hw_sectors a little earlier so that
nvme_alloc_admin_tag_set can rely on it to set the initial queue limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/target/loop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/loop.c b/drivers/nvme/target/loop.c
index e589915ddef85c..d8e33427a921bb 100644
--- a/drivers/nvme/target/loop.c
+++ b/drivers/nvme/target/loop.c
@@ -351,6 +351,8 @@ static int nvme_loop_configure_admin_queue(struct nvme_loop_ctrl *ctrl)
 	if (error)
 		return error;
 	ctrl->ctrl.queue_count = 1;
+	ctrl->ctrl.max_hw_sectors =
+		(NVME_LOOP_MAX_SEGMENTS - 1) << PAGE_SECTORS_SHIFT;
 
 	error = nvme_alloc_admin_tag_set(&ctrl->ctrl, &ctrl->admin_tag_set,
 			&nvme_loop_admin_mq_ops,
@@ -372,9 +374,6 @@ static int nvme_loop_configure_admin_queue(struct nvme_loop_ctrl *ctrl)
 	if (error)
 		goto out_cleanup_tagset;
 
-	ctrl->ctrl.max_hw_sectors =
-		(NVME_LOOP_MAX_SEGMENTS - 1) << PAGE_SECTORS_SHIFT;
-
 	nvme_unquiesce_admin_queue(&ctrl->ctrl);
 
 	error = nvme_init_ctrl_finish(&ctrl->ctrl, false);
-- 
2.39.2

