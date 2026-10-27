Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088220;
	b=nmb2CDgJ4kFPWhMpoybS975qVBn7F8/XwpYE0fNugnpiw6cSQ+bkx5OKb0rOleF9UCxZ
	 0N8ri83uinVoNa4XIXUXE/+axBIeSV2+gQGUH/Ww0X/uFvrzUdrd2BO/22nsuUh4KuVrx
	 jTr9oyULuYHusH86t85lJXO88/SUY6mqV2vjwj2h3xahNaOFw0Ev6yyYMQIj+kwNfVZ5Y
	 YAGJTv+Bj/drTGKXjviOAdxaaBKjq/Pz9QHpKkJ+xMTLfTwemrrIyH+oBCT6C3CZOYTO2
	 17a/pqWHnVQBc/qvnrLZkLVHtAWblhc6YyXEXGU38b5nNtrUMaL39U6xPsmRT9Q15Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088220;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=c7x3BJ6jlesjIm6zIfL80Mk7VDOu/GvYzZE/1SSRn+g=;
	b=OJcudUtImr2xKYhwl5B4C3xD1C266JoYpFHdc+AVkyR6RfXUFQBf+XUeX+QKE+txtr+p
	 bGWM4wsjxDxlMfwxLJ3rnSJpR3sF6/HxhpZ2jZFbAi+1YpMoaF44Gc2v2I9eFw7hBlxxM
	 4duHRH7W5g/TZnEAXDxqnhBhOPO1Tnh712tBnIF8LDe58Ji1CfAotOvv+DLtOggB12j09
	 ZQu8Mb9YQZcZq8f9N2jxaxYu4VHwF2aXtii63qU7Yq+Hunqp9fNjRu+BcltSvAY4z8EGK
	 BRWqGV2mQoDq1CEGmgYJ0QYQP9xQ8b5bPnIcYPZyObFRvSv0Uj9xkVLYBihGT/0lQDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=upMebKaJ;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3460A2607
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA3460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=upMebKaJ
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7x3BJ6jlesjIm6zIfL80Mk7VDOu/GvYzZE/1SSRn+g=;
	b=upMebKaJKW+tF/NpJ6u3Ifuw3BYG8mi9BNULoWUytrDcSHUQ2+FzroDxY/NbGWw5uQEv0p
	Of56kx3Q75KsEQwn41qnH/70HBZaUzEflsQ8bL2aHoWxp7QtOEkWTQJ84xPMx/ip8W3ztv
	4f9MHnXBHDvCulJuN0s8Yhs4HgDFIXg=
Date: Tue, 27 Oct 2026 09:03:27 +0100
Subject: [PATCH 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t8142
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
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-7-1356181bc50d@cyberchaos.dev>
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

The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
"apple,t8140-pinctrl".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 0984e4e58af3..a4a15b117035 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -17,6 +17,9 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: apple,t8142-pinctrl
+          - const: apple,t8140-pinctrl
       - const: apple,t8140-pinctrl
       - items:
           - enum:

-- 
2.56.0

