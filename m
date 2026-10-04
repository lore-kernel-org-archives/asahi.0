Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA13F5BE3
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093955; cv=none; b=CWQ/aHcnP0lUsXTdVtVQh1RcHEm9B2PXVra1ZOQ7JykTFU3xpA3+dWa8N62jkqncbZYjimlQRQxeFfaWgkVKjdK4MKgaSQlS2gPr2KRWenLmFsTnmOEgVsxZhVCJJ5qgIB0SiDenfft0RXfBi5k5N4bYuDEs5VxCZ6av+vB7Xa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093955; c=relaxed/simple;
	bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pd5cOHtA+qGWtcY+4rDbMWdTiRAKwlfK9bLTrI62dw1JUN27HXaARhULAy7CcyzDhRc2WTcoOTBokYM8XM34cTJVn0do2/5JiHg/Vg0UNVSJEloCnX8gZXiV9BvyktAAOS/0h6DqfOa2IFN+YiAUQxrFxP5OW4+sJmFCEFGtN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9oLCoaz; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9oLCoaz"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so262188a91.0
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093953; x=1791698753; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=K9oLCoaz5G3kafgP+Yh8Lg6WGeQI6qgtfH8mxQ6pYu1OJ1gLz59MbUK7B1xMCHGWiX
         vqem7HLSMpa29yx1bCeWqNona+I++Vgv6MFIiXysDUqdbD/axw2LAZda8nLgwRYzdj4l
         hF7TbPCY8rQGBdi3M854ycTxCC94xxupMyFMvbBj5M+IlxyxfLi1+CTQyksz4x1pXNGx
         QAa0W1CUzPcCaNKsuYOuKnnTLTaFX20r2IQXVZjQcHL3ELA71IvpcOtUj5L/9cKsiiIT
         9qrUovPw4BJymUbo5QSfJVj1Qt5VfqmzAXYd2n77LcjM57Iw3vQhDlTAYreLhbHawQyW
         2XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093953; x=1791698753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=NMIRaq4qE/+lbJiqzMEN/XM66kJlPyo4fUFQAJyV0PUMz19GItwpBgjyhd44vAdmj1
         W1nw8mZiy6QsYRCPUAtDL0z1jVUl9dspkvoLNo5DRuNSLYTTN9Y8l5TVrpUTzPy1nvXD
         ZHfCLdbzkeJKkv0RoDMlJCbD/LY3imCdGsK5WFKf11LMtqpM0O9t7EMlsqbxdJFmeMcJ
         rZcMDTEhu3tGTGO1nv/x0BLcVL1oF6cySxkttgt0mS1NvtwO4eYU5W8Ovssc00qR3ZUy
         pVB3/NwzflCbwY2q7NPWyn1NpRvp5M2YlS6Z+FbvnaW991kCsorL0+cKtz/MEdCg9MAM
         w92g==
X-Gm-Message-State: AFq9FYLAs1g0Yxm4kLThB12yglRzwmAKpSVIcgRPZh96IqVXEGolI67R
	Qe4/Yh0x98t2hhvQZLie9KQ3EPaInKofNYMW/xnxBwxd9r3NMJG0ELHUQli5WoXk
X-Gm-Gg: AYBFou3BceHzGqWRSukr0t/AKT24t/AjFmOMKGNABYsbMeihUA6jWJwcDc8cndYJz0I
	5DdscPAyvhRYwzcZFPkFzPIB9/nTD+FrPrtJS61obllDiGtlbn6S/LnDVPFuO8EU4KZrmtu91JU
	OqyZBG+ncB8szg4PNKApnjfUA7e94fSgnpg/Zbn1lgDeRkfr3mEN6RRI9s+TR8M+SSA1gOxXjTH
	zes5GLh5m1ZrLnVnXAvLsVFbDJ+5x/o5/p3oiWnv7QuLneSAAEdtHtzDJtT8CSJ2hMGgPdnGi4k
	shp6+KnwovtfXGHucMfExV+S0atu3tBhv2Yy9xlm/K+trtlghmcfdWEJ5GJm6dRInzS7BuA6jea
	RjuCnnCwO7ptJh183YIT3eARCOvhPfZVVtiXCPLQsopeuLsDUccO+5qSJGUBV3egux9vcFmiXVY
	5sN0HQ503sriaQpEpu+QrXBdHdH0Jf8NqOurZKQRebeyKI8CKz7nzP8Y/kJxMacI2jKFEl213jA
	bhjIlg+gJ46PGPx5MNXPsg/sMYfqVYsXKZq/4KYAbBgl1LoDnJDQQBUcDitEmej7PvspETq4iZw
	TI3ILFMi2o39VQsGPypZyP51qtpiLX9XS12uvlHRJphqLg4=
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr2965260a91.49.1791093952798;
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:37 +1000
Subject: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QWXGpdu8z133+eZ64Lnup8sujus3zwc7tQzqf9Y
 uuKT+Ws7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEw1Cwsjw06nGQ5barf4Td6WU/r7ituvn5LT5msFFjB0rn1gLbuwazsjw+w1bTU
 7D/Zd69RfL6+UNX937tHpsh2djX+uCe0/ZhtfwgQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..6121e3a89a0f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,71 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
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
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
 #include "hwmon-mini.dtsi"

-- 
2.55.0

