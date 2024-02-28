Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937240840
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143951; cv=none; b=APomODxn5YxKyr720S9NI2kpFwmFS2xtmm3w4H+b1ims9lZ0PFnSiUb715f+QX4KqIIlpK7y+lOGdORM3yrgspLxT0+OVwPiMpFGy/+SaokRbYZBeLMPo26k8e8c6t6I1eWhnl8GjfuRe6xh0B5e+1DtDBitp5sX8gfT5/Nc7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143951; c=relaxed/simple;
	bh=Uq7DfcEScs2rFEhnau8ASMLop+tZ5ry0BHRBU0wbSW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HB8VDn+O4eScH8VlOyEFM6SbqJQim0LE0B+BEz9CNSYKCO9fp0f6O1ratsPMI02XGXZiN1yYMPfarDelqoYCQN0Li/IMkbMKZdffmEjjiuIuYr6jkH7F/c5Ko5feYT3rGUy8fgl+YJWcIK/UtVUEQpCDQjWZa5B9Fvo5PgbtaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pEKT4cb4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pEKT4cb4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=alKHL8CM8KKSBdPN6Bu4nIeV2UKJk208uMbG0wiOBj8=; b=pEKT4cb4ytLtN1E6F+jXDUiFW9
	x45q4jvV0tb/yH97Rh0pHYuUKxZ8mHcaQQOsZdM2iwmZFQJ4qNmsAkcMVmtByib1BFeU070HmjrDI
	pHqqk6BeMoQ0s5BFW8K6plmtW/77LqUImSRQjGJp+0R81lqqMr75RytZk5ayVI3Qx9185+nDDztjj
	ONgK7sbjg/gtDeKjzKenx6gYs2O0uTerHOSGvy4fGo+n8eayUiPuqJTRX1y7+e9UvBI9KLj3GFlu1
	5o/7rbKbYfYxh58DKgx7m/3L56Ob9dPdVOe7/gv2Ew9uYdnKGSVX1FgjpeB7KgTbdxRIZSYIuy7c/
	2Hk2G6Sg==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPp-0000000ARIM-3BS6;
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
Subject: [PATCH 18/21] nvme-fc: initialize max_hw_sectors earlier
Date: Wed, 28 Feb 2024 10:12:12 -0800
Message-Id: <20240228181215.873854-19-hch@lst.de>
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

Initialize max_hw_sectors and max_sectors a little earlier so that
nvme_alloc_admin_tag_set can rely on it to set the initial queue limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/fc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 68a5d971657bb5..537008dd2c616c 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -3113,10 +3113,6 @@ nvme_fc_create_association(struct nvme_fc_ctrl *ctrl)
 	if (ret)
 		goto out_disconnect_admin_queue;
 
-	ctrl->ctrl.max_segments = ctrl->lport->ops->max_sgl_segments;
-	ctrl->ctrl.max_hw_sectors = ctrl->ctrl.max_segments <<
-						(ilog2(SZ_4K) - 9);
-
 	nvme_unquiesce_admin_queue(&ctrl->ctrl);
 
 	ret = nvme_init_ctrl_finish(&ctrl->ctrl, false);
@@ -3542,6 +3538,10 @@ nvme_fc_init_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 
 	/* at this point, teardown path changes to ref counting on nvme ctrl */
 
+	ctrl->ctrl.max_segments = ctrl->lport->ops->max_sgl_segments;
+	ctrl->ctrl.max_hw_sectors =
+		ctrl->ctrl.max_segments << (ilog2(SZ_4K) - 9);
+
 	ret = nvme_alloc_admin_tag_set(&ctrl->ctrl, &ctrl->admin_tag_set,
 			&nvme_fc_admin_mq_ops,
 			struct_size_t(struct nvme_fcp_op_w_sgl, priv,
-- 
2.39.2

