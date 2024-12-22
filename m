Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A069B18FDB2
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734888499; cv=none; b=gwY3LIcqCYeH95ghZcX/VTL2wwItqvlp5P9YqPtQ9d3lObg0K11DxdqBpFozN2QdpTX2JhXPiNw0SjQeVKLaUHBhtvirUXYmtGqFwjeW4sAxEsU7XJhR6pRBVIbyKpr80TFuTZHUYekVD2jp6T2ItFMT1Ffa0sJeTIFg9NJlAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734888499; c=relaxed/simple;
	bh=TcNZ5ucrKkvZUeTCm/E10lQ+rbroBONonILFuhZg5Vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2NWhGwUxSznqOrF4NBbkfNhjRmS0vWz2tzHmVgKnpQtQPQkXQQYh6i1uG2wWV1c4VbeNDyAmkNTdM8Gn/KW+mWGo63JuXJeqdsDhsx5Xn1CRMgjs+Y+SfAWC9Rwian54DIbMNXqO9f+oB594unH17i+AB3V/7+5EJe5pG6aLs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7h2+jXq; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7h2+jXq"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-825c6570a80so2082738a12.2
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734888496; x=1735493296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu601tyY4epLjb/tQTUlTVuTNbfmOtzSi3U6eJFzPzo=;
        b=a7h2+jXqHEyDMPZtVnYh+/m38RGAKvLxb15oDAszIvxRixa8PUiPwLC1+b6//QcdBL
         kWsKXnC4yqWy9UuKUulXCsypgJaopCILjpVdSPMdUaGG5pXqEm0O7x1onWFFwVJMsrl5
         RvZWqmiuyJIffc0Gw5MSniRBnbq5rcwG7w2d12J5CuI0/MFhNbwQbih7xe2LZGPDrw/d
         JsJEMAyCFvCMb8K3J4j/uCcfXOLTXBx37cHxFt06XIEaSjHcu/TJeihrVAHxtrJDza2M
         1IqXdAJksQHPMKbYIWVM9jli73TT02B+cKqBLK9JuyAT9+PkFlHuaBqj/rxbImsOUtXn
         wBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888496; x=1735493296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu601tyY4epLjb/tQTUlTVuTNbfmOtzSi3U6eJFzPzo=;
        b=dW/+9oTkYnawZG6sR/SO8eHUhCXzGw8Uu1JXgAgMuYgJVBZNL5FalQdTAOG9zC/Q0D
         rPN57MnGCpLPMrB/pnji4PkQzZiRxMYEGemCx1OdWvgRF9Wf+0VLJMzddEdXhhjwRgvD
         tblmfID9oLAFRYuAIyHAihk0/lWD3PA3+4cJOcsvf+bY56idej9HD8VpQkeRlS1CT9b+
         Lc9f58+uNO7hGysSRCNL6ZSYqtR1lb8/kTes7dBYApA6cD3FAEUTNMmTck2iLP3o2/iL
         id8yj1CdRwZyOYxTz+Sd2VJVe9aJUwKH0jFu8xVgWEFfOHCaYlpfGXOilak4Yr/I0tKp
         imGg==
X-Forwarded-Encrypted: i=1; AJvYcCV0rqJUj6ccp51UInUIdG3rlcj1f19HaZq6d0UMf7l6+V6UTv0YIl8O0Vy5nSjdMoq0Nve6dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRxhry58v6ixnTJWdrp1mwp1e1ziwRXOWzIUFYvSJ1DMdQIGcn
	p62VLXdwWYlNSyUJBDbG+TF7Q+mSS51nKxnRXbHpivtFbTSq1v34
X-Gm-Gg: ASbGnctzQizHEwWnpo9ZBSqr73XEPWtgxDUzrRfwovSr3+farkLCYbjZ5aMFaFqc3sq
	wMo9QLrzVoP/jwi91iPcn8XogsxSJmQzasLJHxcK0KVoxDgauhyQaPUDj1/3nz9G40NrHRNp7HF
	yED0vo28XrxChlL9Fbom1Ao7rsfbFKMacp8oh+ZXtrhtEeBLzTfUVX33ELrgHlnwn11mKUaVU3w
	gGJclNGwmHDGh17jfoJA47e3RaCI3Ar0sX0M5FP5DfTIkqGL7cqyzQWdw==
X-Google-Smtp-Source: AGHT+IH1Z39YXP8Pu3o3xRuuV9/Pd7ax39fhbC54Q7wq7X45elUygQIrzJo2YY5Botik9QCb/Tsx5A==
X-Received: by 2002:a05:6a20:8428:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1e5e04584ccmr16452790637.1.1734888495765;
        Sun, 22 Dec 2024 09:28:15 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad836192sm6585404b3a.68.2024.12.22.09.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:28:15 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2] arm64: dts: apple: Split s8000/s8003 SoC DTS files
