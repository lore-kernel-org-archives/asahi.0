Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E2224CF
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561149; cv=none; b=VId0hr9/V4GfUUkJSiSM/3E6DuHEOeIxyg7le+nzRx3stYzMhsAsFvVLpBe4LRJe9AuGUMkqhLVRB84t4oB7ByR9m/qPPqv7viEsbeuVVg7PUPXYWJn6KTrDGnaO1arBTjmEDqVJGAXanI8jAIbtaq+kBIEa6OGY5uHnFN3EA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561149; c=relaxed/simple;
	bh=5wiZN7x6+eAhbM0ZDhJp0cMmH0FgIY9IG2RibSl+2Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qrUuUf/IUHyYnLQfKzXhcH91q1TSklTLvvULVQrdNprENg0GIikhp4vOfHDB+nb6XG21qkuEfLJiQXGmVH7zwTbXO/82tz15MUjIFugroE4hyC5fSebdj02UaPljJkyKAFoBqepSPOA9llJcG3o8Od1apHQ8ff+Oks+dGYITNZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QxXZ2VnS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QxXZ2VnS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Lz/u6g+BaZm0j76fBeLBRUF7ggXFm8PkVTCQUViNddw=; b=QxXZ2VnShOK1qTAlIYERA/K8Bw
	ZK2khreN1lAN8kaY+Ul8x7B7vAaVXZYUAc69lb4Fyd3p/e8rGumy4ylVXVFrzMY7YCX4XTKIlGhll
	9U0TZC1iMCJM83tSbW4wOefd8wliSDvgy9r24Jbtd/4pXhiN9lEtXb5Vb4BC2SNtavnYt/rZJ4FB5
	LhmRK8fxdzC/qQFCwa5vqirqUKY3nzXJwLnPubp6K3CyC+UYj8zrm9tuQQDdT3+ElALtJ3k1l5aaZ
	6TSk4MqGOxbYMGB7yrrUtMfyjSZnoNL3G/YQG3fkVqv+LYtaojF2rWijv5/Ex/qE9UOlOJwsIJceS
	EK8fAeSg==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wq-00000009Hrb-2zTv;
	Mon, 04 Mar 2024 14:05:45 +0000
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
Subject: [PATCH 07/16] nvme: don't use nvme_update_disk_info for the multipath disk
Date: Mon,  4 Mar 2024 07:04:51 -0700
Message-Id: <20240304140500.78583-8-hch@lst.de>
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

Currently nvme_update_ns_info_block calls nvme_update_disk_info both for
the namespace attached disk, and the multipath one (if it exists).  This
is very different from how other stacking drivers work, and leads to
a lot of complexity.

Switch to setting the disk capacity and initializing the integrity
profile, and let blk_stack_limits which already is called just below
deal with updating the other limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 40fab7c47eae24..d356f3fa2cf8eb 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2159,7 +2159,8 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 
 	if (nvme_ns_head_multipath(ns->head)) {
 		blk_mq_freeze_queue(ns->head->disk->queue);
-		nvme_update_disk_info(ns->ctrl, ns->head->disk, ns->head, id);
+		nvme_init_integrity(ns->head->disk, ns->head);
+		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
 		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
 		nvme_mpath_revalidate_paths(ns);
 		blk_stack_limits(&ns->head->disk->queue->limits,
-- 
2.39.2

