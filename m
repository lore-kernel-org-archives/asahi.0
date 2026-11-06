Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984190;
	b=A2ysqU4xSfCo7IvAX/Wnq0BWDQYlPDiEVDEJ+kxANlBrilSSXGnjZPWPoyTa+y2DN9Tr
	 rSjxHtSmijHHiTJNHnqPouBs+BMrVliThVSZS3OB3AJUoO6xyMdBFtk8+/fiS8a1SH4eA
	 AiEDhzLQoJorZQCu+kyU7bgjVwRmiRcMVd9ZZvAFipSCo4OsdlSshvdRgReFIse3d6t5o
	 jy0SPw5PlR/BGL/9/3lKYifNXSTkf2hIUSY9agw4Vpu8z0onw7YYdJvw/ZDbORsFUucEk
	 I/Vj01cftc3dHZzzFQAQHtbuFFceNq+SqubEoinQAPsRZi8QmJNSkD57LfK8nULZJAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984190;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=6MyheDk9AmIiMUlnMcbJVkjS1qaDN78uIvkLvU/yuaI=;
	b=PR/I7/pSlHE5OuMVBQI64+wEDPj1krPyL7sJtTAFmJ3LUOADRM5Q9x2uJUavTLmD0IRq
	 XI/w4kPVxF5aKqzbkLr7F7QJCLPTZlkub8SX51cciQUyennfQ3PPMULBhjWGh61PFNswH
	 en7wZpjaWDw+wIMgwxlLO6nql5Sub98cMEyywd/WkQIYXyOwlZjdyF3IhpUB1NCCRMUjO
	 Ot4rXoHR+biZSrAxNSD08HTYCSOvgS2kv3zCv8ICajkDOh7hlABVDh25Lg96yWxdGp6fl
	 E5Pa4Ww5crgS7UdQOnIMv4nAAgiy8Sz1JNvum7pZHxpu2l47v52vrsUJsCI9nxBUMLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=r4AAqOq8;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C9606A33D
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 16:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649C9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=r4AAqOq8
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MyheDk9AmIiMUlnMcbJVkjS1qaDN78uIvkLvU/yuaI=;
	b=r4AAqOq8CJd+WTHowBxNRL530plm6NayXIfPIEa5uB3JxaKIo3+XIPHPKYd3WdtC8RLm+J
	lpDE8LhyJi+o6Mcx00buFdcGDFwJa+6CyCV6iaWwdGdHSOGAYqNIIglrf0fx52tluWVjqc
	YFjAfVqkS5Ml/iQKlRFlxOpYPN1zfVA=
Date: Fri, 06 Nov 2026 17:56:13 +0100
Subject: [PATCH v2 1/4] arm64: dts: apple: t8132: Fix indentation-related
 dt-check-style issues
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
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-1-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

This fixes `dt-check-style --mode=strict` issues related to
indentation in the t8132 device trees, specifically replacing the use of
8 or more spaces for alignment with n//8 tabs + n%8 spaces.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132.dtsi | 64 ++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index afec92a06015..58805c6ab002 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -241,12 +241,12 @@ pinctrl_nub: pinctrl@3881f0000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 503 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 505 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pmgr_mini: power-management@388280000 {
@@ -278,12 +278,12 @@ pinctrl_smc: pinctrl@38c820000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 552 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 554 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 555 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 556 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 557 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 558 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 553 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 554 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 555 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 556 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 557 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 558 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_aop: pinctrl@390824000 {
@@ -299,12 +299,12 @@ pinctrl_aop: pinctrl@390824000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 423 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 424 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 425 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 426 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_ap: pinctrl@39a000000 {
@@ -321,36 +321,36 @@ pinctrl_ap: pinctrl@39a000000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 308 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 309 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 309 IRQ_TYPE_LEVEL_HIGH>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(104, 1)>,
-				         <APPLE_PINMUX(103, 1)>;
+					 <APPLE_PINMUX(103, 1)>;
 			};
 
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(106, 1)>,
-				         <APPLE_PINMUX(105, 1)>;
+					 <APPLE_PINMUX(105, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(44, 1)>,
-				         <APPLE_PINMUX(43, 1)>;
+					 <APPLE_PINMUX(43, 1)>;
 			};
 
 			i2c3_pins: i2c3-pins {
 				pinmux = <APPLE_PINMUX(42, 1)>,
-				         <APPLE_PINMUX(41, 1)>;
+					 <APPLE_PINMUX(41, 1)>;
 			};
 
 			i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(108, 1)>,
-				         <APPLE_PINMUX(107, 1)>;
+					 <APPLE_PINMUX(107, 1)>;
 			};
 		};
 
@@ -458,9 +458,9 @@ timer {
 		interrupt-parent = <&aic>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 

-- 
2.56.0

