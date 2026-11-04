Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813074;
	b=U6ihJRU7CYQvanbcExReeeLa42HR8nIjdSaQTE3nX6q259lG65Cnf1EwIT0dvCjfF4xQ
	 yvxWX9GgIEAvIcQl6jmKbHCKN3HkErhtygyhrypKjH1Dj9t0rCY+eZFpzoVYvc725oBZr
	 9u8y2+HbUCEQcUwUra9HvJlY3uwYhT5AqQhq2ckJwBAUIzGr5CjI9VseQpBtM0w8Ez7CR
	 lUf+B/YCtYspcZy9rM/xIncNjMqcRz30slITTGPtHB9S7lWpiWZ91+RxuUNQAUHcw78Ra
	 gjGyMsW6DN81sxnV6l+XC8QYBTd6foh8MMt1LR8x0S677nCMUiljkcfikvOsjoEaoKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813074;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=/8PGdx3b4XeHSkdMg3JZrgGdQeSTkjaMcXJhL5UCfH8=;
	b=xKYotzzQFbVTFbLXz9tSuCr2V4VkJlAl3Ga0Vcd1Yo7/lUh7QcM97P7lx6jHZ7B/HHXh
	 9YKFV9zpbnwy+d5bT4KTIZEj/CbjCMsRZ6O2oe+zcv1dU4mFJHGhHN0bYEElkq/tt6lhL
	 dGFQYdNPIUi23Gzq/lLFiX5K3bIZ0ciJY51owhhR3YTFujG/ICdvpN8tJmA+Sai4yco08
	 AjChIqruFyvh9XEuXM1kfaFUqRo7Nsxe5R20PxHl1MoKxz/DK4GZgF/IsytBlOOK52cWl
	 FCGdT0PwkmPEGt906QiiV6V1TttQ0wKrFqq0h7jbZil7axRfXuR7nh9kGGc7YlvX66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=YdIuUHUA;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF02606A337
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 17:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDF02606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=YdIuUHUA
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8PGdx3b4XeHSkdMg3JZrgGdQeSTkjaMcXJhL5UCfH8=;
	b=YdIuUHUAQRhSet14daWdMDKk10cKrnS7vOhhanCwNDJ2umk88MQxP9vKN3g07oe8MKWo4G
	C3ubepOjWh6RN397S0j5XSHfb6vsv5nd7xQifshnepgTF6Qq3UE+pYdngRDJdfeplykoa8
	MrITVGriZjJCfTv79F2NCZWEUCde1LM=
Date: Wed, 04 Nov 2026 18:24:20 +0100
Subject: [PATCH v2 7/9] dt-bindings: i2c: apple,i2c: Add t8142 compatible
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
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-7-fd727a82d380@cyberchaos.dev>
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

