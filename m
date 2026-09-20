Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1716B353A72
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880276; cv=none; b=j801f+iNS3xiubPHWEpTM9NsgmHPwi/5sV2EyQ1u5KHuastStNCjR1UHzOFHQQCucF8QCgzK3fjupcSNjxmyzv2uIABzL5M1vVSvh1rtRIESJu0byfrAmQFM/PDI7bJFtswLAw7DUaYc3RuxJaLUvfh3/zCX/q+AfKA4fmxMVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880276; c=relaxed/simple;
	bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYWJUe1Wpv71HiRptDcoqzqsHuhGfZquGg1w0IwcfIk4dxaPhPyxk2TxIQ1QZ2EEGOfXm2oc3Kva7gokyuHiOUnCFrhKBYUrOWnnOj9fl0xf7kjzTX7b+AgoTd1dY/i0c3swmjzk4Qk5QRjqLtVEJ9gLAVF9RvtjnsGf0VCYql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VseShxgd; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VseShxgd"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so12422885ad.2
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880274; x=1790485074; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=VseShxgdYbe+jl47Bb9vezgVntsC/t0WYFz2uWd41YAHT4VxcymtXg23N6ltPzc8S+
         tp1ZrU1tpapHbUxgVK7ezs8uoOuqMq8ICyM5Ee/nDLQoVKF4Rtbt1LktCg4ddNId8SPO
         TLTY4kujz0BWpcG0GGXma1zsrTh+RQqcoZPsQEQ/cokxydj9nccCQ3wFYjtAkhoOrSkn
         XBnyI6UAEmlVZJqrqfHBuc6kYVIOJ2GRJdAje4Gr26KMeyTDl2jMM/0DI2Pmzoi70KcB
         KkWmD/34M1MrGgJ38FmPFpkpcWSi7TWHEFxAu4EPvT6LPNcrtHwpC7fjiadNky7jWp+y
         clYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880274; x=1790485074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=uYVRY3ntC4rGg0eATlDgrOO6Zuwqo7OIZgWkd0Zc3gOGuma1sX4BDZLG0TGXJJodz9
         ewm+tSBp+JqrmuEYRYXWSMW/DGLpn8BHhTRDYgGqmcLD2JZGeIMD0jUDfSbHmT6jN3bB
         vq08fI63vAmwAYfhqaSOOFEUA6MfyDgSEuRBU5Dqo/vq0Vve/Im7k/U3klHBW0uIcd9r
         DTXHbEsiPrHrn/8TTGvTI/INJ/MsM5lSLVILtZ2D0rQomm09p7u22hgY3x+ccwkCWHy/
         l7Lf48LuZXE+xK5e5QRbS5CL5utuDp1I662HTxOoT2yDN1QKbu30Tr/Grf8SJmXjsaGq
         S3JQ==
X-Gm-Message-State: AFuF++mg7F0e2Uhf7MWMAdq9+F3vwzXgJxBhembR5Gp3U+Mnb9PvnCkg
	9eEd5H6LK2h+ebUTbrfUfvAAg1KpbpvnucJEeEgRoXW4YAOqSmyJBEyT
X-Gm-Gg: AYBFou2MnRMUPctf3T9DK9U2327m5M51JInUdgFudpu0fiV8w2L6bQWgRFKQi5qm5ar
	mLcwoWhHoFNVlQslc/tCIRmp+dfjt5BWmaCGzhBokjfbnxBFOuPeBuzsxmgquy4tCW2J94UlXbG
	jmY5ONOzsiKbVMaxddrur6HFd61KplyF5A5PVmkMDGZceqKbZzd1pViKWuHMaNoilB9cATP+Sdz
	8Uvonn4VL1h1ePEBd4TlA9rMySu+lWp+Sbz7nuH99lPYDvQ047OCUYi+zOcTdZLU4dQT29wJ7Gb
	RZ41hLldZaA0Fgnex+Dr32biUwjdbmBjb8J6NtwtuVjLaPlsye4Ho/4+PE57F2gvRyoLUBDuAIY
	nTbtHCPljcCa62GrcsWjDDKKOQe9L8JVt7qENeyKb+6n3cvi2zPD1WGLfPftXf9XO2V4j78vfJv
	VvuPrD6KkJhbYcG+Ou18O/V6CGE6k8NO5u0VYw5/40REKaL0mqiiiuskfLwApt1x1uGVO5L65W0
	rLuNq1GgCOU1uh9wZABgzO4JvDBrptl2eBuFGQiMmx26vVJjqnOakgBTwf9wmdZJJbK89qgIWyd
	cGaXl9fpUUovvlGxypXGWJe20iQz4zc2E38O3399q/LKhHA=
X-Received: by 2002:a17:903:1a0f:b0:2dd:c053:82ef with SMTP id d9443c01a7336-2ddc0538401mr56050135ad.38.1789880274403;
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:57 +1000
Subject: [PATCH 18/28] arm64: dts: apple: t8103-j313: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-18-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWb21c66G3M4JvHv35y8tKklc9PTDVZ/u9cp9Se1
 TM7LBnEOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPNLMTIMOnKCZnG5Qc/2M6KzS1409PptySZccGOP+mzG6/GRCytbmVk2J6X9P9
 4R3Mos7D4tdcO8pv3FzRPULvT+sC76gqvaqwXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 75 +++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..514dd56bc9f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,79 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio", "apple,macaudio";
+		model = "MacBook Air J313";
+
+		dai-link@0 {
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

