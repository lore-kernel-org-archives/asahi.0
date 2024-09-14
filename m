Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31F13AA2E
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291593; cv=none; b=Q2CFmGMwYprpZQCzBi5RpcNzvHJm3RpE04QG1Wf9/CjhgaLOsrNrLQ3S9OYLJZ+/taS0tRKweJamqoefePbwW/ybuJxD2dz0vAmTzLv6OUTKubmWcmxUf6SAxn4brJWjlhx4A1Sb0JzBF9Z4qoONMeH38LDtxlJSPtQfO2rXHYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291593; c=relaxed/simple;
	bh=TAT79Xnzl1oNNV5FROigdgNXLb2Cybp4CLgUCT939cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnF7gLPEog15nSFFcs5InvdsCZbKv+vhwV75swgZ8EPeeik0APP9kcUuPG4xezj2k+tpZLTENYxd53t1GNFkLzzJf9tnTv9XyTaLeJjQMjzNilCnqQ+O047WvdtlITs6NuTat5si0FsGQVCrTVwRj6VQ8DilhloeVY74ulAk+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niYI9dbT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niYI9dbT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718d606726cso1875421b3a.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291591; x=1726896391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyWUpX9SDl0pBa3ZzU7qUw9/ZE6s9qUhKf2MUIrA7EE=;
        b=niYI9dbTWPwXq4J1eQ0Ntf73uy5OiZ6AwXf2v50arntXyuZCf+uDL8IDB8vIIJIeyK
         pNtM5+7brZFStUkxzcA6vm6TdO/Gue/ZViG4fdcr6uIi3Pnx+3QZMwGz3a7NnCvrkC4i
         mUCkn2IXGRXgAiXdbcYS432OEyoRjZBx+8GG+hmbt2VfFwq8qlxbjb3TwwT7w6esfue6
         L+DcP0ifMeHsDFwDHzsux5sPlINnhqPTjFieNnD/N2EoUijUO5UXAJIMlqLZ02hobb5L
         ytAfxqNSMCgs1IOH1ydav+FSimlGdYsJyfDlJ8Dq1+/oQ7+XOm27Pde0DCQJFuj8NE8c
         NGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291591; x=1726896391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyWUpX9SDl0pBa3ZzU7qUw9/ZE6s9qUhKf2MUIrA7EE=;
        b=E0PBDeqbe5B1AbYu7uc2KOgrk8DzmZ0E3CeGzvE7N5sQpC6zSLT3sOdCwMTA/bLEuZ
         ywYL3j8vLoQNC/Bfa2xdd7VC6bHExxV/1aWj1YGLDWF8rYAoXaqW20F8YbtMyLouuRgA
         V52S0wn18MD6p3vEP9TEPRbHkdOuM7JxVP7731/3sI1V7DmtsqNBKNJx9MbQRNADs5bb
         743LWm/tGN21SFkp2QelNJjbGiZQwa8zIxjNF8u5y2RZCDwWIx6XXpJEg6U/Y2UZDfyF
         spT1WNs3QdrEkGgx7mGkJZtkwal3wM1v7VRnlEtH0pBq3b3yUtWqMNhn+IskKuJUeNWQ
         0FzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXECMitnEos7nR9MP7Z4zh0Cfp9Zj+FBRpULa2UD75DhnNtkOIx1U5UvlNHxHx5I7i429VX7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSeFOIJy2pY2KRyvxXY0hS5YQyn1h8z6dWlulaB2OAzHlvEdoh
	bYjLZxFBRhfu2DERTuBLeDO24d9wrGRPobBP0sRMNtFdCnbjMPtU
X-Google-Smtp-Source: AGHT+IH3zVd0MsQtVAn28PYAWgvpDdnfz+2GfTFH0wyaRF7ncUJEboGdbAtP0fEa7OuBSXI9Ga3vBQ==
X-Received: by 2002:a05:6a00:2196:b0:717:9768:a4f0 with SMTP id d2e1a72fcca58-71925f9d846mr15037094b3a.0.1726291590786;
        Fri, 13 Sep 2024 22:26:30 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 17/22] arm64: dts: apple: Add A9X devices
