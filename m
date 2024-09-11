Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EEE188933
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044476; cv=none; b=iP8sBO60btQEtVSdn62glEwGr6mhUuzFF7R+xqn6iPdG62ugpxTMuyemS9uM1/+0nvjrZ/5nbEgxTikO93iSHVTTP62L8vbJPIhIMJlVszA0Hc4cjEs0qtZ8oatwRHeW1MCHqPj8oIFEGHqBHCe4Ox/N/VXdDRYsUjUTpk5eJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044476; c=relaxed/simple;
	bh=g9nc4Ituj+X1HWyXRMzbaj6RbA6YTyycvHtOn7+fDFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+dq5sJpeI1yjlu2ywJ/S8HI/1CubUw3bncdjjrGBIHctFF5ebh2taDttQWSc3HJ66rgp9dIJRpWWvvHsGq80hM4i71rauZyDCTmVHjyEGpEQuSUkUKOOYVicZudYhRi6QjvPTfjIE5pY3tE/U/iQkDsAe43We1Ne09dq1+fvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv9NCFL4; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv9NCFL4"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso4549883a12.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044474; x=1726649274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWNzugIv3rULovOLrNzbetORGSTAU5vtXCO8QT80TL4=;
        b=Wv9NCFL41B+t1maS6oQI7p7Ks8gyfxHa0q8dfAiaEDI9A6PKmmOf7vrMQRfLwP+ba+
         z4Cxf7ii7OzDHBHgGp+RATKzxxueGfO0W0Moo6oeizHZjwx4psljIlhe7eyQC8FiR6Xc
         EuiK4YUqkc0VaIz4psm1+USxQY0dpmkARBxbQDJ2RfI4V0hqVmTya4cCnooGpBOhdRu7
         FBXlpnDtC1vec77z7r98s/Vc9sw6Vz6kA2KbQtSpe8JOreD5w+B4Fv0UQJJd8l5H0kq9
         +2Cv6Qt/2KLAvp/A9QZaLhWjLZ3LFU/fJ8tj4clQJKAdSvTV8DS9pxZ7Szgthv3K1Zfn
         x+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044474; x=1726649274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWNzugIv3rULovOLrNzbetORGSTAU5vtXCO8QT80TL4=;
        b=J0ZqnJmvpeNz7iihMDkCRbwfouczneksMmAQr2BjdSU2uT2GTTIp4f6b3pEoAnFTjK
         J3NWMR7n2FMDqA03oliG1qTEldiz37ba4PsZADtv58EMQwz4FOmQeOEFRBwSNENb/TyK
         mUpVLc7s6m8ztrIXDef0e0gfByDJj6mmTVoVNMYJaIqixZiFaIbptFE2IbcRm5vL9SUn
         ZK9JsplOmGvvkrutCMBnA+uQ8K9VM7kDaqLPpVsWz6z/lVoznuZKzBDI03GjOUQdf4mP
         uQyitL0r6iz7EEU8pRHvVVYHIHoaoVOOFC6b/AQZvyJaQ3vO/1FKUCMHv+7FofQUDAMN
         lnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcavFnLk/ZMcFKMPSDbbWOtiFi2qwg/c620XsJtlCNpB0rSqpw4U6og2D9K9i7MPJk5JnhOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt7awNJqJAD2ZqDwKq9PetjLaEeNigae8WFB5Ijk31LRn6JZ7F
	pp3bhXasQmB3gl49ddLbq+By3lYAe1z09P2QdYHu3RzFk0ggsdR7
X-Google-Smtp-Source: AGHT+IFOoRLQFiA69xNfcw2iR/+a56NPEeMysSDqf2Vvde5Cvg5sypU3XDSUCoRKPlLIzYmqIAE1Lw==
X-Received: by 2002:a05:6a21:4a4c:b0:1cc:dd02:f8f3 with SMTP id adf61e73a8af0-1cf5e106e2emr5507672637.28.1726044474006;
        Wed, 11 Sep 2024 01:47:54 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:53 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 13/22] arm64: dts: apple: Add A7 devices
Date: Wed, 11 Sep 2024 16:41:03 +0800
Message-ID: <20240911084353.28888-15-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konradybcio@kernel.org>

Add DTS files for the A7 SoC and the following devices based on it:

- iPhone 5S
- iPad Air (1)
- iPad Mini 2
- iPad Mini 3

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
[Nick: SMP and m1n1 support, gpio-keys additions]
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/Makefile            |  11 ++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  52 +++++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  52 +++++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  52 +++++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  13 ++
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 147 ++++++++++++++++++
 17 files changed, 481 insertions(+)
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
index 000000000000..1a8d92a8f00c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5S common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTMETA>;
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
index 000000000000..ecddbb33bcc2
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -0,0 +1,52 @@
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
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTMETA>;
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
index 000000000000..208415db4d1d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j85.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 2 (Wi-Fi), J85, iPad4,4 (A1489)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j85", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Mini 2 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
new file mode 100644
index 000000000000..b3d84a46cb64
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 3 (Wi-Fi), J85m, iPad4,7 (A1599)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j85m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Mini 3 (Wi-Fi)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j86.dts b/arch/arm64/boot/dts/apple/s5l8960x-j86.dts
new file mode 100644
index 000000000000..22de63976649
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j86.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 2 (Cellular), J86, iPad4,5 (A1490)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j86", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Mini 2 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
new file mode 100644
index 000000000000..11acb24ab41c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 3 (Cellular), J86m, iPad4,8 (A1600)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j86m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Mini 3 (Cellular)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j87.dts b/arch/arm64/boot/dts/apple/s5l8960x-j87.dts
new file mode 100644
index 000000000000..d1fa78af3d2f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j87.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 2 (Cellular, China), J87, iPad4,6 (A1491)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini2.dtsi"
+
+/ {
+	compatible = "apple,j87", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Mini 2 (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts b/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
new file mode 100644
index 000000000000..10c5f4cfcc58
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 3 (Cellular, China), J87m, iPad4,9 (A1601)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-mini3.dtsi"
+
+/ {
+	compatible = "apple,j87m", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPad Mini 3 (Cellular, China)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
new file mode 100644
index 000000000000..b214b780a12d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 2 common device tree
+ * Based on A7 (APL0698), up to 1.3GHz
+ *
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+#include "s5l8960x.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-home {
+			label = "Home Button";
+			gpios = <&pinctrl 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_LEFTMETA>;
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
index 000000000000..f4b8afbfa5f5
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Mini 3 common device tree
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
index 000000000000..ba50c0bd9650
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-n51.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5S (GSM), N51, iPhone6,1 (A1453/A1533)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-5s.dtsi"
+
+/ {
+	compatible = "apple,n51", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPhone 5S (GSM)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-n53.dts b/arch/arm64/boot/dts/apple/s5l8960x-n53.dts
new file mode 100644
index 000000000000..6115efd95b80
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-n53.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPhone 5S (LTE), N53, iPhone6,2 (A1457/A1518/A1528/A1530)
+ * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "s5l8960x-5s.dtsi"
+
+/ {
+	compatible = "apple,n53", "apple,s5l8960x", "apple,arm-platform";
+	model = "Apple iPhone 5S (LTE)";
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
new file mode 100644
index 000000000000..fae18d4be53c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -0,0 +1,147 @@
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
+		/* To be filled in by the bootloader (based on XNU BootArgs). */
+		reg = <0x8 0 0 0>;
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

