Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813070;
	b=eZprJlOhT8FV/fC9q7lR96OVZ0FRJ7y7su6c4Pr7M4SCQuD4O0cOZJLaz53t5xDqPDyP
	 OuEa73FMt1olmCLQ1Uo1sj+IhK26Ndj/ISyhAYE/sx30UvcUMNj+Jh9ZUW0HbAjjzoZzt
	 V4lvamiXMOawpKfGYO8YHYqYOZ6S6dvrne4EJYoGt9soVyi5eepeYyzj2nEOfOAMX9Kz+
	 tKEYTK8cXLTrqIWmf6huoott5JgoE1aohoSW2rfhweTMKAS2UB3Cyxkyubc3hBld+INe0
	 oG8DL/uJ611N4Hn4brD/SRSKfLgYlIjT7OCnAW/sF0msGJF76nhvAono7eVYyfinBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813070;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=vNw98TulTGI8RlWvt5yNDg9lFfwWrwXKijxuB0xHpIc=;
	b=KA3Le9K5nJEntOLzaGPsshe05aH5G9asFQc2sBHTxBR6l1Qz13RZT7pR0UjBRoda/1wM
	 bu3uHj/OMG7oFJGVziGkupxlKvayFMSftryMd0IqaBIxremu7YvUaBt0n8GvcGW3HXPiM
	 p7Yk3AW0QL5RxkTu9GYWol4dOjdNTzrugEkpEvtggwFlGgJoPoF8RLzRGGDgDGwna7DFl
	 TNsyV7e6JE0ajQTiGYaZwPjAVSxtvW5P5SkzlyHHt3OQB1mbFFhiOTpykuwDB8vcUm0wZ
	 /H1CplSQtwSqTjgH5NU0afshiML7YEs2dqSOH2LKA4/b2VK1vfXFC09UvTN1J8AS7NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=qtvwA5GU;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A98A606D812
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 17:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A98A606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=qtvwA5GU
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNw98TulTGI8RlWvt5yNDg9lFfwWrwXKijxuB0xHpIc=;
	b=qtvwA5GU7eikNUdoQCOehV+PyKxLfklf6heK7K7d/Qmjdhkz0qKG367Kw977LwPgqiUj6N
	88T0febrM8IN8q2U/PiPZlzvMrOcVOqoIm1npjVVUcizv4kaFYbPZho9WgymAMPGboZfxE
	SVBjZ/7uYHGLCF/STZ3Jn8PWQrsao9E=
Date: Wed, 04 Nov 2026 18:24:17 +0100
Subject: [PATCH v2 4/9] dt-bindings: arm: apple: apple,pmgr: Add t8142
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
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-4-fd727a82d380@cyberchaos.dev>
References: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
In-Reply-To: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
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

The PMGR blocks on the Apple Silicon M5 SoC (t8142) are compatible
with the M1-M4 SoCs. Add "apple,t8142-pmgr" as M5 specific
compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 3967fcfc1663..015a5b6834d0 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -44,6 +44,7 @@ properties:
               - apple,t8122-pmgr
               - apple,t8132-pmgr
               - apple,t8140-pmgr
+              - apple,t8142-pmgr
           - const: apple,t8103-pmgr
           - const: syscon
           - const: simple-mfd

-- 
2.56.0

