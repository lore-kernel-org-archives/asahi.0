Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719D3F8D0
	for <asahi@lists.linux.dev>; Mon,  4 Mar 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709561117; cv=none; b=MtI5dKrDVpBV8eCW3P2zfVWOcUika/VuJvm2P2n7q1DrOEbvTCJ5tDT93i4EmhQqH2vU41NYZZgvO6NddEgSAj4ojUIPkWIMfmB2RwuN65dSz4q/HgCy/LMaoeZ/us99Xy4Hd2uPonkCKc6VguC3Ah1W70zNSyR7ITjf2OdNxm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709561117; c=relaxed/simple;
	bh=mS8nIdgmMypfdSprXWb/vs83iPRz/LlIzgXLKOIbnfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UgZNC4t4MAzHen7SQ730jaY7MCkMIr8LUdB3wKAnTAUnbGhaxzOmcNgfPMGWhBScNFi0TfLYifthGemx4zR/kGPdsxqAUb0Uwvoa9dx+ZkNlEjRefag2PF0nYsa6H1Ip5No8Z+SoN/+ImCOIuIqopRrYS5f4+HFxmAtFYqnQojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bMzrVObE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bMzrVObE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hDssSc3GtQMWyJa9MFOY5+NDJYLooAIm6n5P105s+Wk=; b=bMzrVObEk3g/8rKAM1/0WaUtBU
	GDfHD7UUZAgQB8Z46/4OzUm7f3ZSCA8JQ5eCUCYHCeU796iN6vSU3BaSZx/tNZA+JH7iMTfV/a6g6
	nOqi2wldfkEdEqT/s1Ap0VgDhxqNm4v4604FHP35fvj0lSrEuDoB5XSeQMrurkn89zwghbFB4/ix2
	rF9/5uf68BwNLh6V7p0bEG/NOpYwyizUnag1kEvyVgIzftJrZlIgu4Gt/dtMnHBlYaSdRUaznhq8G
	S4RVKMezCmkCOFCu9FPJ/QE3U1NMfwcFEvr1dzC3mwVRyLfNdOUR+R0aD7CH0ixy/td1FDJ0j/TY2
	0KV5WT5A==;
Received: from [206.0.71.24] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh8wD-00000009He8-3G5f;
	Mon, 04 Mar 2024 14:05:07 +0000
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
Subject: convert nvme to atomic queue limits updates v2
Date: Mon,  4 Mar 2024 07:04:44 -0700
Message-Id: <20240304140500.78583-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series converts nvme to the new atomic queue limit updates, and
as part of that refactors a lot of the setup code.  The first two
patches are block layer patches already sent out as part of the md
queue limits conversion and will hopefully get merged into Jens' tree
soon.

Changes since v1:
 - also set GENHD_FL_HIDDEN on the multipath gendisk for unknown command
   sets
 - use the queue_limits_* API for multipath device stacking
 - update the admin queue limits after reading in the MDTS value

Diffstat:
 core.c      |  393 ++++++++++++++++++++++++++++++------------------------------
 multipath.c |   13 +
 nvme.h      |   11 -
 zns.c       |   24 +--
 4 files changed, 218 insertions(+), 223 deletions(-)
