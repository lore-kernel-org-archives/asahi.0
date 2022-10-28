Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38602916
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 16:53:56 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id kt23so14268035ejc.7
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6s01AbwYkQdjpJZBm9lXEp2eoEWm0Fi1fj3eRupAY=;
        b=Wn9mroTiWrsQWcPC2y9SPU+AWLR0J/+mQ9Z7st9E6665BwycRdVhkW9c5wyoUmNlvT
         zGJyuxLu8/mm32FU4tc1F+nXq7mbRR42aMuITUgi17Ss4IIRxkryRbaghfOkWZK78kiU
         YrsocUg5ylWvI3xeVofu8JYCH8/0n4K0YZave2QHsnuUoH5iLVaQwHHYKEQGlb7+TjTq
         M4Jkdx0QPfuEFWiLowDUzBgwzYzBMlI7Lu+ry8OwJ2ecg+RkJkHZoz63PF2rwfSCaPHe
         BpMpxTuw0Dno0bNBbf2wnuIe6L7rOLhSxMSmm1wKnDW1jooaGJYWaxfS3IPBkHWHhWMe
         c6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6s01AbwYkQdjpJZBm9lXEp2eoEWm0Fi1fj3eRupAY=;
        b=L1KYjbzjgvqtjCtdU0/fsPTh64B0lTEQUg5YXptATON0jqrZWFZ9KFWHYVLkT1XxqY
         V49NfLIt2IOdWZ5rUJ8npsdk2va6xIQ0kzo9V1p+4yHEpK5POaybC0ngQql+LcNlYAN7
         iZ/qkNWk0G1iy4dULZmYhe1CQkx1uhAwDD/Z9mzBhg6Pp8IT+kbJAqJ/VjiF5uTBFeRq
         n9fS0rQ5rFHcSvwJk8mZfrHMChbxRPXa+1UQr9S+Y5Tre8xtGEgqRvA6PLVs1ai/SX/a
         OEDkItzE0ufidKUGtG35DJL1oz6Rhlg8Gx4MWYXxHr/RJ3sDkvfd/6XcSyVLNz0OD++G
         3KOQ==
X-Gm-Message-State: ACrzQf0D+HN7lC76wuIL8SPGyO9NV1atCxpAizsvxwquICWU8jWgmm9z
	Y031SR39NPDOi0sjL5icWL4=
X-Google-Smtp-Source: AMsMyM6GtYiFzraRR/zi84/PsPHqlixqpyeG+7KA8z9hAYWO5Xok23W+3VEy/yBLXAPw2n9IAdWgBA==
X-Received: by 2002:a17:907:2719:b0:7ad:2da5:3ba7 with SMTP id w25-20020a170907271900b007ad2da53ba7mr258719ejk.340.1666976035297;
        Fri, 28 Oct 2022 09:53:55 -0700 (PDT)
Received: from localhost ([88.227.58.131])
        by smtp.gmail.com with UTF8SMTPSA id x12-20020a170906b08c00b0079800b81709sm2407440ejy.219.2022.10.28.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 09:53:54 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: apple: t8103: Add PWM controller
Date: Fri, 28 Oct 2022 19:52:15 +0300
Message-Id: <20221028165215.43662-4-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221028165215.43662-1-fnkl.kernel@gmail.com>
References: <20221028165215.43662-1-fnkl.kernel@gmail.com>
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
index ecb10d237a05..5652cd41730a 100644
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
+	pwmleds {
+		compatible = "pwm-leds";
+		kbd-backlight {
+			pwms = <&fpwm1 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+			pwm-names = "kbd-backlight";
+		};
+	};
+};
+
+&fpwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index df741737b8e6..cff53f8770f3 100644
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
+	pwmleds {
+		compatible = "pwm-leds";
+		kbd-backlight {
+			pwms = <&fpwm1 0 40000>;
+			label = "kbd_backlight";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			color = <LED_COLOR_ID_WHITE>;
+			max-brightness = <255>;
+			default-state = "keep";
+			pwm-names = "kbd-backlight";
+		};
+	};
+};
+
+&fpwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 51a63b29d404..a95dc482102e 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -191,6 +191,15 @@ i2c4: i2c@235020000 {
 			status = "disabled"; /* only used in J293 */
 		};
 
+		fpwm1: fpwm@235044000 {
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

