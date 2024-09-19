Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B21AAE0D
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762620; cv=none; b=m0pmolYeE1eMQo+dC+LVEvHUBf8j6ZUnMF00oNB3UajzjhHyWCHd0xndKszWIj0+6y5wfYl4zpgf6bViZV5cTqG5U/aBICZGx6meOupD9Pu5nqlXagGjdxEWRD8fdTQ0C/cgQPE5AOAyec+1AzMEkXrEHVv8U5dFC0M8HyyEKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762620; c=relaxed/simple;
	bh=J5SEPolgAawSH5c+wA7Z9Ao9L7d2oXkDAmd1T2EK/Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5Pv4XIz+VbsYqNomO5k6DbpwY4uCeTjHIX8Xn6XB8MzHSiwmVI36Xw27cD9usE+TraZe8/J3ncgVNju6mH7gN9fHWt13CVYrQSVjQYnYVqAD8UEGgAzLNUUV33rGfWttrM2p+/KTVzaGsyWlzsMF5T4lnoA1aRSnr1HgrBg9SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg4loIMv; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg4loIMv"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so926351a91.2
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762617; x=1727367417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfUOSGh3pPERF4l//XzS1dlj9PxGJ9eyoQTy2F1aJ0g=;
        b=gg4loIMv0ODxs0Ct42D64OJqlc0DXeCFJYHF7ijAryaheZOFOG5zRKsmTGN99iZfyL
         8qx3SJmeom3bfMgdGmzycY678GPWKGaKHdi3/QmYsqFIntFKgzu7JK9QNe7k2R0n2D+P
         mZWFuBm84OcF2X1AxufyCNmyHDQ+D1Hpsxug7SaZc07yUyCjfKxjS7uDhF+UQympw4Rp
         XN/q8ad7ih31MFNH0kk3USOJ1KCxrshNHVl9dY1G0Wqi7Yag+nx71H8iyJirYnGYp2H2
         k3xVu3JEw2Bq8hTHnvYQu9gnwFmLYBbPANqK1L/iOYWs8nwgJhLPgQ5vQLr1eGlJoCT6
         IiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762617; x=1727367417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfUOSGh3pPERF4l//XzS1dlj9PxGJ9eyoQTy2F1aJ0g=;
        b=qyCFL8JgJtY/I44X1L3qwZEZsWCZaizQOU3UgDq0ns8g6KneGdlH8ralrOITWgSt+L
         SliKRTCK1CEA6ZvfxVBRRneAIFesiJZTcu584RpbBYuXIg94161z7vi88oKgBIcUJf9W
         eKS0xlBQeAx5qH1QTbXlxGHvihCh8CQbooCmCKUSvCKL3ewEEsWFIj39b94HiAjXHgRD
         HunxFUSUZYIT4+17XwA+xu8NmFLGvTx6S574lzJZM5V8tcKDvcVcimr4Wxsm+sM5w9rz
         ZL5mpwnDvl2joTbj+M7rRg6khlrC7W7uhMFwlcxCVaTqd/7ifx8qHOhKRuecDqVzz3kB
         aIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUtnZEU0PmcFbpjWKYzOsfQO21Fqm935LuuvbxILArcKuyR31hEHbgOKMOn/0tGkSxyWQG/kQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiYcRX2j1DWM3P0rCY9QXQQgbr/jX7+0Jc/kfj69pj3cFEvjM3
	HuruSPmAee9HJdOMNzFJmeZqZrbQkIp24mQqbT9w44UgzcwPFWlj
X-Google-Smtp-Source: AGHT+IE/gXZu2ApGAahrljHW3p8fT7VJLyEUhMuWbT8qBfqL+cloQ4JljcfH5Qzh5jHQ8N3X2+AZLQ==
X-Received: by 2002:a17:90b:1292:b0:2d3:bd6f:a31e with SMTP id 98e67ed59e1d1-2dbb9f3a24cmr30632185a91.28.1726762617258;
        Thu, 19 Sep 2024 09:16:57 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 18/20] arm64: dts: apple: Add A10X devices
