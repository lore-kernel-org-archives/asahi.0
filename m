Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39C79B83
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143945; cv=none; b=hxhRlA4/zxeYsD/AOvakjelnoq4MJfAGOF92Yt9l+feOvTMZbryY3Xh1pvUPcbEhPgpY7KtbXfkkoSHA4awNPkM3Z4GzAm+/SWQ0wf3xxGE+QlnxAaorTqfiLVQvBCe73+RzcNYRsueL1E087zwEyj8bmwY6bVk19O3O5SSmb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143945; c=relaxed/simple;
	bh=WMa7wGWvTS2uFKn5vkPgEA/vi2m/U5HoPce+AKRo5cI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UKHkxRNYtpHZ0slXWD9yonFBmDgvwtZu5JzdTIFoC0G4T410s7lPyCAyTMmUh0I3FbVsbv9+zjXGfDW+3ijUGJsT+Vz3+ziYNFDCyevxMV+jepxF85ztUdd5/jEFnLEM7VJ10nVa2Je5wEEt+CIO2RJnDC1wRwcJW+a1oJ3FDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K3cMgV3x; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K3cMgV3x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6qmqyp3X6vguqRsPEv+PAHrA12TOnC+qT7k44PIG4D8=; b=K3cMgV3xePIXwGrqfHaM2v7Xjl
	YatnP6zsmmzJ32m8thNyCZycP9bt0Q0COVREonbIInxRviWk0UXIC+hAuauLNjBJXl8sj+x7tVL9I
	05Cx4T/fzX/qf2KY6MwK1I4TcsbCGORzysEwzrlcnxqf4RByoj5w75qsQe17I+5rinh3j9z/Mfr9D
	ZrEVqHdkZxaskMk6gfmaXmEPVqwJKZVR2qOrufc67M45abCKcndIEfwSDdF/z9/wrKXCnQngFsX9p
	CtKe7jfb5MHe+OocCe9bHSWVACFhRgx6NOmupf8SW5nI8ivYeqEs2hp4X7vL0Qb3/ZaY1V4dSqOFe
	KaQ9yQOw==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPl-0000000AREV-0bfr;
	Wed, 28 Feb 2024 18:12:21 +0000
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
Subject: [PATCH 09/21] nvme: don't use nvme_update_disk_info for the multipath disk
Date: Wed, 28 Feb 2024 10:12:03 -0800
Message-Id: <20240228181215.873854-10-hch@lst.de>
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
index 105046a7957272..0bf30580f29d5b 100644
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