Date: Mon, 23 Dec 2024 01:26:08 +0800
Message-ID: <20241222172735.145764-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Despite what the code comments said, the DTS files were not split properly.
Since these two SoCs are now known to have minor differences like in
latencies for cpufreq state transistions, split the DTS files now.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes since v1:
- Drop PMGR nodes file rename. This is now the first patch and other series
that modifies Apple A9 DTS files now depend on this series.

Link to v1: https://lore.kernel.org/asahi/20241206135051.56049-1-towinchenmi@gmail.com/T

Nick Chan

 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 140 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/s8000.dtsi    | 133 +---------------------
 arch/arm64/boot/dts/apple/s8003.dtsi    |  10 +-
 3 files changed, 146 insertions(+), 137 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3.dtsi

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
new file mode 100644
index 000000000000..082e5b1733d0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S8000/S8003 "A9" SoC
+ *
+ * This file contains parts common to both variants of A9
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
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
+			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
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
+			gpio-ranges = <&pinctrl_ap 0 0 208>;
+			apple,npins = <208>;
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
+			gpio-ranges = <&pinctrl_aop 0 0 42>;
+			apple,npins = <42>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
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
+		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+/*
+ * The A9 was made by two separate fabs on two different process
+ * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
+ */
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
index 6e9046ea106c..c7e39abda7e1 100644
--- a/arch/arm64/boot/dts/apple/s8000.dtsi
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -7,138 +7,11 @@
  * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
  */
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/apple-aic.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/pinctrl/apple.h>
-
-/ {
-	interrupt-parent = <&aic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "apple,twister";
-			reg = <0x0 0x0>;
-			cpu-release-addr = <0 0>; /* To be filled in by loader */
-			enable-method = "spin-table";
-			device_type = "cpu";
-		};
-
-		cpu1: cpu@1 {
-			compatible = "apple,twister";
-			reg = <0x0 0x1>;
-			cpu-release-addr = <0 0>; /* To be filled in by loader */
-			enable-method = "spin-table";
-			device_type = "cpu";
-		};
-	};
-
-	soc {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		nonposted-mmio;
-		ranges;
-
-		serial0: serial@20a0c0000 {
-			compatible = "apple,s5l-uart";
-			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-			reg-io-width = <4>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>;
-			/* Use the bootloader-enabled clocks for now. */
-			clocks = <&clkref>, <&clkref>;
-			clock-names = "uart", "clk_uart_baud0";
-			status = "disabled";
-		};
-
-		aic: interrupt-controller@20e100000 {
-			compatible = "apple,s8000-aic", "apple,aic";
-			reg = <0x2 0x0e100000 0x0 0x100000>;
-			#interrupt-cells = <3>;
-			interrupt-controller;
-		};
-
-		pinctrl_ap: pinctrl@20f100000 {
-			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
-			reg = <0x2 0x0f100000 0x0 0x100000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_ap 0 0 208>;
-			apple,npins = <208>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 42 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 43 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 44 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 45 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pinctrl_aop: pinctrl@2100f0000 {
-			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
-			reg = <0x2 0x100f0000 0x0 0x100000>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_aop 0 0 42>;
-			apple,npins = <42>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 115 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 116 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 117 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 118 IRQ_TYPE_LEVEL_HIGH>,
-				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		wdt: watchdog@2102b0000 {
-			compatible = "apple,s8000-wdt", "apple,wdt";
-			reg = <0x2 0x102b0000 0x0 0x4000>;
-			clocks = <&clkref>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
-		};
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt";
-		/* Note that A9 doesn't actually have a hypervisor (EL2 is not implemented). */
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-};
+#include "s800-0-3.dtsi"
 
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
- * the S8003 (APL1022) on 16nm. While they are seemingly the same,
- * they do have distinct part numbers and devices using them have
- * distinct model names. There are currently no known differences
- * between these as far as Linux is concerned, but let's keep things
- * structured properly to make it easier to alter the behaviour of
- * one of the chips if need be.
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
  */
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
index 7e4ad4f7e499..807e3452f8a7 100644
--- a/arch/arm64/boot/dts/apple/s8003.dtsi
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -7,15 +7,11 @@
  * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
  */
 
-#include "s8000.dtsi"
+#include "s800-0-3.dtsi"
 
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
- * the S8003 (APL1022) on 16nm. While they are seemingly the same,
- * they do have distinct part numbers and devices using them have
- * distinct model names. There are currently no known differences
- * between these as far as Linux is concerned, but let's keep things
- * structured properly to make it easier to alter the behaviour of
- * one of the chips if need be.
+ * the S8003 (APL1022) on 16nm. There are some minor differences
+ * such as timing in cpufreq state transistions.
  */

base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.47.1

