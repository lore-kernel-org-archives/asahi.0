Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1440B0F9
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094024; cv=none; b=TFbK1ihyW5t0+RtfhjIm506heyaLP4iDcVmfZbxxbY4Rnz/heeCC8PGTqaa7z/6HytAxfoZRLsXlkshTCgqrvYY8Q6+JIf7s1zY7AWQxlrfoCYmPkvlm7CS4QVkBiNQq8/XNELlwWtqYROUFgEvNw2/qm7C/vAc7eFkVNwC8OdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094024; c=relaxed/simple;
	bh=USmIbIxNd8CqGfdxvcD6LlyT9J8+ju7yBuayKmryPMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvIcUjYdoBcfBXaVyrvY9rkV5waNvsCXhOiPNPAeNsiIPJ8HMmaK4pSKeCr1uEjP5bUW+D9K3BRSJ0lVoDo1r2P2DOgrxuLK5kOHa96uGgV8zJIDdFJGVEJMKQPO8CnxW9aE9JhMD34YpgJmRJitFcsE03rVweeB2zdEZAYfkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjAmKN5S; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjAmKN5S"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a7d283e017so113082a91.3
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094021; x=1791698821; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=;
        b=JjAmKN5SF6zh7LqpYvnU5LDknxPvUs8Av04NASPkk/uttRowpm+6wj+oonfItEUtg2
         rAKvxidd/kKh9TBD1VTP38//4jXmHxZSJoQK3WdPkUWhOu1YS0kIq/SvNctaAf6etTWW
         K4A6eBWc7637z1CvtHrGTC6ILUg53uuI4ZmhpXm+sz0rsCBxxVTQGlrCH/p+yp1bN728
         MZyDtiSeJGt3v0BO0k3vOoJcLpYEhzoEtk2Pml/fSRLr8XE3vjvlxeEB0Ray6+TEMSi8
         c2Z4fp/L4t/mL1KZtCc5rQtolk2IHpTqTQzGoujXpbSJnh0yXbhC3hlJtisnSdZrJ22d
         Dy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094021; x=1791698821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9eRBqZKtThzspVubPXk6ZwkfjHPkOgXRwJNp+IkXIw=;
        b=LYRAoayhts5ZTCJqKsgnrHFMKL2Iz5gwUVvhvoF8yEc187roUanqma9Mvx5CwwvxSi
         1gI+KsU1zIELSPcwTRx6aR1Gr+3UyFX3TqlCrRhIL8h2O0+Re+g9EsDohCHV1Gs4Vnt9
         bkWxn4XGcEn7FkJoqX4i+pmDaxQ6CWnkaaN9Tmd9qsWlZ+aFH/ZJWbjXmn+tyKrk0HT/
         Zf1GAuOgulsYAUbvEL3cdVID+YoturkrXrcW6oXU9flt8PtZCjd2netBNHhejRtENyPI
         mkIaJsZ/pIng3TcWcjwChNkrvM4gMxrkrdoTFSrgLrWZU5KgCoqbicDup39CzvWFUNoJ
         R7sA==
X-Gm-Message-State: AFq9FYJ1bP4ZqxmnSoECvOq/0/n+QxwHKmeyM0oCPufne5Yr+zubK5od
	v2wWaAvULuCiRDF+BicXGDZQwqEuQDrsupKdKa/qkL2nAg1b5XIpzJgI
X-Gm-Gg: AYBFou27WbzAU67t3vj2WUNg5nmRMq5tEcAh1F4LoNdbZR+vxpxEmdWkUqu8ZzkZC1Y
	4STXBJqqbkFkjbueustgvMk/rybBIt8bgUIjFF6ZGmDbjYALAVKGPAvVo8Zd9kH3igvNm9/O/g9
	dCyB3ZJyiJZu9KTBo5GfT0U5CgNaGMtMYIVfW9NG7Cn+Fzzim/uTPJ2/70sGCqi/TAOgFgdS5ki
	hH8ZqGJ1UAM+YkCOB0aFS1LnWN4cC/Gg85ecE0H3Flf0vRMXt+TfAV9/Z/R1c17JyMtKJ/4nMWl
	efaK5MHSS2Y3fZ6TMZSTIRBJ+/OIIAShmYfPxDxzfjfbNdf4b6ahkRFlXQaBbCortAv3cUDM/2p
	26Fzv2tGbOvWVR08/okReDNwEnwOCZaNQdZDpfX/eT+HBrj2db/x1V1FRChCCIqiPvGH2Yyzm99
	18R3/ukm8rWX1iEK1Fy6sxJE+69GXzl6Or4G65So6IfFXHQjt5dp13ZGdwwI2QuKo8RS06Q8U1G
	+hyowz4riSAj+Z66iOoISS0l0/flUHeUuIloWTnwYL25vj1/HuPf54AqTKhVNOHM1bH+BiUGflL
	byTGi97YtUmNRbx170CBglkupcOVwoeYjYQtNgqU5XJ5f1E=
X-Received: by 2002:a17:90b:3889:b0:3a4:c11d:b78b with SMTP id 98e67ed59e1d1-3a7871846cdmr2805455a91.22.1791094020938;
        Sat, 03 Oct 2026 23:07:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:46 +1000
Subject: [PATCH v2 19/21] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-19-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=USmIbIxNd8CqGfdxvcD6LlyT9J8+ju7yBuayKmryPMY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+R3zmUMuv0m3bzStIRRUaPBfw7vqY5lc39fP9q69
 GiQ0rOlHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk2L2VkeLNmctGcwpI73e6/d0ZHPr/JbVZpJrXj04UazzW753Gf6GH4Hyg70+V
 tm82UkPQJjimL7NavrqsOn8xtLhGybFao409bLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 65 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..6c34fc86af74 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
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
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,41 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
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
 #include "spi1-nvram.dtsi"

-- 
2.55.0

