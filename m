Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BE2DF3D9
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835931; cv=none; b=gkZm1hUmodspIglT37MYpTfIe9s+Ak+eJfaD7mktPLhHhWbhwElbx4BgQlf8BZ0GIOuyGbGrCr7Gq9s68jZzDc0PpekovhZbyGxTEQJl6+l5fxPDMmMLNtQGlzqNBYtsyXl1yGM50tGxVwUaEDVdocgrMun05tD0TS4G7ogRhHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835931; c=relaxed/simple;
	bh=d7bQy0SdounSmC8jpi+/HU+WJQIYNBZC5J2m4z/NNDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UJM/r+6axAzehv7dvZckHy9fXzB8wxOejyutJdYHSEv9/NcLGwVXiSEg4kdu5inFZqcRZVw0CykutMw7x+YfriSbPkJ0mus4SA7ipTwp3uaU+3ReOgsSoEqI8oCnQwaEcUVnK+M/AsME5w+QTSZuTrSCYpC3Ibkc3wysH4nxcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=debruQi4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="debruQi4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27ee41e0798so92040635ad.1
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835929; x=1760440729; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCAPdNKXJAJcEkJcDhcjdf1sPz5hSUw5MgyKkZ0p1Mc=;
        b=debruQi4PQM1FXMNKxB7TmlAHScbMtfwFfuxjw3YRpvVsAKXGc2OZzpBMVqqShuGQa
         3Yfg9ZpZuLTGBRGruvxAEsdqswBG1DRi8ABr8qHEkDxbG6Ccs2BM/KGot9nD23x2q5GC
         PunJAkEnhMGlTmNK25OtufIbZDUVCPwg9odQLVr+3cckGr0SLcoVER573kV7aLCdo+Gq
         KtJBj+PRExlKPZ4+K2pGrOpu5eVvgARUR4Laj5rfkY2vTqVWSfTZd3qi9tKByTku+t/i
         zGmDEwioYA+ytz9Cz8rwO7Z4CUAIyXMnDZ80uAmssNZxIToYZy1hwrvanN+XAFFimlpB
         Z7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835929; x=1760440729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCAPdNKXJAJcEkJcDhcjdf1sPz5hSUw5MgyKkZ0p1Mc=;
        b=BLEChte/ebpEJrZ9rWx1k3SE61wN2ZkFb9ZaFcHiJEkhEsUPke5iWibj4IklrCzk5G
         3c3qZfhlwLzwufmgkUJRPEHIVFPd/N8uxH4Qi01/O8vgdYpL0dzdQoYsIcttHn3J/OXV
         EBGpJtAXaUWUGvItzhYm0pxlLxlYpePMiOZ0ATyI7L3WrlfxkWc4l+SrN5D7tXPs/1MR
         YP9zrM1fxSzMgEcMZertYmCUwtNmFvobhJa+J0A1RG2VK7Gmm7wCslxd5MAjd987T+jR
         EvefwAyGc6zpVC95P1yTzhLoF2B8y0P4hRcr7OCxG9Y81oztNG1bH00LdQp37Xrt2DAe
         FVeA==
X-Gm-Message-State: AOJu0YyS/wUynjZWXpLrv06Mq1BgJAd35bWIzdPd+t4Ncvqx7F5hJOrB
	MPTaFq0LsATIFpz41/g04SILcPQ9rJSrpkH4wqD2s0elb3M1R4qwmhqt
X-Gm-Gg: ASbGncttT+fumhWZIIIkrtA2wICwjWJ1dUnrtfrShQ6HWX3SclyHGY7klG07fQp1epb
	NBiPYNtdwzE5xb+TAkg1IrFs/cSYlVkpw/6XbzBfyjkBx+mDcLbu16FhPF3JWHUWG3xt8REoEv4
	2VW/Byb/M2VHrtdRXpG71HR33pFj6o3viA4xXDAWI3wBXnnK5LyJf49BawRgtbYdC4nE/qEWvHR
	278s90kz9vaRUiGu0Vf035Gu63RkIes8nuqTOYXH92dpM0MwGMBsCSbySFLXaGo2rT3cmkcUEC2
	Yp31QiFrhz2n5N3TG+zrMaQf/LjbjPHMEwgv3fCy5hTDlitvysZL2E2nGXVO5xOC5PcFU2Pn/dO
	V2hxKbYwLWkr5u+1xFW6GIxMhm4k/xgpp7jD/S4QvdXh11CJ1uD6EUP2jHleVfv3JtIODinl98v
	Mx8Fv7LiD9w22GZfYCYjXtpBTHN/qI4odnDmBzQq/veA==
X-Google-Smtp-Source: AGHT+IHfFdoMlBoIXqzrWMT9RmZo5vW+Dn8SIHU12lJcuw3hvHw9CkNL5y/ftl9SyGp75w6luvCUCw==
X-Received: by 2002:a17:903:38cf:b0:271:45c0:9ec8 with SMTP id d9443c01a7336-28e9a65686dmr167161655ad.37.1759835929326;
        Tue, 07 Oct 2025 04:18:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:53 +1000
Subject: [PATCH v3 12/13] arm64: dts: apple: Add common hwmon sensors and
 fans
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-12-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4644;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=d7bQy0SdounSmC8jpi+/HU+WJQIYNBZC5J2m4z/NNDs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3LiQyNvGA56f7Tw3ofdhvf38exui6Qd2ZZ0GsJM
 cfHe4qEOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZgI3zmGX0ybfr9c12HOyzdR
 lD19cV5cu0XH3u1lk2e3K6S8nfH9ejUjw9GXqVc38Hw9UmHNLjNJbnL7Qf/VE1flNosUSi5c8Pr
 5byYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 22 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 17 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 15 +++++++++++
 5 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..b87021855fdf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..3eef0721bcca
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..fba9faf38f4b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..0c4666282a5c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot Temperature";
+	};
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temperature";
+	};
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 000000000000..f32627336ae7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+};

-- 
2.51.0

