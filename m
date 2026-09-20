Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF63D3323
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880322; cv=none; b=aiv56FcBh0qjPcX9BbXIl9kroAhffOmaz31tBPkmkCuNUG6RpBPZKYJZeEji8OiDehZbqg+39zQ5XfJD7XWIIC/FbNPjRavNmoVjjO5XgQ5yBSEC9E9mrAQuIfmONb2aZ3m6qwJ/CBZFzUTd+Zocko9IYpHQvyzzjwqmRH7GKwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880322; c=relaxed/simple;
	bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOjCfndnT5CK5SklzmG0PBLA/497pKrss+Q7BONk6lMC74tn49E+AnvMVH5P8XtU3apoWi9DILsEAPlvQZR4QXtttY/1BtfTbvOhlxSEHFYUnbi3k+3U3uf5VNXSmvigHfMB7rKPl1/79cKBZSLMmuonGhGZu/a4b42Wyi5Kbxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF4q6uX9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF4q6uX9"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso21889875ad.2
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880320; x=1790485120; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=AF4q6uX9YjHc8r2QGlzHctIb0HLOr7+gfiQQcDHRERc9MLgD2opqDlZG75ueY3Vozt
         yPi92PMYand71vwZ9Ais+Dpo5ibbKhJxtw1RMMT860l07zfdIF4TumelbcbdOEfDoJcC
         Iv7tIds2TJVGZ4NBSObQ6YWq1gjJaizJCNxDsCbDl72SJ8j9eWLuELLal3ih4ZoONs7o
         bVwFeVbTdQhUbOqCbh6h7F5Sz/RC7WPxInO4t60ubhKB4efBTg5m36hWstdBdUWATKrY
         kXYC+wlWpLsY7uUvLIQ4NiyQAmeBS+qeHwb+uQf65LcVKzjrMjOhhqt10wvrvRRsve1M
         /EJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880320; x=1790485120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ojaG0e/MC0OxeKJgMYBSONXy+QRcCdaW5zg7jxOvgg=;
        b=hACT3zspftycP/9XnYCHrLsJ+7rZtiJTyLM/UFWgVSmS4vLq6WlzqPytGky1uYbkuQ
         VkR9qJEsTvTJt8y79cp6+bC0LBqwAE+aPdo0puZoNsVXgdE1SEKrcesa1Gq655W5Tc5R
         qBjkwoD6oYwKGEWmsOS/npOchk8l93aV3b2CmPz/7xfZ4wOu+ccQyQpV9FxUDISh/e3A
         r28RvLjKiHS4l/D8Vy/56hvOVFDemSjY7zIcqVkgAqPC5IAwrK6ceVDmbaOFtbqvOQfl
         J2QoZhdsUe0CuWzYlByKLENl+7fekB6SkkCfdNLdOvQ6fKWMwgwYqSbDZovlgg/7IyM9
         O/Gg==
X-Gm-Message-State: AFuF++mnAncufzYUuWPYIp3mHGpF4m9PMuN1mK2d4d9ltLu/dDtFduAc
	eF0Rc6ajEz8fc1d/iklxP6Z3rhLt+Aeyxw8Fpkanyq7UenHHqUHStS/K
X-Gm-Gg: AYBFou3MOVDxHkrIwyVQoyCQhchHE0hxM9OHMTLlZRWjcAGTN/gKOjvO1NmllT/Tr4l
	ZlPRBfxpqwGzo/OTujlRgbq2TK3dmXNBow56kOtfupqzl7PjZLNTBNP56fD+tgjE1kDSri8zfog
	DhrY1c+kOcwrHcpEJ4bPj9y41eEhREzxHZB8Kv33krFlZOlczP1wBV0y48b/d5XMGIDnelQRUcN
	t3kJJ/xP9NnshDQACzvFMQVDsMC33yy9JPXw49KVskVu8A2oYXjqwGaE0wfUO2mQMh6zz+ttZ5t
	6XSNtCxcMjqZI4QUwcICcrQx2Pbeh9xePoP2CRcg9ps0hQp5vsViwmMc3Gkcg46uT4kt3eszGrK
	wWjgj9g6OGCByA8b51pB3U6oxkldlloC8N0R6I2/MKMtsy8MdZy5zrODMyiT+Msoj8Je9zB5LSc
	FVEqjAh5Pj5ADNRnSkk8pRzRKXiYYW2h4XVU7lJlqIQncadExW//UASHnNuBLAQqCCxPN7tDhJK
	JcTon+XzYItNtDbUu9Z0CDx0rvPSMIpPaonYvNg/9hD+d3v4h9vJcD1+BXtKgSxXt/IUSJNqZnH
	LIPIn6nMzU47ElHl4Ylan5vVnuceYtctcsuzwm7W+h9gD7U=
X-Received: by 2002:a17:902:728c:b0:2dd:ad74:ac1f with SMTP id d9443c01a7336-2ddb1bb26e7mr76373875ad.26.1789880319821;
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:39 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:02 +1000
Subject: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CU9srHz2GgdK9c8dFe4loM4R0cHA8ZEmrmM8hXKxyBM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VcxLh0uAQ6FiSlzpQTeSvnrh373E/mvGIyzzXm2
 3z983M7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 pGOsY8TAxSkAUz3rDsM/ZaXESME8nayVqaKSDUuiH7OXfN39fW9z/Qe1+UohogezGBmOzPm6p4P
 dwPaF7e1y78Xaonw8ektLpG0KnYNSTkqcXcYEAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..50088283f2e8 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,59 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
+		compatible = "apple,j473-macaudio", "apple,macaudio";
+		model = "Mac mini J473";
+
+		dai-link@0 {
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
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
 #include "hwmon-mini.dtsi"

-- 
2.55.0

