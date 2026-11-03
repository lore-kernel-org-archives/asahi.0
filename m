Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691742;
	b=fUxLDkGglxptK5kjRPP+mTcUgCZi9fdyYN6VZ/5HRyYIGG8mFuQgg0Ln7461B9qyEIS5
	 rn3/whxflFEzTsh3iyKotAEyhqZ/lsYnLySpCUel4J7I/Rql726r2E3yuZSFPSgANbJB1
	 O9UnCOKaReRgeDrLGycwL6K3LGerXGmuEP72q692OC/8DVDQMmvIUkCudt6Ag0INgC8YA
	 yefRm1zJYEMiDEWZFS++rl9dWEP2oMpQJ0fp6pm4BpAKxV4/orJ3xXpuVpcWTQX0J27Sg
	 i41keAOCkK+DF5AoOTAktylOP7KbNPcgY8tixChhZj40sBOKM+u+w+yaOk4eAPFJj3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
	b=mKRKVJBLv2Bsp0VihLgbtbZE1A3WadOKr7FwM08HPceAWagargc9Dlk9if91AJx8qnaq
	 JQMcbvjDT0+GxxKo9ofdNCQ43rmra2ocFP6ipVePMRFjNhLXYn7Ew1/ybMOvncNHf4I7r
	 j1jTpACDzYaE6Hhx5+dT/U3lTFPtRfkc5NWdZzSg0ESY0NSmHjTJueNZnD1lM1ieOZY+P
	 M8iZaN/3Z58McEH+V2BrGfeDKJI3WlS20xIAZD87sqI/UvX/xw+4M9BXs+IzTWUKV0bsU
	 XaOdgiJTegpIQ5WPc+hgSPYr4RFhHP7vfOHNrJSHq1xoviCozMQ8XHWdVy8q4Cv/bsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMjw8ioc;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D0606A32F
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803D0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMjw8ioc
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1842739a12.3
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691741; x=1794296541; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=gMjw8ioc0j92EzUGqU1cjg+5YIda/c/l3iWtuHgY7i4TVRdGhwfpgg7M9dpyhM9LDi
         mdj3hz5d4eAKnMlkMs5XkMpYyfSaW8CifH4d8eEjV44wJ1WuJglH3Jz0okn3IrLY21U5
         W5VVs4FPYsSQob+bZ1hvHCk1KTEx7UoKzLZSEUu8JaQ1CTFrnPzWh4PrxsoHtiRHmShN
         KGS7nFj/f9z9rJHZCefB/wCXUg67ldr+mYlEpUf9zp7HUqXN0JTXpWHyb63dtCTZ1Bge
         9P/yMKxZNAzOs0DzvlGvUau9ahvUbCb0QpbqbdRwxIf9J3PlWl2WV2l2986GW/IUxmct
         4Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691741; x=1794296541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHOHvCSXEoTo46NVws8vPtdQYLdsjWLGfWtQNeT/eIs=;
        b=ySXwq2+i/ArJRUAJhU9P+2S1UiiC0lM5E05Go6r49CDK2Y+3RF7RduzkW3KUNM8an7
         qOlF2ine4FeDx8ZdJcEVw+XVbUmOik1gML1JCqwTm23c14gClNu7K1y9w70Gk7YSmQoz
         s2u3JpGKRmb59591NphFJ4t2wUJrJHYBWQDbofl2fwOVSUrvHLwb7ZtNt6P4RgfHQwOx
         qq0wiNAhtIBYpjmJlHLFtklG/S/ZtitQ4GmqpPSmqsTJDuBbZX0vRnPu2tUxcaB9sNXo
         m8RF+dwbHvQve25W9M96U8qhU25oEVOvoo+caSTzKnLWZjoExQDSpLdaibWJJall0NE7
         66vQ==
X-Gm-Message-State: APuU4Z+bra+FOboWHmtWaMStnODXnEU8elH4aYerqACSljTL38HjcYS1
	24Wzz+g5XWxVyWf/lj8OJHrXnTHHVeAG+6s6Gft1EbR6S5Lo6GbvLuEv
X-Gm-Gg: AYBFou0l8l8/DtEJEPAPMSeAtCHsLuiAELma2n1sx7BPtOLU2vjlBAv/40uhy/i8P1p
	OmNbPVEGMZqHyl5Qaa0ZQELjbo57TstjDVo/GKGUlRzZ6MFwzMw0KBnuPhhp4Ihu0cO0KleJ1Md
	6K1oZp/E421/5IYltenDaIvcXbviFa4JkJjzU4juHnm92zdAC+U8rJEAfHS43r/owbfJ7pf+0wJ
	N36QNtTNfOGYRCu3wbmyZicT/xf17WLzvTlBsaoHkvFFxPvLzqEpOdb8p4xS/Wbl6ob42Cu4iWM
	KnCSXKXewhPMRTP0bj3qNhY9Uo39Ly+t9DkJGpZhivpvW99QTVxYt4Uqrl1GPI34hSuEZGeJ22b
	a4U6EinI2CU9GzzL8qQCi3KFzFifz9hlMTFNb2E4sxVArNFOLkk2BUAQ/T5Ryp7umD9gNUm4c+h
	mwodKJ6zqb8YC5CnMNoHVUHbJjASwOLiIz9zsvYk2blhi9ash6bMTkPISzXl6jp9zQ0cO6YvqlO
	VNRq6FvhKH06hEMTYaBX3QBIwJEVUQZhBoJKfBVbPOJN89e/gUhnIsmMb2gXWjFir9OD4bd7KDe
	9TO3dNcKIxhTmVifXOwGa5w37A1J2dispLaL0asVN7wwaXZWdcN2ws76mBKROqPw2zShqOxYjSg
	9aOBvtKtxbTKLabV2OtJ6FE6FDZ7TSVPe6gDyspIQlCWiYr2NGogtrJ9aseDqVvzFWt2BU8y0F6
	qjKZ8=
X-Received: by 2002:a17:90b:3d4b:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ae8977640fmr7907935a91.18.1793691740953;
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:20 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:03 +1000
Subject: [PATCH v4 15/22] arm64: dts: apple: t8112-j413: Add
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
Message-Id: <20261103-macaudio-v4-15-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5tHHgqd9nLG6wvk38A1iPKU89o+NzJ9eWA6n+JZ0CHs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/Pa69X5b1ifPf+kakJCX7iN8Vffb5ssE2q83HJ0
 4tNhRcfdkxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZa7hUjw/urKYw7es/HfhY599g8qmftTo4Td0T+bLPsjPq249yxI52MDCeFOBU
 D4tbsWsB3Wb7g7/biiTveJS1QmXeMk/2J6nxWLlYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..62aba7a4d3c6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,108 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
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
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

