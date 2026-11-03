Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691776;
	b=QFxq4VdmFtux9kv9c1WtyQ9Kpmn/A9/lbc6EeamxDjt4aETRE2ry8l47Cgf2qCz7Ug7Z
	 gpkrnggVMQ1xW4kB2ZaBBrzWwZmAHn2quo3UEo3cRArPbuD/3nTadjV2WpHynLzCYhVkf
	 IDgdt2Cidg22LY0Dp5bIdXFhpW694FtURzPaO/cLscy02mx0F4FFkna06v+O+ODuoqSqY
	 DrQF7QQ3yw5JxV3qB4MimyB0mQPIupX5alXQ22Adqkr4soHfPLnVY4wOIQUsHXvUYRJRY
	 t9OPwmxSeUygW0A0/kqYsau09zajOffXNhFKMURdsWbXOzWKXgiF1sefaH+cLbRktGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
	b=1wSYM5n3CooC2cv+CI1uuB/XwEB5HrzTB87nfWJzV/xSadJm9tLvB/QAQBANL4O0piIG
	 m33qCfypSzEueRVoSyJbWSsuTIsqV9s4kw0NoT9FV3vaqxeMgOXrrTUu9iBCb8V9FedOb
	 0DEiXfB4yjeAt4aO6z7Z8fbWgA/IKJdafwPDWfnbCTgPyrGXsbUa3ZJ4+9RfGo2x3hGWv
	 CHjBBtquXJvRR1ZSLnYW9OHLbrpHjciX0vC/FIAR5OhAEdd4wKHlTggSTzovBR12BAmdp
	 fm6MW8low/IKkVvwc2YPYMJRzc4NkOC1RvU1HFuqIyqSCreW48E29hQZB2dwHXSxUng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6lNAWJT;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48C606A32D
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B48C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6lNAWJT
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b07db03f41so298248a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691775; x=1794296575; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=H6lNAWJT98y7XrU8/G0MNtiGnhZg8mnt/AMop7VOXJ7yJP5cACxKHJ4W/gUWI/8b1b
         FOCNk4hVLGj7u6/yPDDWwLuGaC+ef3nK9noSvke4geZPJKcKUXBxBGMQdRiwipiMTCXM
         gjqS9eS0DebaZSpEscKy43Mx9qW6ks9B6DpAdG+KjG71yFAWz0fuVQjT/aw9Le7aYZtO
         fNFeg9eaPhX063mJnrCMm0t+dpA7FqAlE43/RJLantygtKtwxFCEbzOlp9IKeLNCQ5RH
         5WJe0Zn9pznsDnA0gZ9v3NXAEJzuRO8/QD9ENs9U/n02I/farbe1NCjrAXPBcQLvNqXC
         N3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691775; x=1794296575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juI5uj4FaPK9VFQkpAL5wEy0U71+2PC4taBfk1eXfEE=;
        b=rVi0TAD8gnLNFu/ERK1qqpE+8zz4kJfPlAn6cSe2+wpb17h2GhCg7SLbA8aub9mEA2
         hEkcO2c9Nf/VMrnaWneH4VSbnyGhawBgCTqwnu3iVfoFDl3WNXrWL0T0sxXzMJLlmdKi
         nomOOUNFFDT/IfW3aCEiGNWvQzJbCBOUCSIzQZ/IPT1yAryDyppYV+7erDTWf2aV/hEG
         OxIQXiJ59c7/Slj3XP38rigGycr9Gdtp7z7OSEumy5H5vpZ/KCn5RSh5RIMXltcXuckn
         XOBJSZJisRJaESNFbal80WpX2JtFnDVgNzeykNm+LqyQ0g8aZGYJBKnvIzAvTeSEUxe6
         f9sw==
X-Gm-Message-State: APuU4Z+VaTEuqVmq4hOEOQ15TWj/x+PqdoRuU2gPZyQmgM9WOvQTi9UG
	IQKdpJEGdyUf6rm6DKa1XU+1OdrnSo80M3O7xHcUGhvvobv8ZIqyNiPv
X-Gm-Gg: AYBFou0yvxpwpP0TKeBPOqdLrADzROTEZPYV3PS/+DR4MMStQVKwujOinZfaUUCRtU7
	tNHtE2ACD2qJKvSWpEeFoa6OXY+Kof3qillxW4+5X9wzaIXB1Cp5+3JNf/sK4uGj5oxFX3LV8NA
	vUqQuxH3KCMfT/pCh8j9Q1TBaYD7L54FpJyVYaRjZIRCd8iSbe5He4o0jKPOPkGlnYHljJ+xGWQ
	4ITTWCn4VfDeV5YY8NRomIm4N6jDw+dNY+dEWnj/ldFBFxh2boUKo/ZsKclRZm51ayNdJxxBamQ
	Njo5HIUFwPBtj6sO6oqCrttMvwu3WttjUJg59nexHEE993eTtmJcs7mnpE6j0aHr5Knh09UalnI
	Fxap50F+K5icnR8uSXhvxBK1tPGs1HP2oBtyf3R4RSrDOn5cUqwY2en2CEvGnOIrr19OOwjsMMo
	zuOlY+6O5uu0DVtLep1n+bZDwoHFMQyFH+R+j3V4ooX3xh0cC7oT2Vl7BM4znImpbav4whn7I6k
	xpVdgOvrLRoaoziXsWLzJBvLnQKw9eFWtJNPT57XEoWL2Gtsaz7sWtrvFyifaaB5FLqJ01q8wfc
	jIT/uZ5rWk++mxLXDz32duqNmVRz3cVznI3GKNXGCiZqwlRjHixO5DDKLvX2taYcNxXidsujPVz
	7Vp1hO3ZuHne40MEMFnZYuKGDGCuq4UenoX6Ucawy2KJfM4Qkou6klEv98Tp3mKIf1LanUOYt3a
	5cbkU=
X-Received: by 2002:a17:90b:48c6:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae897e07b5mr10233118a91.63.1793691775441;
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:07 +1000
Subject: [PATCH v4 19/22] arm64: dts: apple: t600x-j31x: Add
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
Message-Id: <20261103-macaudio-v4-19-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6072;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tVHb04ag/03f/ScM4f2Yc2EXk5oXeWx+RtEiWeg1z4A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y+Uvl+YaXR70WTZzRaW6iUV04JTViSs3a/08tnvn
 A+7twW86JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1nx4jw68f0oJpvl+nGCW1Leae+nJ7j/aOBx5r53e83PGJJVpS+RnDP5ujN2b
 37Hh4UPJNm1TuI4GLOdcmrdrYcGzClL131U62WPACAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6000-j314s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6000-j316s.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j314c.dts      |   5 +
 arch/arm64/boot/dts/apple/t6001-j316c.dts      |   5 +
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 131 +++++++++++++++++++++++++
 5 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index 1430b91ff1b1..63ae47ea46e6 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index da0cbe7d9673..c8428fbf9244 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index c37097dcfdb3..05066cbde96b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 3bc6e0c3294c..ee0339b61713 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..5237cb39491f 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_woof2: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+
+	speaker_left_tweet: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_woof2: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	speaker_right_tweet: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+};
+
 &nco_clkref {
 	clock-frequency = <1068000000>;
 };
@@ -366,6 +454,49 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
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
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.56.0

