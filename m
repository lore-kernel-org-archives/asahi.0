Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813066;
	b=hJP6hNAQ9sxvK2sJRXwAlki1WbgZQ92OKIY14eHK5Iu4XnxbcwQWjY+nfnLAX3ptk1lM
	 VnwPQ1BmDiBNUNwzkOPjBsKg2FiGygoJuyoBm8bVLfPEgW8nBy3Rs9WaDgtKShTjfOyg7
	 nwyIooT7+lGvMciN8S8BKGcEnNY860/t4Zqnx+VUB5BG7lxoQyTfY/HtkufWRqZ5Q2O9x
	 /OVBKK9NsubFUSnvNy1k/2jrZre/INslZ2Mf1YHdMz9u7klpeZ8pQtSW2KeL/9kZILJM4
	 eBBWRCZUyXrk9+ia/nfxuPuyAcPjAaf233+M2ZQ/qvtTSQCi7jszHAEmz5h/GtrTXNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813066;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=UMIk77T6D8aeVXKipe7tHa21wj0Z4+vE4becj0xztjY=;
	b=Rqh/pXKh72QXswNJ3iJOMBalOO9RWHbn4p4psmqvw1Tmf1CVRXUCVHlYXVFg/WJjHwwT
	 W3ng/ao3pZZiSrprUKrUSONVXIRQaT0SWQcwVsIHPnGq14cZM0zCM//m/y82Wf9Fuhcxx
	 ofKkf7BYsCyLxfLk4ukANWN2z6eSilin/3vAfaZkdp56R9tlQGyP0FbuMIvUOppu6gFPS
	 uE4jeH/KiXuSi0CkHuIiU4I1faLPLfTVtydvKiovbW+aEMEXJ5dizomkBA+ZfJ5zNYmou
	 XhN9bK0cf6krSokYJAOmIhjLCRWSkRlTtbkPrxrQ6jOwK0Vd5xA2N1pLNEIKF5B3gow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=HRp+ZlwG;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEC606A328
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 17:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFEC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=HRp+ZlwG
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMIk77T6D8aeVXKipe7tHa21wj0Z4+vE4becj0xztjY=;
	b=HRp+ZlwGQgcU/TK3pqNiy7UmA/bo/5u5EYzmzqrCDozGusGfeeOQA9X4Bxi2DdQZURXrYS
	NIYSF+rO39MHQm8OjwFzvWZ+JqpL/HsaU1xTIs1wGc9wgjuaG/RoNTnjqBZ3B3lnWffyfs
	U13uI3tVlhEODic2XtpmVEaRmCF+agE=
Date: Wed, 04 Nov 2026 18:24:14 +0100
Subject: [PATCH v2 1/9] dt-bindings: interrupt-controller: apple,aic2: Add
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
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-1-fd727a82d380@cyberchaos.dev>
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

The Apple t8142 (M5) SoC uses an AIC3 as interrupt controller, same as
the M3-M4 SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