Date: Sat, 14 Sep 2024 13:17:26 +0800
Message-ID: <20240914052413.68177-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add the device tree for the A9X SoC and the devices based on it:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP and m1n1 support, uart interrupt and pinctrl fixes]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile       |   4 +
 arch/arm64/boot/dts/apple/s8001-j127.dts |  14 ++
 arch/arm64/boot/dts/apple/s8001-j128.dts |  14 ++
 arch/arm64/boot/dts/apple/s8001-j98a.dts |  14 ++
 arch/arm64/boot/dts/apple/s8001-j99a.dts |  14 ++
 arch/arm64/boot/dts/apple/s8001-pro.dtsi |  47 +++++++
 arch/arm64/boot/dts/apple/s8001.dtsi     | 167 +++++++++++++++++++++++
 7 files changed, 274 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j127.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j128.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j99a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pro.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index cbb7e409b7e3..f8cd10889d9f 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -28,6 +28,10 @@ dtb-$(CONFIG_ARCH_APPLE) += s8003-j72t.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8003-n66m.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8003-n69.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8003-n71m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8001-j127.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8001-j128.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8001-j98a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s8001-j99a.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/s8001-j127.dts b/arch/arm64/boot/dts/apple/s8001-j127.dts
new file mode 100644
index 000000000000..8b522085cb3e
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-j127.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (9.7-inch) (Wi-Fi), J127, iPad6,3 (A1673)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8001-pro.dtsi"
+
+/ {
+	compatible = "apple,j127", "apple,s8001", "apple,arm-platform";
+	model = "Apple iPad Pro (9.7-inch) (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8001-j128.dts b/arch/arm64/boot/dts/apple/s8001-j128.dts
new file mode 100644
index 000000000000..cdd3d06dcbf1
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-j128.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (9.7-inch) (Cellular), J128, iPad6,4 (A1674/A1675)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8001-pro.dtsi"
+
+/ {
+	compatible = "apple,j128", "apple,s8001", "apple,arm-platform";
+	model = "Apple iPad Pro (9.7-inch) (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8001-j98a.dts b/arch/arm64/boot/dts/apple/s8001-j98a.dts
new file mode 100644
index 000000000000..6d6b841e7ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-j98a.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (12.9-inch) (Wi-Fi), J98a, iPad6,7 (A1584)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8001-pro.dtsi"
+
+/ {
+	compatible = "apple,j98a", "apple,s8001", "apple,arm-platform";
+	model = "Apple iPad Pro (12.9-inch) (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8001-j99a.dts b/arch/arm64/boot/dts/apple/s8001-j99a.dts
new file mode 100644
index 000000000000..d20194b1cae7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-j99a.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (12.9-inch) (Cellular), J99a, iPad6,8 (A1652)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s8001-pro.dtsi"
+
+/ {
+	compatible = "apple,j99a", "apple,s8001", "apple,arm-platform";
+	model = "Apple iPad Pro (12.9-inch) (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s8001-pro.dtsi b/arch/arm64/boot/dts/apple/s8001-pro.dtsi
new file mode 100644
index 000000000000..214fbbcf66fd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-pro.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (1st generation) common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s8001.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "tablet";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl_ap 122 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 123 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 15 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
new file mode 100644
index 000000000000..ab22d7948f62
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8001 "A9X" SoC
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Based on Asahi Linux's M1 (t8103.dtsi) and Corellium's A10 efforts.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/apple.h>
+
+/ {
+	interrupt-parent = <&aic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &serial0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0";
+
+		framebuffer0: framebuffer@0 {
+			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; /* To be filled by loader */
+			/* Format properties will be added by loader */
+			status = "disabled";
+		};
+	};
+
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "apple,twister";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,twister";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0 0>; /* To be filled in by loader */
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * The bootloader reserves a region for the (varying-address, depending
+		 * on what FW your device runs AND model) framebuffer under this node.
+		 */
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		nonposted-mmio;
+		ranges;
+
+		serial0: serial@20a0c0000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0c0000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 218 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,s8000-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0f100000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_ap 0 0 219>;
+			apple,npins = <219>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pinctrl_aop: pinctrl@2100f0000 {
+			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x100f0000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 28>;
+			apple,npins = <28>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2102b0000 {
+			compatible = "apple,s8000-wdt", "apple,wdt";
+			reg = <0x2 0x102b0000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A9X doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.0

