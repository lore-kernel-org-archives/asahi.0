Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340A6111
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 15:29:18 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252146; bh=qcgclGCFYD+77b0HLKFa7/pKBARXaiNkZFUlsvgiV7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rPQdylosAxrYCCO5c8/2Rz1rgF2eMzEo2nN+XzDHHHY4+Y/P8SWrZZ3ZkW96z5Hcb
	 7hYQRfRVs/LzFiwrE5hV2PlmdcgVImUYYTcN6kqBi+W5L2KFPLvVQuwqPe1AOsk3bW
	 qLWLeQ+rLGrT5pbA3RNrIgOsxOwUY1GatwjsNLj8=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dmaengine: apple-admac: Set src_addr_widths capability
Date: Fri, 24 Feb 2023 16:22:22 +0100
Message-Id: <20230224152222.26732-3-povik+lin@cutebit.org>
In-Reply-To: <20230224152222.26732-1-povik+lin@cutebit.org>
References: <20230224152222.26732-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add missing setting of 'src_addr_widths', which is the same as for the
other direction.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 drivers/dma/apple-admac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 497bb65b7d6d..4cf8da77bdd9 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -861,6 +861,9 @@ static int admac_probe(struct platform_device *pdev)
 
 	dma->directions = BIT(DMA_MEM_TO_DEV) | BIT(DMA_DEV_TO_MEM);
 	dma->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
+	dma->src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	dma->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
-- 
2.33.0

