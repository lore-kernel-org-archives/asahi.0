Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64740844
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143948; cv=none; b=XU3E402Ym0CtykyDM0kODMJyhmnDvAN2EhCZAOyBlRcqsIrsNQRwLL1d4czXHZMAkVCQvAX5r3XM0YvicKHADsqCBVIdrmm4nS6r3KLZxXTt4e/o+QCXKZ9lggTpenVSbYYSjT0rK3khPAe2fUWToIrv46fZ23IbtBG6aheY2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143948; c=relaxed/simple;
	bh=kegolosRHFteRM0UAu162PGar0vLW5QEXLxxoge1KCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZLbi2GAWB6w9er7Y5xlP5ok2VeROAVFjA7G9xDDz74w0ndQlJWiVxsXcWkGU+d3UjekBm+o8xur4pckfGy6RNp9+YUhvMciY03eYT3dH+iqh1wiWxDTDWT7kcN8O/PTFjja8VEwimVDboJCPY371Fgynu7/WtRmqJRA8CmCj04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A0kOUwsF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A0kOUwsF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CguPRvQxrjD6y/IzPOGivdt7zD5O3eoa4wiCpjmt0bM=; b=A0kOUwsF8nJgfOURqLLLR2aSwc
	N5EbmNlvUE2hEEeU+HyK15GpzqhZIqgkocLObRvKTf/8gnELwv5WE/sbH7bakDdrZdV4Dpx5aKzwc
	5MH37AqZ+3Wy7I6LsyU31oGq+3kOc4bhumr6vckm8hiQa0WpLMR06PWa2sQShV9ZCTVZ+yBdHry7j
	sbxN/BRgKblMaKgH0Re08puZexKL5xlJ8YEAQqhWHB4Q2EGUDOQvqEvJbuNuMm95ncmI1Zbl772Ko
	pZcP6qJFBmpdkUhqtfRh+PNENY/DQlJgDn+FparwcE5Mbop9nMVWq3q2naNYH9igA82cVRKddF4eT
	Yt8UfHOA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPn-0000000ARGY-1Dqa;
	Wed, 28 Feb 2024 18:12:23 +0000
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
Subject: [PATCH 13/21] nvme: split out a nvme_identify_ns_nvm helper
Date: Wed, 28 Feb 2024 10:12:07 -0800
Message-Id: <20240228181215.873854-14-hch@lst.de>
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

Split the logic to query the Identify Namespace Data Structure, NVM
Command Set into a separate helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 78667ba89ec491..adcd11720d1bb4 100644
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

