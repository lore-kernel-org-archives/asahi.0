Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000310;
	b=K9p9wLZeF3pCYp9U8V+MfxYFsx47OHi5+irteZ363r3usVAvypS6JsW5z63Qzamc4T1S
	 qgZtv2zfbD8NvOxd8y2XVsTD0O0KjsN1MoCX8b8PwaQUbO0I7yIArpDhL3yyEoZ6F5yWz
	 dANlMwJBQzwykXTApdKYLjvjgXL3v37poWUtD8wzFlnCLaUAjmtxUD9xpy0CYGyVFMdpq
	 GK5AMed3RsoaRCtGVxOLx2jOiyghRZHpxJY4o75RcwK9RK2dNAgIwmFmDGYuxsyuKrJH+
	 +auVPTrtPCMVlvEkIjtpqVLWQ2QxMnJ1IdateFcV4WOfvWr2dXpKIhtS18lzFFb/m/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000310;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=FmFhmHqchVrqj+0DB2A1OfSUsKoVGkJJrNsEk9xPgCc=;
	b=rNzBMnFCBDfWyYQ5JHzbPOFvljAlSMko9NeHMZPRVAFB0dOed06I6X3kQ01sDhTJyEuG
	 LIVfcN5CjXoXMexH4GLu1v+WAXSqDzebhVKQXY+xwoEoafWBZcEYJfnVUK3DL2iMzqWgk
	 BFhlH6pR6WtXN/tPPM4yzPgCtkzJBB9E4t4w3cTavq6nrHdPOnDpDewsNS3Ou9rtVHVza
	 M6qv0u6TPEzucGhs3xyKN+eKb8gNIVVM7wtfP6OOZKIMYNEGuRGF0ImCmjjYDszkE+TkS
	 JALf7dU5a69q00zQDQcWg1ECUm05UgurUvTi1fzE/MyLNr1GVwsPmVz/Vkpz0vldixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3CQlsABc;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E55606D80B
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 21:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E55606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3CQlsABc
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmFhmHqchVrqj+0DB2A1OfSUsKoVGkJJrNsEk9xPgCc=;
	b=3CQlsABc/M7fJT77nzNv+Yd+dYK9FHTMMZI6rXM3gPpojUfLHV0y1h+yrUtC6Sv1WvFCCZ
	v4USYsgmHD2fochuTUR3O/ZRDUE1Q1qM8zIqFoxLYXYtOAe+7ySVW46/hb7UDDAFdGfKhK
	bnxM2iVMamNsv36Xs8ZqGBFrQmjUn3E=
Date: Fri, 06 Nov 2026 22:24:57 +0100
Subject: [PATCH v3 8/9] dt-bindings: arm: apple: Add M5 based devices
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
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-8-cee55de54b2f@cyberchaos.dev>
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

Only the MacBook Pro (14-inch) and MacBook Air (13/15-inch) were offered
with the M5 (t8142) SoC. Add the corresponding compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index da6f043ad07a..f78c89780355 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -116,6 +116,12 @@ description: |
   - MacBook Air (15-inch, M4, 2025)
   - Mac mini (M4, 2024)
 
+  Devices based on the "M5" SoC:
+
+  - MacBook Pro (14-inch, M5, 2026)
+  - MacBook Air (13-inch, M5, 2026)
+  - MacBook Air (15-inch, M5, 2026)
+
   Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
@@ -364,6 +370,15 @@ properties:
           - const: apple,t8132
           - const: apple,arm-platform
 
+      - description: Apple M5 SoC based platforms
+        items:
+          - enum:
+              - apple,j704  # MacBook Pro (14-inch, M5, 2025)
+              - apple,j813  # MacBook Air (13-inch, M5, 2026)
+              - apple,j815  # MacBook Air (15-inch, M5, 2026)
+          - const: apple,t8142
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:

-- 
2.56.0

