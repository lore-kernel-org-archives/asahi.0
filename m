Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000312;
	b=hP+UP0kDIsaDX7w1egNIonN+yTrAHLAyaui1BgjvspMWRGrUMD7bcVUAywmGLV5WMgoC
	 9DkpECUuwQYz7j8bVRUiKFRmXkJ3PWvj5ur2Fl/7N1tatq20IouW5NLgQdm8dxRF6GxDt
	 jUBlbtUC96VmJzBN0V/k8p0vUhZJQSf/i/vIQnkyGTpahbCf3DWl/aw8xRyPMfw48JsUu
	 7Kcw7OyOLdk1xG2iDDH+yJE2lcw3oRPJ6qiyctxz9fivLpuAJVVr2unYxqegrrQocoALB
	 YkmxQbefoCfCP4KF5gVEC673RJasIbljIho/uDNVcZw70cqjUwGr2aBW4uFtaIwKZsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000312;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=2AYHzRX018yeT4DRUy6H3UKeO548rYehdzwG2De2FNc=;
	b=Tx6IecFUfWMm1EY45mhrtlWTxuXaNeYTa2ITrfJzdP3iXJLqkUvvL6XAoyqg/zGil9AH
	 AX/ntVmKX3uQk6PPz1PEQq+J0ov8uDGKVKDrmgzO/YZpEmSum6v18phMUxVXziPmwxOaT
	 jbt4WKdaFKNawTybUKbYIERiwRX1i244JpBRpe9iAtYwCdm5hGt1c8xjk2f8dTqcq6j78
	 aQ9g/bYW0men+wWlGjp2UvwHa7AmYqeaicOFjRzD5uRS5iG/FboWPkoocwjQqFY3UbKcX
	 afEuLyQ5vXbVoK2A/qijCn4dyx9Jacpu8NyicTWA157SmyDs2/yXnP01srapqdHqhWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=wVbVL2mg;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9AF606D82B
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 21:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9AF606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=wVbVL2mg
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AYHzRX018yeT4DRUy6H3UKeO548rYehdzwG2De2FNc=;
	b=wVbVL2mgoH4HIUcPprPedUHGYjgprKwHDMWOXKFpW15wJdRXxXdSaoIu182S1TR4XeYZ8E
	K62B7hB6w3EKQ0XZ7guL3UyNnWq7m8IubVnsIGDsNQcJDGRJs1E5AJEaVvtGGWgfH9ovAR
	mIIG2zPAox0HcE4tMILdK3gDyE0iolA=
Date: Fri, 06 Nov 2026 22:24:55 +0100
Subject: [PATCH v3 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142
 compatible
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-6-cee55de54b2f@cyberchaos.dev>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
"apple,t8140-pinctrl".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 0984e4e58af3..13ece17eca9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -27,6 +27,9 @@ properties:
               - apple,t8122-pinctrl
               - apple,t8132-pinctrl
           - const: apple,t8103-pinctrl
+      - items:
+          - const: apple,t8142-pinctrl
+          - const: apple,t8140-pinctrl
       - items:
           # Do not add additional SoC to this list.
           - enum:

-- 
2.56.0

