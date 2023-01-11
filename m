Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA917D2
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 04:38:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A9EC6422CC;
	Wed, 11 Jan 2023 04:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1673411907; bh=Q3CUKLEywf+vR4+nGROpaJQqVS2PQmhEl5Il4+LejRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QY5tqf60SZHxFaNdFYSzNvp4IdFLjD4OU8BawnpwU74nj7igN5fSFDF1+fcojF39A
	 sOVlpJT9RhW6yM4BHm02nodGm1dFnVtmoqCnFikp1F9d/8cT3SuUqKczh83l09wMoo
	 Zz+ydkC/lTC43zhbi3SjksPhqde146WnH3Ge1L59zI7Cg8TeHT4GQTiqLfm70xYxh7
	 LVdvZPRhSF4FctliGqXRgKXSjYPgtSRKMkB+ouZ2NiQ/4azKsNZx88fxEu31eKkYae
	 js5/uMv+MwTL1AyrKdtdx76z3wHbPDiWP65rW7ZcORH+fhFmpmvHqNkiBHju5CgmAS
	 FS6P8dLLiUcuA==
From: Hector Martin <marcan@marcan.st>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Eric Curtin <ecurtin@redhat.com>,
	Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH 1/2] nvme-apple: Do not try to shut down the controller twice
Date: Wed, 11 Jan 2023 13:36:13 +0900
Message-Id: <20230111043614.27087-2-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230111043614.27087-1-marcan@marcan.st>
References: <20230111043614.27087-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blamed commit stopped explicitly disabling the controller when we do
a controlled shutdown, but apple_nvme_reset_work was only checking for
the disable bit before deciding to issue another disable. Check for the
shutdown state too, to avoid breakage.

This issue does not affect nvme-pci, since it only issues controller
shutdowns when the system is actually shutting down anyway.

Fixes: c76b8308e4c9 ("nvme-apple: fix controller shutdown in apple_nvme_disable")
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/nvme/host/apple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index e13a992b6096..1961376447dc 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1023,7 +1023,8 @@ static void apple_nvme_reset_work(struct work_struct *work)
 		goto out;
 	}
 
-	if (anv->ctrl.ctrl_config & NVME_CC_ENABLE)
+	if (anv->ctrl.ctrl_config & NVME_CC_ENABLE &&
+	    !(anv->ctrl.ctrl_config & NVME_CC_SHN_MASK))
 		apple_nvme_disable(anv, false);
 
 	/* RTKit must be shut down cleanly for the (soft)-reset to work */
-- 
2.35.1

