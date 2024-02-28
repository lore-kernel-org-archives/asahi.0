Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1E20B10
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143945; cv=none; b=BcSyDNGhCDf+oN/ReCI3LENDdZGzfEuFL5leQ8jR99vEnwPwkZtLexCmDfbLZ+C1CRLCI5DDckRSRvjtdU/I3pZ5IqJiOnd1tkpIo4ivOEQH2907wsKJ2wcSyF5ZrKNe5xpNYLabGhHNCBA4QbKv4ce/6u5cjlCQSnepi8VB3jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143945; c=relaxed/simple;
	bh=i2Kt3PTa0rSJiM8L80fyqekF/visx7fU3aoy4nhtGi4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FEnSFNnK/8oWRRezQaKE/3j7qQ/Ng+Ut9GvOgTy3KZaEw/aoe1nEHXHoRgYWokaUOMnYV9RvQrIVwU4qb02YqIc3zBykovVMO2RKzlemiR7+i8W2AblDs3NX+zuFBekbGZenuGXcsaA3KvZ+lA8lgd1AtwoQ3HODADtEdkP4lAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BrZtMvLn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BrZtMvLn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JvOMaux6i9aaC0HJ1wOJa+6rz2L9A4qqSbrzYJv6iXY=; b=BrZtMvLnD1zqBAN0OYZYp2mqTV
	8m0KNtWTZfGjDniPFFbuiFze+QaaT1ZunoOaVuDFXd8DsHZ5nziqNB1nZ8Fov6iLMOKdvLNunS5Cj
	E+iSN4I8xnaoBhtvme5rxyUr1omX7vVZPmBZFLUbFKYp7SwUQaxK+E5ipdBy2ku1TBUwZhwoecDnZ
	VtJMORJh5eXMHRRSLFao4U4NjIdk/Hu0udbwsiz9xgOT2/RJQiJsXGN98IukUxFfi5pw7M8MZ7Tfp
	puP/Z3LsoS22/wKLq8XnvRv3CHlX9OYr+Qagx19MeOnbD3lY8YS1pCi5C5VI6zkLejbgZEYkqYRl1
	9+K0KGVA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPk-0000000AREE-3WvN;
	Wed, 28 Feb 2024 18:12:20 +0000
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
Subject: [PATCH 08/21] nvme: move blk_integrity_unregister into nvme_init_integrity
Date: Wed, 28 Feb 2024 10:12:02 -0800
Message-Id: <20240228181215.873854-9-hch@lst.de>
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

Move uneregistering the existing integrity profile into the helper
dealing with all the other integrity / metadata setup.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 76e548902ec33e..105046a7957272 100644
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

