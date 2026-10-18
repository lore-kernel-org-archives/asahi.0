Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C4419FA6
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303029; cv=none; b=HTWzhzRTgjX6KFbaPsyFDft/3Wi59T7idFsCb2DLdJLNG7TeEJXIWpYB0OFtMzimFLRIOArh6IFjEcQh8xFQXkrvKYGkUQWnHuthh4GZmFHQrLcSDwIiQLVyEVx4JIubJeK3iHLBw0MSqynzVb024jjyraOtjsC0Hq5lf4BdOfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303029; c=relaxed/simple;
	bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKGmliyPnR2YjKBs4PPXclNGUgj/+talOQStykhaJe0gsUsDhoX8lOztIC/t5AsgMpxBum+ELQPOPDDwdi17CS5WjxSSfDyBYIBkLjnPd8GJkwH4MhfhKvypNEs9sW7mxIHxqCz5tWjf0bmwYgG2GNToRieBKz6jPny4/07MNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aga4fpT6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aga4fpT6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1455473a91.1
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303027; x=1792907827; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=aga4fpT6vMAum0AgsdM1cZ0UYVQCBAV4WHStje+DqugyT7m6XbUYAenYNr/kCWNYkf
         izMJIAhSFrOYPURdcYg58fDq0jTBbJWpGwE2+ZjiAMMkKy1bVJLS6iJe8cWTRiM/vwmJ
         DCFe6gWqP5/osCgNkkJdmmKunumZFqWtNahrIKWy6qKN38QpYW0HlLZm3eEC1XwUL/mc
         jHzfJ4hbKEQUZT1lBO/DIHHSIfiULP3ufiAOXFVGO1EcFXcDC5oTnt1KJn/h73EMrckU
         QETUcLMXpZra2SZqsOr/K0VG7ZD2L1fUYha5AoJjVuiT+hDy5aJFPAcBqBf7PvfLamXb
         StMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303027; x=1792907827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtLvsWaFWzYJWx/3MHHGGwSOHm7+TdbDYilQ89Jl+VE=;
        b=nsNOHrv9CMR7v3J0plV8Kmkw6O2DO0vAaaY1gy1W7k8m7+bT3zi4anI8t5OvMb/FmY
         gmn71Adr0znY3fXeJ31GsL0q/gQS52oJRTje+5QuL5iODjpcChyHZpo99896TYPE5FLk
         PFJMTlR1PCt0Vj0RuPfc+7n9csraRCbFDKZtDhQ11fPuux2EBWbZ6FGelLEU3hoFjh9v
         4J3KZO+oNc3wH8YdsYsyNEiZWsT3MoCA70+fl91GUjs+7HFodfYwqCVEnaXBtTxagNkd
         QkzumGkvs88Vxh1I0HiTsVpfQp4JVDsaec/un5MtYx8ewnrT4BhQwUhCOFFxiqRmBZ9Y
         wGyQ==
X-Gm-Message-State: AFq9FYL0/Ur0pEX6LlnwpaYfENQ7uBAAtYAevWopaCA5Y9eERyxTd1/D
	LhQvlEI3GLh9Z4vo0R93Tad8muwm3G4lQBARAD1XinsZA+PED4YuDdcX
X-Gm-Gg: AYBFou1L8mRVNOkWAQ/nLXGhzOGqdemvjCA74xxvzZffZesHYvMBv3Lc+P58P5HI7ZD
	Hl+eUZeNouCRG+5YI2dPD6tIvptw7uRhJg3hgzJ2OcbLPLSzXW57fkbj6aBCUO2fopJdgXRdV42
	yjy7cRV+MPQxbhNovBE76yJ9RTXwE4Q10AymiQxe9k6e95EVh6U8tZdphR3JK/mUV8km/5SMnsG
	Yccb2EPqgGC4Ihzau0jFGuiiFDvRKCd9HJKi7iE6OO3dsbx6kBVTh/NErqJeiWYOPnOC1PGxvDo
	NgYbnvGb13aq6jzi6JFaJplC+k2AeLi9gytv8OSZh+AJZZyXqzeNDzM/PhQaHPM/GBDNDYeOgDP
	vxurYZjqM99QFSPE+msehsDgdhtl54Hk9iKWXYo0TYejzsvb5khE18ozgZEwOJJYdTGawpEbr1w
	pKEFZgGMIVlE9MSVDi0kDuNMAL7cvYiPdjXe9k4HN4LG6wmWngg9S7YZBw03VY+JzbPDl7eiWaF
	q4QB4xB6IfYYiNtjLP1Ik1bI33NJYOnxC0lFkOM3b+Dgl8dHWWw9au7rnmfZ0nokwY/zp5HTxfw
	lqHzcTrQaaN3bLj+KP/9w1beCGetK2qxsoph0VBTZ842Zg==
X-Received: by 2002:a17:90b:574b:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3acef1455e2mr2608414a91.21.1792303026863;
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:10 +1000
Subject: [PATCH v3 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-16-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j0rOzFFEXjkMK4EG4U+SxX5aLvReXnNVPffFl/z+LCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vk0WW5rpj6bePiVjcsp16Lfqzil65TuCy+bap0h8
 FSdsZW/YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVR9xn+Z0QrbdPOTf875YKM+dsJj+conv81Y/chW//Ml2FFBrda2hj+J3+ffyc
 oeWGv1wFtZbaWyhtMj7/sNUw98ZvN44//Moe5TAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
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
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
 #include "hwmon-mini.dtsi"

-- 
2.56.0

