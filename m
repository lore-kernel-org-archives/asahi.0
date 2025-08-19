Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67993334726
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604138; cv=none; b=ekYECiri102D346QjPdXOMzYcKpGfOGv+D+cvMbJqXTIbEPT+YxXQZkCfhBUmQgRhzyNgu1MrxAn+rEzCo1NPzt3SkbD8WcpvHBJeUw6glEboY2jfN9EY0zve4zTDv0q9dHnh3QcKEHQ9dYraf/CqezwxhNcYd7wMYyyuC2GVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604138; c=relaxed/simple;
	bh=x2fSqlD1a+GhrYf08R4xKoVp1GNK3211Ryioe6NRPdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPB3mZte7TfElj8eYdFJYxq+16aifn6SbrPFeuD6pev4ZB5nv8q4BJwy2CefsNJ2bWOeO2upBgKFJylIOlPWl8VHTJiGGQHO37ai1YDsjOUnATm06iWOG+MhqNukmRDd086XPxBlahq5wNLmPnqB0lIyZ//wGkejQrVuwx6ol2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acMHnKGg; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acMHnKGg"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea887f6so3841068b3a.2
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604137; x=1756208937; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=;
        b=acMHnKGgMu/dMQ0xbSbVgkjiriHo/kemt9vR/Ib48Fes4O6tcDfPAh4I5YKvRKc4w7
         6l/w/Q9NWfI411BmisNi5zIyNpH9jEI7p1IZoacKPJEWb1op7tKc3ZvDXO2Sro1q50dO
         xFngu7MX8K2aL8WP28PTTaq+gcQZzCNLtwl/XTrsKUmNeOfsJB+hCbFjxwcDAPuWyaoF
         cYzx3/8WFstnOzH8sr/D5nqM7OA3/MB3vAolYJSS5acJeR0pT7n/JwS1xQcc1eA64sIL
         HI5tuApP7PYcXVMRfbkwcDi55oDn8elWiA9G9ddboQXHkpUknGXHjEmiLufSv3tPqbT5
         j4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604137; x=1756208937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=;
        b=sYi5GKAPnKH88hozNfosKhoN/kBsnJ0TnCltZ6RsGV8wxP+HTwNxbTbB48Fmc4yLMo
         +juZ1KFZwU/k0C63NxS1kxptdO0VUNbfyyxZ+iHtkX3warAGYBGGnychelr/pz6eXk7N
         MFHKluGcpsDIv0D7b2VQXUJlec8nj8GhDzKtSIe7+/Dbi1lhbu4rXVnGWpwKPZU6+xoO
         BTEInA1rYE7vrF1lH56m1Rxfw8/qaABzro7q+EJOEciyglbD9up1UXW/dnxEYVkqeAhk
         pfMTIaMTszMPlMhbWDxww61lXBzWVEeRaDORWTa7BThUxM8j58l0k54ZcAZQtBnzOA2R
         5QOw==
X-Gm-Message-State: AOJu0Yy9pNNLPrrKpHP87eEvyUmZfKFDAENx6LUHkoJpB8IgiRrlVoQW
	yIbb8l8KAXjms3A1Y/z83LV1o2y7YrbZEVZGQswcf2HLiONRAKbTPSwd
X-Gm-Gg: ASbGncvpxMYaKspP11ga0bTwOAM8kETyJRYAjtEauEYdVrO4dY9s0b0TeU2dUQHzeys
	1HQ0qFgkfXDIpOGFMSyT+Lv0Hcj3T+Cwm/qxPJdDGj6RD6wXokta/oYMzmpAw/qTnUWBV8lsAhQ
	Y9V5qxQavafjsVzOvDQVcx+cD9zx/w9KFLbofjE/Bk9c/4O/vsYNg/nL+8vEgSB588Ikbp6aEP7
	O6brIx7w5ffjmWraa5z6KTMULj3W35X31f+SN1hNbddy1fiMofUA7Zgkcw2jRLJyNfLxNdFAoWQ
	/PVClTRJG7nRa/IaP+fzXOtdMJKcP+9feQG5lnCrEEvxXpJjIjAsYh5mBEi15EXGVkLxPytGIOX
	g6tjyxy1Z2vYuGVjLYsu4+KiFZGvuKv8nCioxxAdWxbo2Ss4zfsBoFhuDsUdLyrhfVrBr6c6eUz
	CsYRtNDPP0dm/DoJk=
