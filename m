Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE3224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561123; cv=none; b=nMoVX3WNnRrtxlnlhLx97JcRMXVotcX8XDza6/lJKTjDT6q0YC5g7136sIKt/OQBNbKRqKPPspo21JHHzCMbTS7l5B4aKYD3O3HMILeG/FQ5eeypwyQwV65xGeqdF6IDq9P6R15g+nfvTXSNtJJBfA9RdxN0206Lfx/qga0YaTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561123; c=relaxed/simple;
	bh=/uEf1B9AL6ptExX1N+Cr8BUSHkW4S1dpvrqFFMsj+38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ugh82jyY/GcRAmiOWa4l+bLtfcQE8S6OeAQsWMjT8EH1qOUCxFig8AKnRzkmvvugdSWQbOtpe/l1qNIkpXXxgbJEjTz07lLSYtZjXZeruOtcHuZOvH/BVwVKzIRKd7SuRjpPDqkCDhXhZtHBDOJjgprzTSnRNXa1+GYxOBQc2i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WWJKA6az; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WWJKA6az"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=i6ZBWJoVrGrdvRvBJUYTrkVc+SIXHoDPMV8L7WkhNCc=; b=WWJKA6azG7tc43vLLerfiiEn0u
	Tg9277F0Vng+xV6L8eoYZoIl1EkhN1WsuVt5KnNP89Q9m/mE+PWywicBcmChIyLLru4ODCtmlAZtg
	+P+2tl5L9HrXafomP0wnOHx2ftI2KsQUFqfu6soLJk19vXeKxOKACKogPSSmydBFmtELKIuiP2Cfs
	innaJXbJxdrBMkikdYM8XcMfUOJLRTH7Al6PAOTSPbxSoriAMR2NlRBP1tFN6hgMKRilvHSqvcAJe
	rWxytULMJCsfShkHvxkKeGWjkUIvSpKr7olnUB3SOG4kjHr57yTaGt13hmDZmflaf4uE23BDrdI8r
	83jlwfIA==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wP-00000009Hfd-0CNQ;
	Mon, 04 Mar 2024 14:05:18 +0000
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
Subject: [PATCH 02/16] nvme: move NVME_QUIRK_DEALLOCATE_ZEROES out of nvme_config_discard
Date: Mon,  4 Mar 2024 07:04:46 -0700
Message-Id: <20240304140500.78583-3-hch@lst.de>
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

Move the handling of the NVME_QUIRK_DEALLOCATE_ZEROES quirk out of
nvme_config_discard so that it is combined with the normal write_zeroes
limit handling.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 6ae9aedf7bc278..a6c0b2f4cf796e 100644
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

