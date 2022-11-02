Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E32582
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 14:17:22 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ud5so45721314ejc.4
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0n4mZvFvck3T3rrfQ9rSgkc96Wcu4vbjw0wqQZmCTT8=;
        b=buxhVMqCdIEJlX44xa53eEaCR2cbl9OSqVZRxuS7pD4aeF0CWccB2ltiOBS0cNgMX4
         DisAdaH4fQPyuswXY8mVrNu/7euYRzRDdNtKNtsN51lGD+99PKgbDALVFhoBMN+cmot9
         fn7yeb9EjsaqOyZwK013AISF1cpQRA+Yp39a27gl3aT2p2h5Hn28d0wx6qx2pn1VrPKT
         NTxouVy7rM/l4nOEJ5Acou5ZCHUT832R7egaqXzyvXlozybZFJcfDHe1TuWDs9tbASBh
         FPtX9F+vYjwOZP1PLOlMe/fcS/0+qrhgg/0Nzg139fODDkrB6HmPAbgrGrIS+48geAws
         DoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0n4mZvFvck3T3rrfQ9rSgkc96Wcu4vbjw0wqQZmCTT8=;
        b=CjooqF5c+tr0ixQAzUob8fQ5oM4GVPBs0SWvst8YTPqukTi4cVwk3J4RI/hkxOswXb
         FhFCa96Sal59zRKfYed+sWRQfba44Z4K04N+Q/aBT4xuHjkUJ02o0pRq9FoseLYS/noz
         37QNbzgVYFdPENBJWAKbPgzVpvBiBdCWkf+DyJILwq5EJasKB0HO1+SWYIkk/DuV1MAn
         6Mzk5JxMoMTGo0z1MCsomLo6JhRGGYO9zHZWRjf1Q3/FIdbVRkeu6kVQOmJR2QJ63+Q+
         XPqq406nZ16+ChPO5swJyirnvz4b03IPzjAuhzQY+Gsse+vAaoA7YNyPUJRjMYHsi/62
         w9zA==
X-Gm-Message-State: ACrzQf0T3BCsLZXTRkKXakvZ+Wxz+I1uLTqpTxJFw2sT2aWdsgqbE1C7
	7dhfiBDRqSFYINcPLunetfw=
X-Google-Smtp-Source: AMsMyM4UO4LPIkeJUPkXOsfooljJbLt0HcMi9N88XdOTQPepALYXqc7eYSiyc0/cuRaRL24dJu/mLw==
X-Received: by 2002:a17:907:6d9b:b0:78d:f24b:e358 with SMTP id sb27-20020a1709076d9b00b0078df24be358mr23291374ejc.714.1667398641424;
        Wed, 02 Nov 2022 07:17:21 -0700 (PDT)
Received: from localhost ([88.227.60.86])
        by smtp.gmail.com with UTF8SMTPSA id r16-20020a170906365000b007ad9c826d75sm5465266ejb.61.2022.11.02.07.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 07:17:21 -0700 (PDT)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: thierry.reding@gmail.com,
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
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: apple: t8103: Add PWM controller
Date: Wed,  2 Nov 2022 17:15:12 +0300
Message-Id: <20221102141513.49289-4-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221102141513.49289-1-fnkl.kernel@gmail.com>
References: <20221102141513.49289-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds PWM controller and keyboard backlight bindings for M1 MacBooks

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     |  9 +++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index ecb10d237a05..0b4b7e8e0726 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -11,6 +11,7 @@
 
 #include "t8103.dtsi"
 #include "t8103-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
@@ -43,3 +44,22 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 };
+
+/ {
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm1 0 40000>;
+			pwm-names = "kbd-backlight";
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
+};
+
+&fpwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index df741737b8e6..0e0f57dee96b 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -11,6 +11,7 @@
 
 #include "t8103.dtsi"
 #include "t8103-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "apple,j313", "apple,t8103", "apple,arm-platform";
@@ -35,3 +36,22 @@ &pcie0_dart_2 {
 
 /delete-node/ &port01;
 /delete-node/ &port02;
+
+/ {
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm1 0 40000>;
+			pwm-names = "kbd-backlight";
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
+};
+
+&fpwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 51a63b29d404..ccdb26ef6b22 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -191,6 +191,15 @@ i2c4: i2c@235020000 {
 			status = "disabled"; /* only used in J293 */
 		};
 
+		fpwm1: pwm@235044000 {
+			compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
+			reg = <0x2 0x35044000 0x0 0x4000>;
+			power-domains = <&ps_fpwm1>;
+			clocks = <&clkref>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;
-- 
2.37.3

