Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F0B3F9C5
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561179; cv=none; b=ogpmjRzjzfPR6er58LNa4gyo5jCpcjfCNXDballsAQo3mavmJSSMI5HTHU+Ev/utXWm6MrQsbFpBk8sHhtqdNriOCfNEFd9oA5fECACP2RJy+VhzwpEvWE/Ut3USKH8rsdq/O01sZRd4UnnE+Ev7TR0eOXaOlFTCjGP5ROlnNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561179; c=relaxed/simple;
	bh=3G35h77oMILr7W9MGx5LCwENaM3hOJheXzXCc5Fz3+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iE/1kIoaCZ+E3wFPUCd0ro+cOXJ7FG+S8FiKsyoCBzHYlbtOV7Up3A8HHuqxtozWywPgXZABmGkRuFJ6m1Ub1Q06jB+IBrvDbz9fvfs5zNIMi4D7oqg7mtzANBKtyukPTSyZWLi4EAZzqqflmaHoOxI+qe8VmkQbs4Cc6Sc6Nes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1PEtEWPL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1PEtEWPL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1iq0SDNjuAqju+qMj4DRxcdeQAcFblUDGrqSJeOZj5c=; b=1PEtEWPLE9j/Fk1J41jEOGaB5z
	AA1XhRXzmIGFhtN49wtAB/JZ4oj6CDHbuCHXPWQCsDoGbazewUiSEkXl00rE2G2r8hjcMWVV+2J01
	3DXhj0WoJJNLrTAxShFpmMEprVQtBwWZE0XbH0ANZG1Ysv1u4ZqF+HBLajxWuRep1o4DoR9PHGsA4
	L4it77qy+QJ3/YBR/mEmVnkBlVjt/Vv1MmDj/e/uPKVcDkKJrBNI34ICO8ELPm7EvvoYgJVbttJog
	qjRp3tsxx1qSFzcnudWFu426jk82ER58OLCyspOQhQX8z1LkfHRHuedrL+rDPVCdquSNYUCcjbdcL
	Z1fTI0Qg==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8xG-00000009I5q-0oCL;
	Mon, 04 Mar 2024 14:06:11 +0000
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
Subject: [PATCH 11/16] nvme: split out a nvme_identify_ns_nvm helper
Date: Mon,  4 Mar 2024 07:04:55 -0700
Message-Id: <20240304140500.78583-12-hch@lst.de>
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

Split the logic to query the Identify Namespace Data Structure, NVM
Command Set into a separate helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 drivers/nvme/host/core.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f0686a872d0e30..9abcc389f0f3ae 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1831,12 +1831,35 @@ static bool nvme_ns_ids_equal(struct nvme_ns_ids *a, struct nvme_ns_ids *b)
 		a->csi == b->csi;
 }
 
+static int nvme_identify_ns_nvm(struct nvme_ctrl *ctrl, unsigned int nsid,
+		struct nvme_id_ns_nvm **nvmp)
+{
+	struct nvme_command c = {
+		.identify.opcode	= nvme_admin_identify,
+		.identify.nsid		= cpu_to_le32(nsid),
+		.identify.cns		= NVME_ID_CNS_CS_NS,
+		.identify.csi		= NVME_CSI_NVM,
+	};
+	struct nvme_id_ns_nvm *nvm;
+	int ret;
+
+	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!nvm)
+		return -ENOMEM;
+
+	ret = nvme_submit_sync_cmd(ctrl->admin_q, &c, nvm, sizeof(*nvm));
+	if (ret)
+		kfree(nvm);
+	else
+		*nvmp = nvm;
+	return ret;
+}
+
 static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
 		struct nvme_id_ns *id)
 {
 	bool first = id->dps & NVME_NS_DPS_PI_FIRST;
 	unsigned lbaf = nvme_lbaf_index(id->flbas);
-	struct nvme_command c = { };
 	struct nvme_id_ns_nvm *nvm;
 	int ret = 0;
 	u32 elbaf;
@@ -1849,18 +1872,9 @@ static int nvme_init_ms(struct nvme_ctrl *ctrl, struct nvme_ns_head *head,
 		goto set_pi;
 	}
 
-	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
-	if (!nvm)
-		return -ENOMEM;
-
-	c.identify.opcode = nvme_admin_identify;
-	c.identify.nsid = cpu_to_le32(head->ns_id);
-	c.identify.cns = NVME_ID_CNS_CS_NS;
-	c.identify.csi = NVME_CSI_NVM;
-
-	ret = nvme_submit_sync_cmd(ctrl->admin_q, &c, nvm, sizeof(*nvm));
+	ret = nvme_identify_ns_nvm(ctrl, head->ns_id, &nvm);
 	if (ret)
-		goto free_data;
+		goto set_pi;
 
 	elbaf = le32_to_cpu(nvm->elbaf[lbaf]);
 
-- 
2.39.2

