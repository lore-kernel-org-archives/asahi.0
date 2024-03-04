Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFD3224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561121; cv=none; b=J3ExsCFjpxPqPDtfpwWhEesRYCameasfxwbHVvwXKww/NDxCZDODUR9+zpU7bltzlZ9iJMr3cTo1fN8c2QOrAWZDNTzjFpm1nUu2tc0lNR1umXGi/JAgAVy+0/yzUJ6AJKe/R7Xub4urVQMKmDOvgj9fpnRcqojEWAutHevbDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561121; c=relaxed/simple;
	bh=rLLWBSLHlGcCiWXEP7CBISlZHwpd0ExeKzJYjRbz3mc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qnKOYN70bhlb9ZxlBkwApqa3r1VypntON5sajGR5fwQ6giELjhm0NNq5JCdDVstqqWtvV+aDf7iWi8Uwy1fAhrLyZhZlH07NCqb7fjC/OfkZ1Xd9z/FoJIgPpkJo0UpUcG97KoZOvCvjD/sGI+GM4n8sMeNTAM1yujqn8x0JYOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TTLADhJc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TTLADhJc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=srPAaXD84GtFyIb0hxHH8yNM2Wm+rIoF6ypTyDb0y3g=; b=TTLADhJc3JJbNJ6iqaJZb3EB+l
	lKDtLeV8e/LGA2D/turSO3Oc9hzQqR2E/yWCJhgz649+lfn2NBe0W6vnL9tKR/wUkYhV10K24B4r7
	3xoUDStqNQrNelt0cIpMJlcEZVJCe6yqUVVJO411xLrsGZE4+BSoI4CuC/16Pb2LtmPZc3jAYqgcF
	aSamwxqA3fCUPzudAWuGkitlUAAFruym9T+4I86F45I0EbBJW+BRCaQhWd+BFX5avisCItIGo/3VO
	4dT8J82vmlRfx5s7kYtkP0Bz4nWA76+nR89xcJ2vPMV+mlpL9m7Fin3tvjmauXMmtdI1Vj6cRGxG4
	35lEfQEA==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wJ-00000009Hem-3uWO;
	Mon, 04 Mar 2024 14:05:13 +0000
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
Subject: [PATCH 01/16] nvme: set max_hw_sectors unconditionally
Date: Mon,  4 Mar 2024 07:04:45 -0700
Message-Id: <20240304140500.78583-2-hch@lst.de>
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

All transports set a max_hw_sectors value in the nvme_ctrl, so make
the code using it unconditional and clean it up using a little helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index cb13f7c79eaf9c..6ae9aedf7bc278 100644
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

