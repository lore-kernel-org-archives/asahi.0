Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7240A938
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094030; cv=none; b=bQLK8zmMfnn6MZ8NSeJv3qqtMsyJPfoZCczpdTyIdwNKySt9e+D1NL7Wey1azCWo/xxdMSHUYb2j9SuD0fl1rRm3x+7lguBn5I6PlDmavSFmX3fnppJlPBTrLTpjXqeEwG9PYuJi5EAMyxStucNkj32tGn65ITdKARAmnroIG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094030; c=relaxed/simple;
	bh=gcEmnx4AWZiPV2AjRp0zlkie8hCkMFmgpjBnY4FNmw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3D69niB9/CCWLuBSVtDqFidv1P6L8jAG8gBhFTP3pFtewWm8Fbin35QOdWYPNDnv/TdLjlISj+TuHnoDJu/g7Yza10rbEk3OswTpJRuCOPA5yzEW3EgKB1dwvUWsjcrfgs/NhHlK0XTfwS1Hv/IR+QmACju5754kBp4vCeN9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSk/YDjd; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSk/YDjd"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7e13e2a77so32082a91.3
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094028; x=1791698828; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=DSk/YDjdsfkXyWx9ZJ9N70GcKdCsGtusqi8x85/lCD+lkVDHi15G3giLl7liR/S6z9
         W7rUFqC7hisvRYXe6JHPh239V3UnxNhFpu2EWCnexdbvWv3HArp9ViURmtVKP4VMuFQp
         6HdkqVdIZThdHEocOdpDaGyQgheLkYVPJYyv/kEuLcYmWxmyZ9RPYLpZg1xNS5XFA/DV
         NSG9pobvXFvQRnjhan2RvhLeqA2hISpxbXv4v8loqZL8fEWIBocB9/inM8mel1RWalgu
         KK+/LLtYJVVPgUhF5ILhLibPEs5bdjpoketXJwQde4/gNKuQ+fD4ffiQCRvf9Vej5VmE
         Ybkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094028; x=1791698828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtNnhUCvwBmA1Pd0xS3AXh7wfPALnqbmv0yzoWp+gA0=;
        b=iEBFm7MdtOIc6NlnbBEypW6CDBywgYMx2P9UBJ+YG+r016HIa8549dQ5xbYBmfVWQj
         6EYBIaGJ1lLidp4hgYI5qHCTCUtkuylJuPGuFrCqBcVxxfOgeWYY/r6HVJJdxChrwm/u
         bM622vWWdGmxUEKkbVDm0qlV5/mUuZ+FqGpqCh4b0RFwobchmy5OJTypRRsmLzKTMe24
         3mdmrCOkvIoMoZH2ERpvmj6cM68o7PuAOtaT2e4Qw2ol7KAp5QaaiDWwCVf76qrFkvm5
         r2lywkFQSGrnR5fVc+mgmKOeS6T7iaDWjfRXinlVrB7rmbwZj2nFlAyL3U/9mf3EniZm
         ilhA==
X-Gm-Message-State: AFq9FYL4eVaoScbS5By+wDBzcWRwgieS6EErhrmMOqMv3KqDa9BOvLhF
	iPO29xz97ADITf6qymr8m6wNfbtzJDOqS74Affs2WzZBAIvO4WF5S4Nf
X-Gm-Gg: AYBFou1Kz4U2kygt1ZfjRA7Uz+tKrJ/8sgbZFb2+upUsubcmxGSvxjwJ9RFG2vg/B8w
	k5Hvc+agZIZd0rnhFyepMTTOmU+mR2NlGjxGFKamRXdNTUYjaBN1qkTxkaVXr+uURCvZQli756Z
	khm93aNZbA4s8PIiMx7pDs16gN/wNw28njm/s2SGCXOkgjpe8u+kWUbW5JYAmp8pRCexoCRJ9aM
	GnSE64pwjvQmu//3rsdER6XaXHo2lirdKfZOq2y1yPMaIHhFFp555a5ebIZ16NR8rEK7saLKCX3
	E/kReH9DObXKG/ngCvXbV6hv2YmRDwiVM5lwiWvsdb2UOsetP/QILjukzCcrqOmrLC2QynA3Gty
	pLFq618Ulj2B7qEjXIlEfOtFN+nXZXX2kSe9NCTq63cGcNexhAbDaFtyF9nAqnWTItfQv5kzR4d
	SyI41RWJDrm1XR9TYt/BKPGXRdvPo5hAicLoi2qH2WrIihTRQv019p1dIzP3Y5jFwRxbefJxMRp
	cTZzrBIN1NJ1+liSP4ltPfs2V6GXP5t2Db6r1pinmxGvon1ZgaCl+uwGUM6ZucX55xbA+4jyfGL
	JUTG1MHQzXHXFlDb/lUxandicPjQYPNcKimmIlo8oOsv01w=
X-Received: by 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr5172343a91.39.1791094028414;
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:47 +1000
Subject: [PATCH v2 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-20-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gcEmnx4AWZiPV2AjRp0zlkie8hCkMFmgpjBnY4FNmw4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RHeG2cdUNOvI+5MOZVKn+MVrvVx4OTZhY9W+sw1
 zhwynKjjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQfX8fIcNHTODT83Aq+rLku32+9V2lzY+za66QQt6UuLm12cvnh9YwMHR3d36K
 upVVnf9232mbCnOgoM5NJFSfvCcT+3bzyZFQcCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j414s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6020-j416s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j414c.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j416c.dts |  5 ++++
 .../boot/dts/apple/t602x-j414-j416.dtsi  | 35 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
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

