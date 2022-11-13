Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1461850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Usf+R6RVsaQ2qPXORkfHh47EniOLLHDMiICrDrEjhNs=; b=ZHNaUpmZiptsC+UiVsJ37ve3VY
	y34t8MZPuKu4owxXhgW0j1Ou7qkhnw4OPSwn6eSzmekHKrX36+Wi/una0CD4v9z3y7etslfTRY1RO
	604RCqbY2ZaMGLI86dopKlJ/JBGlXzcq69MEoNDQE4EvxTTP9BJx6aANPVVan8U6EfOWvlHttmKT0
	zTGjyXkN3KJm9mrSxjfKxg+mHVMsO27azN3kSNKoxAQDQMG70bOw9yf+TFk5QwaQq+wWWF+gp4Ndt
	fa+7qugvoRQG1WAkKdJfgTmM1J7RICZ9eM94IUO5cqP3Io4Hbxgc1ld+v9cAUHOGXqH8b34MOkh9y
	/OE+iJ4g==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFaB-00CBlz-JG; Sun, 13 Nov 2022 16:11:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: nvme-pci: split the probe and reset handlers v2
Date: Sun, 13 Nov 2022 17:11:25 +0100
Message-Id: <20221113161138.883195-1-hch@lst.de>
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

Changes since v1:
 - switch back from IS_ENABLED for the SED_OPAL code to prevent a warning
   when it is disabled.
 - rename nvme_pci_alloc_ctrl to nvme_pci_alloc_dev
 - allow initializating shadow doorbell buffers during reset
 - simplify HMB setup a bit
 - shutdown the controller on reset failure

Diffstat:
 host/apple.c  |    2 
 host/core.c   |   39 ++++-
 host/fc.c     |    2 
 host/nvme.h   |    7 
 host/pci.c    |  413 ++++++++++++++++++++++++++++------------------------------
 host/rdma.c   |    2 
 host/tcp.c    |    2 
 target/loop.c |    2 
 8 files changed, 240 insertions(+), 229 deletions(-)
