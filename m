Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89F6AC0
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FrvnfBTugrlzoj/uKZX5uHlEQw2inwA7+9zzZMRMd6I=; b=flpVxXkBWAqK9BoHHNO9G/+ldG
	5c6Mnfye70J/vAZzu38BvhmuId6fh9guTCbGigOywLhVAN27A5FTf7v7yzMyOeClfR59bCA/RkOqb
	4A67c5/jqw5VLbrQRdWjcTjcClJbS2Fn7Yuqe4L3To3Ing0Ijgi/mmlYjSisHbYqx1+IMvfp/DuNF
	q15UbmnqPugyjrY7k9L2Kd3HymvY5Xy86ZlHW7Ouz0zn/4TeWUK0A12qfeaxrkmqtwOPk+IZHXYIz
	PYfFVA1mAVglGl6ZNniY8LyxG7TWVVBlDw39gbUsNoOb6MUOJ9GKBQAF6LM7FFIcvagTDqFRZ54kH
	HMiV2W3Q==;
Received: from [2001:4bb8:192:26e7:691d:40a8:d7b5:b2f5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00Yx-008lWO-Bq; Tue, 29 Nov 2022 13:22:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 1/9] nvme-apple: fix controller shutdown in apple_nvme_disable
Date: Tue, 29 Nov 2022 14:22:00 +0100
Message-Id: <20221129132208.4337-2-hch@lst.de>
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

nvme_shutdown_ctrl already shuts the controller down, there is no
need to also call nvme_disable_ctrl for the shutdown case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/apple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 94ef797e8b4a5f..56d9e9be945b76 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -831,7 +831,8 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
 
 		if (shutdown)
 			nvme_shutdown_ctrl(&anv->ctrl);
-		nvme_disable_ctrl(&anv->ctrl);
+		else
+			nvme_disable_ctrl(&anv->ctrl);
 	}
 
 	WRITE_ONCE(anv->ioq.enabled, false);
-- 
2.30.2