Date: Fri, 20 Sep 2024 00:06:07 +0800
Message-ID: <20240919161443.10340-19-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add DTS files for the A10X SoC and the following devices based on it:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP, m1n1 and Apple TV 4K support, uart interrupt and pinctrl fixes]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile        |   5 +
 arch/arm64/boot/dts/apple/t8011-j105a.dts |  15 ++
 arch/arm64/boot/dts/apple/t8011-j120.dts  |  14 ++
 arch/arm64/boot/dts/apple/t8011-j121.dts  |  14 ++
 arch/arm64/boot/dts/apple/t8011-j207.dts  |  14 ++
 arch/arm64/boot/dts/apple/t8011-j208.dts  |  14 ++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi |  47 ++++++
 arch/arm64/boot/dts/apple/t8011.dtsi      | 175 ++++++++++++++++++++++
 8 files changed, 298 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index 4a7002e289a0..a44c14fae7bc 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -41,6 +41,11 @@ dtb-$(CONFIG_ARCH_APPLE) += t8010-j172.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8010-j71b.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8010-j72b.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8010-n112.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j105a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j120.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j121.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j207.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8011-j208.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t8011-j105a.dts b/arch/arm64/boot/dts/apple/t8011-j105a.dts
new file mode 100644
index 000000000000..4efd02725963
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j105a.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple TV 4K (1st Generation), J105a, AppleTV6,2 (A1482)
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "t8011.dtsi"
+
+/ {
+	compatible = "apple,j105a", "apple,t8011", "apple,arm-platform";
+	model = "Apple TV 4K (1st Generation)";
+	chassis-type = "television";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j120.dts b/arch/arm64/boot/dts/apple/t8011-j120.dts
new file mode 100644
index 000000000000..a620d8aaf468
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j120.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (12.9-inch) (Wi-Fi), J120, iPad7,1 (A1670)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j120", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (12.9-inch) (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j121.dts b/arch/arm64/boot/dts/apple/t8011-j121.dts
new file mode 100644
index 000000000000..dfec25f7d54a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j121.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (12.9-inch) (Cellular), J121, iPad7,2 (A1671)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j121", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (12.9-inch) (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j207.dts b/arch/arm64/boot/dts/apple/t8011-j207.dts
new file mode 100644
index 000000000000..12582bfe7532
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j207.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (10.5-inch) (Wi-Fi), J207, iPad7,3 (A1701)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j207", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (10.5-inch) (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-j208.dts b/arch/arm64/boot/dts/apple/t8011-j208.dts
new file mode 100644
index 000000000000..c0cd18e0ab18
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-j208.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 (10.5-inch) (Cellular), J208, iPad7,4 (A1709)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8011-pro2.dtsi"
+
+/ {
+	compatible = "apple,j208", "apple,t8011", "apple,arm-platform";
+	model = "Apple iPad Pro 2 (10.5-inch) (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011-pro2.dtsi b/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
new file mode 100644
index 000000000000..9f681dd9d463
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011-pro2.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro 2 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8011.dtsi"
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
+			gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 138 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 43 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 40 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
new file mode 100644
index 000000000000..e9f7d54893fe
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple T8011 "A10X" SoC
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
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x1>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "apple,hurricane-zephyr";
+			reg = <0x0 0x2>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+	};
+
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0x8 0 0 0>; /* To be filled by loader */
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
+			interrupts = <AIC_IRQ 216 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,t8010-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl_ap: pinctrl@20f100000 {
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
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
+			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x100f0000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aop 0 0 42>;
+			apple,npins = <42>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 127 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 131 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		wdt: watchdog@2102b0000 {
+			compatible = "apple,t8010-wdt", "apple,wdt";
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
+		/* Note that A10X doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.0

