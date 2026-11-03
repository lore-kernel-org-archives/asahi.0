Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691794;
	b=SAjPvPpaFbqQZpF3XakYFMR46GprTOJC4PJZTPu/hH8SvUxCybvjGkZgwnGSxzmiX44k
	 rE1fkoMxcMqRW+fcc3QWxI4IWTAXZcNGRnKUZp41hg/Y4WyqzML68VhPr3td+9cLwImwf
	 8TwvPufKHJr+Pw6tA4AeUFBM/3zdlFvlO3iBCHWuP+yefGkdSxJo1GekiRlO30Zm9eWbi
	 kNMRvu5W8pDv63FEZqkyTytDGoyhLCkVZ+BWpvbXFprTnsKjEb6QstLf9ECym0dYwW0CL
	 AtS4061tc4lsI4hdIjFwtVecUzke5tt4l3WdoBRJ37yQ9GNPotmhLuBN5esJV/Hb8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
	b=zV3TudEe4SCZ83GP1HuAtn6zlhtJ4zY81zvDXCY3Vpcpr4t5fqtcLfXk6g/F6XCxtVHo
	 BBY6ndUoqUTcatBRTtJKB/1sp1W8fnQevwng84jeY6+tDEVazpKglbSBlmPAF/Gjpcjlb
	 zMzNYRwqv1wImIg376eenyaL5VNnEZXXUcip/jylQHrRcCieFYebhPM9UzJNGIUt5WUzL
	 tM8r8Wsithn7rFMIL6+BO3TdkEkPjkaBd6ArRNi0awcUCLKgdfP9pr5qGZUQv5w/FxzKz
	 K6JU4cEfbRSlT0CFlTgi2DFHT5xmBM3YBMlF0nBcDD8anf9WnpBa0N0vhPcBc92AqnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=artktc68;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDFA606A324
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDFA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=artktc68
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1623759a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691793; x=1794296593; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=artktc686x5Xut+20OYi7pFqyYGHcmROgTgRkoVU6M/YZMaEgLrQ1VbmFcSL4RniN3
         IHgXWzA3dxcWte3C1isF6Cf3x9w3btYuKIgYWLMyhfcoNBVaAxhGzm8ln1N1+gqroLvS
         pM1VPgVqmYp983K+LKyTEnEiVEbe6J8cHbuWuwTflT9eArk3VJUzKNIfzlXgV8hHDOni
         U+BCEJAKIzXsF3vejmAvs2/ck0crehNd1vRy0RFwxtn56gjaF1cPt9rHJmZA0aeL3xrF
         gq+iI0+W70Rjzu4XRI1YLLs/6KSCQk1El1pDToSYDIlJFf16SSjYrBoA8L9br18p+OcG
         Zorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691793; x=1794296593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=Vsyb4Sl0HHIs9vEYJXJp8/Nj0UeTiRO8U20Wo8t2C3s0mID56MZ+zB9H95Pa7GAIQ0
         1GGF2YBiBuUO6mfATstKD2JMQfqHpFEDnA7fHYVE996MVUn5hGE6Z7v93pjBSkngYX8M
         zD9xAEv3S717ym4r+QRHWluG1vZ+jbb689+LA9tl+FxmHUzezANOw/3T9a05oft9fEVx
         jUnsq55+5YJQd7pisPotBWnPp94NAlTcxtGnnAIhu8DQU812yyFwY1EL3vKKBRKVuOKk
         JFCMwkP9ZmaQOxLzgQx7s5kw/r3kG5fltH0d9mT0XoPbbBp0vRTfE9i9yI/lVoqK/jHQ
         ytRw==
X-Gm-Message-State: APuU4Z+EQ0Hk7JpO8Uw87T0mJAXub2/QsS8WvPqWUx79+BIa64zP0tCc
	qSIqHxO6tA5KWaaeJdEImqnD6288QfSr/vXK8hPQoyRepAzVccQJgkHj
X-Gm-Gg: AYBFou3+BZ/bbg8pO+zReJWCPwUxnoXjjZMJTyVIxtxhkXLYPBWgc/Xo03wZ4hTriBP
	0VnV5/vX80GPAMfzy1SgAOnL90Ph0UjIumR1QTP97j+V5JRZZ24skc6GphEE/VdPjDP5Zp2I+cY
	xyTrnVhYz0O2cIhc/j7xmfEcjnO6LT2CqMTVTvoAg8eOLzvONei706NYVjRm0bQw9jLhE3rAGEk
	TYSODrCMpxKyBLn51RwMGO3bpFdx8D2w55TejUgtAZ3V5w0N0OU45TqOJ43tJeIWJCRpFKTvoZD
	Hri134ifKTKJ7WKeDu4lmqZuzgcZY3LZvzYUwQbmVG6HOM+Vh+PFsf88y7CoK/+ZdTnUfE2klJn
	/lsapT91/TpckYWlR5OmZItc702LuonoW/FNl1CT5o4sUeaNyg0pE4IQoimR/0JN335P1tFib5T
	ri1lQdQGUM/pWT6Llga4fCO37gRQOkBn6zCd3h9IfUK721PdXqK61d6xxrCgdxFHCL9gBbxBMHA
	H+to4N2u+DiiSmRtMQtiGPAEar2qnS26GILvdngBicHnJb9zQl/Shbbu+Q0qK6Z3O9KG8ZWy04Q
	OnAFpQcYMkx+B1Ehm0g0jDxG3x0QjQbIPJHx/4Y8AeAmqy0LZ8c4r7Ie7GA+MletTU4ngGrgXhs
	2zGFUwJuVEGW2GDqgEtIIjC+bz4OD4061PD54f6bVMl7FaZ/ifI0k9/qV64vMrmXB1TCIUVHhmw
	H9Efosbt+MYz8jp4yUcgy5xDdr
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr10686171a91.29.1793691793151;
        Mon, 02 Nov 2026 23:43:13 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:09 +1000
Subject: [PATCH v4 21/22] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
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
Message-Id: <20261103-macaudio-v4-21-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y5xIM4BZ0PHyivynw40OAddi1sDRIGnERSTTSJ+mmxQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y9wRso3TUh9auS6Msk2fH98Z+jd93PUc9fpqf65K
 rjLdKdTx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqNRBgZ/l1zC6o+0FBrukKdT0arUvvX43dRzcYnMjyW5bUY1ApOZ/jFXCG+ve/
 1Wrd0w8Dr8vOtLfWkeWfWpr8tnvh/bZh6Ix8jAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j414s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 35 ++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0

