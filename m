Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691767;
	b=JOMOwhAnIVRHGeUJ1HA+xVYC23P7OYnU8Xb+qYOcz4lYp0C2mijUmupFV019GD/9C56L
	 zfAdb29F+/E7rMYOrK7gkrkZ4TwhjBJvTOdo+EpAt8M5ZrLV426O5AEISRPfNz5hJWSMe
	 L7DRY+Pk5VJkF4PpS4j4hZA66tGkl3snNlgu9Mx6VBLb54OiplKgGNkHQDRpCbuWkn8jy
	 U5LVCSinYLzRkDCsKK2HjOVANEZmfrepUhfDy2p9eigY/bMWPSlNVIrr7rS7w09l6Vh6X
	 HliicBj6uI6Gcu3TMye/LjF6ywI3gvVGTD1uAm0WipFuGG86U223wDzXF4nbf1CvwUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
	b=OHY1gwpY6L0s8LV3VZXCYN0b05VGSxtF5qBjFzMkz5DA/jFR5FiH3+vA0RahBM1OJEx9
	 VVY4DO8Y47Vb/tqE3dsH7BT10GvHyUaaeCJxwxlFZ2KGyeYSnJY70SRwym3a0u6GDjoi8
	 dXPubeoAFbSYUtSC2rcvqpmN1oiyPPnKoaLloOWB+uhU+46bX9qC7m29jNpoOQV6g9q9b
	 mp0OwoODnVFsllLnPWfd6K45VNWi4xt7UPGckzzSbgC6xUO16ppVS2Q6Cja5PAqoQVCNB
	 Y+jrWYuX/6YBmyWH81mKlmi/LRyAfnw8odVImjzw8U1/XK5Pli+o3a38X/5mQsUqDTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQW9yJN1;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E66606A32C
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQW9yJN1
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1867894a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691767; x=1794296567; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=yQW9yJN135KrGcyn7dh/RCuTIYIaUHcFz3MwDG1IbRW3VbkOtgFSS2pLpl24IU9uPt
         swvcCDWVk8TOiVsxYeeJSxU3UrJOooJDlTFemnM0s3nNui/7Sj1g3m8Oyaea6WNTSug9
         BOINLbq2TMZ1ZN361Znnh+UaNhw33rt4kNKvFRZjVQfHrUbqNtcoEw9JFj34AlVcR5KP
         o/BaDG+SH6/+8SWoF78NCSTQj3phocf9iMEObOL0PmRNCPZQQjkicvRy7VqVYQCXmjbe
         8aGpwACwtVeU4Fy/N/4Batbfed1DjTxFXmznX+UhvMVnDc3pJjurqBUTdCT3nTE+hIbI
         XMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691767; x=1794296567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=VHdvqYjHJRPuS5URwD9rJQVGrQj3xLDVRhPhVlMlk5dTpgmAPUQMotuvjlSH0zYJft
         rBkMZQOwZu16DkKd3ycrLgeLFf/37bns136uBKfznXUdzHYI8hjZe+WsHpLYb3b8Ocye
         ko+Yhh2t34vMb34Dx33MFA+/QLwxliAEJbIV+Xqw/BX0QPSS7ckSCNcmCTFZWik1Sgao
         1MdTOvm9O4zZ/ybER0SjMdRQltLcw+OPdr8Dg+i5TaQPm2lqchEMeIsfKPo5UDJv2AtS
         ryMH8qkHMVzLXruTMXt7VC7X3i9j/q/cSX+MId30m+Ck4E+o1YbIn0iT9i7Xk8gMC8BM
         MlBQ==
X-Gm-Message-State: APuU4Z+dILcLoHlHMYuTgqwQS8eZq6XtFYqCuAnMP27bNu7fbFPAyD0p
	UlxclD9FObUmuuJLmTA9OP/ncwJYeTa/8Um7G4Jy4uJHs36YOgrkx+Ne
X-Gm-Gg: AYBFou3ijw1sg5/8XOk9dpA5o253+onxSUp9U/IUQJ0oJ0x8JSCllUPvYF7pp5MIKhw
	HS7uQcTkxolcVKKgnaottI3GeVMaxvkN0E/GJ2J6zoTRR+L7PWQnxt3baEF29ClQBfXVXKRXEvU
	DArj+38UDt2/Ega9R9aw3ALi5hNs37mvjPJdFGHxF1jm2ej6hWTt3mp7faV7FC9E8WMuwMgnCb/
	haJ2Hab+eL0D84mE34v5d3stVDhhiXLG7tKdA6XCYGYKmhCEh7RPt2umD5Rkaa3UVSL4Hn3m3VD
	mw93wTb6slXT8Qluctb+NdLcIyahnzhejjxyXNEfJx7PafKw9GIwX8YWjwM1/rFga+z4H/jKNej
	6zNMTi4UpMAKRTe4s4aHyrc/3AZodn3P7M3ogrI7doaE6pwdt1r/PDCJGyK5sYu0BCmX58u3dMx
	17Xb9BrwMsNfuvgrnutnfHoOPBVOCy/8MZmcMfOUrvNXpJwXQCknUyWus1t9JzNpZ8onaX8xnVT
	arES9aoVJjOwWOa/iTjtpKRZNzN4X2GzTV5kTZrCaQEsIoDybcrsuyd750NX9XPLDy1ROFn0qoz
	meIqVfme8AcL+B4dKBuiVrpH4zmLlQ0wq2JWs+b3BWVvTIDoj/a3k/JlK7WyKTo578clpGds8+d
	Rj4iWBLwba3IxQ68NZB/qsMESvvI6HipYZYhssYgFIpCyKYXEniWg2DLoNfljoVSjKbiTaMfpoe
	6ujMg=
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae89773f17mr9382729a91.19.1793691766813;
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:06 +1000
Subject: [PATCH v4 18/22] arm64: dts: apple: t8112-j493: Add
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
Message-Id: <20261103-macaudio-v4-18-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8fzOK0BtAM9BKavKDtzvC9SkMIH3VaTohkyi9BTYOYQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88bPdw7+8zxaeJR3g1PXwjIeS0/LufRYzbxXFvRF
 sbQSU8aOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9ajkjwzoGp3vpF83+FtboLflt1byU6xkrr57qIumIVLazKrVXdzH84Z7/WCp
 jd6xtRMr1hR8S35z10Ou0ZEixmRvEKzjfMmcCIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..832c18538cab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,109 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
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
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.56.0

