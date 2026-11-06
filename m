Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000309;
	b=p7tYvSsrmcQT1NSMeQWvLXc/L/vsm0xS5+cwpGAr6JwX2etn15k5SI7ydI15Vio4JaQ1
	 LsGU0HLVW+/YPKWwP00fB+eT4T3G3ajnIiHfDzgPIvKhUbMAUqgnl/rov58AyR/fjFPwi
	 hO9flbEgmeLiAGb8r/vihvmtpC/uFs3zzfJnT4WDZxrxc3bfIKr6ORLdM6dRaoa85NSGf
	 ZcRDZXS5etZBx9wVPQjsw4Zku7N1PUbd96coXgIh1hY9RsgextR6JTpO4H3nTZmEo+WHo
	 ckThjRH2W6PisRrxeVRS9zrZcpO86Be3TndRRNBB6ehtAHIodVab02weBywUE90+BPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000309;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=/8PGdx3b4XeHSkdMg3JZrgGdQeSTkjaMcXJhL5UCfH8=;
	b=5Cp9DI7zIDfsiNt8ekh6yKrXweFGHB7z0XiYiJpPBPszO6TibOZ0hbozwJ0B3uFsdlzk
	 J0fz1MmLjk1JHfgILGGE1IBYUl8zCF5vSJJ/UP197eohTLMecUUZNXILjgEWXZClLAdSb
	 /VdG2UAieJaXxvf8LoYtHs4FtgBSWlBXU61O/LBk46Z7vKZnbx0XmVeWKTkpA3u9LEk7p
	 ubrcodTtIktgWM0oolC1PEeyg0zfUBZ1CuBzKL4BALB/ZnSGcXr7zF6t5f05qrAm54cMp
	 3wOqYjJREqMPV11d4mqmG7Gg5BYnesUGGYBDqIGi9mS42G/BWIz06CMTWNvrbWmdWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=HdhkKLn8;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B572C606D836
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 21:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B572C606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=HdhkKLn8
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8PGdx3b4XeHSkdMg3JZrgGdQeSTkjaMcXJhL5UCfH8=;
	b=HdhkKLn81x9s1QHnG2IDcWuAs8jdfPSIl+gwJvS9k49diIMMFtIQHrrPejwU4l0rQDRwwG
	Y2DbgbU6fFxi5NvO4lZjEAc56JBCtIEaV0yvXOb/+jke66BQ34jJa8Lm9s72GEa1unJY4k
	NrzZAlNmzZZu9lj/p34HkZZM3Km+ciE=
Date: Fri, 06 Nov 2026 22:24:56 +0100
Subject: [PATCH v3 7/9] dt-bindings: i2c: apple,i2c: Add t8142 compatible
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
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>
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

The i2c block on the Apple Silicon T8142 (M5) SoC is compatible with
t8103. Add "apple,t8142-i2c" as SoC specific compatible under
"apple,t8103-i2c".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

