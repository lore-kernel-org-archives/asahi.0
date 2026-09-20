Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4AA314B6E
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880313; cv=none; b=J3hM1nebi2yRAXypsGaQzr744jb7hB3/l+TOnP/ygl9dbUUANBNSzbBJ6Ca1avgB22x7dcLJM2ZCRGxhUARQ0qgXBhBrP0DzQpo6/KLrsThZR83RNuTKQK8oEQBpvlNeMYITSgzenzeSTe+Sw0MjJFbRi7m5kgJwoN/+mK14Cs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880313; c=relaxed/simple;
	bh=35yLsTXZt5swGMfuhMDygKEChMzE5kiCXJnWEUcydSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkZ8Aptb+FCtTGT1nf73fRiZeTH13fHEfdrtzXzbvVlfUeuqWxCsEP3CpSEQ4NP8/cgygHd7AkFlecyCvO80BTbvhQt91WmF11aQ3DwEDDZOxvB6ETYalJ+gXEWcdrocNsaTAaNCk02Wbn+YGqhR3MkXl4LVij59Lv+EgB1FDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnIQMbjt; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnIQMbjt"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1757527a91.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880311; x=1790485111; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=gnIQMbjtX/5/E9cWN1LRZWIHKQbciN1VL4/WGywl21sNQMvv9olXflKDg69hcC+eMk
         5piy2tcDIiaoPgm8XGA8ycWYfU2HK0FqNWoCfA5Bq46C0mnpt0k8gkA76qoDPraIMV1l
         sRZNyfognft5NYnoSJFUZwuCCSc7mOVsIraFMz1p1cCmhcaV2wuji536Xje7dMTo5H/8
         +7pChwjv/2beorQ+Md/Y35VEHpFvxrsQHd/SDEeIAQwAUakZIuNvg+Mi4flB7w1DwjYi
         2ALPk+aEiMmf4Efv8Jq8pilOYbVZIhiMqkiTGQNQlSTAxRLQx52v82a/GPo4bQBMNlHT
         P9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880311; x=1790485111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=LDEPLidP9G9kaROevRe9/KsW+u1e/aEDcP00ZpzZHsvDP95NamRy7YBBvd8crf5XsH
         pVHpxVGsQx/fn/XHA16o9kkPGrjwF1m7RiWBHCCwc0/AQSfgQrtta+s0SHEvpks9TldD
         3ClAEyTIjwOlDj0c5Fuaqb8pgMx56bWVxop8MEh0bBupZ1UU9clldjemO8DHep6Wnta7
         lZN7Aa8B55H9Siue59sstfJxF8MO3PqT3er6OvaKktC2Rm55pAr8Yi2rzs0FB7c/Y8GU
         LvJh+pyu83u7eJiakdEh2InIEPzheUlIHwRpWa9ByjTOe5iwUqBcoNQ5UTgz6zlbDKyt
         CCPg==
X-Gm-Message-State: AFuF++ksoNOEFZJzZBFny9joWDCJMrEpms8uxTCDnpEpf+su8YDmJ7/B
	DA0EaODLOualsADNKaKFPdLWpcJEmrNqWaUJfZSagS41H3FZuU3fBK7V
X-Gm-Gg: AYBFou0/ZFKpETRivrd0LPBIz5tnzMntticyS1q8OflPwBz2THflM1SanRK4cROVOXZ
	f1yUOWObpjlpdlId8wE5v/ZwLDoePhhE9IV6f+vDq6UXxGufO48GSMCRwgXwdl8hBJHdxUliPq+
	AqH4aTfCW6qc65jEVlDuMtxZ/Xp5FRwNl98pSsNwoaKUydzG+w4g9ZRhh3DyPStavHyxt6OoVRz
	rt1phXMZiU1A4LOgXUjZ0qUc5b7ozeMgDk5GXZZ5yTH+ox9zgMX0xwj++mnYbN1BAdAN4fmQoiP
	VoWLMziylsBUHsOZDgzOQDKKESfUT9/jh6BrH+MkZDw6ty95gsTZI4QZxJPzRJHSQFhwWwB/D8b
	lXkiWHTUWI+icQizENQRR+ghObt7khB5Us289WhR0ULoy3iaRywD9AGhbQKwRbSVeYERZWAzSTC
	UZcNcZ501ZMZPQ4bUMDl7mzMHumSet2jOxp9N859aSIMJ0sC51Ft2/Z5QrevVGk69M3cr7u3PH4
	q1D5SHZVlXlXcA/ut7G6HoEfdMQFOy4lMz7O8kQI72hn5QYq8BPbyYNBvuI7RJKhDGIITkn/T++
	cX0bRDIq3HJWWgfDNNolLNAq1FK3Jnp/pj2L7ZfseuwO2WE=
X-Received: by 2002:a17:902:ce0c:b0:2df:336b:9c2a with SMTP id d9443c01a7336-2df336b9c5bmr36073685ad.70.1789880311051;
        Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:01 +1000
Subject: [PATCH 22/28] arm64: dts: apple: t8112-j415: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-22-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3974;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=35yLsTXZt5swGMfuhMDygKEChMzE5kiCXJnWEUcydSA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05WquSsFpwoUim+YWmBgy24j0P72fv6G5Q/nVsbZJ
 W/wZ17UMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOquNoafjJvYzyr9844pFNAM/iGur//4e1/lxXUnnHVSzdstmrwjGRmalJomLJf
 fYxJ7j81F7eX3p3b7nxjnnzqf2szswb5m5R5mAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 125 +++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..5f245ef1c4bf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,129 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweet";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j415-macaudio", "apple,macaudio";
+		model = "MacBook Air J415";
+
+		dai-link@0 {
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
+
+		dai-link@1 {
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

