Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A18563D9
	for <asahi@lists.linux.dev>; Fri,  6 Jan 2023 14:00:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1129048wms.2
        for <asahi@lists.linux.dev>; Fri, 06 Jan 2023 06:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3DSO2nFSdxMzrHJBYG74NM4oJgLnjp9dkanZv0gHOQ=;
        b=JIOlZ/Nx0g107umrYRbaqvobCR6S11fvHIgf4M1VeCTHgVTR5BO7ilFAatFWxVZAcH
         AbfDbThGcBs/JVtVcKOGYeZuOh5nljp+QtqvfAxbT1b53cmFqHw0FZXCUrj7ZXMd3pkj
         +OtHqOwPbIqn41qMeyKRHz6OUHhg1SMMsJDT93cFrvJ9k0XyNdWAai2ggqn8w64DFdLF
         oyIC4CKtrgH6PGhuZdXIZ2BaznuO0YtNTK0U6jU7IamLf50aNUWaVD5Zn9To2h/qhr9t
         1eN44rEm+GOh24KU9enUB2P+oz+iv8mDFGt8Mf1O8X6V2SKvv4hpazG0olnZGbEmG9Ap
         NJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3DSO2nFSdxMzrHJBYG74NM4oJgLnjp9dkanZv0gHOQ=;
        b=SBriyx4dQ8iNmNip2xX3awGGN32A8QCoItdYxmtWaHrY4NjZMUa1JeI3Y/hHiGVfr2
         7HzDFz/btICn7mrqvTtJOFbl5i1TfmgizOIXgWxWlvM/v3h/eTGxrSGFvfRNOjMwowI/
         J01CFNslb5zs1y8rz+Q9ii0F4diJjHMGfwviMEjrvMC/RMxIayG1JhTnKOu02E2G0TUW
         0jVUvvIVccW0pK+VQHdtlYus0sSur7A33SuI4/u911CyHAsIL8SFNZGc4WpO03VIIJPK
         0K7HU+1o3pJqz7YSyJFuQHiHeLarKAJJ7LqzmQevBdX5KXDViVqNGJgjNot7wxBa5nNA
         x6Kg==
X-Gm-Message-State: AFqh2krqMk+UWYpsvsDKggoHosHcrbqE9SjD5aW3G7KYFwHpUpcB+IXH
	mVZWJgYKIs/xg0qb5olpwYns3tcbN4I=
X-Google-Smtp-Source: AMrXdXsYq4D+WnUsWLyK0xKopnwsG6pFgkxKUMrZEJ6/pn3r8RHOzSWaRJYnqCuDU7F1PH/2JWFV3w==
X-Received: by 2002:a05:600c:3b0a:b0:3d9:91cb:bbff with SMTP id m10-20020a05600c3b0a00b003d991cbbbffmr24761921wms.26.1673013614525;
        Fri, 06 Jan 2023 06:00:14 -0800 (PST)
Received: from localhost ([212.253.112.114])
        by smtp.gmail.com with UTF8SMTPSA id r5-20020a05600c35c500b003d98f92692fsm2102274wmq.17.2023.01.06.06.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 06:00:14 -0800 (PST)
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
Subject: [PATCH v6 3/5] arm64: dts: apple: t8103: Add PWM controller
Date: Fri,  6 Jan 2023 16:58:41 +0300
Message-Id: <20230106135839.18676-4-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230106135839.18676-1-fnkl.kernel@gmail.com>
References: <20230106135839.18676-1-fnkl.kernel@gmail.com>
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

