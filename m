Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88D12FF72
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291584; cv=none; b=XqB5x1+T8+KmA1Fyga/ToMLrobkQWTB6fyU9F4OsT2qZ2qxChKlUZFP38e3ws4wQE6NhTqGOlPPtjFb/63YBco8wgOs9mFymUTHleTCRM1blK3Ny0/tPKQTEaWQ1Dezo4y3KNi0fOhW35nGvDKSQmHyeBLaE6SuhDibqElrXBaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291584; c=relaxed/simple;
	bh=72JwKxsOiQ9ATwBxQc5idMxg+wu2dRcm5FUheKCg9zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCAJBDLTQWYBjYB99UHx5Bc6jULc6pQgLY6OSHFHRg2SZrm4ojfnt8vicjt2CI/OM9sXAsuAocZvSDc662kU3WWPT0iLxRpcVDOkwmQeW2KeALrjv538LY3ykKp2wnA8KjXg2WqxTKwLY0P50GulNm0bPQ0vUJ2jTN15NCZRXFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2MjnhKP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2MjnhKP"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718d962ad64so2383700b3a.0
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291582; x=1726896382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VwGFb5jnroPV5oNGC7ai+uUg9dX6Uu4B+zhzmxSREk=;
        b=Y2MjnhKPjQCA4nokmkyzEI0UaYvBtz+apdnuc0ELMCCkNC5AjnOt317Xw0o9ddgfzE
         H5G12lq7fBjejYvKHKFTSxehtRPyPjOol/mmwtmRWsd4zViwTS/Hup+5sq9L9yTFLCRn
         trvgMjqr9O49FltwjbduZstciJh2ezZbWKVmOZDVKINCK1cE49DEXWkVR9CXme/k6Pkb
         acf1EOX3RcL7XJop4MpQoYGgIc5/fFc6JSQH12M7b5pSUtEIsl/CCh8E2EgioUjbqBbO
         l9J5hN3Tofv3k+reVOEQxZI+3vul54PkoOsdDueK93wF0PF8XBkZ+4MepYaNAc+uYS3a
         KMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291582; x=1726896382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VwGFb5jnroPV5oNGC7ai+uUg9dX6Uu4B+zhzmxSREk=;
        b=tCpbQOjlosXVLnasVimQySjHOF9hssKL9vu1AulmIBFKwlDcYiXL4ZGzxXhMA1jOlf
         TcJ1ElY8YfFv9VP4AaE+MjVXgF5uem+F2S8wkyDaTBs2mDKhqcvAXqERtkRozVTywZnT
         MBAeYUHpE37aSMedhFkZVbylg0qEG1MyhXihnWDC5flv15s+2SmRH1Vz4twUhNl3MLwK
         YqWHZW5b3QUowPMYGt3DnUieHPS5KKls/NilajbBaEOTjOzE5BcIFRAgoSiYYJPRC713
         25G09b4I9g/q/EZ/2nDGyb5TD6JyZW2HwLN1TDxSDmYV1rbyxFJZuPMjlfrrRTwhGftw
         mZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7I81sFIDb8Q976rkJbwcuiRV/Nx0QBZujSIjqUXyumaAf3FvZfH2RUObx5Ga3w3QwAP8JQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB0QAJbHGSDEvQ8GVm3u5k5bcSP+55jDieZ6hb+9OsVK/9r+rm
	JM/6jhmH7SpaieAlZt/p+IiinmmUDxUEYGea4VCJyoZGrh5ImAh9
X-Google-Smtp-Source: AGHT+IHd9rUwx1vPgvau2mRCMsPu7jFuom4TlKP3Iryw6hYBdaK/Ga2xceDhsm6Lvgbdk60eJznQIQ==
X-Received: by 2002:a05:6300:6681:b0:1cf:22d4:382e with SMTP id adf61e73a8af0-1cf7624b255mr13716445637.37.1726291581862;
        Fri, 13 Sep 2024 22:26:21 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:21 -0700 (PDT)
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
Subject: [PATCH v2 15/22] arm64: dts: apple: Add A8X devices
Date: Sat, 14 Sep 2024 13:17:24 +0800
Message-ID: <20240914052413.68177-19-towinchenmi@gmail.com>
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

Add DTS files for the A8X SoC and the only device based on it, the iPad
Air 2.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Ivalyo: system memory bits]
Co-developed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
[Nick: SMP, m1n1 and gpio-keys support, pinctrl fixes]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile        |   2 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi |  46 +++++++
 arch/arm64/boot/dts/apple/t7001-j81.dts   |  14 ++
 arch/arm64/boot/dts/apple/t7001-j82.dts   |  14 ++
 arch/arm64/boot/dts/apple/t7001.dtsi      | 154 ++++++++++++++++++++++
 5 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index d5dd1e2e4f4c..adda522ea490 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -16,6 +16,8 @@ dtb-$(CONFIG_ARCH_APPLE) += t7000-j97.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n102.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n56.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t7000-n61.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7001-j81.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t7001-j82.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t7001-air2.dtsi b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
new file mode 100644
index 000000000000..8ecf2842e8e5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-air2.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air 2 common device tree
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t7001.dtsi"
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
+			gpios = <&pinctrl 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 92 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 93 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7001-j81.dts b/arch/arm64/boot/dts/apple/t7001-j81.dts
new file mode 100644
index 000000000000..ca90dc0c872c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-j81.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air 2 (Wi-Fi), J81, iPad5,3 (A1566)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7001-air2.dtsi"
+
+/ {
+	compatible = "apple,j81", "apple,t7001", "apple,arm-platform";
+	model = "Apple iPad Air 2 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t7001-j82.dts b/arch/arm64/boot/dts/apple/t7001-j82.dts
new file mode 100644
index 000000000000..d9fd16f48db7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001-j82.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air 2 (Cellular), J82, iPad5,4 (A1567)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t7001-air2.dtsi"
+
+/ {
+	compatible = "apple,j82", "apple,t7001", "apple,arm-platform";
+	model = "Apple iPad Air 2 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
new file mode 100644
index 000000000000..9a5f0a4bde52
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T7001 "A8X" SoC
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
+			compatible = "apple,typhoon";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,typhoon";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "apple,typhoon";
+			reg = <0x0 0x2>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
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
+			interrupts = <AIC_IRQ 158 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		wdt: watchdog@20e027000 {
+			compatible = "apple,t7000-wdt", "apple,wdt";
+			reg = <0x2 0x0e027000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,t7000-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl: pinctrl@20e300000 {
+			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0e300000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 184>;
+			apple,npins = <184>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 62 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 63 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 64 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 65 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A8X doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.0

