Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAD92F3B
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=JkfGQa7KOskg08fvS4HAPLNYwKvousPKstD++UlUgWk=; b=yt+/smPUK1XxggtGO7xes4yERw
	kW4iwwfo+2u0in7N2POB8MbZ1A5qMoaW+nH0g1NRDxfCTLQiWrZ0350dVPTP3YNbo/wO9oictRt2E
	C9BaY6WRK6ZbuQs4FagrR4p/DZvByM/Z9+ecWX3GwFeFKy2aqKL4XD0xeKyvqSjdgx30E/5xyMdpo
	eK6vl1l0Wh133PAJZFpG/tWRRP7KEtK3g3M1/pjdhiSrHRq5qjZfD+0GOyQ0QBUxItiDmdcf5gF4O
	EIkYprPh5DWzU43AtbdaM7yYB2MDFxYJnQV6iN0bCBsuEhkLDLrHtDvEMntkAqXHPbKJiL7TJQF1F
	1PVz+HiQ==;
Received: from [2001:4bb8:191:2450:b4e6:4796:2c38:d4bf] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ7u-006BmC-TN; Tue, 08 Nov 2022 15:02:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH 01/12] nvme-pci: don't call nvme_init_ctrl_finish from nvme_passthru_end
Date: Tue,  8 Nov 2022 16:02:41 +0100
Message-Id: <20221108150252.2123727-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221108150252.2123727-1-hch@lst.de>
References: <20221108150252.2123727-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

nvme_passthrough_end can race with a reset, so we should not call
nvme_init_ctrl_finish from here.  Instead just log that the controller
capabilities might have changed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index f94b05c585cbc..706499d4bfefb 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1120,8 +1120,10 @@ void nvme_passthru_end(struct nvme_ctrl *ctrl, u32 effects,
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

