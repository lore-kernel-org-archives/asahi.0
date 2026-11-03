Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691707;
	b=Lr4vjmKENTRZSu1QKniMZidFzGAFDa+fqBIbImrDdqHRN+CHCSK2fpc+c4ut5vXTMnVJ
	 LRW6wtrHhuIbH5Lb7KTthw0f3W4deN/snWUWvU+n73hL9HduSCJFq+nzhkmCnw27xbnmu
	 E8yppyiv/kXAcCFnR5lc2erOQjCEbJ0hSDMqAFqer/QGVEVj4XdGFMXZoCpEGKyOgciFi
	 jjR4VJ6m5YJUqf1zU9CZQR4YCMI6QzPE+ig0Wixezdnp5Y2Jwc/gv777bDSW5gkBxwdOf
	 cylLWyjyLUxk9smlb4Pcj5ufO/XdsP0rCzFviY2HkilitPfghINzZ2kmKtFBNhneCeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
	b=m91moEPyYdc9a4Q3ArMcpd+AJBKP7AOunTEKWWl2xHuEGdYBpKAWaodER0MT/ensQXua
	 bnuKoI+RhXmAaLZjcgrofTq759aVGHXfI04TavZ1D/iBmdmrXKzOZquOiTPreLqduJE+j
	 AJfCH0wU+Eq0e8SPPu2a38vqFYOpodHi9vr9CTwi4vMWeysYjhiGk1hnSxI5/deFBbG+5
	 igerHcOSuCQfWo19k2/iQKfJ5pf80G4djsjpJHKek519yqb3Xt2KmTxbWyBbwOadSCWuw
	 DQQNnua/ICPUOqhEOnhigCgMw5GBt+0J0tVEn6sa/nVVLQuTgLiSLMA12vDVg51L1UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cY1D6YbG;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A94606A32C
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A94606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cY1D6YbG
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2406881a91.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691706; x=1794296506; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=cY1D6YbGhB6okOS2Jp4pSOlTw7gJHTKju3ACUIqJDqzc3PIRzxXB0oVZkRGmUsBwbh
         ungivETdMFPrLDNTK62FBribKE2oZl8dMDz5/IW0kqyBQzOVRDKNR0o7nBGHYMIKramq
         W1mvl1Rb4SdPl7zZVaBSjcHr+ckn63b9s6jmmaOwAlr9Z1my1A9QA7To1wXk/iNv60by
         GzgWwEkrFcdRtZVggi82J0QdjyRdACa6K5K6plLzs5O3UDnFV22mP0kzWDEQntcq2coI
         a7P0Zyh7TTimeKF11B0GtAeSUDgyvnA+ymYvO/jpRBI+LmuAoM1UVNU2ag/jxgSm/1lt
         uKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691706; x=1794296506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=L8a2TmDHPDL2lLMv9IbVFRHjqS0yLxDUgS/3lQI3IEjk5K2IPEQAHZO95HYoGYi/zG
         04MfpOc1pYsTLxDzadVVLqaLRlH0vN88HA/UwO5JGPFvp0DfVOAaUh1vT72mKIJrf2h3
         AbC3eszxSKJP/uCr3reZ68QXWl302eef2a4L3o5AbRcV7BzFbcqU1heQgnFoSwp1pf2J
         WELtFDTcA+qgP5Mb5kxQ+lnWt2OwPtugKBAosX9cvp3wYE+GkE+hcSo6vv9sRPn8ONwI
         pt6YpPt7y1EYClNwJ07CY/IDe9uSb9rSieI5U5WD2S32xxCdrcYls6HE1eLRjZbWkgR2
         s6ig==
X-Gm-Message-State: APuU4Z+FLhvtM4vcrP0BdplR7n7FoXksf4cM+ql/5OQwR4R7Xzg911zC
	/ckTb5yOo6pr7iBoX7m75tguVKpuouwewT6Amm8oS+PF28XMTz/LCuRA
X-Gm-Gg: AYBFou290T0lKRBtl//Xh6Vltrga5tgoEYEYdtddQtbT9sE1oSMlqTp/Ybm7eHtsHZS
	72O3nZ2X1mU8uCjrSg7RsMaAtAxNyMUkjr4FaI+4vFdWVfNTgzGCG/x9uIaL3ayOlWAyt4gl46x
	KYo+tBWdLOIKRui0Yhzeat0pH1r/NTI7iKXiFLcO8X5q4VynY4x/E8GTlaYMCSTKwTgqNfiktUu
	V4Zj/l70sFxELMbbCVBcFSt2SCipuyAnNjtkrc4/OD9/JkS5XUA4TZrno1RTQqIlipzrb1qYRSO
	HGpvEpkHWBkNvPLuIwx21oPrTYOZ1I4wW2YDD+ji21xWYJpJuo0lt47zd8OgYLla3FIstCNJJgw
	jBHoPF+z/9nWvQF+n8x5gRsZWgzPoRzJE/FJ84crn1ku9p8iAshkaxA23pqQ9YEFOtwMkbEpP4e
	3MYrb+l7DF4HBZAMnkMwx4WW7qQV+2+YHNRkSHJxvXDMNju5CYE29zv8abhsb0oc+ufi7ZTqK5d
	oaL/xn2KkV2iDaUS14e0RzL0Em/+nvZkUQ+7PSVG0a0oIFeIMEOH6RyYeYcyvLLydoM7Ys6X9yR
	czFioZzH/QFarYD5DGMnMr2n7Szeu4uU7P4yKpjBj8gby49KlREs8EZ7YtWcJNyd5TurXtk4Lp4
	yMQjtK0kVEcVJRXaEWJfECuR5Y7ngRXET5nbXMvtwDksfXwy9iDdROOREtOGLqs6ycWXKbe+EsU
	lDN9CD
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr9578811a91.39.1793691706582;
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:59 +1000
Subject: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
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
Message-Id: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=TytIUXjJL8r3NaXmKyOX8nX4Lbzdfp/ScRYJ0q4A7Bw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89x2fO48DAsFK6dtH2TTMEeh6r2Vx+/xxg9e6bdW
 to/6/yFjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSfVWf4n6Do+UD+o9H/Iwu3tjuwHzrNUMB7P39p6hynibxu+343RDD8Ztl/91t
 skAdfhWSrz8+MTBaRnIfZG56t4tilkCugsPQfDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..2fcadd77b1c9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,74 @@ &i2c2 {
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
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

