Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD818E77C
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284987; cv=none; b=t0r+e0pJJSqd19zXvsMWEQM0DpI4xomiEEJml1ya9sQVBxi7RzT5w/bAp+hipV5w0eD9gU6PNuKtVf+Gx4mV93MNDhalVDkPNeZx2DBlAe3Z4inDSM/mn29ygvBcIix4tzz2qvtvhiuYF555t4fp/o5rpmtW1mFryO1Sen0ZXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284987; c=relaxed/simple;
	bh=dqUYI/G/g7NKW2V2lKCa4cC22YgoHrgYHGrzItfYOvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMkPgSob2DDzqu5Hq3LLazmaKwWh8ECx0DxuQKogMOQXBa7IKTINfJAeBs0FFg2QXSADhfYnWDr6wInsfsXHZot3oIC4ftl55JP54eyJnQ2DSmiVpHxO8I4DQ5U3GsLHomXK2lzMcWUAx99KMoii6zCPUlysndQAihGLhab1exA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dxhv5tGZ; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxhv5tGZ"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e3991843e2so2130204b6e.3
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284985; x=1728889785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+b9pn6yT5Ix2s6JLKELpyLIdb8RSINBxcPaExVf9Hg=;
        b=Dxhv5tGZsm8q+P1WlSbpEyGeV55ZEPENdqPxygwNpeRzJC64PfYJ3Tz1nAsxTnm+FT
         /RlxD8bL4XjHaj5FTMhuEJ9daGITw8V7gjBTewC30xe8+Wa6fVptXqYDYjUOtCIblBPd
         exF5WBV+8W0CtTnyifp+rh+3+wHt7le/FTA6GCuBsn+ZejX0lqlJPz033GM1dxapL4Mw
         cZUE9I6lu9Q89hx0K3Qa1d7i3Tj2lnc9Ec4SwcZY/QdEWUHWN5ajv4n0e4TP6OwVnEKv
         N46W7nU4g4PeuquBa9sQtGjGddlgO18VZTixo9KQf33zd+60O736A2P65w2Hg3q43CVo
         h7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284985; x=1728889785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+b9pn6yT5Ix2s6JLKELpyLIdb8RSINBxcPaExVf9Hg=;
        b=ois5EWnz+93oCy+UwIQcz4l0YbWz8mw/pGZRrIq3Mlevw2SE75/Lv8ITM3Xi4Vu40+
         WnEfhEJ5sYSiSLxKkXjNGEKDkaP9rC6Zov698e1uRZpA9owOKbXniaSeikX4F/p0WkiY
         Xsu6E/iQ8XhAG4aacDg6ZOaTCcCfGlq0WfGuTo2Q06MOjmk3XobzedB6KynWLFEfPsmU
         MevKEVyhgjlDCv2SFYATd5B+NO4thj5vTGpipiBLc+Aic2u094h1sXuyTHC63ZrT7i1b
         XqoGcX7R1AVfM5NEgSTfatlErrgpXYvh4ULaEncHkHPcKBksQddR+l+9nxnS79iPSp9r
         WzbA==
X-Forwarded-Encrypted: i=1; AJvYcCUiGukoXViev5ZEa+3DnkOlg/CewNi1BojwhfqOPqPqVc+MKmCh+uDU+HRiPhaJ9xMZ8a6q7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlSuQKlkWRohOy4IUtw/N0nXDOLY8vZ4YG6pVt9iR0JNVAvBbV
	rD2OxdUE0qMHyT0TadYhWcoWiKiduAku/Tu3RZhVDzbTSfISgJDV
X-Google-Smtp-Source: AGHT+IFehfwp1aUPOaxw+0ePiG0RWTfgFh8bGb7r5kC6D63Gu31aGazacPARJNkg4TPj3h93Rv0RPw==
X-Received: by 2002:a05:6808:168a:b0:3e3:a903:49cb with SMTP id 5614622812f47-3e3c156ca40mr6697293b6e.39.1728284984412;
        Mon, 07 Oct 2024 00:09:44 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:44 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 17/20] arm64: dts: apple: Add A10 devices
Date: Mon,  7 Oct 2024 15:05:42 +0800
Message-ID: <20241007070758.9961-18-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add DTS files for the A10 SoC and the following devices based on it:

- iPhone 7
- iPhone 7 Plus
- iPod touch 7
- iPad 6
- iPad 7

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP, m1n1 and AOP pinctrl support]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile          |   9 ++
 arch/arm64/boot/dts/apple/t8010-7.dtsi      |  43 +++++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi |  48 +++++++
 arch/arm64/boot/dts/apple/t8010-d10.dts     |  14 +++
 arch/arm64/boot/dts/apple/t8010-d101.dts    |  14 +++
 arch/arm64/boot/dts/apple/t8010-d11.dts     |  14 +++
 arch/arm64/boot/dts/apple/t8010-d111.dts    |  14 +++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi  |  44 +++++++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi  |  14 +++
 arch/arm64/boot/dts/apple/t8010-j171.dts    |  14 +++
 arch/arm64/boot/dts/apple/t8010-j172.dts    |  14 +++
 arch/arm64/boot/dts/apple/t8010-j71b.dts    |  14 +++
 arch/arm64/boot/dts/apple/t8010-j72b.dts    |  14 +++
 arch/arm64/boot/dts/apple/t8010-n112.dts    |  47 +++++++
 arch/arm64/boot/dts/apple/t8010.dtsi        | 133 ++++++++++++++++++++
 15 files changed, 450 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index f8cd10889d9f..4a7002e289a0 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -32,6 +32,15 @@ dtb-$(CONFIG_ARCH_APPLE) += s8001-j127.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8001-j128.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8001-j98a.dtb
 dtb-$(CONFIG_ARCH_APPLE) += s8001-j99a.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d101.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d10.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d111.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-d11.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j171.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j172.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j71b.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-j72b.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t8010-n112.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
