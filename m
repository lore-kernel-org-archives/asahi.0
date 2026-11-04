Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813071;
	b=XxW/UdpqQRc59vXetJiijevtG95Y13cR3F0qQjQUEKthFcpPC2M++l5vf0CV01VgNU5S
	 KS3aBkiUQD32NCGz/ZXmCAtfRvhAG2S11JARntfllBrIuEVlBpbOb4mNByGmV63Hqk5zf
	 ZCIajGLPumGtZ4hJKH9/n9dvYiq3YrChO232ah0+Z0wOC/dO18ZOqVBJIcVhPPnFgsFGC
	 OTBvAxheQI9sV6xWZg3uGto6QTUzOQxOD/EZgx1sN/jgoTBMGxZUkU9M6uXnB62Kypj2p
	 +OFbM2SiW2+U9if/EGh5IVOqC4DUhcYRkNsL+pZMzMPn0O06TZfmgA8egzBJCXqnrJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813071;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=lXroUYdDolHv5lN9NNHseRZOE3JAoYxuFQHyAq1l5kg=;
	b=OAidDWCBPS0yc2tC/59dn1GYtXRmb8m4T412l5/qZMjRGW+FJpH+WtwmlEbV760dtWLG
	 PjjXxjN50HCFiJtl2WXLh24L7TT4a5HkHFx8zWfXDH6gLF64xDT6LIuuR+qzrfKU5t9Il
	 Hc3ZZPKfMJfS0n1VAIPDQwchkhLOumn104bWq1ZPLwKNWIXF+9PNQVY3nXdOhlhxTa5Jo
	 OHR3EJ3gWU4wriMTB8K9vYn3D5y8OcpiYEXUcteFpqablsfpK1tGuwgBoFg5mH2CDmAKi
	 kfer1BteSDd1hClSeFAcNBvUdYzrY2xxFubkHxoWajwbKGYwx5RcedBoFjHa5+mOexA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=DJwpMKdv;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B4606D821
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 17:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06B4606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=DJwpMKdv
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXroUYdDolHv5lN9NNHseRZOE3JAoYxuFQHyAq1l5kg=;
	b=DJwpMKdva4+LvkjgpVco78Vvg36/plBKCLnLJqrWhEDLgSYMwvncg0riXhVwCKxOFDH1uJ
	sXajS54WD3qTEd5VmJRNfO7/COvzYNlYjMQCtxcwIeHo/GIb/eWfN0nLSmqvJVvf+asm9T
	Y7JDOXQl4T8MjDouNJz8sgsyLO+EbkM=
Date: Wed, 04 Nov 2026 18:24:18 +0100
Subject: [PATCH v2 5/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
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
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-5-fd727a82d380@cyberchaos.dev>
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

