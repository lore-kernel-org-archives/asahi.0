Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DC3185956
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291575; cv=none; b=mP1r3/Yo/ZUjn6w14ERK52YGi7+zOPAtuuwqCQJKMH1zEV5ks2ojOAWz+UyWb4O/UzEk9868U433xlokBN8K0p+8p9fMny1hhEuPtE1XhkBOLUd0vPyeAJy8tELHP8FM/VQdLKUyef20HSOA85wf1BvB4FWXPZ/FRCs5sB0rcdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291575; c=relaxed/simple;
	bh=eVkXQZAEIH8Iolukyt+/fIxhMe0IktyxyHHKQ2aBrjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aABulvQIvM6Y1iUyDe89TXZfJiXZzNAMctevc5EYqAh9ePNh+kewrzE4J/5olQJ+BxwEGJ6G6MfnTNFaHKXPUEDekKqNzbbAHiiJNeeP2Dir3bbB9tanfU+LJXlunEmqBTj57TRL1NMeUef5ICDeDE+EOpKqFkcomCCvSaUZBi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebdU23Ws; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebdU23Ws"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718d962ad64so2383629b3a.0
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291573; x=1726896373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ5g+rZceq2sd9R8Rbk7PSzJd79RQKIw0Hvg0zFVTCs=;
        b=ebdU23WsXJ2v1HvTypLUM7amlAsKj7LUfj2Hx4gA/seDWKabyX7RpLYjYbcAo1RWiS
         yDTVoZIe6Eg3UCljUqZXJFbKWQRR0KUkJZld9Yx/ya4ZxRVYBtWIcFUabpaEfhHrDeAo
         t2MCeChpgXy37u1bt74O3ip6thNpcGDDfQvCvu4DKjSeREgC/zy303+eWuNWDJQTYNoF
         +IPMkxHzpZGvjXilZDZ3RALUqwDZTYh5+GKC7HUdb9vQqb1PKiaHm2iEQ8yitXB5Kdi2
         8cJPst/NO0hoYvXP6TdInqRyCCYkEnAyNDyqoeTLWmXWawAZQviqH3x1gxVywh/Vd91K
         BLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291573; x=1726896373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZ5g+rZceq2sd9R8Rbk7PSzJd79RQKIw0Hvg0zFVTCs=;
        b=YOB8wGxHcubeKbZ+RV+TyzWYIcsn0JF59ST0/5PMhZhD1CU7xF0lq3zz5KfR6AZbXi
         Bo6Nxyq7JELsrbSUojsO4rGWlPrN77Uxx/S3JmqBNNgYjh5KFoZogvnPZpztKUoEuiOR
         n+Sc/sw8wTUwI7197Aj++NPlUhgfSrB0A2+tv5nzsv2sXy4brT9uL6hvwIjtLo3g/QJi
         tkrOGJCijm3/XjABx09MFLjiUH5WIbFpY8cBGTLcec4oRR/feqMI2JhAYw7NJ2/qmCvK
         vbJEbZHvcAlTYDe545c+Sw3tbP5fpXLI3Y2NgCRs3YAi94W9Zq8viqB708H0S2+fWmJQ
         wD7g==
X-Forwarded-Encrypted: i=1; AJvYcCWwpGoDiGrCeeHeIW+ocYRJxCdIsyRPfzr7hj0hLaBi09SnUXNdD1r1pYtvZIdVwW6VdlCloQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7R/3iTKAsLg173Vl+yigfL0RUdzvWS/vAibljfApf5EGLsMjU
	gjdCTqu/qYFgkHiwzb1Vi4neNjEQcuDiwI+sK1GhmZLH2CBnsGtl
X-Google-Smtp-Source: AGHT+IGY8CKIMdWL9Gsc/Dp5tu+Gz3BZoU+A28OiqyeLP/NaxrRK6UREdRXwq04Hmu8rgIgKe3AtPQ==
X-Received: by 2002:a05:6a20:c90d:b0:1d0:80d:665c with SMTP id adf61e73a8af0-1d0080d6713mr12495061637.7.1726291572801;
        Fri, 13 Sep 2024 22:26:12 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:12 -0700 (PDT)
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
Subject: [PATCH v2 13/22] arm64: dts: apple: Add A7 devices
Date: Sat, 14 Sep 2024 13:17:22 +0800
Message-ID: <20240914052413.68177-17-towinchenmi@gmail.com>
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

Add DTS files for the A7 SoC and the following devices based on it:

- iPhone 5s
- iPad Air (1)
- iPad mini 2
- iPad mini 3

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP and m1n1 support, gpio-keys additions]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |  11 ++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  54 +++++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  54 +++++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  54 +++++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  13 ++
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 146 ++++++++++++++++++
 17 files changed, 486 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index aec5e29cdfb7..e1ee803f72a7 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -1,4 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j71.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j73.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j85m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j86m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j87m.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-n53.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j72.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j85.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j86.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-j87.dtb
