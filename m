Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088219;
	b=kOYS37O/hi6/XsaouMfeSxn0hT+DkCxyL12P6yq836Qr391GyxhaALZl/1o6DdcSUAlz
	 zNeCbdvmTWvXkAr8VMzjp7GZOsnZcXl4J52oGKk0jcJ9dXz6DVp5TRYQUcWyE/Z9jAjMw
	 85jHYmYxY6+Gh+oo0ZG7/IC4ESN5ZtKTNSCauF2xgVKPXeh8tUYD5RiBUeTAySoK3yKCJ
	 QDYit3trv0Y3ObLL5s6hOEqJbdxPZGNAfeb3MJlCnlvJmQMLQQ/kbMoTn5kz6d9PKlECN
	 PbIgBu6Ze6a1RvEvgzOLZpBiom02jN2y6nXsFff+NBpDI9/R5qa/XThef7Q2Wo9s3dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088219;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=gBw0ADmaMQqk7oeV+6pRJtq9HTNAOXgjPKJUfbEvR9o=;
	b=t256vOn8nOLDrPxWeR1D4oVF4qAjrdo+q+wkdQT5FLhNKsCGfYhadgIetOErBQSVUQFN
	 /q3oulgAJl1TdA0NNYiiXkCeztS9HzXYKMEvgkrvVaOuSaioD5/jC4gmPYlCi7rNBRQNG
	 I53dgoSGcIIf4gINjr6Z3kKsfHF3TeDKRHgrLSSOszAK3HWgaccusPwC7iDfJT99PBWrY
	 zz2Oyo+t9fEpL4trAcAgaOs6m4bzS4QqF7nQUczZPC5UwA8KI/vPQVeZpFlXDQrLMbUrC
	 5PhAEusQMP1NeUGxxRuGZf+8830cwSS1fQLUxmjWFXW9mKKEDXJR+Ote7XRiJFT4NEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b="u/CFp35t";
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE6606A33D
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AE6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=u/CFp35t
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBw0ADmaMQqk7oeV+6pRJtq9HTNAOXgjPKJUfbEvR9o=;
	b=u/CFp35t0PAQ1IdE/6Tx3MWqCeqaaHOTqYyfD1sZeVXu038traGEYOsB7hlT2FdjGXHdTH
	cknQxhTF1lVQQNcQ8rYquAgU/9UVSYI932HJUpju2QZiNiu6XUsKnhoNhV3fHDWrcrRTSa
	1AuqRvdXefBOnJYHapTO+gZFXbt2v0s=
Date: Tue, 27 Oct 2026 09:03:26 +0100
Subject: [PATCH 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
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
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-6-1356181bc50d@cyberchaos.dev>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
"apple,s5l-fpwm".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index 48cafd391ca2..7c9e148727a7 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -20,6 +20,7 @@ properties:
           - apple,t8112-fpwm
           - apple,t8122-fpwm
           - apple,t8132-fpwm
+          - apple,t8142-fpwm
           - apple,t6000-fpwm
           - apple,t6020-fpwm
           - apple,t6030-fpwm

-- 
2.56.0

