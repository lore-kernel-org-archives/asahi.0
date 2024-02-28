Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2879B8B
	for <asahi@lists.linux.dev>; Wed, 28 Feb 2024 18:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143943; cv=none; b=SKBHRJNy70hjojn4l43p8kvzlR2KjrjEFszLMmr/M/boQpRlS1HMeKrOUreMkzqK2k+1CY2LVfHuDMBvkqO9x1hJhRmSKwKh1MCcbLsFyaE7snvQAUYjB1AGdhOTeXtso02PG95jckkqds10gzfMPQO+Uv0GDtWPGiEi0r2ybHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143943; c=relaxed/simple;
	bh=X6n/l2Uf6cMkCASzzUS6bIqe8zK8+iDCFuRAEdVsafs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dwLRVGfcR05bq6kM+5yGeJFsHR1NEEqU8THZa8+dt/gHkLRWXNEoiwHcORD37EY2KOwmM0rhjiI9i2jLi2hDw/ic8vSYCOY1B5VHPiD+ocOol0+bg6WuiaIi8BrUgH1RFK1vk8ytJWniJPnA7UO+M8kpWjpRLciJ17BvzJE/Jcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A7S18yVd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A7S18yVd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aEybhb5DKf8nVItUAdL+3MWNqoRa/GexTube2U7lHnQ=; b=A7S18yVdFQav47F8lnH75PCq30
	h/HNlzsu0/tZaNE2C8QDa+/5roHpuqdrHGZBfMcj+Rtz6wO0dsVqE+XcSE3EAkxN+S0nAC9WE4Wbn
	obkgYb/cCcUluwq1ksET/aYkLIdqXJH/7Xb5gvronbunM071gdL8VyFFs6Nn7kHL8nUni4HOmzDzg
	k84pJnDEDa0UecNd/bCdG9WeJqSSioLtWkMWVlVuEB6/CSFcqZ1QF6eYwH3mKgorvUQ4Jyosf5Weq
	LjCuxX2B+lpDM3AbdPuweTSd/uexcIOwV4hCSYghtmR9sG9gOvrIFRvroBhHU08HLqZ1sF3dOKgi5
	bxAb6D6g==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOPf-0000000ARC3-1JA1;
	Wed, 28 Feb 2024 18:12:15 +0000
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
Subject: convert nvme to atomic queue limits updates
Date: Wed, 28 Feb 2024 10:11:54 -0800
Message-Id: <20240228181215.873854-1-hch@lst.de>
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

Diffstat:
 block/blk-settings.c          |   43 ++++
 drivers/nvme/host/apple.c     |   18 +-
 drivers/nvme/host/core.c      |  378 ++++++++++++++++++++----------------------
 drivers/nvme/host/fc.c        |    8 
 drivers/nvme/host/multipath.c |   13 -
 drivers/nvme/host/nvme.h      |   12 -
 drivers/nvme/host/rdma.c      |   13 -
 drivers/nvme/host/zns.c       |   24 --
 drivers/nvme/target/loop.c    |    5 
 include/linux/blkdev.h        |    3 
 10 files changed, 272 insertions(+), 245 deletions(-)
