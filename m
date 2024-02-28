Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D338479B89
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143943; cv=none; b=MWnbl3Hi6CkwNkR66hpi1mGsqszfFWza41H083fVF4Enh5y5FZF3jKHKCcx8Q0VoOPa5oKdWJioef4djgAKHu4CAweHoYxM3BDbTPzcnK49KsHs7gTMX7DMZsz1FJpXUxCS7iR+r0uqMX4ohmePPeWJnEjQRjXGyGC91TLa18T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143943; c=relaxed/simple;
	bh=fUQHXoK1YPDx41HRzXxMn3ZaOcURULOZsD2WamM6rB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C6wY874fmaguNWqNth/3+faviNgtFMTaJEfClDN4lL6n1VGz1DctTPK7pgmbjv0ftncu+EQ9OmRhmU1QiPL/6uld0J6n0pAa5VOrbQ0DZYzq6yt1dbPQWCKnIxdJZ3eS0P2Hjk2Z3t98LoxtJFRo110DfDU7FG+JTLV5eRizPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FVWgLJuB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FVWgLJuB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=N9ZUJrFBkRWGc7DQIo6v0v4QgMBRqPp4BiTSXcA0fN4=; b=FVWgLJuB3qura5OdddjlVmSq8p
	tbJUa/LIJr3d5UxtkdeLLBlHwiRjFaWTL+d5xJmitOI+lnuL9q3kXQhAN8PphU9XdLoe6thzLcZX1
	pTFN9nue0FDVKfpSVVgMNBMl+H8oZgLoqP3TRbAY2LS6ULCt77a2ZjayZ8Ssd4AB5NQA4aQTecU4f
	sQvtCFPluv6BjELvHzqzafZCLFAVBOMGvWUKMz+pjQj3i68f3ZP7iArTqgt+PCCsOa+oCurBYdqn+
	HU9mKzO3cNj/4YKilxBugRrlOUnFyrTBew/XjDSD3BZR/hQurkZHHpxUduWE6L214r03GcYHa4AQv
	cYHqzHwg==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPg-0000000ARCE-0U7h;
	Wed, 28 Feb 2024 18:12:16 +0000
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
Subject: [PATCH 03/21] nvme: set max_hw_sectors unconditionally
Date: Wed, 28 Feb 2024 10:11:57 -0800
Message-Id: <20240228181215.873854-4-hch@lst.de>
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

All transports set a max_hw_sectors value in the nvme_ctrl, so make
the code using it unconditional and clean it up using a little helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index eed3e22e24d913..74cd384ca5fc73 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1944,19 +1944,19 @@ static int nvme_configure_metadata(struct nvme_ctrl *ctrl,
 	return 0;
 }
 
+static u32 nvme_max_drv_segments(struct nvme_ctrl *ctrl)
+{
+	return ctrl->max_hw_sectors / (NVME_CTRL_PAGE_SIZE >> SECTOR_SHIFT) + 1;
+}
+
 static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
 		struct request_queue *q)
 {
 	bool vwc = ctrl->vwc & NVME_CTRL_VWC_PRESENT;
 
-	if (ctrl->max_hw_sectors) {
-		u32 max_segments =
-			(ctrl->max_hw_sectors / (NVME_CTRL_PAGE_SIZE >> 9)) + 1;
-
-		max_segments = min_not_zero(max_segments, ctrl->max_segments);
-		blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
-		blk_queue_max_segments(q, min_t(u32, max_segments, USHRT_MAX));
-	}
+	blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
+	blk_queue_max_segments(q, min_t(u32, USHRT_MAX,
+		min_not_zero(nvme_max_drv_segments(ctrl), ctrl->max_segments)));
 	blk_queue_virt_boundary(q, NVME_CTRL_PAGE_SIZE - 1);
 	blk_queue_dma_alignment(q, 3);
 	blk_queue_write_cache(q, vwc, vwc);
-- 
2.39.2

