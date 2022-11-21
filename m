Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE116FA6
	for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 17:45:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id s5so17273283edc.12
        for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 09:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5GqgUQltU/UwWJVmKB9yBrhZ1yrd9RICIJ3rDIHDxU=;
        b=EEQfpiS80XVVx5sLX7hxmEe6Nc+y9aFvjbVDbccbOjamDOnaEeSuuTP9cyjVQmHaEq
         RAeC5m7UPE16AP/Qe1/9HOJUWGg48B62MMSa8VOrWdNX66bj6g+SyDJbDSnMjQuoXD7o
         ZoeMcpvr7kFG+oX9fW4DuJFATYerf1o+IbwZQN4Lo9hNq0MLbLXOaNQ5PgG9YaU9EsAe
         XyGRYc+8xGtXbYyj9W6bOm8Lix67z9ectnuHhnU3WrEhyrcKQb5maUCdqLLyVFgG8dt1
         tYqdX+qgQrC9JGANOEjoWFa40ck27oAmDOFhNPEe6q5tHXEVj43J+JZztCxi7f5vyjgQ
         ALTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5GqgUQltU/UwWJVmKB9yBrhZ1yrd9RICIJ3rDIHDxU=;
        b=urKBNcOq+/43yID9mAxQkFngcyaPlG3RNzs9jl6cl4Ye5QRLJ7hpK75ATeUwbjiW1t
         atYh81bT+NTK3Fdkcw1Po0A7M/y91z1dOaErEUycYXvIO1XBPX+zyGBPrssH0E2cKLKr
         WemuQ02GAOsuG9fizgaWpZ0DUcslo+jk1WhLuKnpBhVKoZOGOuVP+l89y6zJ3Pj6aZcK
         hbzVJL5mNf1a1/8zaHu6J0Co6hDGL3U+BSeco5dtYO1KJ04rNCqTHTXDGUYeYFPVqXp1
         hf+CzNVzV3puMiMy+yZLbvv3GV/1lpRbb34JvmrZPcjAirw/IHjg+OGmyQFJT7I2KeqO
         j0AQ==
X-Gm-Message-State: ANoB5pk69fo503+HiG00KZNHYifKHQsQwIgQjZQs68fPNszojqxxk/zT
	Y7t6rQMdKrSVYh4Pg76aXfk=
X-Google-Smtp-Source: AA0mqf6LYJRmuao1b8/FmHyF8hM9rGcOvUl8k9MzKzg4AB1fNO2tR3YxlSSFoYQG1Y4rrMZVM+c70A==
X-Received: by 2002:a05:6402:2929:b0:469:b603:ca21 with SMTP id ee41-20020a056402292900b00469b603ca21mr1615945edb.350.1669052714455;
        Mon, 21 Nov 2022 09:45:14 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id d7-20020a170906304700b007b29d292852sm2418180ejd.148.2022.11.21.09.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:45:13 -0800 (PST)
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
Subject: [PATCH RESEND v3 3/4] arm64: dts: apple: t8103: Add PWM controller
Date: Mon, 21 Nov 2022 20:42:27 +0300
Message-Id: <20221121174228.93670-4-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121174228.93670-1-fnkl.kernel@gmail.com>
References: <20221121174228.93670-1-fnkl.kernel@gmail.com>
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
2.38.1

