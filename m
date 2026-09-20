Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946093D1CA7
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880358; cv=none; b=ISAGtOccfiQLvEW2t3/fnSn3zNBCESrmzx0NrlSHjfYg9jkhiwTu5npSNqu+2Z+rG8MvfK7eMh5B4VQ9YJMxovxaQk22FvHciqnRsKN7w09j1ex/mv1+xLzPkgAsjn8nzN9APmqgHXvEAB+jnIodsfHFciPfJ8+o1Mc4QwVvLmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880358; c=relaxed/simple;
	bh=QYtiLlOA1qm5LKu0Z+66im/X8d3VR2WwNILFXW4q0n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKDJxm7C3r2RRg1kb1qAMn1ghY9euBFxQBH1z1qVCjGPgjASvfPUvwxQIMSitaH0RcipdeKStYm4hdj4WkN6b5jXQlw8Rc4gXO6RoBocjMa9xXPhdedMom1znLN14ODi7ZCXMgU/vd4dQaLFPSceBc8dUFKozZ62qCPjY0bJWWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF4DXArc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF4DXArc"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso14391195ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880356; x=1790485156; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=;
        b=lF4DXArc9zP3Iw8iREgrRX+wZ8n9oOshuG9gO9H8e+9hlqVsfjq3dcBMOQ6oFVAgfg
         jAsZdZecjaMya6+YHr2XKfhobLpNqU40nvin1TpmvvpxjPv+jihIPbCMufeTaoJiakfl
         jfRditEy9uUh+gKiSdoErV+SbMiziAsO3QxxOjIZvAO9HYVKq0byRQEMEq6qO4vdmzt8
         IYA4lscL5nC2/H19Ss5nM0Ss+QDQOx/dSyaGIRJhPjPz/VwSgokrW3Ftyepb4Fh7S0Fi
         4t38mHvKorWb82qtHotDMpYaaXuUZKYDcwGwRKknv7tH1BQip00DR9AdnzcDxXuMFj5k
         GX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880356; x=1790485156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=;
        b=R2QVzZMkZced0s0JxQ/CRz+2ERWNIlEHFxfbTJoB34+78V7YsEJVDy1lUTl2GKOnlO
         makJ1ku5P+emMIKWYRruDzXU5Wd1Va8N96JmVQnEFvoi5ktBU9GPDjaPM+LPEE8nm8ed
         xaX7KQCuluaqs6DzRgaA4GFJvq6h7GugEh+rhtq3Lj0xIBEnsqfsLbLPauUnCJ367X0d
         Q1bCU2MYw533t/J7zqg2RrX2IO6D81LNZXMVXxeNMob7RZRX2OPN2ToM7gofkFVkTN8m
         b9PieJhOIGsnKpYJZFn2/c2rdQgtQhqOnwWQCuQD2TxgdyE+qJmeKtskXWZpntUL6AI4
         KKBg==
X-Gm-Message-State: AFuF++kp+wtby9/MmVgIhR9pBNTJdUqD1nbEr6GVIMVdqKxFtMQ2lJtv
	A9GLIWHx9qec6mF8tq9A7nG9XmWEBPmEUbvkou+tJ81oZ15yN4ouS1DU
X-Gm-Gg: AYBFou3TwWLkehFfzT/6JoAfiqcQmmbZiSStqva4UoRVL5u8WT8I7uVyHblQZqTQMhz
	gwgNk3nXWkvGf6gYw1CNgZokECmfPaSSXHJK457lM0bVMb/ZW5MbJc1bNG2epGpGp3kGGnAzBqm
	0nQ0vpc9wRFlWZA8gmmhw9+mCISwAHbE4T8mSd6qQndo3GhelNn+1bYDtcCZb4kYU5qXfJY59RT
	JMAqH5FPQD+byzdRYukTE4nJKYMcMjU/JiVO1o04EwQrBxaexmme+gBCH6i0ik+8UurHp+k88ya
	ikLScf6yvMCQsGRbsdak279beFwuLJg7bjYqd5+Npi2rGrGATemKtYphx6FciRgUuIMpmsMXx1/
	kuEF8CHaymSkxb8VJrE3kfqVLTnf2EcPXReHuNbNAqBwAvxohusuASwf6zN0AOJ6L26RCS6DWHM
	EmX6f1UalU4xJmAUyClwQhTjmDrBoPVEpx17+qIFiUtmyYKWgCP9nS5u4e6ibh7kMcymutzXmnj
	dr5U2+B0DxjNcPRUSe233idnVinT/0agyxiIGD0xDFAQDhVuKjlnpg+dgZmmyVu436L3raro+gd
	BgTwR1WdLwh1MCO1wJYfmdsHavhfJ77sJ9BfKfSn0DQxbsY=
X-Received: by 2002:a17:902:e549:b0:2dd:c1a0:c7e0 with SMTP id d9443c01a7336-2ddc1a0c90emr52143865ad.15.1789880356108;
        Sat, 19 Sep 2026 21:59:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:06 +1000
Subject: [PATCH 27/28] arm64: dts: apple: t602x-j41x: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-27-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QYtiLlOA1qm5LKu0Z+66im/X8d3VR2WwNILFXW4q0n8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05XPTGNt3/WoMq6/4MYqMYPpp/m36vq7eT2aWFHVs
 GL60dczOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOt58/IsD4s4cR7/Wj2Vz4BV5SmBH5fkXHibatD78cr9h5NuU+l+Rj+ytw/sUX
 9/FmD7bVn4sSZ/P5WvdeS5Pp+0+dSuOPprgnvOQA=
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
index 631c54c5f03d..b42750fc9404 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..98caa29e3bdd 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..b945b75e518c 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0d4a7ef7dcac 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
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

