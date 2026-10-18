Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237F3BED01
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303009; cv=none; b=pWR/G3dZPzhs2aQx9PGkAkEJMqckeDg5bFPXJb55dM2FWy1lR9opeTmH8LUY8ehAUfp9/1SH7k4WTxjMnqzN7uqKo4csjhFynfCfIHqvO6pHjSuTlP4GUOGeuGM0g2JkY9IsXaEQUPi5XVrPxoapn7wb0jkatgIL1NX7HNMcqqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303009; c=relaxed/simple;
	bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ja4ZbrJTBzwYZf7v/u6CYIP0vqvNDaepM378g4447xFtBz81c2dkYzDi0FaAqfL4vGlMmssB2mfV4m6fxLXEMPD0Rm2W0X1dSkVl4sRNSRSsKk5J4eqQBCnD1FAuHTX7Tq4Bo12OyamiJb/AxuPTSH0QPALL6Ep3xgKEdPLwVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DntB4IEO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DntB4IEO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso678603a91.3
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303008; x=1792907808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=DntB4IEOqmCmM265QIptIeLzyWD11zqfcmqaX9/YNBsmcSOG6j571zZJkkQmU8STE1
         ZHPi7Gk3fKQ1ouv8Wd37RC+PhjymV4WR8x4RYXMvl8Gl0CjeYmcP5OO1zJ926G02iitN
         iNviXwsNjQDf9GZLxgum3JSxpYroafZWNS6URRx5f1KjO5N4BEwdSAp5ct0Sg+BOhL6e
         b175hMJiT/BNbAepIKtMqepYXnq65auyshODtkb8prT3Yx/53HjQD48Rbj2WyI1OATxr
         d+rBzs+baqZs0Bvbdo8uKzmNLJXKS6bmFtde79XBUMrkHxmCv4PtsWaK+GkkDtrQ+NPQ
         z4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303008; x=1792907808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=KPed5CIrPW80mIoGmZQVMxq5v0p9seWU2p+JmqBfQczD/P1WeOf8+EgTLySvUyCTE5
         ao875ciRAGWmrCpVqIT2Fo8Cv4vojd2OKt5m2OaSJCXpfbu8ZyTEv3k+w1fnYiVc7b0K
         gMOaYImq6et9Q0l62W3cisDDyMWwNBhrG1K6gdCxDvRRGdhLKzcwZYTnAarT06B33qEr
         xJ6eoJ6bxnCa4TQFqmgQDD3PEu9xxTGochy2iXYMb29nZSpRc0Wa8xBd5NMmLgi0U03Z
         HUDY1F/S1vKeLC0FLYTGikmrXNsDq3IHq+fZHIarL8VG9jtmlvUoUveBor1ha6uFWulq
         ABaQ==
X-Gm-Message-State: AFq9FYK7bOs3r6nj7fx8AMmDdrpnDcFqGuFRQGrwvORWG9YAZkgE153E
	/nAQba6rmyg1DtmuYnfTSzCvWUTTz6EZjWj4ewXRjvlxGrNqRFdz6dk6
X-Gm-Gg: AYBFou3A3Irz0jqq22Jsc/6AV2mBNGhInKOeGyXiM/e/PXyiFoDE4Vc3gT0uybMwoSG
	lxLFBSvkiLVv6cjctTo+Rk8Fn9nUQnhe8DvL7JMPVuLYS49Oh/RCjZNiDOLDLksGDpWz0U9APPI
	HSQLGxIrw3C3pYOIHSxAd4B9MLkGGWGUcf9UlqHyWxEh/WtX4JBEslnZ3Khn12ani+RotQ7Cts9
	6GuZyjUO2eggrQHQUBNU5usZFmN/LMg/h9LHQDbOoRbMlmQlp9zWskuaai8SnnxeWCv9vXAWM2T
	NElmL1XCXwHT77W3ynUfm5YqIr2nbAQMWTzLQfX6fdo5uq8LqtUESki51WIwGql91A+x2a2hewx
	r7AC90VkZsedNnmsx6gfvl83gpw//pnmZ4kakPajvDqYoadYfzqcF9kGzhDQFS5xK037nEa2/48
	SsXJlChVqjYY4dq3lrN/GTZ8fh4U6Da7W1UakWgn6FVLWD1VKR7s8aVf/fKIF5GCVESVuQp7Kw4
	E5K52B6PY8p0gRw2uipIgw5YqvxswqYTOd5v2WDoAqwNGvTZvq743mK00iegEE6tgAqv/Se2Vfu
	sA0nrSwFyKjLnxqoxnmBJbIxyWu1Sa4P/ytTRjzkGTGYrhz6vd7XKfv+
X-Received: by 2002:a17:90b:4403:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3acee277aeamr3445331a91.6.1792303007868;
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:08 +1000
Subject: [PATCH v3 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-14-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnX+KUfj5e7JO+wvi9ik+yT2s6vbRGh+W23BDaIG
 +asTJDtmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWiLoZ/ig92rPZILWu+eLD3r0WNtXlBwxeHvskr01arqft61ZxmZPgr37v++BT
 3oCslcj7OK65N4/1zwb1w89sT0VenrF4msHIlMwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
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
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
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
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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