+dtb-$(CONFIG_ARCH_APPLE) += s5l8960x-n51.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j274.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j293.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8103-j313.dtb
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
new file mode 100644
index 000000000000..4da68f610747
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	chassis-type = "handset";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 16 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
new file mode 100644
index 000000000000..9afc1b0600b8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air  common device tree
+ * Based on A7 (APL5698), up to 1.4GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
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
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 110 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j71.dts b/arch/arm64/boot/dts/apple/s5l8960x-j71.dts
new file mode 100644
index 000000000000..e13036dacb45
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j71.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air (Wi-Fi), J71, iPad4,1 (A1474)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-air1.dtsi"
+
+/ {
+	compatible = "apple,j71", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Air (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j72.dts b/arch/arm64/boot/dts/apple/s5l8960x-j72.dts
new file mode 100644
index 000000000000..afb71b8885c6
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j72.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air (Cellular), J72, iPad4,2 (A1475)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-air1.dtsi"
+
+/ {
+	compatible = "apple,j72", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Air (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j73.dts b/arch/arm64/boot/dts/apple/s5l8960x-j73.dts
new file mode 100644
index 000000000000..c871962df529
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j73.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Air (Cellular, China), J73, iPad4,2 (A1476)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-air1.dtsi"
+
+/ {
+	compatible = "apple,j73", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Air (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j85.dts b/arch/arm64/boot/dts/apple/s5l8960x-j85.dts
new file mode 100644
index 000000000000..aefb7b36d7aa
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j85.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 (Wi-Fi), J85, iPad4,4 (A1489)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j85", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 2 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
new file mode 100644
index 000000000000..ec2bcaa6d1d5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 (Wi-Fi), J85m, iPad4,7 (A1599)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j85m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 3 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j86.dts b/arch/arm64/boot/dts/apple/s5l8960x-j86.dts
new file mode 100644
index 000000000000..470f2f825e70
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j86.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 (Cellular), J86, iPad4,5 (A1490)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j86", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 2 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
new file mode 100644
index 000000000000..90311d98aaad
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 (Cellular), J86m, iPad4,8 (A1600)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j86m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 3 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j87.dts b/arch/arm64/boot/dts/apple/s5l8960x-j87.dts
new file mode 100644
index 000000000000..3580fd8e3831
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j87.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 (Cellular, China), J87, iPad4,6 (A1491)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j87", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 2 (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
new file mode 100644
index 000000000000..fa0da4fa6727
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 (Cellular, China), J87m, iPad4,9 (A1601)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j87m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad mini 3 (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
new file mode 100644
index 000000000000..778f470b5fd9
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 2 common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
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
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+			wakeup-source;
+		};
+
+		button-power {
+			label = "Power Button";
+			gpios = <&pinctrl 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-voldown {
+			label = "Volume Down";
+			gpios = <&pinctrl 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+
+		button-volup {
+			label = "Volume Up";
+			gpios = <&pinctrl 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		switch-mute {
+			label = "Mute Switch";
+			gpios = <&pinctrl 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_MUTE>;
+		};
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
new file mode 100644
index 000000000000..5c2e1b838af2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad mini 3 common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/*
+ * The Mini 3 seems to be only an iteration over the Mini 2 with some small changes, like the
+ * introduction of Touch ID, hence there is little to no differentiation between these 2 for now.
+ */
+#include "s5l8960x-mini2.dtsi"
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-n51.dts b/arch/arm64/boot/dts/apple/s5l8960x-n51.dts
new file mode 100644
index 000000000000..cd52f814fbf2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-n51.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s (GSM), N51, iPhone6,1 (A1453/A1533)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-5s.dtsi"
+
+/ {
+	compatible = "apple,n51", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPhone 5s (GSM)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-n53.dts b/arch/arm64/boot/dts/apple/s5l8960x-n53.dts
new file mode 100644
index 000000000000..4795798a4444
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-n53.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5s (LTE), N53, iPhone6,2 (A1457/A1518/A1528/A1530)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-5s.dtsi"
+
+/ {
+	compatible = "apple,n53", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPhone 5s (LTE)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
new file mode 100644
index 000000000000..b36c06a6d96c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple S5L8960X "A7" SoC
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
+			compatible = "apple,cyclone";
+			reg = <0x0 0x0>;
+			cpu-release-addr = <0 0>; /* To be filled by loader */
+			enable-method = "spin-table";
+			device_type = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "apple,cyclone";
+			reg = <0x0 0x1>;
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
+		serial0: serial@20a0a0000 {
+			compatible = "apple,s5l-uart";
+			reg = <0x2 0x0a0a0000 0x0 0x4000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 140 IRQ_TYPE_LEVEL_HIGH>;
+			/* Use the bootloader-enabled clocks for now. */
+			clocks = <&clkref>, <&clkref>;
+			clock-names = "uart", "clk_uart_baud0";
+			status = "disabled";
+		};
+
+		wdt: watchdog@20e027000 {
+			compatible = "apple,s5l8960x-wdt", "apple,wdt";
+			reg = <0x2 0x0e027000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 4 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		aic: interrupt-controller@20e100000 {
+			compatible = "apple,s5l8960x-aic", "apple,aic";
+			reg = <0x2 0x0e100000 0x0 0x100000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+		};
+
+		pinctrl: pinctrl@20e300000 {
+			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
+			reg = <0x2 0x0e300000 0x0 0x100000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 200>;
+			apple,npins = <200>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 109 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 110 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 111 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 112 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt";
+		/* Note that A7 doesn't actually have a hypervisor (EL2 is not implemented). */
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
-- 
2.46.0

