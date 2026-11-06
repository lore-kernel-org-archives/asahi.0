Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000322;
	b=1s7boOFsHA78mPdmESq1VyHRdgcc97yRQFC+HJadaQwjJPhCHdxuTgtdy48P6Up1vKSJ
	 2iuEfz9XK4lR0XYkO9wlvQYojQiY0Dyx2UqHqtCUwl2EHjo36p2Rbfb70EVhxyrv7AyoS
	 0dWqttb0zvPp4ldUX+NYTJ43OlEjJ+byzdtAjeioa+LY+vRc3Z/o+Hkcy4dS0ojUitRvP
	 mNeTI9S6+XSsgQ3OUhThlUB1yQLI7eyyCLUv1oQHy5zebEFCc/TpQUZz9/vYQuZ7XE927
	 FYIKnmk6dHuKQOulnmMqYfoMWiyVAm4dOtaknrLryb5CCxCuWnAmU/FCbqXjv5EXWdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000322;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=lXroUYdDolHv5lN9NNHseRZOE3JAoYxuFQHyAq1l5kg=;
	b=ty/eSs4aeu/Q9DEUP8s29w5URYy2UsI1azGo1/cm1IbuQCw4eramFw7KkDL8Tpm2QWTC
	 BTPOSUJ51/2B1T6cfoMLekz8LQdoehbK6UHZkjM8lRU+AwG0RVm8AKifa7DLTBj83msRq
	 e2XuuidQjD+ikAMRWyCvnOXmqWXRtF/UaY/Z2rpiW8jjqrvQ8zh7f8y73OiCpRbJwGbqZ
	 /xuZ2wXiviDQFi+99lOBNbtp5F9KXLR3Uax20tyrfwWIepUUUc3V0pX6UDwGvGk/hjr+n
	 0F0iv53RDr9/6fnEcoMACaV+fFmHcCnSZjrgPgwQLPmCSmdPvk0Svb38NQDaDXp7OyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=c+9E6btm;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAA606D838
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 21:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BAA606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=c+9E6btm
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXroUYdDolHv5lN9NNHseRZOE3JAoYxuFQHyAq1l5kg=;
	b=c+9E6btmmDKoJD0idSnvlUhkFb5i/yANJ9R2dtmN3tc0DtXihUkfMZTH4AJ8PMOYtc33E2
	L8O/7eY0r24D2MspkcDvF7WwwwiXySfB1LCkIJhzaqujbj3yi8NZiznypS1SWqa70BanLE
	q6M/i4OCSgho+HxKl3NwkAnPHHVPTM8=
Date: Fri, 06 Nov 2026 22:24:54 +0100
Subject: [PATCH v3 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
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
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-5-cee55de54b2f@cyberchaos.dev>
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

The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
"apple,s5l-fpwm".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