X-Google-Smtp-Source: AGHT+IGv8XYNQhdMisvhcNFC2QCyy2wLByb+FNRg29NG9SM7abSIzlHCw3nXf5ewYBYJpL+eRz80rw==
X-Received: by 2002:a05:6a20:72a5:b0:232:4a42:dfd1 with SMTP id adf61e73a8af0-2430d420584mr3645255637.36.1755604136875;
        Tue, 19 Aug 2025 04:48:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:59 +1000
Subject: [PATCH 7/8] arm64: dts: apple: add common hwmon sensors and fans
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-7-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x2fSqlD1a+GhrYf08R4xKoVp1GNK3211Ryioe6NRPdw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvKP7rrxVWf2KXfjsxf5rPefiTo9+UGJ3P+zueWND
 5xe21pd6ChlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAi9+cwMvyZuprz3e4pLMd3
 Ri1pin3ukTOlW/HfRu4/652XOF294tDF8M/oqWp7nJV4iv79g03erLOW/3z1xS5R+oHa9ZB/rZ3
 idYwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 46 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 27 +++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 21 +++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 43 +++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 19 ++++++++++
 5 files changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b8da8951194d1bce6e55f3558a2f4af8b3bbb45c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardawre monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		current {
+			current-ID0R {
+				apple,key-id = "ID0R";
+				label = "AC Input Current";
+			};
+		};
+
+		power {
+			power-PSTR {
+				apple,key-id = "PSTR";
+				label = "Total System Power";
+			};
+			power-PDTR {
+				apple,key-id = "PDTR";
+				label = "AC Input Power";
+			};
+			power-PMVR {
+				apple,key-id = "PMVR";
+				label = "3.8 V Rail Power";
+			};
+		};
+
+		temperature {
+			temperature-TH0x {
+				apple,key-id = "TH0x";
+				label = "NAND Flash Temperature";
+			};
+		};
+		voltage {
+			voltage-VD0R {
+				apple,key-id = "VD0R";
+				label = "AC Input Voltage";
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..2897f3b7a6a32ad3d31566816a1b237f27dc281d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc {
+	hwmon {
+		fan{
+			fan-F0Ac {
+				label = "Fan 1";
+			};
+
+			fan-F1Ac {
+				apple,key-id = "F1Ac";
+				label = "Fan 2";
+				apple,fan-minimum = "F1Mn";
+				apple,fan-maximum = "F1Mx";
+				apple,fan-target = "F1Tg";
+				apple,fan-mode = "F1Md";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6d307abd64adef9dda1a64351070968167cc9f3a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		fan {
+			fan-F0Ac {
+				apple,key-id = "F0Ac";
+				label = "Fan";
+				apple,fan-minimum = "F0Mn";
+				apple,fan-maximum = "F0Mx";
+				apple,fan-target = "F0Tg";
+				apple,fan-mode = "F0Md";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f2d473c26526cff89d497b4702323996764973de
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		power {
+			power-PHPC {
+				apple,key-id = "PHPC";
+				label = "Heatpipe Power";
+			};
+		};
+
+		temperature {
+			temperature-TB0T {
+				apple,key-id = "TB0T";
+				label = "Battery Hotspot Temperature";
+			};
+			temperature-TCHP {
+				apple,key-id = "TCHP";
+				label = "Charge Regulator Temperature";
+			};
+			temperature-TW0P {
+				apple,key-id = "TW0P";
+				label = "WiFi/BT Module Temperature";
+			};
+		};
+
+		voltage {
+			voltage-SBAV {
+				apple,key-id = "SBAV";
+				label = "Battery Voltage";
+			};
+			voltage-VD0R {
+				apple,key-id = "VD0R";
+				label = "Charger Input Voltage";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f65a3011372bd2bc37f84fad3abcd6ca59e88549
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc {
+	hwmon {
+		temperature {
+			temperature-TW0P {
+				apple,key-id = "TW0P";
+				label = "WiFi/BT Module Temperature";
+			};
+		};
+	};
+};

-- 
2.50.1

