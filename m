Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088224;
	b=HuFkLgcTmjmYv3pjoN1f2PiE5M8rFTaJxTcQDt5bYxUqiEJfUlFjZrFUBCiZ7cFPu/yp
	 ywve2ooTnlW9/+vJgwlIGZZ8DGYbSRxaIthPwrPMV7JZ7YpRFGhoRFMvgmU8ndv7g02nM
	 e7QaCi5CqOHVGh2Esj7dFGH6eKYnEUc5fbogkHVhM7bXnfizwnjk6td8e2VEw9+P9njod
	 4RhL5Zg6L890mEIppdk9Esn6jGvf/TmaKU0EBU6fwofPaKrrtdTipAxZGZgcMlaeWn6gu
	 Du9qy3ya9m2qyD+ZSRkR6WbGO8SohSCcBMoauH+oG9SvgJsWFHlTNIkr8yAvRgQVnFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088224;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=s+K8NyCu+xAAM0MSCNFGH1id4owFp+f6RDQzhLFB72I=;
	b=bA/2xlqTll+mhBAVuQvhXwu5t1FEZOentruuVuALvk7q5TzIPuabRAOqPfLS3hG2Drs6
	 NNPp2Cc2HyGWkZO7Ujq7r9IYeOo4mmT1jwx/Etg8a3XpI1xfmFYop6ONIfjZFVS9qxmw3
	 XloWmWh7YUiR6OfPs+ArL32IBr/gp9mq0jE9o84SlUXVPg0gvDlbgL4NkGsbOF+QOaJni
	 UqzzJ8yAWupD5VHK/y/4CMeAhWDz4w23sZ63M7dZURugoYfXRjHO1o6FJXYXdVKinlZp3
	 tgpyjkJYLhB0zWn7J28zYqaen1oQJ34KmOKlfx/BWw0xoVbAEwlhhwcweBtIorzeJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=gspxbl9o;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81860A2608
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F81860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=gspxbl9o
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+K8NyCu+xAAM0MSCNFGH1id4owFp+f6RDQzhLFB72I=;
	b=gspxbl9oSXOyEPw+2xqiQJ2MtZli5Ne5dG0dWhEF/DdKfasU+mvusZNaZ/KS4LeiQ1sesl
	Qllr+dGyVX7Rxsu8Z507py97eP5HMWiPTCa5K9ZI3o6VAzDeN1WGx/SbLH0Ly3lmfrtYyM
	N0TNdViKmcLv6vv9ftiXXClJinCmTc0=
Date: Tue, 27 Oct 2026 09:03:28 +0100
Subject: [PATCH 08/10] dt-bindings: i2c: apple,i2c: Add t8142 compatible
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
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-8-1356181bc50d@cyberchaos.dev>
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

The i2c block on the Apple Silicon T8142 (M5) SoC is compatible with
t8103. Add "apple,t8142-i2c" as SoC specific compatible under
"apple,t8103-i2c".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index b817a8f0a9df..e7ed1efb7b64 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -30,6 +30,7 @@ properties:
               - apple,t8122-i2c
               - apple,t8132-i2c
               - apple,t8140-i2c
+              - apple,t8142-i2c
           - const: apple,t8103-i2c
       - items:
           - enum:

-- 
2.56.0

