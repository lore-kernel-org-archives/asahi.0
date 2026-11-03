Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691803;
	b=eV74+EiJxhy2ipR2ytq8f4xSamOmf9pRM/Wm9CLRhqCVpi2Tmm0HM8R8B+tR0yEOQyWk
	 zJ+srOH75tjsd7DNm7tVvRrgmsiP6q90HoDlCbgSaH0LnthMhzVgbvDuAWvhxOfL+loKT
	 Pas2iF5/NfO7+G40XDC5j51Ll0nlQ2RA0cVueADGFrejky0+SPk48LmRYU1ecWsJqHPyc
	 UNzvGoSIX/jzv6vj8nwED6qMpR5dPZR9GAu6ZkeFC41WC3eBXQcfJl1NOtLiGOS4Myzk/
	 EDPY78sLKidsz4XNaZE0Jboi49pItRUDGs0I4AjGMWBKi2IxgwlqwEUAudnMEd5GF3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
	b=ESfQfwiWIzHIXRMikv5hdRc9uyAJgTph7pXnQCFUPpaKVQeKImdqmKU9zMGX/7uue+qt
	 VJO/kn/eqTuF59tWKhRZRL+IP1f5tn6QLSJkI8CruISPAFYUxh/hnsJsZzbJt8woT2hFg
	 oxQd8DbgWG3GQnxMBDa85q8REpdu50BfeuSHZiSQTdtzPOm+PRk1N10Rn7/gQMfHqy7AJ
	 IBHd5LuJBxRiyWmaRQ1cPxat8xM5vx7vSBruTkkLmZ+kfVMFaDM5SI1J/ZPydoj6FAGcX
	 IrG3UmJmSECXZr1BQqRBllxN8l0h9fzwdoHKNpVuAQnDzIDoTmDGIxDtKotGx6FVWjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGrJrIMn;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA83606A324
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA83606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGrJrIMn
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533362a12.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691802; x=1794296602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=BGrJrIMnzc+MvADgYCFSNZYVx1pw8kiJM5k2TvolWKdPHRLx3P+wsHlv0P9JfLFDBZ
         Ryb6QdwScMDutW59xZq3J3VpAjHJ3lmnxhIRKXzNcWOvkgiK6qVpqFxfmMzZJcFCiuoL
         7KiwlKi5v5bCwToIsSMZ0Lr65AZq1MeX4jy5qvGtMQSPzNxiUfFji0mipYNEW6k1+J5Y
         QQu8hg16B6eaB5AVgbq3ZjFNc3xcc8bG1EflVzvILl4B247I7t13b5xSl82p0kskK79o
         ICZH/XX6vAHcPzYcl/CP4IablRXKQTM3SLYkgqjGBeRtzg+b7/9LGkUmC1gQNCSBMWXl
         ryWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691802; x=1794296602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=F3VG0mYyLgt2XnzA9MvzSsTjAu7Q3GCPuygPPBKYq8ypO09M6RkQdWgBpWie6zeXUK
         9TYD6wZD03UT9vHZc29QghGLmltzy7TIE4afrrbdhnXP6IiSbXnwercSOroFtojbQt3e
         DTFTbq9GI2CxLOUQQ6cOasU9A0LY2eNqE8o8bVzTo1OQsClXL8CTMisoxGRG2aMXalGq
         5Un4PMEP5NuwWqFHUI3Ccof1g7euGZt0d/MpdYkpiby/NCPMD5YfHNGUEHj8P4E/kRzS
         8MB9HYxLSH5WxyFwRUa3Ap9A6XzmxkyfhwBsS/OX9duDkhATEYM/cQjQgGbg9v8aDOw4
         awAw==
X-Gm-Message-State: APuU4Z8woQhw/j9yb2wg330ZGFjgMfdh/bV8j5qL1MBjYVUjkyQFFBkU
	OESOcwwLY2aKC8XwTsBvQTZl1U3pHR2QaDkCubgYiZKdJPYGQdDgBYNH+Iiqtg==
X-Gm-Gg: AYBFou0eVKNp+NRbRG+DYH25a8wgV4umdNb/mfNdiuOffCBYkwyKCUtKeBid9PB6UBU
	D8hc0te0GkYkMYLpq5dP3pzw3sX82a+/sSMb02YE3KW4I2RrGFTG3iQ9ffx7aBlDBKUtMv3NHxP
	3TekTCculQAxCIaJ7e8jgUCjfHacIQexWKQrE5Uf14Upv6BYy4B7UbR/IACm/e+vijD2tyob1+P
	oiNJUnovjt991Xw7dVocMajlV8+DxckR5eDiPXw/4mOFutjrL0iO5vhsrndDibCjxOpJ7TActGc
	T0A4oIoYjh5KzvRd8e3hG1e6ogsa9sPr5UTldzzpfx2tVtOQUkgQt2/9o/gYVgs3O/WRlkWyn3n
	6y5SIkhgrUHY8zMublyZWnl6olxEZUWCqw8TqK3INmTglxoccfKZtgRDpUEMkxAwovgIBrs+Y9R
	tuiB/uwf2tLLNOxics7dRRtx55wokglkuK0b6YYcO+g59PGnm+hBuCLV14HMgbHGQ8Gk4lv/CNo
	fYoEVmjKoqhVPwvpI/9mbVYjZ+cxoV9mvgpfTJgi8uHxPh309TTLJXUa6cTeT578eMB2oytMq1g
	iShxsInBVgXLZ7SAY0Kl7ZxnOVFFjGfHizujS3fjcob6OLBt16ASibvJ8SpR9Hh6YusgVjg1hGr
	FkdYdYsDOurYakgxWOc0+ehFI08LNkQC2aH3lUaGJ93EFhPUkJy6pHX6kVezK7xQ23pjF3Ib30P
	mBiZg=
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr9451595a91.19.1793691801674;
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:10 +1000
Subject: [PATCH v4 22/22] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-22-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Mpa6Lyvo5t3WwDhLa15s7MQvnpQJvZyAGw7Ghv9V1tE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y/cXfot+mNMjqG8VQGnwRn3EyJWLF0yd4RXtmu/+
 PuK4dLTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT7czD895M+e0r0trTbnV0nPsxR/+sWH2Zbxmy//I3n/ESnsJq4dYwMZ+yOvLw
 gwH4mdKdQWcjzb8U8nGvO1fbvNZLOyU+ekd/KBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
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
2.56.0

