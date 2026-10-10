Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535223D0934
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791651591; cv=none; b=fZKvGynB3DPGfQnY3ExUpBRCpNKPz/WjDALBBEIl1Waj7ZPVwjVI4ofh7+PDeixJGRapClPiTLhXY5h9gPkImefpnvXXp+Q5E/WUOfHpaRpWbTpQ5rfOvejuon0wBHlU+z3lJdZjYLkPnoUc3auIVB+XV0L06kqWvvDz243rTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791651591; c=relaxed/simple;
	bh=HQELEj1j61Ui8/DKZPfMECbLDDSpSQT7IxH7n0Wh5uQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1HcdeiRaBOn5jkcOITYjdX61HWRFuPBT19oNJqO3uFfsI7fEsYXHSkjohe6rECA/8CVj+9CI/EbpBtWOE6k4GVu3UNWMi0YAwmvbswwdSG39GCuU89xgdtFJtEOglTMoNApK9w5yD/gDBDhtGPmqHxF1LPLTKU8ocOtpp3dk9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=UctQoQph; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="UctQoQph"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791651588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq+OmcbV9LqeydbDNlmuijp/LrKz0fFwq+3YHnO8+cg=;
	b=UctQoQphByPxrSGE6hcM81iqKodKNTor4oh0wUHm0MLKnhRnkrzY0OBYDq+EE7TKkI5hVH
	iAOBw1irFMXmowfvb2UewFHdScYvYONCeZYNARMFP7Xq9atZA3LKmJtRdkoXIO/4nGgiB0
	dn2PH79uNtBYD6CiH2hcJdC4PLWVYiY=
Date: Sat, 10 Oct 2026 18:59:22 +0200
Subject: [PATCH 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-m4-pro-max-initial-devicetrees-v1-1-781fb3f2d9f6@cyberchaos.dev>
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
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

The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index ca4cf01db59f..bf785bc3cd4f 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -20,6 +20,7 @@ properties:
               - apple,t6020-wdt
               - apple,t6030-wdt
               - apple,t6031-wdt
+              - apple,t6041-wdt
               - apple,t8122-wdt
               - apple,t8132-wdt
           - const: apple,t8103-wdt

-- 
2.55.0

