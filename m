Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E47EA
	for <asahi@lists.linux.dev>; Wed,  4 Jan 2023 09:37:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id E287242037;
	Wed,  4 Jan 2023 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1672825057; bh=NUEh0FNVbl8pM5v3KLVsYoeV+coXZrlb1+D5P/bGSSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HhZ+eD/ZncivrtyFKQI4dRTREx8Czu7pZTMHYTB1CDFE6pEVnkM2RTQR+TCBcFk42
	 9VYuPyml0THd37OvUssFznHXZcoaczR2eIypomMKN7NAGpk2n9fXUb4Qo+B2e3Jlkx
	 IzLM+xQfYqjM+gCa4N56ygvujCbVSpgHE0ICkekH3I89YeSBoSAuNRVY9jyH8Mp7On
	 WXGXzzBwsAGNUgiTqNL2+a6QCdj3sOo7MeXgqpJLxK9AJaWkrBh3bSY20SLZQWBk1N
	 eJqotZcGoJrcQYYhrYB2p0gSudj9N2X+1WhnGDMe9ZxBn4sQQJpvdB9YgGGH6ySPRg
	 9s3FyXTGuI/XQ==
From: Hector Martin <marcan@marcan.st>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH 4/5] spi: dt-bindings: Add hold/inactive CS delay peripheral properties
Date: Wed,  4 Jan 2023 18:36:30 +0900
Message-Id: <20230104093631.15611-5-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104093631.15611-1-marcan@marcan.st>
References: <20230104093631.15611-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Janne Grunau <j@jannau.net>

These two properties complete the bindings for the Linux spi_device cs
model, which includes cs_setup, cs_hold and cs_inactive delay values.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 9a60c0664bbe..782a014b63a7 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -49,6 +49,16 @@ properties:
       Delay in nanoseconds to be introduced by the controller after CS is
       asserted.
 
+  spi-cs-hold-delay-ns:
+    description:
+      Delay in nanoseconds to be introduced by the controller before CS is
+      de-asserted.
+
+  spi-cs-inactive-delay-ns:
+    description:
+      Delay in nanoseconds to be introduced by the controller after CS is
+      de-asserted.
+
   spi-rx-bus-width:
     description:
       Bus width to the SPI bus used for read transfers.
-- 
2.35.1

