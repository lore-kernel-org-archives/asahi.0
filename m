Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000303;
	b=DyEPU3WvzT1e7bRTIqbS61gIxNIkuHtIGa8R5M8BkNr9xxcl+RV22AZg0lQtqWeDoglp
	 EiUKRvBQskAfpLEtYfxDQbRhU4RABE6EfA0A7mRJ1bAB0/i6f5TV41vwhVy1csnE7d9K3
	 4nsg1bnneYvH0Iwtw5qFUym4Yh3F+vXOpWv77vcoknXR/kK52AEj2xCmkHVkhvwttX5gx
	 D+zbQWHjPIGDc7ZHjA1YlH+DZT6PYk9mdY26jbc5eT24SnSmEoNSW10+RH54gpjwJftnp
	 wWd8lkJV06gGb+Z7edOvGqmcWmtPL/1lqdctk8+6ubGjR2kTxH/FNY5UC0cHy/NJFsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000303;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=26RtvXWyvPMKIsPpPxfp50GdoxTzvUevSoYk/CUFfTE=;
	b=g+AqwcPBmwVeCY5tbmR1eQVVz7864YF+EO67f0OJhm9DvXSq/RsLXkhwXbnVG/snlMaL
	 59VBjz+cZynMD6xv6GqBATZeO+lxAN7co4DWBSrGSjDizx5uH8gbMOt/WrMuMcKfmd6RW
	 Bq7vo0hnQ2fdAwHgMLc7EmhrBvSWEJyjA30Lv8ot1Y4Hkn17SVEfh/F8RxgCdvnmBsN44
	 ouWrYNzDWvxN0ZwvIx4q0Cb+nbPpB9Fsz1hp4035/Y3H5lKVtqK2/9MkGLcsteTS8qknG
	 W8D53Xmtn8TIUo7ICZvnx/zDAZMkWRhgJB4HcGlyHQvDJe4dVGjDHXmXELsM+mdHECw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b="mYwZ/Oza";
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408F606A333
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 21:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D408F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=mYwZ/Oza
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26RtvXWyvPMKIsPpPxfp50GdoxTzvUevSoYk/CUFfTE=;
	b=mYwZ/OzayW+UVVF4NjyN2q3DDSAAX51TPZIgU+AT9L3J6O3hJ1z/rEgr9vtVbJk+h5zR9p
	dKBlDzVdz5KT89br4ld9o5yBzS7iByHH6egVxG/lS2Ipdi/JzNeC1jQ875kFvJyUNgDzVj
	BD8SXVlR9wPB5CNTavnNVQepgdbofv8=
Date: Fri, 06 Nov 2026 22:24:51 +0100
Subject: [PATCH v3 2/9] dt-bindings: arm: cpus: Add Apple M5 CPU core
 compatibles
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
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-2-cee55de54b2f@cyberchaos.dev>
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

Add "apple,hidra-e" and "apple,hidra-p" compatibles for the M5
efficiency and performance CPU cores respectively.
The compatible strings are chosen based on SoC codename ("Hidra") plus
core type (E-Core / P-Core).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index b2fc99f74a15..c3cc0c48ca54 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -92,6 +92,8 @@ properties:
           - apple,donan-p
           - apple,everest
           - apple,firestorm
+          - apple,hidra-e
+          - apple,hidra-p
           - apple,hurricane-zephyr
           - apple,icestorm
           - apple,mistral

-- 
2.56.0

