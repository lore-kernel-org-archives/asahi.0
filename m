Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1663D1AA4
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880303; cv=none; b=QBTnqnd53azVkbaA9bBmw7RGMisyWvLfsQQ5RdWEHWxbEpNBodeQlhS+RlobV2pipVNtQ/VDfIc/GPCLAJMWkNbxPc992ZMG/goKezZrN1JIfIPk0xmp68fF8pkEkddTSBwlvS2WMAwaEWdPkY1Ewj0gfw63Lbr0i0dwAvxUFlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880303; c=relaxed/simple;
	bh=cMTjWQ2NYQrAfPSCsxwJy6m7qzo21To+mIsntW6H2OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVUNB7n9bynyJ9dn868SR1itRd8LQ3aDYAgldkRlHPUqOMis5jutc4KncYUkuqSi8MOSkc/g/BH2SLDyNxJX/ukCF9hfELMaWAkFAzV5a4ge/w5P8QwP4ug/jyJrPpTQ/XUid5D3DWnxe6LH5HWFXJtKR1YQDY4d0U6Q4F4e8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0a1jiU0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0a1jiU0"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d93ff61046so19907065ad.3
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880301; x=1790485101; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=;
        b=C0a1jiU0dYWn8o9gI6bumbsWvsg1AtuyQ3m1sWp/QV9l6AZhfdM8J11IiOBU/0fWwv
         yIn//rqIxF1v2suRdNSAO7B4rsXyOGDVjkvVpN81vMEGYcNu7KhIWmDEkVKSNFFs/Y6H
         HEj8NLYPiYyLx3E0zP2uAPTF+9J5/tDF2GTsYb8rQnfSIn2MwMjcWabCztfaG4lgdhrG
         aMhZrOSAjveJSv0TfgOxcOd7YKt6qujZuLt3FDxoAXp720A3vZHt0odcMt/2GVufLX8O
         nJII+Yq+q/wZEVFtG5x53roYq2I+UE1cML+sXFuBlyrr87fFUIpz/l2gHKrEEXgWVtqC
         Xp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880301; x=1790485101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZxE7qtOQPvQOMl18UomFCfaDsFGa2ddpzMEh9Wx8L8=;
        b=gn++wV2+kX0/fAnHqzCEoxBA0Wik+qx6hNpA5g03a8N1zzrmIddiqjkKHZL6Zc6/q+
         2yL2olW9fDsby6xkarlUF7ar3i4uaLHmRqrZWqY5ASeMYt6Mg0bAsw9ChcRsQrfvoudq
         eW7FJdsWWpvpyw9eubrKB9ukhjPV6HAHxbP24a8vpsK/tyvHLhjvkPh6/rGqdpGqnrP8
         ZZiiwuFV3IbbfhfeVymryAoyOKFIDWeIb50PWbxpXdM1OI2aqytbzvAUA7EPuOgvDMZz
         Je0nOkEgGjy0cFs5QGaavlSXIE+3EIitP511P3p1Ob47DW53FvEBbFUUHeWqGFzhhWLH
         qXAA==
X-Gm-Message-State: AFuF++kvHO76UcBRE0nFv1ntHQ8p2RfGLwdy0hSFrKapdM4aUNwn+5+4
	4aYj8ww4PKQ69zJC7nfqHJp5/PvYTmHJRr2fbuBpGiFIKq0ejvwW/SuJ
X-Gm-Gg: AYBFou1Xh5megCYqSTyMmI3tAu1HaAX1p1t39icnOHMKDX/JUZiX4PLKurFJiAr37w+
	TkIG2cPRu+1WV5nzrG14x0dFLD5Op2tymDhvI6b4tCV9fWf4RiiBOdDSKO9XRMBEHqicivHWHmv
	MPuLLGWZU5uSx/3TlEawKjTuMkVT3wtkWsFfmVOZD2SqZ5FaX2NvvtVFyzMD/PNXmAntPFLX/5u
	rTI5u7ab4veonDsmljJkMRRyF2vT0IVqhIEoccnbj2larLvcrhO/Hg/y/S1gD8eZLmJZwnVIpvv
	2txnvieWzT8DS+hw84B2lb46m52BuZHvuyez3bCkZi8xrzx+sBtxyht9j22bvasmUAInQxI90A0
	xsCLn/5ZbXg4yhxNyXPAbf7N7GcuHgGEnNDVCqOrI5vL8hkLYDger5unHV2yBKdznVk0Qy+BbeM
	R1yNwmRf0cS/3YUTWQOEaQoGF2tUN9PLrfTFAYrFmWBT8c7fEeezQW8yRl825UFnOg4ecELoItP
	nPYStZLhNgeU8WOy5w0PoYIhcCRI+8unonDoh0Yysb+9wjlUZmqcwol6hBAx/ar46WRmuRoaibM
	fhKCjYX+iPVr6rSxC4DPddVfdD8F0U/0HXYCLIcIfgpSrHA=
X-Received: by 2002:a17:902:eccf:b0:2db:210f:c111 with SMTP id d9443c01a7336-2ddb1ab4ef6mr125516895ad.2.1789880301114;
        Sat, 19 Sep 2026 21:58:21 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:00 +1000
Subject: [PATCH 21/28] arm64: dts: apple: t8112-j413: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-21-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cMTjWQ2NYQrAfPSCsxwJy6m7qzo21To+mIsntW6H2OY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuP+DMftLnqRZtuGTlf3b/ValBqobdPzubNFVFO
 RcEp1/pmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPXWbYwMk/+Z3n3DFRUan37nVNuMtc4q8mc2s7MsW5H9P3H+FbdnWgx/xdtnmzw
 vucN5cprA1im5nl5GBpIXljl2/tp07eZyTZdgHgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..38d0e33c701c 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,105 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j413-macaudio", "apple,macaudio";
+		model = "MacBook Air J413";
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

