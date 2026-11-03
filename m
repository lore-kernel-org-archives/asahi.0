Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691717;
	b=Hb2cXfMHaS6qPl85DytkCkhFify1Vq665aLSlUotyMHiyFPsHtYOSN9U9Qh4/+uhB1r2
	 YoKRd0L7kCvHhQ3wijAyrdDltaifOgQNMh9Rp+dwipnZaGwmw/2BVZdiE/il5jjF5zw3/
	 hBCIzPy8X+dgnLUWVUF6/31fJ0UAeDWBaM1zT/Qopr8OPth7d/adcTNtlnh2R+j3BoQN9
	 7ZcfBJ6g8T6CzRJzaEKxsQy6uwn0aIlPnK6IigcXPC3FdM+8AvNVqD4BjJhHs9Bv4OijE
	 xGfaeKX1Oj3aY45H3wkfuIIuKLv5WRWItbLjuyGmOkiGnFA+y5aFpeWBKWueSfTnloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
	b=f7UvLSNmPnWIOrjAsfDvG2mKfM/Fjc/B3q9mHhIuvmYVPRu5oDFvZ1ZLQeFUotZ4NP8L
	 W1dhcvUx0wn3qcB/Hwc0vSbz46QFDL2gduKHlWfqV4iBBy1eHUxnSsjJdCafdI0v/O3F7
	 rjZ1weKbLO7vImKlXfK96ML+hUhBiCVlpd3X8Y0CCjI1q02a6Zw18Nau45yayFdCTS25R
	 DDHuYxN5Ucqo6P4EHguZ6RGP56Wj+P9PTnHwBuJOxrDROc7A31xhQvmajatxFEp6x2g8d
	 jciWRdkJkt8/P0UJrkxFjaBIYoZ288YB+vvgWbcYbCcHbNJR/YJUHnqlmsu9GrWAjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytiZYbFq;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4148606A32F
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4148606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytiZYbFq
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2780434a91.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691716; x=1794296516; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=ytiZYbFqAnsVyNIqSH/bdW/GV+mvTibNw2CmWaRkB9uvAhY3KjeTyuIQ6mqFu1ViBI
         UIzzvY3YJxrTTBhRCBFHvfpBsPXVAfLcbyoPW3zS3ritkUZ4D7RDcB74N5foMJujRexA
         1zWRWb4PGbnogWRmuRUsFpsiyC2lz/VOMrnhlCHSyflz9fcRJYBUfx78UwyBSr7QIc9N
         gw6O+N1ROaxZEznB2ToQ2eY1MgbxAMwBQuzi1r1AVp7LsAGyBABoBcpyRDHjRI3lQC/t
         WNLa4RNOEIJvydqPzGJWjp8KgEYMWH5MJGPJ9MNQP3IDaANxKibe8az5/pRbfbs3zRpd
         eySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691716; x=1794296516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=p0WnKPnDzhcxU4gMj//ef5tv+XHRpoaQZk9GcbR3PlUqDofqAj2jikfUiy7UhZvxL6
         irHAaLltOTXranLSkcGyeafQZ1SzURBO7+v7YMQ/QG7rfq0Cbn+4quRf9xr9rV45qcOT
         jhr48tLEs/L8e8NL1cmKTDHMXEAubR9/9U3UPZEVGZUFcQfjpjVg7LjsoITIdCHxwCUz
         B1nPV5iO60ZeBABTqOJR9RsmAUfZLjn/Gk9/7RdWK4isCMmvSF0XrVLyRRu9UM78hFpm
         bGsG4alvE+597KKQauFqJi4kur36KfW/TWaEs1qOClS3SiEE+q3RjyMNdNReJwaxq+Km
         gg5A==
X-Gm-Message-State: APuU4Z8VKNzqIhU5DulwnWnrgT05/LQd5CGmxXq+t24BVtPbr2lMBjir
	IbIuXIcRHYaJPD3ZVVa5e7RI93NfycSQkzNQPhy3UdGRTxjf3+/CiaEt
X-Gm-Gg: AYBFou29/JSKMS7BJUJX40qOe7LNyBaF/eSfYgtE/NQjBFm8GBwm1HW/tYr1yWCuyfb
	vefJ5llNQvjS3NdvfWTv4moryGA1f92MQn0cMD0f+Ku+8HEfwUTLabqy8KyXm7BZup5N122LBRX
	gEbGnExMiqG01x8F1M9BmjKSjdFErP7BN6TjDpgA5wTMK41kb0tYejPMExInr4XejNiH0E7AUOt
	012E2fMF5iR2pIktlJv3Z9QwylqvL7JUkhMrDKH0Jk/4lQIdGT9Z0pDCsgaLYMXEQ4neNYB2bqr
	79vNjrPxrxF9yvEemsK1PpQGuW+VD+UmCv2yCk3Hv/1LrK3DouedzOC5KBWd7lrwGWD76HU7gK+
	94of6ceRqLezo/lLR0MdZbhgL38lnwx+EyF5bHEjhj7UQkxp3VurBtPAyRasuKvwPS9NJm0uhcU
	Cozk3XUvXKXVrd7F5bOsElAXmAOfeswbUnPpBNyx/V6acF3rBY8eH5yMrCjSWxrbYthuqFjipZQ
	md4sOjEL74T3zIy0alImS67PaAVRgDFdI6+xsir1PkC/0XrT3QE+myEUlwCdHOIfIv3RgkATowK
	d09RkfCpugH9PDbYPimqx+GrsIUhUKl31rEExCUPwJHRXWfnGj7GEwIy0KEIBk3T6F61HFhG219
	gj9y4KqSfotfcPqXWcv/Y4UVitv7B9KIgtlhkN5p+IBGLhZ6v+cmvFU/vbOONJRDnXXrhecMMRp
	/dalw=
X-Received: by 2002:a17:90b:570c:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ae897c8820mr11559333a91.17.1793691715180;
        Mon, 02 Nov 2026 23:41:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:00 +1000
Subject: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
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
Message-Id: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5HKyFCsuZAaYnH07XINXm4pOIg/VsCVnTKPu6wyChjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+v45h1uUCPY0rCtPuamc+e3xb9dDx4p/h/1bLYQ
 4rqZ3v/d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaa5zgjwzPGSSEL1Dcw92rcS622su/eaLvyVK7rFWHex0oz5Rc3T2FkmHHyR8Y
 RlQduJ2s6U7+IJa5tnFLfq8544XXu+R17O25f4QUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..36c47734a1dc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,89 @@ &typec1 {
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
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

