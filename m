Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925D140F744
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094037; cv=none; b=eGvAd58RYgWK1I/l2KB9aU6DghlHcQOx5CwTc05MUhsvsYMSX2K+5y6jOzZBSwj7aWu/FP6jXbdELa/uvNp5VhX26xb7HkaooD3fxV/8h7B4+7zaTBRtXT+ArHjJBc6bjq0aQZ4446I0V3B8alVoruCTvqexPOUuAoKZa1NrrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094037; c=relaxed/simple;
	bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsGEv8IU5FCCpmsN5O+xO2gO2rc6H8UQu4ly4/hr8X3XMXxjsJU4aodHFoLpiENOM1Nq9g/bkOqY+V69U+MGI8dIPwy7earnDN0EbEdoUv4nVbGdRVrF+KZi0f/o97X9lG15xf8iXE1bqkRNgSHQpTpcxKlYOvTHq0o0EK87LqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgK9mc82; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgK9mc82"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso529871a91.3
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094036; x=1791698836; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=KgK9mc82IFR2hIEFKdJYg97veu3kE3dtn++16tnWJyTw2ldg3Sx/Uy+a1ibpiLdT6Y
         0IzUHkR5O2rZn/kKVCRzgqSuf3yf5enpuB5QsGZpekxdArTtkg0V3AW4su9mHIPDuYOc
         O85ggOpVc5Sw4gCAhhT6mR6bLolOwjFhYpPwhnifdffxDHK8IvVwVTeOxAPpwmUUzsxK
         +nhjshPCHFitLmsvgYJK7wuz4l9b+Y/LzVAZ0hO7sGPZsiGGZ+CztxPhEh+gnoFIz9lN
         VUr+KWPzOgEw+4MYS0s9j7XIio1dKXnnpQ9GY450094BPNCZKcR5Yjx0n2zIGp3prJ7X
         j0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094036; x=1791698836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=Des+Wqrsm07/kR5n3icsAY9vRNxQ9qIISn86LfOgrfE8j8k0Uq5A7Xu/dzAMpwqeeh
         z8Md12Mh65O459Kc1d3jaycD9/hr1DSMY+oF3DQeAruRyEbY37Z69Yy7EalRhdHuNiIo
         vJjaPhJSXLOrlsUJb5Fv9DI/C4O7+S3c9AkukGGKTDqySd3kB0RqmAFZ8azyIf5wWqOY
         7Bf/VqYNrIzGkKmLUdi3d2ugau9zhRfSKYzZhtayAo3KbbW8ffjBGEdE58d2LbReIyKX
         KQxMcxdTDN4scRJ86eahpF6PoKBb/CONcSKhmQNkKDBeXkjpCkBL4FH0j4l0PSWukbRt
         bQWQ==
X-Gm-Message-State: AFq9FYK2xAsLs3RfBbAwdbZ9CGKAxn/QgPSgbEhEOARDg3OgPEqpyhSL
	ExPKXpJ+sF5cFKieGcIEm6/oOX96HUpirR1UJ+Sqq5azfD8IruBr54uJ
X-Gm-Gg: AYBFou1zzaG+DHFnIThlnA9410Y4OMNY30vKOrowdo2fc6MfUU6vRYCJN4G8P+SOXv9
	4yxcG3o7XdgN/nKo+dNXZzrulSQXGeWl/RSwI59dpDhW43AtYfXTmBMA2gzECDk5BQMGVtvr3A3
	Ces3BuAXU7vgGc2iUbnmKINj6YslUZPOTX8m4klU/SYfuYQ8TxJtxDQvNjqXaOOiPfhNdQJ/z2V
	y+pMTmhZixJv0xHg7TwovDsKj1HLKZ95/+GJX/TrYAcwJMjs603/nlxJnxsvNaUx3zzwOXTIsAb
	ym5H82lEuG66mnedUHZaX/rg4jCpK6OxXq+fijVr6uj+UtOcAuwma8VVuq6vzitbw6oR0NW8cOg
	A8wnHBWA62sra5w07tZxXEfFPA/xjMJOpGUsmLFM3ct6RSPj6g8XBb+rF4E/QpVmWiTJvLodM9z
	rJ7GVgQk8NIH9SPNXL2CaPJ8v7KfeE4z5enjhsvh7dszaUA++rPfu+xXEuLprPB+1SMfg0ssZw/
	2T9z8K1ur19NugJHxBgwmaEL7mk3ZjMptw/8t5WIHG0zbeIfyC+LjbXtJDQLDLpGDnRmUC2zMBP
	Grm27Eg8Cm65mjYBPxsVJdiUV0oMkgP0oZKVDf5vAXJi49k=
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2837779a91.39.1791094036003;
        Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:48 +1000
Subject: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rf2a8aUrExzb1QOepzh8zJfDu2xPAy/q8rvjbJZ
 8xfeqK1YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW/tzAyTH/13rXH33uWx1NR3gB53XwtpaUvo/kPyArq3Wd/sm35NEaGnR6/n6y
 /xiJSZzNZ7uVUVp0VBRsfaWW1plgdP7/06ZMTLAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..7b4c4ef471be 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0

