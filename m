Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE64EC1
	for <asahi@lists.linux.dev>; Fri,  9 Dec 2022 11:15:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so5524045wma.1
        for <asahi@lists.linux.dev>; Fri, 09 Dec 2022 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXoAAIlGGmSpSwozdUzhwnxLFmPcWjZw/9cTYhXVqxI=;
        b=M5jxKsenoI+siJcelcoKbcTImniNIi1BQte27vlsaE0ygxtv84jC2u59I6Rgf37gvw
         8Eam4anacGuvXVYxQHDAuJ+Ei0eNQOBUY1VXD1909PEWQ0oXkGAzMWvDydmGXemWoMoQ
         FgLPt8kboH7bwqyJZ8xwMgqp5femrsDhrqTycElpXJ7/s6MfOoAUR7PGXUQZ3ldQgN6i
         kEryYp0djWap27ZAwj/sBJ/6Dnn3kkb6dqi9nU81JabtVLUwBAfbFhv7o3wwPgylNWUF
         RDcp2USBDguLPYm3lugrSwkxmrNWUxJLWfvAkiF1WE3u1g3z84K3KuC52dq57C7Vx5YQ
         L1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXoAAIlGGmSpSwozdUzhwnxLFmPcWjZw/9cTYhXVqxI=;
        b=oGYtH7yBcRSVnYzh+lyt+QcPBSOLoePB9n526Sl03qBJeELuol9T9xWUHsbIOKDhxI
         BxfIYeUz5keq1cAw6Jo4gbdxBWHz0TJcETfpH/wgXHxp8ibJuPjLcjUuy2YlmQ2UWXmu
         cdR9QE2OpvZgn23MuqErMUg/5Dt9pSRncBhM0K3xLSLvXwwaDxIce5bDuu8Ngp16ttjZ
         4PFbXAO/D6Eo/g5Ii+pusJ6YADroOCFfB7eVp1tdCBH558nl8gt+oFVVEzR0aQss4k6/
         ibF0LNV3I3wcTPmBUaGpJOsSzfHOaiXLR6GE4vrQHMpoilU+p48uwbE18PZYWEo2M5gE
         L8dg==
X-Gm-Message-State: ANoB5pkA+3LOu65m+l5Glzthy71me8KMVHNCfsrtFM4NW9g2a/ctiKDR
	+9XEli/vzGblvRoCpwKAjGw=
X-Google-Smtp-Source: AA0mqf6uCKLeDXGU5PrIOdjYUngC7zdqdd3A6gVV+huIsnmNL0AsnrGLW8L02lPepgTdTJv+YLXF3A==
X-Received: by 2002:a05:600c:502c:b0:3cf:900c:de6b with SMTP id n44-20020a05600c502c00b003cf900cde6bmr4699711wmr.15.1670584514729;
        Fri, 09 Dec 2022 03:15:14 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id n4-20020a1ca404000000b003d1cf67460esm7746763wme.40.2022.12.09.03.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:15:14 -0800 (PST)
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
Subject: [PATCH v4 3/4] arm64: dts: apple: t8103: Add PWM controller
Date: Fri,  9 Dec 2022 14:13:12 +0300
Message-Id: <20221209111313.2701-4-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221209111313.2701-1-fnkl.kernel@gmail.com>
References: <20221209111313.2701-1-fnkl.kernel@gmail.com>
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
 arch/arm64/boot/dts/apple/t8103-j293.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     |  9 +++++++++
 3 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index ecb10d237a05..b28d6f9ed3eb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -11,6 +11,7 @@
 
 #include "t8103.dtsi"
 #include "t8103-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
@@ -43,3 +44,21 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 };
+
+/ {
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
+};
+
+&fpwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index df741737b8e6..57e75e6ddf63 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -11,6 +11,7 @@
 
 #include "t8103.dtsi"
 #include "t8103-jxxx.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	compatible = "apple,j313", "apple,t8103", "apple,arm-platform";
@@ -35,3 +36,21 @@ &pcie0_dart_2 {
 
 /delete-node/ &port01;
 /delete-node/ &port02;
+
+/ {
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
2.37.1 (Apple Git-137.1)

