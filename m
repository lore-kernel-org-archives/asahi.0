Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8C879B7E
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143944; cv=none; b=ohoyOsy6X+LhbvP4qOsc54lvIRMrkxStlooiVNJW5tEe3MnYb/gPz0qWuXQOTAWhjRQ91bkbueoV2h3NnkmqdRBB1a9jqWbFufcqNye6NzGOM52D9pztntjdjYjmCFQxSjvcrGeNhA1ev7NgPmQ4tpNAaqsWMU/tpoYFRYFDRqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143944; c=relaxed/simple;
	bh=oDjlEJkjK4X2kz29UF4y4Ukq013HSMu9GkgkmlJoI9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gj4eaF+xbRM44z8LSjBuGDe1iacMXuXXteu13qA1gmiX/2BHnUJnxaKOIsifHEOujIrIA45lyaw7xANtepx9iAvaWWl3SbH7/T2U4rdelVlUD8HKP5HN4QFyfTtv+FhlIaVwLomkkDMpQctSak3eSslmJLmsOwmt75W7HMPleEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c1ce/sch; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c1ce/sch"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1dZtXajpuKMdF1sDdjnE03FH/3FGPZJEuDV9A08Ydro=; b=c1ce/schG9vL/6nZ6B3Tva7Fur
	bbURa8QX8iBvudR0M3efOY02mFmWpcHa2LT7C0hJvTNb1v6bE7ojMrRpsVmVB56R9Sf14uDBRE36c
	wRtPbSc4xOgqEGbSMnmk26dt2SsrEMQOXRYp1RyF/ctp+9gyum/KJQRj/gh8lJGm9MaavSauCzDP4
	RbeN8UvYUVDphDIS4qQ0sk3LUL7ybiEcPssG7GP84E9V87T9yKjTnyy2TH0Pa3B5ue+V25As2AoxC
	+DCR8O6uDNv5MeyOwEWvkv3DxVjxL1FowDQKvChK8Lvl8WyiFiVnYrWzue1kHg3izy6mxS7cJTaWI
	NYtQDFjA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPj-0000000ARDI-17cG;
	Wed, 28 Feb 2024 18:12:19 +0000
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
Subject: [PATCH 04/21] nvme: move NVME_QUIRK_DEALLOCATE_ZEROES out of nvme_config_discard
Date: Wed, 28 Feb 2024 10:11:58 -0800
Message-Id: <20240228181215.873854-5-hch@lst.de>
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

Move the handling of the NVME_QUIRK_DEALLOCATE_ZEROES quirk out of
nvme_config_discard so that it is combined with the normal write_zeroes
limit handling.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 74cd384ca5fc73..ee1e13a658c314 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1816,9 +1816,6 @@ static void nvme_config_discard(struct nvme_ctrl *ctrl, struct gendisk *disk,
 	else
 		blk_queue_max_discard_segments(queue, NVME_DSM_MAX_RANGES);
 	queue->limits.discard_granularity = queue_logical_block_size(queue);
-
-	if (ctrl->quirks & NVME_QUIRK_DEALLOCATE_ZEROES)
-		blk_queue_max_write_zeroes_sectors(queue, UINT_MAX);
 }
 
 static bool nvme_ns_ids_equal(struct nvme_ns_ids *a, struct nvme_ns_ids *b)
@@ -2029,8 +2026,12 @@ static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
 	set_capacity_and_notify(disk, capacity);
 
 	nvme_config_discard(ctrl, disk, head);
-	blk_queue_max_write_zeroes_sectors(disk->queue,
-					   ctrl->max_zeroes_sectors);
+
+	if (ctrl->quirks & NVME_QUIRK_DEALLOCATE_ZEROES)
+		blk_queue_max_write_zeroes_sectors(disk->queue, UINT_MAX);
+	else
+		blk_queue_max_write_zeroes_sectors(disk->queue,
+				ctrl->max_zeroes_sectors);
 }
 
 static bool nvme_ns_is_readonly(struct nvme_ns *ns, struct nvme_ns_info *info)
-- 
2.39.2

