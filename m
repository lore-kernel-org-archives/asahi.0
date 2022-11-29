Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AC322A
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fuoVSw1VxLl5QCFXba4yvZ2M2fszDXiorTW4AkBniVw=; b=t2T8sfC3ynfX4rP3a6Do0RjhLD
	RJE8jthv8zkqhYuhodB7ASBeVacPkh7b0z/FqF5UVELqejFbcD76bA02yr1LgTSiKFX4AktgwNlzl
	ul/dcV2YS1blsOTBCMd2Hchhp7Kl46/nHgxWRBvL8AAeMm3TbrmSSdDakEIcMDYDqA8GUnrxIyT8E
	id/yqbP179nWDLXjObDJQox1NdzuV/UU1l8oMkRzeOpT4lT9cZaFqlp72NHIF1fIa7aXH3v69VqeU
	gt8T3W8MdqOBj0OEwHf4s5htPLKhjnE9mUgJXhNZ3T/vwfu3MhioeOIySh/BBRfyG0amPAKY5mx70
	M/UxgbOg==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00ZJ-008lfV-AW; Tue, 29 Nov 2022 13:22:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 8/9] nvme-pci: return early on ctrl state mismatch in nvme_reset_work
Date: Tue, 29 Nov 2022 14:22:07 +0100
Message-Id: <20221129132208.4337-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221129132208.4337-1-hch@lst.de>
References: <20221129132208.4337-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

When nvme_reset_work is called not in the resetting state something went
horribly wrong and we should not try to touch the controller registers,
so just leave the controller alone.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 1b527377e35197..02940b4f42b104 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2792,8 +2792,7 @@ static void nvme_reset_work(struct work_struct *work)
 	if (dev->ctrl.state != NVME_CTRL_RESETTING) {
 		dev_warn(dev->ctrl.device, "ctrl state %d is not RESETTING\n",
 			 dev->ctrl.state);
-		result = -ENODEV;
-		goto out;
+		return;
 	}
 
 	/*
-- 
2.30.2

