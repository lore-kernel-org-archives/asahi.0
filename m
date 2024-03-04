Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C93F9CB
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561189; cv=none; b=USC9AELCeu8Oa4nOu/8Ehp2d6RhzGza0hw0XctcQwoOJ94EUsjdkuoSG9jSecaEYtxZnKWB5JpRtnyCeWCkyDhfTgBBrLYgOqXDLIAyNDFPZVQBWzSWud5TG9hlgaoaxp8h+IfvDG0MEetIGDcF+xgREDSH8v4D8CGZTrZtTvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561189; c=relaxed/simple;
	bh=nM+bHqowQfv24IFdGeS8HdSvkthfbqonhekC4jt89mk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wp6b5yTpvNSEFKwQUIqQkgmhD0tWL6PSFnre9b2V7aXBqqWzaWoFUNo0AIx+4acTXOgzxpmMx+Mdu/CpW/U+Gahr0q5vD870gqlsnKDUKJvPFRY25PwRd3E/BrZMTYB2L031nL1ClONl4XxczFPc7vSt1SJaiEMmedV/A+cuHxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fgZX51Va; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fgZX51Va"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NY5xMkZY9IDunpiMbxzGiYjQfg1N7Unp8xQmszSykB4=; b=fgZX51VaET4nZ5T4WmUEQc8aLi
	hxvX/WCjldz2ZfMwJQ6B9fJeCJo9MiLP3T7H3aI/Q0K/02b9vCs/PNAis3/n91j9M9JKZE+YXTQQD
	qKTAafcRzGQ2YM8URhFCq2s69q/vLUsN+EkcjLVW0K3gU8Z3Hin5eNPk+a9hFVsPnL6q2DTLeUOrK
	3PxAePpSXAWJPSn9RDvRAtuPdvZB8MABKDSlkOczhmc56dJtlyeAu9EqJsNEPzG9mzzDlvdhRzy9h
	0yumHgDhJP6cgh9SHbtnZoCNnPuANn6oApfGzfcKpZpMR7otuPlb7y/qisw4ZaI1mqlQu7kyPELU9
	kM4tWynQ==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8xT-00000009IHV-07A6;
	Mon, 04 Mar 2024 14:06:23 +0000
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
Subject: [PATCH 13/16] nvme: cleanup nvme_configure_metadata
Date: Mon,  4 Mar 2024 07:04:57 -0700
Message-Id: <20240304140500.78583-14-hch@lst.de>
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

Fold nvme_init_ms into nvme_configure_metadata after splitting up
a little helper to deal with the extended LBA formats.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 47 ++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a742fa10dd3091..2ecdde36197017 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1855,26 +1855,14 @@ static int nvme_identify_ns_nvm(struct nvme_ctrl *ctrl, unsigned int nsid,
 	return ret;
 }
 
-static void nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
+static void nvme_configure_pi_elbas(struct nvme_ns_head *head,
 		struct nvme_id_ns *id, struct nvme_id_ns_nvm *nvm)
 {
-	bool first = id->dps & NVME_NS_DPS_PI_FIRST;
-	unsigned lbaf = nvme_lbaf_index(id->flbas);
-	u32 elbaf;
-
-	head->pi_size = 0;
-	head->ms = le16_to_cpu(id->lbaf[lbaf].ms);
-	if (!nvm || !(ctrl->ctratt & NVME_CTRL_ATTR_ELBAS)) {
-		head->pi_size = sizeof(struct t10_pi_tuple);
-		head->guard_type = NVME_NVM_NS_16B_GUARD;
-		goto set_pi;
-	}
-
-	elbaf = le32_to_cpu(nvm->elbaf[lbaf]);
+	u32 elbaf = le32_to_cpu(nvm->elbaf[nvme_lbaf_index(id->flbas)]);
 
 	/* no support for storage tag formats right now */
 	if (nvme_elbaf_sts(elbaf))
-		goto set_pi;
+		return;
 
 	head->guard_type = nvme_elbaf_guard_type(elbaf);
 	switch (head->guard_type) {
@@ -1887,29 +1875,32 @@ static void nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
 	default:
 		break;
 	}
-
-set_pi:
-	if (head->pi_size && head->ms >= head->pi_size)
-		head->pi_type = id->dps & NVME_NS_DPS_PI_MASK;
-	else
-		head->pi_type = 0;
-
-	if (first)
-		head->pi_offset = 0;
-	else
-		head->pi_offset = head->ms - head->pi_size;
 }
 
 static void nvme_configure_metadata(struct nvme_ctrl *ctrl,
 		struct nvme_ns_head *head, struct nvme_id_ns *id,
 		struct nvme_id_ns_nvm *nvm)
 {
-	nvme_init_ms(ctrl, head, id, nvm);
-
 	head->features &= ~(NVME_NS_METADATA_SUPPORTED | NVME_NS_EXT_LBAS);
+	head->pi_type = 0;
+	head->pi_size = 0;
+	head->pi_offset = 0;
+	head->ms = le16_to_cpu(id->lbaf[nvme_lbaf_index(id->flbas)].ms);
 	if (!head->ms || !(ctrl->ops->flags & NVME_F_METADATA_SUPPORTED))
 		return;
 
+	if (nvm && (ctrl->ctratt & NVME_CTRL_ATTR_ELBAS)) {
+		nvme_configure_pi_elbas(head, id, nvm);
+	} else {
+		head->pi_size = sizeof(struct t10_pi_tuple);
+		head->guard_type = NVME_NVM_NS_16B_GUARD;
+	}
+
+	if (head->pi_size && head->ms >= head->pi_size)
+		head->pi_type = id->dps & NVME_NS_DPS_PI_MASK;
+	if (!(id->dps & NVME_NS_DPS_PI_FIRST))
+		head->pi_offset = head->ms - head->pi_size;
+
 	if (ctrl->ops->flags & NVME_F_FABRICS) {
 		/*
 		 * The NVMe over Fabrics specification only supports metadata as
-- 
2.39.2

