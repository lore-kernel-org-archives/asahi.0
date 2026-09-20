Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA193D3302
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880366; cv=none; b=JXUd5yHAHwIv/vVOFRvmQOAvIX46D388me+9heJrW+5JA5dgh4aMtvUksjdH1Q4TmkvQB6GTm5A6uLe1zcpS8pIlUvRcE1QzghoUdkENFNbL3B/h1N5gzRtgtiDnnr78mwjX+8Rp/VSJhF8yOOCwQJDWYlZsqKC2bV/DucTu3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880366; c=relaxed/simple;
	bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B72prYraeYQxl3MadxFktlSglutf1/bBMoRg9p+/7oALax45tAzCJaiHMkLzfQTYsxhnNJU0T48LXUi7rwHzZmPAvfangPTl1eFMTLrK1uzV7Yuyzi0WPH7/myiye1cWQ8v+m14HzJJoHVzDW8Cnm+3U/aLqv6j/KP8P+XDaw40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXlHwyhC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXlHwyhC"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d9004a1ac0so12574615ad.3
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880365; x=1790485165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=oXlHwyhC5p3o/vEfgzkCWSfDwVx3j43/UC3ZarEx/QD/0kAD8Dv1xozPDUJUHTfCFA
         EN+kBRbhlx9QPR6iabEnp6p5VkTNjZKUdhpFEfy4AW344U6Z5Zlqw+7431jrfMU9DA+O
         5EkgBPl0aIDGtu/Eet2hAmejemLxZuWEI4fPORhyLEdXKRCiDoUNw2DOi1mK/33uC39d
         iT3xpq0KcX1RK69UoeWP1l1d4Td3AHc/BBJIPLTmS/p9rfPkM/D4Dji+O/Jkb+kFYlv8
         IrGl0xxBS0bNIp0r9s/kjA2iXtNUwpy7CpBlRGVakw0Z5/qO8G6hRWuyLjNZdFIcNQcz
         J9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880365; x=1790485165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYHqvApWBxaD4bUAOaE882+EY9mUZ0r309+FWLunq88=;
        b=sE+Pv6XMrdqjkUZkIrOZCUm983T92ugsZ70vb8kH1DLM3/U93qi4YNsEKNp7mdS5ku
         kQvernkQwx6uBnnXgYEu4ToKHXeg/C8mUG7RgfhHKF0+2PMGsjVu+s+O/W/khKqBalQI
         2oyzp2nB3pEYRLETxUnHC8RASZmX+ykEbbgWzMiWtySPw83N05x4JsJRSZJIUgVRHeXK
         4YgsfjGflEUnhPzjVJR5ruwQphI/se7tPcaFUbeyI4cUJB9I/2jKFl5vCg3qZM7wmknT
         YWRI0mh+4iUeYQHwQ/xGXIEVa1J32PlBliz6iERUlVHjNWs236iV05nYIzp3MU9nH+x/
         ltiw==
X-Gm-Message-State: AFuF++k7hgxSH8b/v2WnK3aQp6DQOqX1xe7bCbCSdrtGQ1XUxxlOO847
	E02kfk9pfVEODUY9Jilafxp0Q/Yny50x5Bkm/pA1sRIRl6rZ/i32TT9y
X-Gm-Gg: AYBFou0T7/+afwDABOzeyw9ksNLrOGpblp9lYmZ2UQNen2tIpEYBctMJDqk609e5Icw
	vNZXdbDtq8dc0ln8YEvOLFToTqMHok0SuaTrvJL64ieETjaMKCr66TNe2LMo0cQL3BkyI0jkvF8
	cIuJWUqTIKqSJOAGFXXvqOYjGI1HBVQgQ9gxNRAHzmggkacdg4UL8nU2voa2juohPSVpek3pi9S
	a9YzeS1iJvMBTd0wu7CB/onlYwRCrp05QVzXTs1oR17iN8WnjMTxChBBYGja12DrVC5QZ5W7r6p
	YTWoA409QaNr6xijFPPNLsp+CMOXa5Hr6yAXmG+cySF+J6+d5hZSAxS1O6nLoCABPyNqqE5auHt
	Zyx/BTbboqXStFJwk8gvxh60KTXhfXNBRr5UEuysRAc+5OPzO1IP9+YbWd3TxuvDKVgR3EMp586
	VCdQcPaSrsSbXsqfBITtvl0tVRdf5ARll4zBr52V0pgeJsaj5Xii0sPquZQz5zNmL0fHwyvsW27
	VMwHvJmaWdh/at5/DUbKe9Eg8Zmv3oLctdhybgv6ZsCZLkNp+wO1KLiyUG3C2w9VW1h0cKeOKjQ
	Q/i7PBNwPaw0ow1sFyCC7WeG2LhzqhyebgxuByLD5VvL0OM=
X-Received: by 2002:a17:902:d4cb:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2ddc053e14amr57727015ad.38.1789880364897;
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:07 +1000
Subject: [PATCH 28/28] arm64: dts: apple: t602x-j47x: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-28-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wZ33HmVJ/5Act5G23FfyEoldMO69+O+FCZBZLHA6YUE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VFbxtZ2sxO6rz5yvjZ5FtlffdnP/XfybTQ3vFf9
 vQgWa01HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlebcbIsNF/880JArN/VbEXGrKU3y9d/+feZy3e5XYinUf3PvpbEcvwv3o111H
 9zCXse1hj/pyY9fsPb83NyDkbHzH1O+07w70vhgkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..e79315b15f11 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio", "apple,macaudio";
+	model = "Mac Studio J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..8aecd23e0ac3 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..91ba7c1d2612 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0

