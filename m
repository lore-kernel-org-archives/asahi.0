Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1F7F1
	for <asahi@lists.linux.dev>; Sun, 18 Sep 2022 10:09:17 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1663495157; bh=gaKj0Ci5FD63deotj130sKbZ5bE1yUtuVtF+Ah5tT40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IDTxXvLfZNDc4JOl0JP8m6l4wQRFooeggzLjK21+aezGO81b0Fdv+LjxPvbhUncL3
	 DpJuT/7miSTKMNJvw4594YyjbRWpDVGJLW8BeZq0JP2VTtbGz7BWOaIW4f4HpFpTs8
	 l28P27O2tz/HQNoFKme3dvax7zeTQWWDkxIpvNm8=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 3/4] dmaengine: apple-admac: Do not use devres for IRQs
Date: Sun, 18 Sep 2022 11:58:44 +0200
Message-Id: <20220918095845.68860-4-povik+lin@cutebit.org>
In-Reply-To: <20220918095845.68860-1-povik+lin@cutebit.org>
References: <20220918095845.68860-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is in advance of adding support for triggering the reset signal to
the peripheral, since registering the IRQ handler will have to be
sequenced with it.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 drivers/dma/apple-admac.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index d1f74a3aa999..7d1b76678032 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -96,6 +96,7 @@ struct admac_data {
 	struct device *dev;
 	__iomem void *base;
 
+	int irq;
 	int irq_index;
 	int nchannels;
 	struct admac_chan channels[];
@@ -724,12 +725,7 @@ static int admac_probe(struct platform_device *pdev)
 
 	if (irq < 0)
 		return dev_err_probe(&pdev->dev, irq, "no usable interrupt\n");
-
-	err = devm_request_irq(&pdev->dev, irq, admac_interrupt,
-			       0, dev_name(&pdev->dev), ad);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				     "unable to register interrupt\n");
+	ad->irq = irq;
 
 	ad->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ad->base))
@@ -774,17 +770,29 @@ static int admac_probe(struct platform_device *pdev)
 		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
 	}
 
-	err = dma_async_device_register(&ad->dma);
+	err = request_irq(irq, admac_interrupt, 0, dev_name(&pdev->dev), ad);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "failed to register DMA device\n");
+		return dev_err_probe(&pdev->dev, err,
+				     "unable to register interrupt\n");
+
+	err = dma_async_device_register(&ad->dma);
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "failed to register DMA device\n");
+		goto free_irq;
+	}
 
 	err = of_dma_controller_register(pdev->dev.of_node, admac_dma_of_xlate, ad);
 	if (err) {
 		dma_async_device_unregister(&ad->dma);
-		return dev_err_probe(&pdev->dev, err, "failed to register with OF\n");
+		dev_err_probe(&pdev->dev, err, "failed to register with OF\n");
+		goto free_irq;
 	}
 
 	return 0;
+
+free_irq:
+	free_irq(ad->irq, ad);
+	return err;
 }
 
 static int admac_remove(struct platform_device *pdev)
@@ -793,6 +801,7 @@ static int admac_remove(struct platform_device *pdev)
 
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&ad->dma);
+	free_irq(ad->irq, ad);
 
 	return 0;
 }
-- 
2.33.0

