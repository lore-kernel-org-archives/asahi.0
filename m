Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691750;
	b=ThoPD9jUF5eOGJM0z6H5KdwiuwALc1BWz7L0aHJwkWIVJhge4Ed1a+Ex+VvpJptw5b5A
	 odw9d0XP2Ve/vmwhXq/NUrT5l5p+uSssT3P3oby9oHUAhjxtyUV57ZR+jk3qsO69oVp2B
	 XVHxII1E4lKF5epcByZmDP7SS+raeXT5A2mqLvIoAMUt8ZcCsW0W8cE31ZB+o6O2KQcv3
	 zQFFnVdwL8p4TlMy3kp5HmbJBpt4Jw8t48TsxZ3DasE0XnuCSlSPHAa5+5YA7/ba54/o8
	 0sTGSlCR/eie19J8PN85h3B9oTxKfvu8o4YdPc44g/G1Dv7Voo0UYsX3vcnZX2QtCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
	b=dSnkHseS+cpMhFsOWl97O/FuxRx8VjG1qdYpcsYHxm4LOmCX6K/ufj/9UxgjjMT1q+bC
	 0Ib+2/FWK0e52z9MJvt/WKzNdshXqFHNgNUabdqmOkjupQ7EUOQYZ0nNCfTgmAEwxQ1mm
	 3dNupTVI/pF8/iUKJWLwb9MXGKZAmwky4ebsifWTYs6RmEJhtDh7QpvaOZ5nqvqx1qRfU
	 j6oMmPVMwedQg6rl6h8ChLdzeA7c9VBO5h2LG1oHjGNcXDViT7sSrVMZaPfCnUN0zajww
	 KFWOrUJM1PRX9bczXIsyK+hifwPiPUGvqSLIcP8vEzyk83mwFSobqx5q3vEkpnJgPog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfjN7idO;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53645606A331
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53645606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfjN7idO
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4193960a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691750; x=1794296550; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
        b=XfjN7idOBVekLTY8RaLlfxNoHzb6ZON5U2I6WCxQEgs2QUyPD6Xw2Jrf06fykId5Fq
         KZRwx0jYj2FY0AsZ7pYsO4oHrQ6RnToROMteY8IB+dkpdmnVvMvXBu9iJ1gasz+f4OA9
         W1GE9GBvHG08IypZ9CNShvsRQUnEUbedGsKXIlz43mBr26YGwF83bt3ndyHM+2qPOweG
         tqnfxsTiMRCOu/hGR3sfFzjNgyzoQIc7xNVpnW88rmY/w/MZNVtzr3ZtWon3RWLFAycR
         LJCgUD7syf0Qz91cpIKdkAfNDvdDtAc0qAj8Miww5l3vjNTuZtccgaAWkldWbeM9s8tO
         oPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691750; x=1794296550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
        b=RbPVuyJXpliIi+uOcUrRIIw1iyaK6nROZPB1vlDB4lKQ/RLzQAXCvgoEPhGWrQ8GWE
         xEUKDMh+N14CK6L4749tmy3YvQrgAn8jUdiH8vFBJ0gh/KFhAm54kmRT/OVsHJ9K07EV
         PbXvTJfYD4t5LKaH/grPP4g7YKYNT+tM55AFNuFTzkyeewQrL9a/NBsnPYwT2k3gwM/s
         7JXq5K3j6l1AnoXBBSKflAj3JPJluE5E2mxQ8hx+AD8LfNvNdeHMQ69/zxKQC27pznKV
         1abomqP7JA9tFYxS7ShxRpFzhQe1bmV7zyby3ZNYvcMbKu5IC1MCYsEZJrr0xYeXoMLk
         LYOw==
X-Gm-Message-State: APuU4Z/GVeFEsV8XIW6dY+zG2y5XgP0gj71mcTxs52LJJgtAhxKZzhTB
	O60oP1qpsd1y5gXtXerO/KemxprRD5HAiOAd6WQjsars8QT1kVH4TxN6
X-Gm-Gg: AYBFou3Bb/nzzypCnz42bZ59Vb+u7pD8lS7EkrXJeiSefyFV75R2gJFJ6u1pG/d/LPd
	Hq2tFhanSNKSrOUGOTHSHvsnHX1kla3NC+LVzDIAUpAmlx55GzE3jp1zTF5fu6szkhNsAE78M5v
	3vahB976Tl+ZAT1/dcb1NE3JujEqS571LRLIOtBp9r+DCBOxA91eh6rmdGVXFxv20DtOLceDfmL
	qEW/m43UcoGLE4ew6ewtzr7xL21zAr7HY8KtSVzebBPVHyVZBggK6Q6ZvGiONrnJfkmdNXjtoiP
	PY1AEJIPQ3EJRRX92CegtdEj+YtcWNEAG66X6MkBbpJTFY2haNr1GODXMuJRjjZlDw4gBYoVpyY
	ATd7g5qGBPxcfUEMSYe+/e0zJ2Gq9VhRrHKcacuART0vBnweK05vPmSNuKy9CkpdgwwBJld9Lkk
	BJEYA9/FFW8kxei4dvpyRDlytWlnoGPKzJOrev96KrddjuKyDBWurYUIggSf6chDJKnXKTkxMIv
	27Ge2RdHJd0r4AL5ezkLmW/dFolLcxwE/6omOJZzZ84aabvQN0I5KlX0PZ0OeL2Yp8Kojw6HOp0
	MMZBbAENZWRS1o7VyxzuSgerQiQfirG5+8t72WPLopyQaOuSw7qYnyeYts88TAy4YRvr8Ng6vNM
	TJXIM3EnUkjHK2fpUS4/02eLlbJuOTyuYU15cvjn4vMzJVhfVVQQXPhkluIy+OqpB8TRqnOneJM
	a6Ta0=
X-Received: by 2002:a17:90b:2ecc:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3ae897c64fbmr10444576a91.19.1793691749540;
        Mon, 02 Nov 2026 23:42:29 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:29 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:04 +1000
Subject: [PATCH v4 16/22] arm64: dts: apple: t8112-j415: Add
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
Message-Id: <20261103-macaudio-v4-16-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3946;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Rg9mnllZl5Kfvh6AnHIOcb1AniA07neRdlq4UArxIs0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88/vXtFsOrw2mjPLw2TDOIdztm19a/TrW/vumKnp
 tp7J5ivYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVeTowMv/1eZqvd4ov9bN2wee7J6X8VJr5c+nbO4iCdU/vvT5lSxc3I8Mg0ZL3
 bP8uNl9tzO/5YnOR/rcPW+sla05+ldOXi3gMhnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..c3f646e21934 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,132 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

