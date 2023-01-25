Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA946B5
	for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 15:11:13 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t18so4548826wro.1
        for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 07:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/Fxp0KlTmBwEo1nLuzPHrie4d14h9A0j9bTIw7gzKw=;
        b=CtGwkl+IS46rp3qQgGyErQWm/hgEB6SyCGQkoL1x+tBLynIrmC7mEtQgDewk4s45Tx
         HzrwbYIx3LH+JJhQmpwBYvSKaHQ5bTcoMeYGkHdek5p9vGBkgF/SRw8oKYNTHb0kQcV/
         DNdar1mAUffK1FG/eh6TsGdscVDdaGEHF/ZkP0ByjX1yDgkKTd9nqCts9tmH/nv1ADL1
         JbZXQnnBt5VeJPTeIa2xQqxjDvOa03K3iwOUXZfLNKIjldQ0Z1kl+vmWz65QDiS1q7C9
         bUN+1F5AaXjddy9O61D4zWUQL03JteKpoI/aN6rK3t4LvNmE0arodkP7iwVIcLrqdcz2
         IYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Fxp0KlTmBwEo1nLuzPHrie4d14h9A0j9bTIw7gzKw=;
        b=ZADKer5VIWIEy3n88hcmGeHgrbd600xOx72TGyPPRPQnjPpNHD8Zy+d/kR+TRBCKAf
         JLYaIPiAW8rXc3pIikOMyphZfpMTykZIZlpVNeqZ4dB/FY3ixSeBRuxj5z+FNw4h6KHI
         AS5AipMXUIcm4rXlccQD0JgYyyacNDGfKBL72DriMdhkoqalTw4YQua0wYRJo4bebsr0
         idhK9JCNsfgewAqURqbMidgE4X+mvCu0+9JqQ+TQWbBLx2C2V4Lfhe4IKTBXDDLN9CB4
         z2Ze59CwxXTbJWWnB0zL91eW0GMh1nV62BnIVa58VOGt37iqQof7Ue9hl13bDoQgSXc3
         ejbw==
X-Gm-Message-State: AFqh2kohN7RMXFHpnL4xsKWhSfz+fHd0CDhcrVWNo+fPMrNVGIwRBkmF
	9GlCkbnbaB5oztZ3raei0a4=
X-Google-Smtp-Source: AMrXdXuMkOQtZcZ4+FN91hG07gKC0iqbiy2giQLh12TtWsSBclabn/wzC+MMIA1i0c6/GJZ1lWA1mA==
X-Received: by 2002:adf:eec6:0:b0:2be:57b9:f569 with SMTP id a6-20020adfeec6000000b002be57b9f569mr17246547wrp.23.1674659471989;
        Wed, 25 Jan 2023 07:11:11 -0800 (PST)
Received: from localhost ([82.222.96.52])
        by smtp.gmail.com with UTF8SMTPSA id t9-20020adff049000000b002bddaea7a0bsm4672475wro.57.2023.01.25.07.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:11:11 -0800 (PST)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <7d578vix8hzw@opayq.net>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH v7 4/5] arm64: dts: apple: t600x: Add PWM controller
Date: Wed, 25 Jan 2023 18:10:40 +0300
Message-Id: <20230125151041.55483-5-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230125151041.55483-1-fnkl.kernel@gmail.com>
References: <20230125151041.55483-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sasha Finkelstein <7d578vix8hzw@opayq.net>

Adds PWM controller and keyboard backlight bindings for M1 Pro/Max MacBook Pros

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Acked-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  9 +++++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 1c41954e3899..9157ae2a9f7f 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -71,6 +71,15 @@ sio_dart_1: iommu@39b008000 {
 		power-domains = <&ps_sio_cpu>;
 	};
 
+	fpwm0: pwm@39b030000 {
+		compatible = "apple,t6000-fpwm", "apple,s5l-fpwm";
+		reg = <0x3 0x9b030000 0x0 0x4000>;
+		power-domains = <&ps_fpwm0>;
+		clocks = <&clkref>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
 	i2c0: i2c@39b040000 {
 		compatible = "apple,t6000-i2c", "apple,i2c";
 		reg = <0x3 0x9b040000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 34906d522f0a..96de7165df6d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -9,6 +9,8 @@
  * Copyright The Asahi Linux Contributors
  */
 
+#include <dt-bindings/leds/common.h>
+
 / {
 	aliases {
 		serial0 = &serial0;
@@ -34,6 +36,18 @@ memory@10000000000 {
 		device_type = "memory";
 		reg = <0x100 0 0x2 0>; /* To be filled by loader */
 	};
+
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm0 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
 };
 
 &serial0 {
@@ -110,5 +124,9 @@ &pcie0_dart_3 {
 	status = "disabled";
 };
 
+&fpwm0 {
+	status = "okay";
+};
+
 /delete-node/ &port02;
 /delete-node/ &port03;
-- 
2.37.1 (Apple Git-137.1)

