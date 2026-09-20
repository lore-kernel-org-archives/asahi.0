Received: from mail-pj2-f31.google.com (mail-pj2-f31.google.com [74.125.227.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57E3D1A81
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880286; cv=none; b=Bx7gAjYDDM3DkQynD5lk+mU+tXAwK563lwLSdQt997ncuelEWDocmeIhfiGW92scNrvHz9oAhuP5mdiu6dQk8DZ8FTtjJp3oeucOb/T7usa4SwSfZe1BelgtliLtrI1rMGF3ueea89k6BHUBX1qe3PGYkRCOQKTNEUHIryDu/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880286; c=relaxed/simple;
	bh=+B+jPv7EkmgtOQeTinSPKUZXk0Lm8pE7GSzX4ECkQug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGNs1o7HPyZOUlp17vJ/xjCf1DTu3mTekdOY0aBvzzNl/vriYx+5+l8ZDkbGC6JmbnL9Jflm3ZB6EDng4ztbczqUlrGfki3HauFl6zRG7/BpoapOxPFpPOpVODHOuJqYbUfPYwS5tOiXNAeuuSvfMFTPunOOfLUop2XofMYTeME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R08Q9ql9; arc=none smtp.client-ip=74.125.227.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R08Q9ql9"
Received: by mail-pj2-f31.google.com with SMTP id d9443c01a7336-2dd53691be5so18294765ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880283; x=1790485083; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=;
        b=R08Q9ql9+qB4gMCtSOfAcAkV896t0rWZEKTOW9xWp18x9zEfArk8OiUoZWerBlN9YI
         bGPfEEk1vqJzAkHW9g66PRX2qWdokuN7gX6hEdEsIHqWnxJwbhCzTr8eoq8M2ivXdP0q
         GdYuzoVzAJJhOuofnuKPtzRvuUZwGUAxOXUpPQotX91809LPlMVk17jh5N8o26i6zx1T
         GModQ5SVhGSu+R8xLZqAt7Y2yw4adOLnVANOxkEA/K9dVsxhbDb4B9bsXuA3QukwhyrQ
         rJfQsri3rrdtoGkdUwOld+nE19yEN6pFRwgw6ZqAul5qO0Rr8DuX+j3YB4qjZfe1wbNd
         rhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880283; x=1790485083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JpYqy9sPpPsDPZvvN4y29k8KbffQ5LKsND+nwCRIinE=;
        b=L++u6ZTdKh2pGN0jwx77sk8YCzQ28g0rRV9F9m1T5cZ5QSHFDLo0dJm95CkXAjYAFC
         jnM0FcLnwK3fYtn525ofU7L8oQC1X9ogN6z0dbhP/qJei5tSuizSoa9Z2Erh+XtJWHUO
         A9wjNheeapq+SG+4hv7Vf120o38l00YGCmyk4su2NQhBE79l3iJICjbZn/N7zw0yzMAj
         p24+lDqG4NZ9/l/pC3m2v1r5LScyahBJKFgJu5iPt5hK20UkVa5NrTCjWhlWr9NjME1k
         r6DexIm+4T9tl3G7t2q1RpwhZ7V6O6gUia7r6xjN39vkXsAYlNtoSerW5J2ZCftgtpa6
         A5eA==
X-Gm-Message-State: AFuF++nl/wc/FUnPbZtqTL94x5FR10lC8p/VwwrnlFwbDaGBcZV7qZ2u
	ym5KAbt4bs0IPMcHfCyjrFbhcG/AFOZSuo7nSNjVWDGl5sJd8eKCpqzO
X-Gm-Gg: AYBFou1tSRLkE3MExWF8HJH0i++fcw/Fgs8S8QArZUSLqdi1FlX/P6XW0+q47/5ftMA
	JJDb439oZGL3a9FDUJLUQYYjpDJiSpsU2S9mxPSo0eQ8TaCEhB954QusJukJMIZ+wdfMDlaQN8F
	F7uZpWl2RMV8Kxo3hLKFQ3jH3pukARvWytDOfAdJ3H+77BdBTpBnIB2kCkNNmThaywdf5UGa11z
	Ju7OZovcJkxn4INnpYvT4NLwZamC/vLvJW9vAhAqbvNFSFmTMl+hKqST7WAZVhIL5D78EAsspzb
	g1vDAjnEJ1qig9x2Cb6lnE+cize1nmdL58OuoXkTgSIZKymTh9NKXF0fCPXz2b+TPWcF92xf971
	HR5nSBNWRsAlHojefrP+0yvYWD3cbt0xFY6W77+3rxMBMKgt86i5BxW77pn0XSVy3/Zx/7q5OwO
	8VRrJ3xHyvXa6YlTtsoNCacndJ6021UKDoRsQ7vprMsYXtYSXxms5frj2opMzzuam763rRCoKyH
	wQpIU2jR3e4HuRA0g0w7myWXlaTovJd+0tTEvsDLI1LdmwMSe6DCK+mcqn58hIe9KerzYg1DY4J
	ytL9svCh/BAnALhHaELhPynekncVCDRJuw7r3xqfcEDwpm/9
X-Received: by 2002:a17:902:e746:b0:2d9:54:fc69 with SMTP id d9443c01a7336-2ddb1af4f8emr115717635ad.7.1789880283230;
        Sat, 19 Sep 2026 21:58:03 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:58 +1000
Subject: [PATCH 19/28] arm64: dts: apple: t8103-j293: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-19-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+B+jPv7EkmgtOQeTinSPKUZXk0Lm8pE7GSzX4ECkQug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXbFkxPfyYrYbfLomRP9IdrIjNM0s6zFdY/2R7Ku
 91jud3DjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSndjD84RTiVi2ZW7NbRnPp9WfFuqxsqkuO5j7i7t8hoHrx6ry2SQz/veWyws5
 f/XDwe6ZMEef9l/O/VSwW2V4xdZbzxF3FHRy3eQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 104 +++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..24d0b512fac4 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,109 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio", "apple,macaudio";
+		model = "MacBook Pro J293";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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

