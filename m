Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8693D3008
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880332; cv=none; b=ZNrULEOVMjVM5MtHIARrQU9UOU/egDXU2l8SNM549fkSehXYzRO9NMMHJpU7oLm0XyJZcIPF8Gc5IzNq7UiJQDbm363tw8xx80iabCr4SELncNCeyKJAS//4MS9irEOVxHw3TTJk88yr6rL3UZNLpjCsDmKvR4V89CoR54MyjUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880332; c=relaxed/simple;
	bh=StMdE/41Quj7yIXSIiTM/Hm7dUYYyFp2jqXhWfbLNVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBTaCXEDyafKIT8gRHAIOszRgfYCcA3YU8P4HSxRZdvMXWt3g0cKrp+NXQ2HkGZHuYWfB5KrueozFRc94r4OHuvgPn6Ehe+5ylZaeiIaUSOKX/Lr7yX5vt52eXDO2owGP5aq+1HiVsbXXF7nJGASo1prkFOWhT/kjNOZUMdRWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyI4fTET; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyI4fTET"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso13303615ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880329; x=1790485129; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=;
        b=ZyI4fTET3vBpRNx8n665OEMRu6SW6SgM2hsGAOK/Ypv26FOuCVDKj735rHEM3O2nRm
         OuaPQPyy0QESAMYlwA/C5tWEdvR/VjW12GW2Cb4j8IIxVlOUumXm2sgU1t87BP+6yxA4
         Z9V3IGC3s28HXxpxmpK5ZcIFdtgpepy6jbWap22N+ofU6zFKds4as754dskkJzOM55Gz
         eqR132j4bciDUrTo1ukbpo5GyzO9jba1SebuSwwBqe8GtaI7LBtXB+HVc042cvColgt1
         MaSFC4bfK/uNL4kYw//59pNUa5Kkh4JmxP1i2oxKHtEgpq30HzCbI3J4NsWn+qZuyTDr
         oM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880329; x=1790485129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=;
        b=Wh7f4dcKxKXIHZTLiwHYxTIU6gE4+jzwnoC8j893WDy2POLsikz45ZVomvaJIlaee/
         5lWpi3ci5izwTry9vyUiBUowcM7Q15flxijRGzcUxJM9utQZ4iQyrBq1MuCEKutvJpZ3
         YenIMa3jxSdCTHM4eNG0+adcP265uZ4PinPFZO3jW2wT2vw1Ai/cn0ZkuOSKktXrYxAo
         LCRzu8Ir+T10VpR+ZZgwxKs4Lv9i/e8HXXI5Y2Nihv76/tTuj6JMd2kiQ39pvZhWv57x
         GQ2jOZm1QKKc/6gbF1Ym2KoBsYJHw43s+kZQyYw6JTJ37ptJdPgOMtS5knDPhucWMQ1c
         vOUg==
X-Gm-Message-State: AFuF++lrVGGJxt49ftZxgtsnyrjEA+nR6m/PQ5Q5u79hsXSuEFe5eMxB
	8pBLbkPqTGtdyN/jSVzVdKvLc2+TyOa1fwol8/YcxEV8p3zCF+zRreeB
X-Gm-Gg: AYBFou1vIbFIDoT//S2OKaVVekSL9mRc034ZfYb6nrLaycEphA9UIKGwt/zOJriyz2m
	5D/3EwG54lEJJUzQKn50WKIw1tbG3FVFM7XY6CK27TBEJ28UE44aobN1m9vf0BsOCLJ0TwphrYY
	byMmpIdDMb+mZHUiSpCTkojAVLLDcSLDQYKyvJFn5ElS2F+eHZEylBtH68yMDn9jM7nd8L/1/Uh
	RtoqrGPyErQz2B278ZFoEZo5VUwuZ6dwyBDMY3alFkx+x6ObP5hka1oFTFOvvVnOsDUhII7aXRl
	OhDjLaR6bqK4d2WXB7kY0XTrLttBEzE+h2FrdMtQamLDix/H2iEOeUfRNMXWeU+7xMDfREsOgGG
	I4DIIvgxyD29HeFFpNDNv3ocxD5Upl+4wX1oP4VB8I2i0uS70K758G8CKY7vk+vXssuJIriybQU
	xQxCiFM1H4Cs+Iv82f7SnuEgH+Bok0dQJXjPkodJw1KAvrXxqkMu1qli8KKJwJj6iZynf1HgSVN
	FQsNDcSXEMSlajBa4PNXsTUK+zdKSnjYUM/e+PuddYeJ4TxFnOBB61jRANR1EJ24KxkvL2U2M1h
	KFWeg+Ogjec/juIGvinjlxAN7L6DAYBt1hFG+Rsy7oGPsHQ=
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr51674075ad.55.1789880329399;
        Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:03 +1000
Subject: [PATCH 24/28] arm64: dts: apple: t8112-j493: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-24-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=StMdE/41Quj7yIXSIiTM/Hm7dUYYyFp2jqXhWfbLNVs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05UuHtmzzNTy5hyeCe56m3uqbz8rKFxy4t6Kd/9Ug
 gV1Vj0X6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1VD1GhqtHy95unr6tZnfMpnu71vU79bx5xat/K1qC4eaHrgUpGusYGbZctnv
 2QkFJ57zSUeMVVvO2Tj2/2eDbYy7OQxbb7C1PLWMGAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..eb401ae8773e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,106 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j493-macaudio", "apple,macaudio";
+		model = "MacBook Pro J493";
+
+		dai-link@0 {
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

