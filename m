Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45692115
	for <asahi@lists.linux.dev>; Fri, 13 Jan 2023 10:23:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 2D09D4258A;
	Fri, 13 Jan 2023 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1673605416; bh=M3tZrYZnQ0FBU0rxzLvbqjtCSW4bNvZXYV5NUHuboTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xoflWglINJt2Kww6POJDVwvtrmzEH4a7tuJzKq+dTzqd5irvgP1Exj3UZ9TOAPLHj
	 Jo9GbMSlw4pmdP335FEAWSGBaYmN81gsITgcorIbKPwW32uXmLbs8x8lc2YJTqWp1q
	 1yXxZkgs+AHxN67mmI7xs1zqw5NxTpAaTKrqtDKo9tsJCuEMAtskUmJ8DhAGqwaUTB
	 MoeuvEbtYnro6hp4nuqzlwVvP2gRKLpu5GIp07cgrhlfB+K46FCNHYpus3uqgrh2Vl
	 fW2BzoBy0+8hGZPP8SIAmC6cbHWEvdIKTOwKDMfjumS1r+Tj15QC7SltWowsx/PO62
	 FgK6uSuqSK4Hg==
From: Hector Martin <marcan@marcan.st>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH v2 2/3] spi: dt-bindings: Add hold/inactive CS delay peripheral properties
Date: Fri, 13 Jan 2023 19:23:09 +0900
Message-Id: <20230113102309.18308-3-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230113102309.18308-1-marcan@marcan.st>
References: <20230113102309.18308-1-marcan@marcan.st>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

