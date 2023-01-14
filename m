Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C152980A
	for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 13:27:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r9so606779wrw.4
        for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 05:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3DSO2nFSdxMzrHJBYG74NM4oJgLnjp9dkanZv0gHOQ=;
        b=pbFyCviih8VQPUB7txIKy8vlSLeMi1nXlBWiVdtlIQaZlU/Fi7wNKU0p8fxUbneMV4
         3PaWN0szqHSBs9Se4sIpzBDQBAulbUUe24mk+37CprSRXPiflCoMJY87Uw+VDwYsO0Ms
         jbp11KwqaA729p1mvAQmMoDUNbtTOJR4HqVWOfnyeI7NIPWtsla3jtu8ujEeHwphli00
         VCISBCU79ftydyS1TQcL4lV2mZU9mWkIVAi0pMXNN2IYHFkUBEEJ56XZ3cS7IH2ZQml6
         mEWpKFhHNQRV8mM7Y6ZmX/lmgwedMQOjOiQGqT8aTKQVtZ/Kv+ndZ0PO9CGx3Vsy5OIy
         YOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3DSO2nFSdxMzrHJBYG74NM4oJgLnjp9dkanZv0gHOQ=;
        b=uUqQ1MFAAeWCew6HZR7S1T+I/e8nd6cm7e9SVgH6oiaDYl4XYIr+93e9OoGDGpwRUP
         kUBlEYPa1FJz1S96xiGygKtZ97YDYUW3ow3Haa9rAWybPOzWgyODSSV9OUDiVGBNcJXG
         PQjWrKXhlyJLPbtfIDh2Zsm2TS1zqTzflAEowNARBI7na71TV0qHsEeExzgmkjrU806h
         BiHo3LwQ5vbZGDrS/3Of4A/h5FyL35ritJVHVaamkrRqkmqqKErjFg+IH/MZ87+7Hw//
         kpxXrg/LLnM1IPYwYDiJP4NC2uM1HGtCYcTwzu83tG6vyDLKudcuIQDdr+5PKfL83PGB
         QLnQ==
X-Gm-Message-State: AFqh2kqDMQdnt6XaNpZXkmfiTJPC/an6Woud6CWBsSP0DTgyX9iyW28C
	x5wGR39GVbvFDpP1WW80Tlg=
X-Google-Smtp-Source: AMrXdXtA+z1KEpmc6DTllds+TJMItwHfv9cgQMfGzXKntFgdGc8gS+f0+rsfPMZD+JQ2m5jSlkNprg==
X-Received: by 2002:adf:fd4b:0:b0:2bd:d966:7ffd with SMTP id h11-20020adffd4b000000b002bdd9667ffdmr5870139wrs.9.1673702819108;
        Sat, 14 Jan 2023 05:26:59 -0800 (PST)
Received: from localhost ([176.234.9.57])
        by smtp.gmail.com with UTF8SMTPSA id m9-20020a056000024900b002bdec340a1csm1812630wrz.110.2023.01.14.05.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 05:26:58 -0800 (PST)
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
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH v7 3/5] arm64: dts: apple: t8103: Add PWM controller
Date: Sat, 14 Jan 2023 16:25:06 +0300
Message-Id: <20230114132508.96600-4-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230114132508.96600-1-fnkl.kernel@gmail.com>
References: <20230114132508.96600-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds PWM controller and keyboard backlight bindings for M1 MacBooks

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Acked-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     |  9 +++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 151074109a11..7381dccc1613 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -11,10 +11,23 @@
 
 #include "t8103.dtsi"
 #include "t8103-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
+
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm1 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
 };
 
 &bluetooth0 {
@@ -47,3 +60,7 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 };
+
+&fpwm1 {
+	status = "okay";
+};
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index bc1f865aa790..1e26aa1ef525 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -11,10 +11,23 @@
 
 #include "t8103.dtsi"
 #include "t8103-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "apple,j313", "apple,t8103", "apple,arm-platform";
 	model = "Apple MacBook Air (M1, 2020)";
+
+	led-controller {
+		compatible = "pwm-leds";
+		led-0 {
+			pwms = <&fpwm1 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+		};
+	};
 };
 
 &bluetooth0 {
@@ -39,3 +52,7 @@ &pcie0_dart_2 {
 
 /delete-node/ &port01;
 /delete-node/ &port02;
+
+&fpwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9859219699f4..5300fd115561 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -432,6 +432,15 @@ i2c4: i2c@235020000 {
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
2.37.1 (Apple Git-137.1)