new file mode 100644
index 000000000000..1332fd73f50f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 / 7 Plus common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8010.dtsi"
+#include "t8010-common.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 179 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 180 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl_ap 86 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-common.dtsi b/arch/arm64/boot/dts/apple/t8010-common.dtsi
new file mode 100644
index 000000000000..6613fb57c92f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-common.dtsi
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Apple iPhone 7, iPhone 7 Plus, iPad 6, iPad 7, iPod touch 7
+ *
+ * This file contains parts common to all Apple A10 devices.
+ *
+ * target-type: D10, D11, D101, D111, J71b, J72b, J171, J172, N112
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
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
+		/* To be filled by loader */
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d10.dts b/arch/arm64/boot/dts/apple/t8010-d10.dts
new file mode 100644
index 000000000000..39cdd12db6bf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d10.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 (Qualcomm), D10, iPhone9,1 (A1660/A1778/A1779/A1780)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d10", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 (Qualcomm)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d101.dts b/arch/arm64/boot/dts/apple/t8010-d101.dts
new file mode 100644
index 000000000000..6a9f0856f930
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d101.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 (Intel), D101, iPhone9,3 (A1660/A1778/A1779/A1780)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d101", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 (Intel)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d11.dts b/arch/arm64/boot/dts/apple/t8010-d11.dts
new file mode 100644
index 000000000000..57e41c2cfbe2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d11.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 Plus (Qualcomm), D11, iPhone9,2 (A1661/A1784/A1785/A1786)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d11", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 Plus (Qualcomm)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-d111.dts b/arch/arm64/boot/dts/apple/t8010-d111.dts
new file mode 100644
index 000000000000..37e395a48c1d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-d111.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 7 Plus (Intel), D111, iPhone9,4 (A1661/A1784/A1785/A1786)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-7.dtsi"
+
+/ {
+	compatible = "apple,d111", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPhone 7 Plus (Intel)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
new file mode 100644
index 000000000000..81696c6e302c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 6 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "t8010.dtsi"
+#include "t8010-common.dtsi"
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
+			gpios = <&pinctrl_ap 180 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 179 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 89 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 90 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad7.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
new file mode 100644
index 000000000000..bd0e9c0b5696
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 7 common device tree
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/*
+ * The iPad 7 seems to be only an iteration over the iPad 6 with some
+ * small changes, like the a bigger screen and 1 GiB of RAM more, hence
+ * there is little to no differentiation between these 2 generations for
+ * now.
+ */
+#include "t8010-ipad6.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8010-j171.dts b/arch/arm64/boot/dts/apple/t8010-j171.dts
new file mode 100644
index 000000000000..6751bf3a4afd
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j171.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 7 (Wi-Fi), J171, iPad7,11 (A2197)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad7.dtsi"
+
+/ {
+	compatible = "apple,j171", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 7 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-j172.dts b/arch/arm64/boot/dts/apple/t8010-j172.dts
new file mode 100644
index 000000000000..51aaa950acd9
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j172.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 7 (Cellular), J172, iPad7,12 (A2198/A2200)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad7.dtsi"
+
+/ {
+	compatible = "apple,j172", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 7 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-j71b.dts b/arch/arm64/boot/dts/apple/t8010-j71b.dts
new file mode 100644
index 000000000000..534eb8413e08
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j71b.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 6 (Wi-Fi), J71b, iPad7,5 (A1893)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad6.dtsi"
+
+/ {
+	compatible = "apple,j71b", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 6 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-j72b.dts b/arch/arm64/boot/dts/apple/t8010-j72b.dts
new file mode 100644
index 000000000000..264924e41f42
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-j72b.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad 6 (Cellular), J72b, iPad7,6 (A1954)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010-ipad6.dtsi"
+
+/ {
+	compatible = "apple,j72b", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPad 6 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-n112.dts b/arch/arm64/boot/dts/apple/t8010-n112.dts
new file mode 100644
index 000000000000..6e71c3cb5d92
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010-n112.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPod touch 7, N112, iPod9,1 (A2178)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "t8010.dtsi"
+#include "t8010-common.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	compatible = "apple,n112", "apple,t8010", "apple,arm-platform";
+	model = "Apple iPod touch 7";
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl_ap 86 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl_ap 179 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl_ap 180 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl_ap 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
new file mode 100644
index 000000000000..e3d6a8354103
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Apple T8010 "A10" SoC
+ *
+ * Other names: H9P, "Cayman"
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
+		/* Note that A10 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.2

