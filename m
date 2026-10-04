Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A1409271
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094007; cv=none; b=lItm4d1H4wucVaQanarTv1xhCoKIXZviMnSouxNBXzghMY80x7eWIBG9WGii5ZD74i3EZe+nmJknZ0dgwbBd1z7m7VX5G0GGTn5dd1ZzTXB4jPSRscs/f8NFsQOYsUS04scukPzrKDxlLIHHhocm3sxvvPwlBZLUjLb0LR5cy3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094007; c=relaxed/simple;
	bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POu2/Xt0KUpvBwwXixGq0xZBkTeARSIFEbKXAaVpYBOPPXGXR2syMH4T3sS5ryyC31n8SBfWgsARm7p8pr+iRIBvz74pxfllkOrw9EOH5MqgX69ZDBrmElXTJFGi6Ys1ZboVCH5XKquEKyh56Ka3/XkQRcPHWqelUJEo7e4Y1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iygr8hW1; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iygr8hW1"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb751so270786a91.2
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094005; x=1791698805; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=Iygr8hW1FtvMfDMiHS4flaopZoH4swsOIWxnaAkNqg98mAXcfz6UpQ380raA8RPbzk
         o083yjSpcaP06I1TdFcs4dlaf4TJP8fDv4kiVVhjJ8Uh/diQiBGhAzRluV0P2leXkKmM
         3sjCw5ZmY2NikFUsfuAAu4oEmhKj14DPVQSEGXD2uGKFubeFSItWHoM9GKliEDH7hK5r
         YOmDXQ1Jkr46EXoY9a8lGHC+r8LrK1kwwiFxd3XWxbJCHuKFwzTvpDeNbnotdSG8T/Yu
         LdvHmv8s6SaxB1IQhaTbhzjLdl9ukGXMmc7YzAiD+DoqbL1Acsrz3zvprQgZkRE9xv6/
         G+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094005; x=1791698805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guIyHpQK/Dufmx/5H00TbHEiaCpKr7cmjeRRgaNH2Tg=;
        b=IXdm2ucMYFfhhJoskzIKowuMu24vxKE4VbocTHZLu06xzfTVlcli2/OXzUIxRQ4fx/
         3tnEcKxK9Z/OC2kig3saZ1jBcEmchgSvza10MXNwWr/0MZDdptrrZQtjE9Q7ZmVLdcf6
         RySpf6p2kRxNHDZGtgYVkIY2DRDpmK/37QH3pwhE5wtGGeDtCpdqLehUAEZkQ+lksTqz
         UaIMohkke3fQCQt5vRTEsIdseXPrAb47aStFNnZGYXCuR+vODE1cwblZNA+kbZ7VvmFP
         DJAsFepof2GtiHkaK9J7AhqYFVXSW0IYMRZtq/pkgC0K0Bdv91yZyDn5I2w36cQEe5Ag
         mJzQ==
X-Gm-Message-State: AFq9FYJqFhRJv4vjCpDrN53azcw2PDdjH3ir7IcQH/Nk+EQBdB1iT9kh
	IvY3148Gjwd6GSz60grRKtAkqPR3XwBmp1OvcEZ4KYHy719kewq23m5t
X-Gm-Gg: AYBFou0dVvvzgNh18hUwsRSaqQWaTVw1LP8pJrQMT0BnyFfsvzOSGHE3zmYAJaEM+SA
	wkVCfTbKq7yVvMoNsscXXQU8x5KetUp+J9ckX48wEjMBM7ZZ/GT9Ug5mVqmaX5bzpWEmsZsYM6k
	x2sZdXDLeqIR1au5qnzUQ9DQ7/VCJg7uMw0OZWBml+nWBDaMBVTOeaCfXR1pvRnivbL9xcOZh0X
	6Z8GdrhFtq+2d58I+pxCHI57ooQvCVSlhIrRBSCjI75wC+c4jgmN4YMKlYt81enEGL3IRvlJKGe
	sSYGUkdyVbdHhfoOX3ZY4kqzQ6XilWOtXu1dDgV8GZp3bxDDa5q+HvwogQhOPrtieTTk8Eb/3ej
	SUMXMP5HXPZp2Nch7Q9ZTGAyg7TiARPOj7q3KD2ceeJhCHXCxL6nyLz7R3YyX8BASNekpbI7Xjh
	WpYCZV1VBtmJ6Oo9tmBXqLRttkbxd2Vq+5o3ZqNTdec9yM4Mhc3wUu+g7fAzkHzXNNlOTRTlVDi
	GPyE6k769xd9M4y2xPDVzHzEW94ec+xC0xqJGQkgN1HvIifihKPF/OHHAoe+YY8pbL+MkxZ/Qb4
	Mwa/VcjH8W025/vJ6fck79lh0mLEVqg201uAKEIHExjWJC8=
X-Received: by 2002:a17:90b:4a51:b0:3a7:cdf9:902f with SMTP id 98e67ed59e1d1-3a7ce18735emr442657a91.1.1791094005403;
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:44 +1000
Subject: [PATCH v2 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-17-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+HjgVzM6hrxGzffR6UpBVCEFiz9mMaK4Qwhq2WWzE18=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QxC34/UMd1dwtXfvSXfTwzpr185aO26s+XrVPWm
 cgpMvU0dkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZ60ntGhm8TvCI1f0Xfna2j67bCJVz39TzObS7lcwp2X/l+bndn2hNGho+S6RV
 5T+59vpkwscoqvlzc+5X27klWLgu/LQmd//ryRgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
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
 #include "hwmon-fan.dtsi"

-- 
2.55.0

