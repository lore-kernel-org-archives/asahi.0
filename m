Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7885641A50A
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302981; cv=none; b=DLlAvTuVKMu24gZQ2ZW7rw3Wcn3QFkf8lBvWK55T6JfUm94EbI6ZkCJzXLI7VpnvsgU3HkDHLIooV1IlgUy6yrZZA01iFs5CYPS6/GIiIaY9mOKES6vU9bP/WarjAbte5HbLS1WqS8DQPCovWdLTw5xCe+qrk0aiY2LuOGg9fu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302981; c=relaxed/simple;
	bh=HgeKP4GX0C8xVVymnI3UcLA+XVtzd7U2ZKk4pTgAUaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9W9Uqpy5dOCNeSKBIqKPJsdTFnZjemc+wZJiGdMJSbPfTPY2dTb2jJCkrCXFSVnI407SAEBCXw5iyf8wMp3G1yBq8UxKH/rJUjOFnjUyRbL+4znHuv4xfq9lLbHl5xVXs0v1kc/WrBBRPEmimegegeC0B3tPpV1IEMdS8G2tqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEC9xCIa; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEC9xCIa"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso881855a91.1
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302980; x=1792907780; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=;
        b=XEC9xCIa2YEsobyojyC4N9v54TBfe5qhqVRGr1PtdJGU6nap1C9df6b0YO2bb+S6p9
         ravIVwFuoSvSNXX4T99isb3/yreUVmt+BRRIi9tzkgxxv0x7cuWnCCN+eTIPea3aNSyR
         KYEmseyE0TGNYsr+nPXv+VXZP+Yl8WF+32BjkR688MJNnVQTYobF16sV2vKg+2WzFjyj
         6ujrJDuTalrKFL165K7UIvR0feJWGLQkNcYuSBGXbs003FkDjnKK+nK5qGBw967PTTCB
         D1sR0NWOgHmpxPw24oKr0ZXwIk/Y0YcM3OOz/SFrv07DTW/GbPy0vz8YGv6AQ4qQkMnI
         URSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302980; x=1792907780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKNPOCoinzGZ8u1xC7JnkW0RdGTkMTpvs4SLnqlKxuU=;
        b=J7H3P0h2wb3toKYLXHY9vW4zaumg0JJC+1GIHfRrc40VfN7UDJNZGl4bjtAu02ZMiB
         UFlzDHw2gFxLz0CbmBa7aG1aZoNw1A6Wi2cJSe2D8NYDss5YAW+3yExhWGCNOXpJI+7o
         0g1OtABP8yRIvsbz290Vd6a+rZ34HcMrZMgC+Qnd+4n3uWqZCJBn+pfjz6aTgxobuLZT
         2coq2klPyMNM7rniU4CtcHZV9Yynp9DvqZz/AbpA1lfim//W1h/aLqCygdMtWKZyVB4Q
         oT5ScV+oXSUYyDbXmnC+16D0HKGqXtO8YQyCsMqpUgaOuQ/uMbW/xiELLKOrFI2GUm/H
         HtyQ==
X-Gm-Message-State: AFq9FYJkEibSgku4Anl7r//Ghg5QikNX6EiG8DG116jhyWSb7bGh5+s+
	+dci76eG6aNknxbLPGZOlc7lbtDT+pJYsPO4F0la905I5sTnyG65QQMA
X-Gm-Gg: AYBFou0l0OptrRhx5Gk59BFlRXlbZRYp4Wu+WVcMU2IltsVjQIC+dmrxePdHmitXURB
	DDu0/Sz1oH3Vd5d5Eo29swzdcC8OaiBoMzkp6kOq42+c3C1DTcCU7ndRlaH7Lv3ZXbZQg80jnLQ
	q8BM+wc+dyHf7ob0xdQO5eVGnfn+uwNU8+cdWuoe92wOkWNy+CPuiigceT1793w9tkfeM0U0bnK
	w20kS3abmwDIoW/iKdD8bb4jX7gJmguuTJn2XbwqJaQTzfVQd5Lh02boSSBDlpagrjO4TSrYGiN
	m9hixtaz6ibIaGzjsj1tC/SpLqVgdKx2DTC3lAFsy+U6Ixw9t4ATkfbNAw49BK7P7YcS4QOtdQC
	PirwVWCsSDZXDfpI1VUmFo0pI4dTjejw52rEsL7rTBQFR1UGivns72UY2y1GZnMynMcekQudKAp
	NBtlt5RsV/tXflzDxw/VEUzGZc+eQiqbbQ4R6cBGTQ6JylshIvDmyLcEfIqn8inLa7KSJ0kFhMr
	+ndYCd5cG555wqbBpMYsVlvvYrivcBLBNLHEsX54FPr9ZTe+9loz71boLJqLT8x8QJ4dUfWl70A
	8EawBS/aYmZspryUOrBw3JFMruRijZrow/vAunU9hjhF1w==
X-Received: by 2002:a17:90a:d443:b0:3ac:97e3:7389 with SMTP id 98e67ed59e1d1-3aceefac299mr3428943a91.44.1792302979629;
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:05 +1000
Subject: [PATCH v3 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-11-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HgeKP4GX0C8xVVymnI3UcLA+XVtzd7U2ZKk4pTgAUaI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nmVdrF8n6+zRbKnZNPTcy8WvWZoP/ppXdiMHQryS
 jsdZ1x/3DGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqPR8YGVYbejg82f4lR+LH0cCjC/+bB/2akW8gvSDs74r9/ycpPbRm+Ct4/U9
 PICvLweea5q1v/Rwddvfnqv8punzuZ10LR5ZsCzMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 87 +++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..ed0eb358809b 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,91 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
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

-- 
2.56.0

