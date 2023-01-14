Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3180A
	for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 13:27:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id g10so16889724wmo.1
        for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 05:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/Fxp0KlTmBwEo1nLuzPHrie4d14h9A0j9bTIw7gzKw=;
        b=TD8X0OMAzHCrbPiSDCwQFOC8jDyzGcm1xImUM4l7K3WQRocTAn/EDw2JtAH8xarawB
         agqs3rzbyzTa9O/+hSL3kpMG0M1CE40jItshSL/CrQUCydeYTIbTAjSSQJc0b8f0rkYS
         1E44hapvinqgwYXI4vtfNRRPBos2qHBZxlybB1T3LncHgSS1/HgARtmcdagL7Ssjb0AP
         1pHlmIq+RpS0LwWU+60Ugya/hzgYmO7LjSnQI+pxy7fhFrmpR8x5BZLjWmWiq3mlXsm7
         X9ViIztl87/VXh6kt6EiklAVbzoUMAl+NWn++3sAS15rcogkqCptSMgtbmthEdgQdsBF
         1rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Fxp0KlTmBwEo1nLuzPHrie4d14h9A0j9bTIw7gzKw=;
        b=p+DwD0UgdyRZ29vY2JIN4cfY5BOI0wlRrt6/6qvnfeoCWDNo5bq5pH3klcdXC0k9wn
         gtlTWLs/57zYvG0FD5MtyrqYbPWYcVKGUfWYyibrM5puCRnzS2de3VGkz4PE/qGTIHtq
         OKXKCcmblmii8kRGJkWcpg77KqjegXsMKgFEh3N9jQnkAyEVid/f0kLgHYo6PXQ2PVE7
         pl02qQ+ScE+qZ1P4OoWjW8wUHKZd2ge7s4joWb3QMij/fjXLoEekdv4y3CH2VHbSwyhS
         ebDohc5rndSQg7cvQ+HJ74I8H3PHznsYWUwTyI8NdfCe4J/nL5ljk5kOAfOWiqa8orSY
         fPKA==
X-Gm-Message-State: AFqh2kqo5kuDU0Q4UHjK4M0mupVCio+4R5SARs5ahw+p2RgOJwlHkBsp
	CIjrV6jwMiCXfNUsa0AtBio=
X-Google-Smtp-Source: AMrXdXvBIJOlly8NqvtSZHg3EZPrc5ZqQPIiBQz8VemZlxvq4gfVHX5Oc1FEsv8l3rvtzcFliCBn0g==
X-Received: by 2002:a05:600c:8505:b0:3da:f89:bc46 with SMTP id gw5-20020a05600c850500b003da0f89bc46mr9552087wmb.17.1673702825604;
        Sat, 14 Jan 2023 05:27:05 -0800 (PST)
Received: from localhost ([176.234.9.57])
        by smtp.gmail.com with UTF8SMTPSA id 2-20020a05600c020200b003d9ef8ad6b2sm19544558wmi.13.2023.01.14.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 05:27:05 -0800 (PST)
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
Date: Sat, 14 Jan 2023 16:25:07 +0300
Message-Id: <20230114132508.96600-5-fnkl.kernel@gmail.com>
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

