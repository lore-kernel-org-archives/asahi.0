Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0D411FBB
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093962; cv=none; b=MYpAX/B+2lptu6cAWU9QAKmy5ph5KSfe9AUPyxGHwazJ4SvkUTCaDG9ugjdREkPhQWRjGxKFmh7urjeLFp9PmS1IpZBWPgN4olS/NplHILxSTqU/BYKaPOySKbeuBWLRIYUbO9jauOO8pUY9jE5asVOSY2eqhIO8SvH2xKvHfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093962; c=relaxed/simple;
	bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BB3kZzDLB2g86YLZXOtAhoR3alt1oLyCFA9ceys5eJig3TnorDQJUhoGh/4QFyaRQ/yPC3TFQYk0+fEwZbPVy32gr+NFTWGsyYJJDj2NdptMrv5Fs/QsTBzO+qUmNumNNx0oImD6gZbnMed3KRI2YUZvE05jpKybxQ9To80OJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+jyuVuc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+jyuVuc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso350263a91.1
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093960; x=1791698760; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=k+jyuVuci8Xs36m85W9HPsHu9FF4TYlL4uzF93RtP2huO5peq6AIk61NYtGGM21g0R
         EPe2PZEZaHKiZY2nQ8eS18ZDP/JRg/qp+PN3uri/Y/EGS8HpG6sWomUMTDa4IETAXlyo
         5AIO9lb1AKwV9wvf5QgkVwEIBVr2tkeMkpOFGml/ZR/ns8oElZItw297m1coaOiY8ipf
         C0S7LPBBky0WkLsoO7o9m98aBHR3byA8XNS1HrxIULWCDJQEIqdLSnadgbwcU31spyuI
         QTe2zlip8HgJBuyjG4kqtPQOoUR22uuECpaJ1Y4/k/jhTia7GyqqEW0LEEj+ceoJxNVq
         qzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093960; x=1791698760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCPGuiYL0vLRXDDm6MOp5xoRgl7DVlYqvCMkReNNZVo=;
        b=Lb3XKJ84pfzh886GdA77DqUjPcevvYyi22VoW8zJ8cvdKh4plzoN2bNR9iyfwMuU2m
         DhTYqtdozeydKsX37ktNdWGcspBQjBMZ0y4Mc4XhcDdEOm/0fAAmDog8pY+XgNpUxnzK
         98AXeZZ8dhbPh2iN3kH6c1ZXGYUwZLioFrS1h3XzVaRdDLvDoga3N2KfU8tyNC2WAdsW
         O5B2j/zBakTtxLmFwOXik8ERVkWF56wsiMmSgV0qZmmLIz4ShNlreZFtQJFsYrmZjrVB
         q3vp09yQbZQrSG14F3el0qE2t37X5kQqxjuVxwRRcABwIltfzCOtFGYcBNNBoRDK19at
         jrLA==
X-Gm-Message-State: AFq9FYJsIuMojQ4KCMK6Lo+9g7aHdBtpjg00SY2Wbe3fRM5mtFFzJ6BX
	Bej+EY26xUkNJu3/wthztrVj2+FUi9Llp84qUkzVp5KijsoGZS89o1si
X-Gm-Gg: AYBFou3sOp3YqOWWBfvD0hxUvSfFJ4FR1lk0vMroUSbzZS9WMO6Xwv4521N2HWsSV/1
	cs9SP1y3qa2B5LZfgO4oqoQfnLVXTGRztQXKEPqGYFDLmw0MGmJrbeC8Z5r/itLYXiaRD28hQU0
	A+7F8ndkKDELReDBq1JeDG99afcVuhJJZEPTM2UJNrbm1+3JB9ypaGPcOmJoho3BExkL1RpHUd/
	0GRdhpp8G7BORNlAwb/5AZgv9lJvoC+WZEDcMQkwNn/YvwWlYdEqkLU1sUe90qY3ya90t4Lknnc
	UrTz0GItWZMXKQnp1ThB8LMyYuXWGxo1pSExaJj9h+pdlIoZ7bCixbgQEDFyDNwCTOdSEUL/62u
	9/7t0TFN4BGPTOW+a1m9VrbvOt01n9BHE0yS65oqVMTxb5DZ9taQIADs6u79dXGr+RYZMHGSr/H
	DGxGZ3lA6jJryK7puOjoyGQ/AR+CBUKGGU6rSIXWoQBb8rV7WtoytjPlh8iw7p4Q0b6WJB1Xf65
	Bt1UHRgIH8bc+qYvftfoK9154llSrHika9f9w8cXBiYqyiWIfiwb79CXwWZo+I/Ehmjm/egf61e
	LIlWG9b6QIRMIqWsdcw/MX3jfQMlorO+0HWqRtKcfy/kvE4=
X-Received: by 2002:a17:90b:5345:b0:3a7:1339:c454 with SMTP id 98e67ed59e1d1-3a78750ccdamr3295837a91.47.1791093960302;
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:38 +1000
Subject: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mJddJwm7KZ1uNbWRbS6abM2+DhqXtUFRofNbxKEJICc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Ty8flGpH+8zah85ePzDT7f9z23WbqmeWefwPw0b
 e/0s5crOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9/iLDX+nXfjbNp7y3RS+TkE1IixG9Xb0+mrPL1rbCq7zroWmjG8P/GF2xxj6
 2/x8j8oJjHA7z5xTVMWwJWZyd5fDw08aS6hJmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..cdda63ca8b34 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,86 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
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
+		compatible = "ti,tas5770l";
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
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

