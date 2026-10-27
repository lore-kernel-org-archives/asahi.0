Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088217;
	b=tVyOxSeeyNpSWTmUKVMVoxe0ewoR7Cdl/Lutbmm18AuksepJKViSyp6oNuklmAa6QWpi
	 Efg+5oLIF9G8UNtyIymW8vP1ZygsPMwmGPk+KBjJ+hTfHIaEFJnjAUooWrdlMyrSEAhKA
	 dPVymlmA8S0wV5Sjqzqx7kHgrNeNWelQmfBkPQHSCQ1X6Gp9/rDWRS7u7Jk+kGL9bAV85
	 NeCyBo5Q8WzEzGhNnuB0gK9MY7U85vj4TUruJH6g2wFjQFCr9oMLoOrutp5Xp17Xocgfe
	 btNhx4cDS8bPiBwzuY82YFKBMERyJUmyC3OJE42F4Apmnc8wwNmsw3jrrxhe5qH0TVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088217;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=dn+ttLjJ/5MynkGaqKFazCfLlj9psHNlnn9E9KLcwZw=;
	b=cGc07cy0BznF6QfbCFz9DtcpLBClM5bwPjA6/nLF6pc80h3aEA98VJZ/BNqivfW/Z1UE
	 icxasMZCBKF/q12G+ftZqmP/Lcw0McU6gfKz80zlzZoNKMLpXWwA/tOiO+Ig/kEo4Xr/m
	 oGB5rlK5PxP3tJAkdGEScgP1xQz76YSuderevk9aUVyaf/KZauf7K8bVEq1nScDkIovHO
	 /7G9iC85kZxyTNpzyL3QPCrMz0tDaed+j6QSvrtSEEtNfMGi4ULDQn+ncM1qM5D0OiWOp
	 h7oXTV/nZOg0LPOdsNynVXgLysF82sNwLqd9yghPKlDfGf/NjMcGIluqRwHIEEvLohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=RhsTqH4v;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC5606A31E
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 08:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=RhsTqH4v
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dn+ttLjJ/5MynkGaqKFazCfLlj9psHNlnn9E9KLcwZw=;
	b=RhsTqH4vn2aLEFAkDrnxn8OxHKSXJXesZNA9xgKwxrzq5QmvOKqy8hqbpKv5WYf0t0Mit4
	8lcEf4FAp3yI54NGMYkzFLRtxLwFDyziUW1DTfWEXt7vzjOoGTw5UL1lulTGFBwwOv3iGs
	Yp6YQArFZuc3HcAqpZ5c8cfN1c8Jsjk=
Date: Tue, 27 Oct 2026 09:03:21 +0100
Subject: [PATCH 01/10] dt-bindings: watchdog: apple,wdt: Add t8142
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
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-1-1356181bc50d@cyberchaos.dev>
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

The watchdog on the Apple t8142 (M5) SoC is compatible with the M1-M4
SoCs. Add "apple,t8142-wdt" as SoC specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 00b0f2ec2bdb..8dc71a79af88 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -24,6 +24,7 @@ properties:
               - apple,t8122-wdt
               - apple,t8132-wdt
               - apple,t8140-wdt
+              - apple,t8142-wdt
           - const: apple,t8103-wdt
       - items:
           - enum:

-- 
2.56.0

