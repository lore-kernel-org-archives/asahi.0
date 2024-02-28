Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397043FBB4
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143950; cv=none; b=X8QPNKxKzSI8/q3Qw3RFwoPRi4puGOsd0Nli7ZPkjaDxX3uY+j/+64wmuLl0jj6PzCEgkDOnL34Nuon1DII46zyaczwCGpD413Qm5aOaqXY05W+XUol9WL/Sc5xKjnwTu4OkFpQZ9Lve++meUlNwhU0gMxvUhZ7aX1hHFpTfqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143950; c=relaxed/simple;
	bh=sjdj16ZkzsPg/F3cRu+XTDahoaHmk0toHjq38XndbI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AWeCb9gqXRPHJWXuJlB86rU4t4c2q4sYT6rYVAS5GjqMvXBLu55ELUI9BtmMDi6Xdggygb2XgtmiMjswTquDTYgesMwBbrs2VUenoOVAoV3LHX+zjiD5DXZMpxZgv8mfKkD4S7QUwDscpP4wTPPtx6j+mhuhQ+khq2KWqy3cKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SVGGqhkO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SVGGqhkO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2mICFj2/KMaWM4nxjGnQ6bAgJPovXhglZhSAX1NBT3Y=; b=SVGGqhkORm6KDoDKzDg1fYv3zS
	t2YVVEcHVwkcYVLd+VRHv/fZe3ZN/wspg3NxfBAsm1+gsxyLr4Hh0anxvqsKX2+6FmnSxxPPUABTb
	3yp2r+hxL5r6PFS30jlcZyknmRZneLxlVGhGdaUvYSZQg9WtcNPDa1/XlqXZqaDfBkvuX7jsKGFYw
	FkkXjp6niDlRfdyRJk9jeHYFI6pkJsDmgPbLm3VEdtIFMk1x5gpRrJ3kuuyx+8gHNTufSB3f1VOq6
	CICsH9fX8U7XTk+MgGUZDNUyBApJchyF5vKG/X74uFSM7lPGjt2AxJh/yEbvFdKs2NLolV5VibhFI
	Y9HR26tw==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPp-0000000ARHz-05re;
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
Subject: [PATCH 16/21] nvme-rdma: initialize max_hw_sectors earlier
Date: Wed, 28 Feb 2024 10:12:10 -0800
Message-Id: <20240228181215.873854-17-hch@lst.de>
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

Initialize max_fr_pages and the values depending on it a little earlier
so that nvme_alloc_admin_tag_set can rely on it to set the initial
queue limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/rdma.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 20fdd40b1879f5..04a69f7bd48f46 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -797,6 +797,12 @@ static int nvme_rdma_configure_admin_queue(struct nvme_rdma_ctrl *ctrl,
 
 	ctrl->max_fr_pages = nvme_rdma_get_max_fr_pages(ctrl->device->dev,
 							pi_capable);
+	ctrl->ctrl.max_segments = ctrl->max_fr_pages;
+	ctrl->ctrl.max_hw_sectors = ctrl->max_fr_pages << (ilog2(SZ_4K) - 9);
+	if (pi_capable)
+		ctrl->ctrl.max_integrity_segments = ctrl->max_fr_pages;
+	else
+		ctrl->ctrl.max_integrity_segments = 0;
 
 	/*
 	 * Bind the async event SQE DMA mapping to the admin queue lifetime.
@@ -826,13 +832,6 @@ static int nvme_rdma_configure_admin_queue(struct nvme_rdma_ctrl *ctrl,
 	if (error)
 		goto out_stop_queue;
 
-	ctrl->ctrl.max_segments = ctrl->max_fr_pages;
-	ctrl->ctrl.max_hw_sectors = ctrl->max_fr_pages << (ilog2(SZ_4K) - 9);
-	if (pi_capable)
-		ctrl->ctrl.max_integrity_segments = ctrl->max_fr_pages;
-	else
-		ctrl->ctrl.max_integrity_segments = 0;
-
 	nvme_unquiesce_admin_queue(&ctrl->ctrl);
 
 	error = nvme_init_ctrl_finish(&ctrl->ctrl, false);
-- 
2.39.2

