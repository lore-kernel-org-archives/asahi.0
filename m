Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E7646B5
	for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 15:11:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e3so17346821wru.13
        for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 07:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3DSO2nFSdxMzrHJBYG74NM4oJgLnjp9dkanZv0gHOQ=;
        b=GzphiZhuHao9jPC9vjQFPlzT9IJrCylsU+4m3KXtOX00+BmO5IRM1GSRoAugm694zR
         93SM/T/Tze+uTscTLgK2IEFkLvPHUWkwtdLa5wnVYhrA9N4y+CW7OiD06zf3ckv9VWNF
         gpiFPVIqUkfz6ujLO5vRasiZNQv7Krd3rQaxtpOd9rGYO6cbpbwz+YNxR3sRUbZMtclw
         lsc/8ATNTLld2Z2U175ps/mp3HSM/987iDnnXgoDGcJJtpGLXc05FpN0Y870m8Rxb3VT
         kPm1q/2YIUFsE45dSU3Sk9huw55o2VlWtt7mqwTJ57gKMMRVAfcTzIUOjIDhN7E/THXr
         h/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3DSO2nFSdxMzrHJBYG74NM4oJgLnjp9dkanZv0gHOQ=;
        b=UnaWSUNhTIxH5kl9eGpBMdjAlhKnn+Ap6yFhECXFCqRqsRgsEhr8XOzIw1G3wRz9//
         CJq5zgYTSS5t7cWEFVaN1G+icdmPX5s4lDTAnIQNzE5lXCTg4sTIV4itlH5Hvn7fyqQD
         7M7WDC4XN1YTbbuipuRNuJY3wSv9e9VQ/hndtn5juQIFD1o2GJOUUuFeBYgQth1xhoY7
         UM4D3j5WP9fvlAFZc/ULLPEVhMGGyuCUB+iw0+MQqZNLYNkplK0aswa30GceCBeWuGkd
         V+HevcL7grrx9j8JQfGPWmAIJL8EfV1VM8V3nskC/TfiMQDp+nHC9IhbyY3cIzv43nn8
         e5rA==
X-Gm-Message-State: AFqh2kpKnWb8zP1J+bwJP5at8ZlD4JagfV1pRh5EYHtTr3xHLTbg1SxH
	Nh0+ct3MZKzCydnmv9vv2bM=
X-Google-Smtp-Source: AMrXdXsCJOUQOjCBEGo9t9JRbe1DNwBYlQw2Rgo557yI4jIZI9Y+nSYoPF2LjDtzy3XZEkdvsqX0Rw==
X-Received: by 2002:adf:e9d2:0:b0:2bd:dca8:a4b with SMTP id l18-20020adfe9d2000000b002bddca80a4bmr27598619wrn.63.1674659469853;
        Wed, 25 Jan 2023 07:11:09 -0800 (PST)
Received: from localhost ([82.222.96.52])
        by smtp.gmail.com with UTF8SMTPSA id a17-20020a5d53d1000000b0024274a5db0asm4739095wrw.2.2023.01.25.07.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:11:09 -0800 (PST)
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
Date: Wed, 25 Jan 2023 18:10:39 +0300
Message-Id: <20230125151041.55483-4-fnkl.kernel@gmail.com>
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

