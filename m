Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691724;
	b=iDpFj59VUpfzjIjq3jOwck4P25ln8A+e13P9gSdIY1EVJCk3bhZgRuXUHIKwDqM5aiGD
	 rc44OszBkpGX1HFPpSd46MoJdMM5TKsG9CNSv2ll3JjT516WsF12WMw7Pj/Jv+CElx+ay
	 drgVArU+4Y1+SFX1YkNRkPAcfLRU44uFl+NifYvNBFfZD0yYncKF+FryYyYoKET4WjVMt
	 pC6QWAJWtKIuNaszzbirI5Hj+9q1aIw6AUytLp2fzcgya2YgEqa5eTgeV7566xxI0bKQ3
	 o0WNbrtx8Ca9yE8Cp9F1EavfMZJTZm59krsnrUJ2wtH5XaFbMWK5C1gWdkeEEsdqYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
	b=Mna9JuvX/HJfk4KPS2yMYhWhYUSJ8bG288lPFQzxyNfKSwwDaKTWNdBV7IAE/BJDnaqD
	 kywogcZQ9uJLG5Ibi+MzJOc60zKen/oovRNvnD0myw0JMYHElHv9YPmM8RpKj7h9r+Aen
	 vtXZkOm2VKOjs4bGcDITSkVvuLu9h9x7NCc15ogVU1ze7FNZO8nbv4cngNY/7PHxwuaCy
	 wwKdUZFPGXH8O9SjkBJQkKYBV1F6KzM00rQnL0dIk4vx5zg+urfERyCgAtT60Q32pexcs
	 uf5+ni6Cj6MVWxDsVpMmpTs3Rsmm4H1oUiQ4zBuOPgnvi6f01/z4uiplfx9CBwVJHqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="se/BwPT0";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789F606D813
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8789F606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=se/BwPT0
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2283760a12.3
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691724; x=1794296524; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=se/BwPT0PgXXUx900YwdZi+if+TWToW5mkoqrBc71G898GBh3KBx9s6RlwvJ/0xrjQ
         Ow/uOSMuI8ArbiKbDVo47Pv7Rraim1mckz5+uNxhsj5XMchrf5FEjT1BifegqsIPpb7r
         BI9kQ66OuLuT8mlWfuuDjUYrROj5hfEBOY+PDvpk0pBSB5RhQ4fryYqLyxPd5rZ+36VH
         +hdwYYcUljJGXjPOETTV2j4tA3b4YzNXmFWE4ndn2SpgxEOzTCsOSdk/8/uqn7nQRyN4
         DCi9pnsGyRNEjVqdQJupCkQG5AmMon6lnP5hH7SCqMiIM4ta3tzVlSrNQHTXJOIgfgYO
         B2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691724; x=1794296524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=RmEe6staNMMvmuquqkHaaY9jol7Qd4MWukqhn+uRObxDWn8zXN4Dkl+CfMxEZhozTT
         ok4SxMRr5975MaDzibCbQAy4jUBx8dxS9sP0RCB16ND8WMN9CrewlAuZP/KBpWxvKzaO
         CUQD+0cgWXHewXSrjHVWKmPsLl8XdCQrB9FKmEFYGoz1OYZYDHJdPpEzP2QPh5fBFb8e
         457qgcBfIiSuJDwCYaUVAXOceQYjf4o4rdvwxbXImByc3f7N7CfalFAbGI3CNmHqWZDL
         fScQcL3dFsOH0w6NgBZLGDP2z8GKBJ49lwJ2hxI7ewoaHiE2ZRlHc4a5v3CBDPus0/SQ
         OYKQ==
X-Gm-Message-State: APuU4Z8ps21YaNrCL8XMo6Ars2Tuz/kIZsF/Og10usly3UI8lkncBI1I
	VoPBpanooByitVGpGj4JvfRNzbm1EAaKN9zW6+2r5f9qA9Xo9It8+rL4
X-Gm-Gg: AYBFou0aH6Skfa37PWI25OvvrsqdEJxEgO0j1QHACCMuRHnhP392SuATF3ZxpoZgCkl
	ImNojtA9OhweG46i3l59v+DxXgCQXcQ5mYfBfENhIJUQo9Mq3tyAPhkttI8ylGsXUWvGFo1Dqpg
	NvnehnSWgJ1dAOrVJgf17OtENkySuS5ncVFm1e9IqzHrieLwlH+G4645pHWcPjD+JqPBkDSfgq6
	cwduiaNYaOdN3hkZpcRRCghQr8awsrYB/o75YkYSIh2Ov6dipL6Hf2q6b8lqtpLLxQcgqxrbo2c
	07BWm1310ybUFL1FtddD6ZOJnq59u4w8T4Tt+5UMMK7j8prIpxpiYJpMP7Iu/6SDwcAfGoYs0Ni
	z4leXKZyYzZ7xV2kUyukmiVQX6eg1iKZ1VHyDEMkjZpzDUcpxtD+WawkOYerYp6y3TexceaoWfM
	XnTxVeC1dyl16FdF/0YzkjFPR1Y4gSDdbsOY1gEGpFDeFBIJQ3OkDkr379sO5ZLmeFrcOVxzAMY
	LWDMaBBTgkNQRGYBb5quwTHeu2Uook/ra/xQJ/Be4wlHmyfNw7XvyO3JjgLSbXTaK4J2R6PzlyQ
	1CZcxIsVTs8HBjdsQSVelV+nggvrRxRSa6g7+5GN1TQLUJ5eSb58Ujx9ZBHWpfqM5akiGDx4i1Q
	RieIwh9ROKghajjoCmuk/zAIkr3TSPFsHN+FEMsJeSUf3rE0P/qyoLZFrHv1GtP2HXH3Zqp+aDL
	xzkbY=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7420951a91.17.1793691723756;
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:01 +1000
Subject: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
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
Message-Id: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=AKNOO7q0vuQyr2QN1X38WMsoOdMQ1mDEzPGmlv8YRhk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/7xJ/SVIuv/ng2cm7unSdmjQsFFy4sW1xg0fKwz
 tpI4L1px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr7ehn+u3b5/9eXOif15smaL7cXx6RvyDn2UaP4otCkj+8tfm06xcDIcOMpj9C
 VLdt9JdY+WBvIsCKR+XTLh6Pmmq7PQvty9yoeZgIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..6980247b94e5 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,119 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
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
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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

