Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73DC3BBFD5
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303018; cv=none; b=QnOEYXeHj4EqL23fvlEEwz6MHexhY9Q/iaUvbANPgeY1kvVVr1gSj/ddkFlWwu02ygPv+IXyv7IRxPG0OqH2EPqz4C2NAiDu3NiMz3aLg46k46L0Fg/WRucujy7UgqTqZJSBbW3fpUG4OQHcJZChOfvCscmyEIQRN+OdxOmnFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303018; c=relaxed/simple;
	bh=JxN80yGgi8dxQy++Lgr6IUGkCUjCTAVvVbG02jgBSPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ri5SnL7iZySQn3ZlK+JCn477qbD3VMHHt0+tjm4paoO/+ltBr4a+wRf+4ktffwkJ+7MsAD82wAbzf5OLCBxTZiucna+MUUm9wGIxU3qp+dD/04uPb8fDHck4215rDYEctAV/OrEUZi1KVqsn+wDtygg5BrvXxexG9iV6Zq7i0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvkODSOe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvkODSOe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1021559a91.3
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303017; x=1792907817; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=;
        b=hvkODSOeQxZrHAaHgJcVikQRNiIEJLLd2mg3wiAZPk88+fRhDVJuopFq3e/3tAuUKf
         +HXRnHSybRgFq6X71/9nbvTOTSoxDx12ZpEEQmFIM/MQAnBgLMbyWO8nMs/D4tDk6RMV
         /5ILuYdR/xyaEa8LnxEK/QaUBSeMHmTEXoOdSOnlf3ByXscoERarl661yySFhZzAbW8E
         Y4IpQzOcKkHGx6gHsBe4XUwHQmeRWXI8JFZ9lS2E+JGSqXVuSqErzwuUZ1dj5okxMPC7
         wvjpCtilgcBQ5rnbxg3vsm7yNNTFe10mv6za6ZLgLqQEl7R+aNh/jUqIqdUNSxEiN451
         eoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303017; x=1792907817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=;
        b=olnHdFZLzBxWHXpR9hgOelNAxRkLQxGZG1Dp/vZmayU/ynWKJ8FMMtfzLnJiAqpE1o
         EPXfMkEAeffKwM9JAy1qPdAI839lHSbTn8b21TAiuRnSh9MBqyGEY9jLqL2Uuork4iQs
         nFbOiZVXSIp+y+1IWPwiZ6GAdoxdRQdtIIeH6gLxs0VLKMl1kys99LBnPTeAaGMYty9u
         s/CNxFyqcKyikiyRSzLEgq3lqj/ByQSsMsxdOy7BklpGLZneILnxWN8zqtUtC+Glvohe
         dz29l2Zs+x/l7ZE+YzWQkPXcE3rJG/u06g8b9s2qS2zePq6/dbPUyiBFno0Gi1uBZ10H
         yIiQ==
X-Gm-Message-State: AFq9FYJ3y8YC2k7mbj38DDLCTiFVoTkiw+DL9DB6HfKvDtVyXMjqrQt8
	SUcDClxYlcR/jEeKvDlj6sInRC0yL1B7m4on62VpBjSvE2QCHUiLRxNX
X-Gm-Gg: AYBFou3HFYoKLowcAXnTc0aTkKHMottbkzsJMddSZfZkLDN1KwiiCjmgLDZrTu3nhWL
	XBvj2twFle4yx+eLKSGKXiL0KfZW+A9r1sphBpbbAs17uLLDYREMe5NfG8GGQfVG0kWSajlSInj
	fqJfECYMKh6Ke08DDY1DZKhcbFvbN29CWdtFWiDTezV5BtUxNb5dfldvqc+SNpDtrrnesaT8u8b
	AjhsCM2vcavkG3+c5NOwg4dh+yxd0rqCD8Wtd2uktSUehjHTPcGmltrqsklSR7/okZGIXI2NqSX
	r3c3u50zd7I7svSS8j5ctdVfs0dBNaPuBlSmQxvDEd4u0rq7tTQi9xExzdWECPofPL77oO67BjY
	CCV/3Qi7PVtFwAJ/hGQNOqWY+kIsXl2SZorJEya2bn+/nD+X4rwGbLzA/EtXDNXbDRjhPMs7VFc
	6ryzwnfE3RlDWKPCngESWuH6LfvxlQiJbRgpKIVb3uUrs0VpeOhBJLLXQCBe0F+5jS8/DPQxSLm
	QaVIKTadrba93T/TMrd9hPoPeEGTQTlXBzM1BPBesMZNV2vz4GJqO9igrYXtP0lILkezaXpjqhq
	cU0h3ZUqgpuqozUNDpTz0tOVaCj9RrBN32ZQPuLXbNenTg==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3875435a91.38.1792303017082;
        Sat, 17 Oct 2026 22:56:57 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:09 +1000
Subject: [PATCH v3 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-15-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JxN80yGgi8dxQy++Lgr6IUGkCUjCTAVvVbG02jgBSPE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnfSi9caHVep7JTrWylnMyGpTn3vO/Krg32PZdR4
 vzDPut2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqrVRkZesRPF50+GsHhvVho36TPntreW05NzQmeOUPX7smzX8U29xkZbi7UXt/
 /ZcokoRMx9rwJr++cETs7J/I2Q9aDQPmvPatP8AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 132 +++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..099b9837b633 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,136 @@ &fpwm1 {
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
+		dai-link@0 {
+			reg = <0>;
+
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

