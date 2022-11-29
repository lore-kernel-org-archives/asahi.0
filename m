Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E3322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bxRikpF+oJEmmcPPvrj/GfyFwM1k+Z8kAMRCOFz+eqU=; b=BJoDYIMnN2+kyhlsWhTfjNyj04
	WR3pdR6zq07DMaoTosLQLC8nU7UFCrmUIPBZcJ9Hz9D1AzZlpbEz55Z90Arubk7xzGrw4/CtFDJVU
	MrhetzQVSMi9/0BfL5RUJSYrjjS8bzvKG4XYLxa5gQn2nMwwuORlFZhG+H/Ua/itORXcfahowf2LJ
	CO0N26UgRWCD1Dnu6Wn23oeCONB2DPZpNXiQv0Q72EMuWpiHwkLeD220PzBxqTT8E3yMFo8HEI6zn
	e77UeZ19AXq7g0N3iWdNKTI2lXH9GG/VO4ASYI+1DX7j8GEA5w9QFKu/gxGWLTUldqJFotpPFKqfY
	33Cy84aA==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00Yu-008lUP-37; Tue, 29 Nov 2022 13:22:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: remove path cleanups
Date: Tue, 29 Nov 2022 14:21:59 +0100
Message-Id: <20221129132208.4337-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this series cleans up the remove path in the PCIe driver and a bit in the
common code after fixing a harmless bug in the Apple driver.

Diffstat:
 host/apple.c  |    4 -
 host/core.c   |   65 +++++++++-----------------------
 host/fc.c     |    2 
 host/nvme.h   |    3 -
 host/pci.c    |  117 +++++++++++++++++++++++++---------------------------------
 host/rdma.c   |    5 --
 host/tcp.c    |    5 --
 target/loop.c |    2 
 8 files changed, 77 insertions(+), 126 deletions(-)
