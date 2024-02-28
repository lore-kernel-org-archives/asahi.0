Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2703079B83
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143947; cv=none; b=XXevOONPdsTPagDen5P6gi4NmBYXf8ruWv3i9IcdJ6590KKyudAPzAoaF00ptBWfyEJWGyEGrrk9E/5TEoSKh2Kaw/RmMXEvS42VgqdKkMSctZWCaFZMKzPmcmw5qjHhFuSogDG1TtLucM+yfKIVkiLSMSwGbrMq6yH43ZrqueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143947; c=relaxed/simple;
	bh=tukrQ3QRnj0OZODN0nGc0tPJ7mZa4ACmqw7TVgud6no=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QEOOMK299221RcAamyWu/N4fMtbnx8pN+T+9ApzK4ZvqQTZPKi6gpHYDLBrV/Q0fGkvV9qMLyrIiokjtOKzK4q/d4VQxhssLdoqIn9RnNYhGQdqi/IajScVp6J8rbvi+bZHD/dN/spuUWfdFI2ljwE9Td6kMMKHmcPHN8tIltHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hq+X4jXE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hq+X4jXE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=g1hf0PV9tDActAZ78IxZXAhJOYzxZnd6FmjGsbrzvYk=; b=hq+X4jXEWlDzYgNetYe+jJCw7h
	RuiF8v+6ADTIZmafp05VxOGujpQuBxJu19vGdkF6hbfIenadmdcH6S5sYEP+bKyOZ7pkhuBtaLuFh
	QMIZotyMe97FZkGlw2ByiT002e8f+ligAXZIIQUhNDfFF2OXI9AbB5c8HufLHkgVXTfCynr57cLnM
	+JUwHavBoQcuup1xLCkQxdvqBPMhH7Qp+TbXPI7fx3Mpu/ufYT1EC9GFFpedagodmr9u6Agr5OGsz
	nsj4R/x+GRjGklPsZtBpIWr0IZlDKvrcC4GbR5TbSxgUmHr/pweE5rOMZDR5TwP3wsMXZMrPfSXQy
	hBWzvxAg==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPm-0000000ARFq-0839;
	Wed, 28 Feb 2024 18:12:22 +0000
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
Subject: [PATCH 11/21] nvme: move setting the write cache flags out of nvme_set_queue_limits
Date: Wed, 28 Feb 2024 10:12:05 -0800
Message-Id: <20240228181215.873854-12-hch@lst.de>
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

nvme_set_queue_limits is used on the admin queue and all gendisks
including hidden ones that don't support block I/O.  The write cache
setting on the other hand only makes sense for block I/O.  Move the
blk_queue_write_cache call to nvme_update_ns_info_block instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 3d839945edd85d..dcb8d0590ed0f3 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1954,15 +1954,12 @@ static u32 nvme_max_drv_segments(struct nvme_ctrl *ctrl)
 static void nvme_set_queue_limits(struct nvme_ctrl *ctrl,
 		struct request_queue *q)
 {
-	bool vwc = ctrl->vwc & NVME_CTRL_VWC_PRESENT;
-
 	blk_queue_max_hw_sectors(q, ctrl->max_hw_sectors);
 	blk_queue_max_segments(q, min_t(u32, USHRT_MAX,
 		min_not_zero(nvme_max_drv_segments(ctrl), ctrl->max_segments)));
 	blk_queue_max_integrity_segments(q, ctrl->max_integrity_segments);
 	blk_queue_virt_boundary(q, NVME_CTRL_PAGE_SIZE - 1);
 	blk_queue_dma_alignment(q, 3);
-	blk_queue_write_cache(q, vwc, vwc);
 }
 
 static bool nvme_update_disk_info(struct nvme_ns *ns, struct nvme_id_ns *id)
@@ -2093,6 +2090,7 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
 static int nvme_update_ns_info_block(struct nvme_ns *ns,
 		struct nvme_ns_info *info)
 {
+	bool vwc = ns->ctrl->vwc & NVME_CTRL_VWC_PRESENT;
 	struct nvme_id_ns *id;
 	sector_t capacity;
 	unsigned lbaf;
@@ -2154,6 +2152,7 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 	if ((id->dlfeat & 0x7) == 0x1 && (id->dlfeat & (1 << 3)))
 		ns->head->features |= NVME_NS_DEAC;
 	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
+	blk_queue_write_cache(ns->disk->queue, vwc, vwc);
 	set_bit(NVME_NS_READY, &ns->flags);
 	blk_mq_unfreeze_queue(ns->disk->queue);
 
-- 
2.39.2

