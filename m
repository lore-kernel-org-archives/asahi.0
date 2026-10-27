Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088218;
	b=OcxOW58divi+8ER43tOg9t5u6WK/Jh9w1JnlWK0bincH0YZu7SnSULtszHvdprjdVAnu
	 CrgHINkSgQSWvaO8upQfPug4rpEBuJapaJFEaHVz+bWnoxKQZH+l0DIHbHjZqrnKProCu
	 bI9Y2zVgStDF/SLA3npnosqjiu/+KyluJ/xMNIaXKaPoTwmkGqgsk8IvusLmSI8derTeB
	 9Voo6/3bXLIyHUwtwftrDrqsedhEav5EBED7NyAGozG+durdFYXxkDRnHQSsEmuAq+rCc
	 IzaAtd7+s4gOcTB5EPrdZI9OTAWUh0PX/IGFx5Gijbnt2OoANZxi2cd1lVTjR6BcPqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088218;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=M+T0hC9qrCnKMLXzTWrirmR4GKkGAo6lPil072JQfaQ=;
	b=tiRA+C6xjY8v0zli1v8p4cFvL/G8P2J5avM++3PNUSfBBys8RwJv4J/RMPjLhiz5TPT3
	 vY4pvDWqbjbyYZ0ZtggX+GQfCB4UdAMsKvxDayIsL5pJwQXCveVQQ9W9gG+/xFmCKwfxl
	 G9i7VeEo51Mb9kAc8lGk3u+m9QWn/0PF12kl4xIP1SHfUUn29UMOL+ANlmiCCDG/rgxFB
	 LtRJxOy0Q55j6tJKiFvgUwjWYxr8mMt/Ucs4U+PdAnyq3ymvqjXU6SckRuU4g+ipn8q5J
	 Pp1tT1mM6DrDW6/2aIRuYFz/UdCZL00gXhutCh6V3eydn6Y3XzdyRQK2t94gThfomBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=hUihcgUI;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38258606A333
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 08:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38258606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=hUihcgUI
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M+T0hC9qrCnKMLXzTWrirmR4GKkGAo6lPil072JQfaQ=;
	b=hUihcgUIKp90fzJfjXVAvgy/V68YRR/SF+h2npLlz0wwWPEhxScAYNZHaNmCEQ3flbPrfl
	4GZGUZc3Fq//7lD/9M/p+C7/7y/vbHbEK4UGg43aqXpbEQt+sFaolNakwX8VlvnfnndNno
	zf0pY+cd+sQd74ExgFg+kmYKH6c5Qvk=
Date: Tue, 27 Oct 2026 09:03:22 +0100
Subject: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 t8142 compatible
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
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-2-1356181bc50d@cyberchaos.dev>
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

The Apple t8142 (M5) SoC uses an AIC3 as interrupt controller, same as
the M3-M4 SoCs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 3c2b24be530e..b6ad9d9192a2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -49,6 +49,7 @@ properties:
               - apple,t6041-aic3
               - apple,t8132-aic3
               - apple,t8140-aic3
+              - apple,t8142-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 

-- 
2.56.0

