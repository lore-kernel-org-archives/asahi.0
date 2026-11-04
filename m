Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813072;
	b=q4sixXaw7wIOK79EsOzroi4HAK8hM8XsFEBRV+K1xbYGkQVqN97aF9WUibh8XerIfq8u
	 qyHZkwT83Qk0QFCcjpwxfBvpLkDJ9yrqSJSJfp/qP+XGWdNcikinvHsebafFzXlJvip5v
	 +raF5I21g5dj/yoqHWGsvFBPhUk0SunoQR6573ekr+DqVWo0t4qvFsQgLFEHkf96/BchA
	 z0DcnCJbdy81xwAhkfgp+u5ts48Q4eMfJCfD8Srxsii2BXrhsVaQfsa4NxlavlAEjAB39
	 4J39VpQMnAwhgEs/Uy3Iw5ktbmoqhWkoycT8lkG20OM8urQFDz88q3+dCQugpUjxu9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813072;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=7KIi5ajgm8xWQZ/dZf4T7JLHUXnisyBiLTaDomI84wc=;
	b=qoVlwmKOUACxR/VXb1ksFuOsiTPtJPrmuXR7J2cNejzS9cBFeOSxinVUormUIZprbdES
	 zGBhPad8rRlA9CXWQZM1UVfgSlylTfyItzbA8yCG37DHM1qDpOdbQl5dghyIT2Xn//lUs
	 zAzXJp3oZZ7dF5Aa+N3UerhjZrg+lhyGXIjGdSWUkbOq0HBkcqyJTQ+ImMEFiNsD+dM3b
	 e1Mup+l9be1OHziSIhJhqNrl379YpYfuxpZ9Hg2vrO6FzDgRG7bDhUCfKlPeX4Gk3/yyU
	 8Yq5fwXxDI6gD+rrutWa0MAWECbAt/zyXaSZAxhVqXQD9HHFe8P9Fh2fFGKR5/uilKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=kth79mT9;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F057606A33C
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 17:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F057606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=kth79mT9
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KIi5ajgm8xWQZ/dZf4T7JLHUXnisyBiLTaDomI84wc=;
	b=kth79mT9ePMBDeNF8OXM5FwgUjM4ED+LpEEa7Pf/2eX4Qb7ughpCmRqlZ7+Mw5L2MXG6ms
	8ImE++fQxGOmsJDMtP9vNwyjglToN10OZLkgAT5s57wkEV/Nc4CAWEyDY6ZLqH2Skb0Bgj
	22GtYWbGyv9k+xS1eDkYODw6wtAZUBU=
Date: Wed, 04 Nov 2026 18:24:19 +0100
Subject: [PATCH v2 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142
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
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-6-fd727a82d380@cyberchaos.dev>
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
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org

The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
"apple,t8140-pinctrl".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 0984e4e58af3..13ece17eca9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -27,6 +27,9 @@ properties:
               - apple,t8122-pinctrl
               - apple,t8132-pinctrl
           - const: apple,t8103-pinctrl
+      - items:
+          - const: apple,t8142-pinctrl
+          - const: apple,t8140-pinctrl
       - items:
           # Do not add additional SoC to this list.
           - enum:

-- 
2.56.0

