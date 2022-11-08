Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E52F3B
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xCqWssH87NIP2qBXcjXCsEOkMsUPQvAGYtSRTrqH0xI=; b=Hy/rzoJ1ropdjYtqu0HbSwwctD
	g8BIPaPDGLK3GIXjOAzl7SFqpkWtO025/42fMTrlDoai2zoJi0M9dVYyJejC49M19YQYtJekiC5Il
	RCQY+J5VkXStoORsaBxFDXSmbvV0eP6dL3w2BWxz6CSEVdKG4UBNhayvjeq3nCGPp3Ttd5a82ejPz
	AGupjaQ6geP3nwD9VgI52RUpnYRV9zEG0fZGLQVsq7YDjQHPr5kqNKgOi6xPHRE1aQ3uFXjeDINBC
	sK8JMn0Gt1UuNhAuG5vhEzv7/C4Eh0X5p9BjNnlAvUEEKWXLCV4DG/D5ujRMRuBcxAYUzAGXGbrFJ
	7fpY/vxw==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ7s-006Bl9-69; Tue, 08 Nov 2022 15:02:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: RFC: nvme-pci: split the probe and reset handlers
Date: Tue,  8 Nov 2022 16:02:40 +0100
Message-Id: <20221108150252.2123727-1-hch@lst.de>
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

this series split the nvme-pci probe handler to be separate from the reset
handler.  I've been wanting to do that for a while, but the bug report from
Gerd that was caused by confusing about the controller state in the reset
state required it to be expedited.

Diffstat:
 host/apple.c  |    2 
 host/core.c   |   39 ++++-
 host/fc.c     |    2 
 host/nvme.h   |    7 
 host/pci.c    |  415 +++++++++++++++++++++++++++-------------------------------
 host/rdma.c   |    2 
 host/tcp.c    |    2 
 target/loop.c |    2 
 8 files changed, 237 insertions(+), 234 deletions(-)
