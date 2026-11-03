Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691785;
	b=BHFenn26J0+zlip+5KF64oyFWS3ze2vhcNnQSv1DAdeC5GqYYfzWD6G93WpZZJ5gkrjr
	 wMlbfI6x+Hf8dhFLe7g5SxXx5RwlXcZ/0aXlrt/fnHfZseDuEmHIjV0083iqKs2VcURFH
	 bWdy4wEnJX/NE1syRer2qE8ZHXWNzQWieAeRmpFwxOs7Dv9XIpmubuiLSLroSpWhRLYVm
	 ER6NSjhRkHGODwc/gUeELluzzx4XedTmfJa5AFBcY8Shi4I7JSCLBhGQfurGEFJ5HgetT
	 NVKsFtaVMHIdh5KvvSRKrTJChmHy65M8mPBv/L0IwMNSrAdSq47jKB16NkOQk/tJbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
	b=zKNJYWhNMp2IUXc/xSzyOTuo7eTrZ3/ar4i8ax+pWVy8du3C5h30BJoLO3Ksnbmh5t+n
	 OjOW6Nu+n3CpePJeV5yn6NCALVGZvPXGCWExie7a+O56/NpF32jCstILOu4yZpfAXCQEX
	 M42ecKplxTkZUV7GQvvyIdaf6hAaG9FlbubSZcxJheWJVKmbjKC2FtDLqhvc7ZvmUh4iz
	 Ejv9CjapF+PzVh+/FZ3ZD3BLX7+71kaEdRx7odFxkuqPb2wL3KIbAYy3D0yZksRdPDrnk
	 wWQtZtSmFulCjOPTw/hdShgjJusIZ75NUOML/R8fD/VpW9ZnYXWpL7BKfup8IEFb5MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7gho6ym;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD75D606A32C
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD75D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7gho6ym
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533200a12.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691784; x=1794296584; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=Z7gho6ymNHStMzTP3dNnHqj9owFFWysZIGd+/bA4X0NSmgmaZjvRh+oZQjbqOVknE8
         0y4E4drufHJP+DlyxFa2pAbPJTIqlitU4g5TA8rptNPYmDAHibWB22zj6sXaKKj/ZqQ9
         OUFWdoI7l9mHy4yQ7xtzANuqJK/euqVnkk9FujDLCs6rGzvQiB/rbHP7CB+6ggXW7fnB
         k2Wv6ZW9QxhyGpZC6lXMrPDym3JbAaTvCLx5PG+CyBxLRsj8w/2d0WnjfcrQ41+QEI29
         UneM5DOYu49sIRxAwNQibxPiAimM7qNmKCKdbeOnPJCmq9fNuSAta2L3JlcK10iTLL9P
         kq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691784; x=1794296584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=tuvwBvhHpmEFOH4rcdQ62JizP9wIygly139u2uKRgFf6wUSdCT4dofPIQXpoWxT7MU
         6S+919vRG7hfTqao02LgG2kG/qJuLG1kT3P4G6SB9jTtBTkABsz0e8lnF6QE2FTXFcZ4
         uvn1wHuljgnu/O7koDt45Gvo3Ax+j1YX6UjBduihNqhdmh1sdI5zrZABf1mIod57yQ+A
         hKXZszICak93YXYNs/zMEIo+pXjKkE8yGAGwyMyUS5BsNTdzVvdxdlF2ScOtjsYmGRHA
         R1upegsQomJ85IyIxp5pr0hshDb+mYIoSUkT6Krk6Ny9mKI0f8n1oSSE6pCTZnC7lkgH
         SGMA==
X-Gm-Message-State: APuU4Z9aALoTMbtIqqiLn1J6OXtyCOb+TUlQ4+8/awxgehFPjJ1gHiQa
	JTu198ga2Muv6GLjBa2cfjT56GuSPCzy2hqreh2IJp3okjQ0VhP0pTDo
X-Gm-Gg: AYBFou2Z+89TMvmZigimw4rsL3IGM+R8JnnX/sxIsH+H/ZxTnFTdK8vFDJRGnKaZV1x
	5ix+eLTztVI+lb4DTLTAcgoWPYRqSepEYu/WSk/ZSRtCIm5D9regBOW+hJbWdlR6LZF7LGhA5ck
	l7Ng6aO83JcROK0ZLSEWJ0cn4q3KJKKAOzHpfX18efPm3vE8jvkZGJBFVniPLyptWJMr8xaVopZ
	3ousjUUzKGf2i8pj8mnAmvW/IF44VRxXSYR5KlYnnxFcCUGRG1fhcSl89igAibJqRaV6xs5c8ZO
	p3m2HdgwJi/B3fG1DPt6zlF6oJEFdBTEFIvhS+kAvlhFbcT56pjvWt8HwWGRSI9dooVku8OA8VN
	noMgWIcCd6C1XatVRlG5sSTM5xJBRGVboSV02g/g46C6fqIGPDh/MJv8lJt6Dvs6CL1voucGIJb
	Mb1+0/Nns5AkOV0+iCOU6V7JCwFM5ETlszIP9jeGFfYmcteVgm82+3iytzU1My3A6WlVa89LE+A
	8zOpwQCkmLoNe8FdUqonaSSDUwjPT8V9Eh91bxHV3ngQ3EED/dfq60qj9JVEepyVVrTc7iVBvmQ
	E4BSchji3GzRdsX3FhWssjWyq2cn0y438Qch0hVRd7NECB91cyZmR+zia3AbmC5Tmx0e4TGpXVm
	Vw534COaV8gIEsUDv0rsejZk9uFS/Zsf0S3fDmUGJBOoG8QEQoe+8CZUZqu6ZQDv/c/EytBPp8z
	rvuLo=
X-Received: by 2002:a17:90a:f6d4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ae895362cfmr7683697a91.3.1793691783996;
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:08 +1000
Subject: [PATCH v4 20/22] arm64: dts: apple: t600x-j375: Add
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
Message-Id: <20261103-macaudio-v4-20-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nKyDcyWpWxK4UlDAQg1VAwHp+X0mdPayNaMxBUVyu6A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y8Y//97r25PvzvjpWdJ34WepC2NXJrklmvY5H9/j
 uWRz73zOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtnMnwV0hRfdnZHy+6mZX+8r16pv968468OqV3m646B2XuVvj+5TIjw5Nw/3f
 xm7LLL2+KOrTr6pPtNR2vJr/zvvMpc/tWg+cP5bgB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 61 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..fc45dd9b1a94 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,37 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
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
 #include "spi1-nvram.dtsi"

-- 
2.56.0

