Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEA21850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=TC0h2wU4Eu5nenLJLEWOQKJwOD/2eKQIZpug5OnJ8RA=; b=FeG9mFr4hxm2aj6oXWLxbTMRLY
	IbmS+skWqk2MTskU5g3LHzsZ3KVPk6FJ3mIHkFIjcA4Nrj5wCFsxK08NzNPpqSTRhdmTLyXlYPRvB
	U0OWKBH/K3V5DY4PaFlBcWvHBOsWtwhpplOfXdhYqzLgjhbjgdw9MGVC3Fuh4F6XMkCcTF6CUByjG
	pkHeLWR281mg0uPsXsGqajorO8k/E+YR4YOSRj5QLzSrq+u2lqhRxaVA9vH2R9KibGZEU9ixI8L+2
	SO1JN3n8uJHzHmcAqgRjyEiYWTE0sv2OSpfBmP+il+brTEbN6lZuvhDwnZKfWlsg+4lVkjMWAcyml
	91AMosvQ==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFaE-00CBnM-LW; Sun, 13 Nov 2022 16:11:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 01/13] nvme: don't call nvme_init_ctrl_finish from nvme_passthru_end
Date: Sun, 13 Nov 2022 17:11:26 +0100
Message-Id: <20221113161138.883195-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221113161138.883195-1-hch@lst.de>
References: <20221113161138.883195-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

nvme_passthrough_end can race with a reset, which can lead to
racing stores to the cels xarray as well as further shengians
with upcoming more complicated initialization.

So drop the call and just log that the controller capabilities
might have changed and a reset could be required to use the new
controller capabilities.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Tested-by Gerd Bayer <gbayer@linxu.ibm.com>
---
 drivers/nvme/host/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 1a87a072fbed3..ce8314aee1ddf 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1123,8 +1123,10 @@ void nvme_passthru_end(struct nvme_ctrl *ctrl, u32 effects,
 		mutex_unlock(&ctrl->subsys->lock);
 		mutex_unlock(&ctrl->scan_lock);
 	}
-	if (effects & NVME_CMD_EFFECTS_CCC)
-		nvme_init_ctrl_finish(ctrl);
+	if (effects & NVME_CMD_EFFECTS_CCC) {
+		dev_info(ctrl->device,
+"controller capabilities changed, reset may be required to take effect.\n");
+	}
 	if (effects & (NVME_CMD_EFFECTS_NIC | NVME_CMD_EFFECTS_NCC)) {
 		nvme_queue_scan(ctrl);
 		flush_work(&ctrl->scan_work);
-- 
2.30.2

