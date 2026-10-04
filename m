Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5353F660F
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093992; cv=none; b=cR+2wSEzalzd0lI1jdUAZ7B/kvYNMqJNLpo8XSXWBpip6MudRrpe1oENYl+O5figyLbcKvRzU103Q4nFZFaXc2kY8qE1yrreR7aawPaj6nC0zfWqrgGo7iysXKL8aYOroQ/VkSeTMDzm3dNCdBh8L2d2QYSowU8XUb0G7w7FAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093992; c=relaxed/simple;
	bh=oL7nT/fUiExh/NupOZC1GRwq19xTT792pHy/X0M8idA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRzBwalGjZacY27rk5KBLXoAt9Z47jqhOWp8i3CL4UxCqqReGrFnfhtw0ysGK1v6j+DiF2HhIv7PpMPHnE9hzGMseauqOKuTy2Fd4bhRvof27Y2OB/bCBn9J2iug8KPksALNcYhP9F5cI6q96rgoxip2HqcEF6BgrwahtMxxa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sX0QI4+q; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sX0QI4+q"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso529637a91.3
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093990; x=1791698790; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=;
        b=sX0QI4+qvRsvke70FGH7lw0vclevaUFzhxhq/I80CkZuYDVq/bygl0mRdCv5O0uRhB
         Tw1fsNddjdTfx3nW5+rnwgs5lwWzZ9OrpO9WzfbENcqrLJNyxm4vwJPhZWnsF+Q1L9Bf
         BBdhRDu3kV215seAokiYZhA8LkeICYKXBkw/YAQxD+Mqk2BOO67n5CXlzmWF0WBEfp5H
         Perl9WCpYx0Q3DRSQwnTxjCxprA5NhK89ZBYxg0hdyyqYtXA1FO3eglQ8qoHXZJgcyMe
         VuLwgwRxfghi7gYwEZM06V8Nu6f3kO3T0jr5qDOTpMwGZIyXF5nqRwjHqcg6ubrJzzl5
         nK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093990; x=1791698790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=;
        b=utqZ0j9JjSJbfgBG6e9Cq1CU9XVU4j9neAoTq7KLEkxgPYI0HjolNkXcNqEnTlBnbQ
         nGq+gGe7miGzEL8r2BWtoMZOS7HBQkogRPgqJS3/pMcu964byRqeVTjkGJxOPpqUKDGa
         mzU5wfVjBxCzM3EoMEWhwHblMj4JdLqZEWhk3Dpjg2b0VrgbqWmmWkBzMaP6EeUo7Dl0
         RAoLKwolRJ9ZEojo7zonagETUVkGbu8TX47lV9TWy1HMNHCD00/h/Wts9OnX885MvLO4
         4jRxyd+8+gYl5IbZ/bGS/Awac+lD3kweU6PgljdZSCD35268atqtVZwW93jevmnWInZ1
         7C7Q==
X-Gm-Message-State: AFq9FYI53q6/Onvo6Df8nSwsJvFusRqStgn78ccDNLl5V39U1tpwASF3
	ix8sZziZc66mMAwAwKUAqrsAWXUlOQ09RdQx2ZqrZzQx4XNrrt2JKNw2
X-Gm-Gg: AYBFou2WaHnbjCxDFfD56k/McZOhHNM9E0tXJP+Yr+1KJaIyxzXqVoXndjSubQYIcMX
	/R1eUxxHTqR+10CFdCu6tQzz5E6/9bOiQ39pAW8GxGT7FpWoPlVBnzO+bEhzYkPwFrzY3q9FScF
	qujgk/vaJdCC1m4ZHQP15PA/49/4fxwjO/Bjj8XJf/+TSPbd+LTi3gX0H4PAyR61uvb9O2HwgEY
	3+JA0tgasF54KSVNJ3hiWNgtD5rHAmjA6qM61yuZd36H1P0yBrUZ84nB/Tu9tIVwEfHB5c2JHf/
	aXaHcdKxTzi/gdp/Jsh659wZxPwXJB3hEjtjdabYVRYK9twIoGoomBgp0IOuk7VErK4yscWuY+l
	/HkD2Eo+3dU49XU2Ee3JfxdiCb2CtDU+isbyK/3q9TC5f/wvZLYyYwMvE/BHrnZbzaHm2+jbEMS
	Ij35kTIdYfFQ5e9SwVrdcOQnBgxUZdE6Y1qTicVCL7GlMRlUjHUDgMQD/I6pmnMAghtUdW07i00
	wlKdl+QuA850NYRGo9f/Kz3WG3Vkf8h+Wa/PCKzh5Z7ktDMVoM7lunzrv0epdBP9Q+OQxRWF2HI
	js5DNUImiEavZ/IvnLY3BKVpX7mDmI9E2xD5mRoRqilwRyw=
X-Received: by 2002:a17:90b:540b:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3a787182b90mr3251613a91.14.1791093990369;
        Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:42 +1000
Subject: [PATCH v2 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-15-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oL7nT/fUiExh/NupOZC1GRwq19xTT792pHy/X0M8idA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TdDphZfaTCsPPMG8d+n6DH+/2eftm3b+pyFhGrR
 uc/h7V/dUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbabS/Dfzed0lhLW4U3onrLem1Vl8vvMOdK8whf1GJ2vmD1us7eSkaGG0Hp60L
 DX+/eOWd7wFWvS6yzZGvWfen+H13WpHAy1SqZCQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 132 +++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..4f3db2a93db0 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,136 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
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
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
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
+		sound-name-prefix = "Right Tweet";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
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
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0

