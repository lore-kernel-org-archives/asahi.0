Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049633BBFD5
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303057; cv=none; b=oKElcJwjlGad1lyQGS/kK4uhqcktJQUYAvrxOR64Th27o2qy5TMKrNaE5gL59T7S1b4k7CL4O+IevbS0EuLu7bCd5nV+fE1EmZT3gnSJ7mDqHY0bfsnIJYQAIvvy7WuFWoz915hApeSfmjYedCXwyJ3G4+3gmtRkKvYcHHBsRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303057; c=relaxed/simple;
	bh=KWfosToe+XDrj81BrY6Ipu7Z1wn2VsvneWja6aQY+S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRWYwW4Bfr6IgsudQQGi3Nw6g0G9iomW0zeHyf7AGUF3WtarmiAwe76V1wP7r0vb1S4E9Z8yvoR7LgWIhYY3KkwP8qakBgB1ZJOcAZT/oLpX/P4XeoMmUBE/WOYxGOUqsYctINwS4XdRvEXHfdB7ejXGcIGwgxI/otw7vwBTF8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBZXhBBc; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBZXhBBc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1001589a91.0
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303055; x=1792907855; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=;
        b=BBZXhBBcQcTQcpltkhVtQsgTRh8I2sFgNhdfZy9jtr2o4SvBdnB5RCRjj6n0z9buiK
         7edWrrWkq0AGD/no9ZxamBibbAJruzEG7fGzXuXeqvQqe/6Tujv3wC4ANlgtm6+PUcbU
         IfVtoIqTEUWwF2fRl/FJaKrpgh5RfrshZMUJooWhgLoEXxtDG2Jb6UUaFIstP2mC0BQj
         AokesHWQZh7LwXGy47It7dLnKfzYTptXS8VD8Lk1eEQQbpQRnocGSvCdNyfRKcRfhYHx
         c49BWEO2omcHtmjBGQXohmIcUxq/UySkU88Kh+glHnSdp7YWs3KqRZrRo3F6PGJPPBE6
         tsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303055; x=1792907855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=;
        b=vWB/ey97t5RUNKWQ33ob8fnAPpPx1nMSRLZjsFr7gVLzeYoT69+xzYF+dWDr8NurDb
         i9gj73Cr7JoYB4NiahpbOZh7xuyCcNunJ2RyDCjWThBwqkUE2EQabqf+oE+f7tF21hsP
         CwFvkT2uMFtiUYFZiMotMR25vn3Zhn//JV4Miyfw/lZpOYMQGfEQLkGxOFeC/CNdCz3D
         mY8rltZZgV2eGbJRpQij2/oi3P9fBfWhyktuLevZfcyfBPmdXGdnFTdDlzwKgq69wumT
         DTKT5n8NLLSEgjeABxmwV9QK2JwiN4dKRehAZP4BCUkA4+RgZcAQudPkJ1LsY+woZO8V
         mSnw==
X-Gm-Message-State: AFq9FYI9GOWDs4zxmf//UDUiz1eZ6IeUSCjDUhAFSyJfaE0V2qin25pW
	VDuhhy1Oli89M+QHMQw7TPzq0wXJ4FIVTwMTSFpauGDR4s3UnDpDq1wY
X-Gm-Gg: AYBFou3vEGprQ8Knqw7Amx1qiRXUxLRrTGVZSzP3OlWXpO07GXIQFDFxBiKS3+Hmjg/
	7+Re0es4X5YdX/2pAA1QXNdwlhn+WIwvuUZREW9k/PaRhIIAx0kGbuA4WbzGviYDvxRcPO1zYp+
	O9BlHjMk3BV43sCQFoTQv0tfkLgscKSEvltMhvwupYLyIRwT+cZ3liH1poh0l+6IRA5CkJU6y+X
	94FbkxkTKS9o3tG7pv2I38dvwyo634cnvZ5ohPD3L6zr7kBUzgejhBk8nQTGp2WBOBUdgS7rksb
	LdbpMpZrc9eESiD/5Lx4p7IWyDn7HJawahhsvQ04gZ5RJf9Abux1g88VFl4+K3x3PxB8LHeRmmT
	TRzIKeEAWbKh//Yfd3SAOeIrUMm/TfRqyKvEVnRw5IWOVTrn2aIYzW4tSNLvCjLhAbFT7UYd0F9
	OZA56Eig0rm284XLklM7C/2wHh/FaKRsfR2lkkRqgMcq6uXPjs2VcO19RC3rkYw3PKdXN435Vf8
	Ka/wtSEqLNVwm8SYnZv6jtgNDGY4LPs/N6X0my7G8nyDvxI1nZNafx/Sa8DDMGyD2R0pGuYlSsf
	iAhTRyLzwkjyPnM0L5Lp5p8qPdBdoFX+FejkgeYnwnTwHg==
X-Received: by 2002:a17:90b:28cb:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3aceec709c0mr3956469a91.11.1792303055375;
        Sat, 17 Oct 2026 22:57:35 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:13 +1000
Subject: [PATCH v3 19/21] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-19-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KWfosToe+XDrj81BrY6Ipu7Z1wn2VsvneWja6aQY+S4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vma2hU3a5esWNttoHKVyYa98MeVS8edXolfkz/0i
 sPBPYy3YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW7fzMyfA1n2z7hzuPv/CJq+7cz/NLqmcXDdMGvarktx+evZ6R5PjAyzCvXrlV
 jn+7trH3DYkdb7Gtr+wfKHWL/5zqs+pNz7OtpJgA=
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
2.56.0

