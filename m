Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA42356917
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293841; cv=none; b=lwQJz4oeJKDE3mj/8a4ZSmnGFri2AMZC9KstJTWvGnup+rQUWadYemVoCzodW7vEFSLPIOKk+xnxCR/NzevOKazvoqYIsxeioN/bVmuNt8ocJJLJa9V2rEfotGSDYBvpqogQBxPWhu2JP4z7Hj3tOwVJxI5dCgxTwVJMFMeviiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293841; c=relaxed/simple;
	bh=Z3EXP1oVeh319IixHdWS8udDApNWGWy/kj1Vo/lfXn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHX2SUk/yW+XaSifB+OJniYVzymPtm2DF8lYnn4dwsRQDJ9uTdDIzkfQCu1ONkme0o4qjzPPFkiGn9yynsCDjioh6cBz4EQ6WiTX5eoz9e7vAY39x3LFXfQPSIwQw8gvzjeRZMn3zIhc6NqGkXOkXDil6AYxv4K/J7jPopKCGXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPx58R/I; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPx58R/I"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445824dc27so64311565ad.3
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293839; x=1756898639; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=;
        b=IPx58R/IPVBw40M+5vJmV64mS+FrViztZPGeq45ckl1CoH5i/7g/F7cSaDaGAVhoSo
         wruHttfMkX3nVCOIxPSVBRIMZQVjeNuEFFdEvEnB/zLba+pzSl/9WfelLwwic6W7VHdX
         TfOIAkzwTXO+nibKiVfHgUDvy1/1LhlbrFVPTI1YFXvGb3oqadLSk63N+BOGdD1kiGcr
         No+5/GWLOjzAmxx9MRe66Yh3fu5oEAaA1P2/waDf2+Sro+sCGMh8/TtZgbrC55Mzq+ib
         nGWSDvr1rqHPJTvthnYlG+PAK1sQduHGwzM7SLvxJ7vVGFGpOJAHz9kqseiBYr0Z5eey
         4LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293839; x=1756898639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=;
        b=avpS/zS4gbuuF1CgYgszyyF219AN57e8muTkSQif3rFOev6kLFevKNMGPskW8Wp5+o
         n+h9DgsvRkP6+ZavgHVCDJ50OOs1zGsSZBeLmCmdFix2GpMVlBTZqimT54hMtRbhyXWZ
         5Tr7ifQCvwfhSmEK8XQ99h0tYTM46uYwP8OzI2QPgmF9/n9mvn7FRyYI376DlcIoSu5L
         ugOclv1NiGLSQpQMQplt7PHyEYyuzJPuLpeoSwlBfj2ef+z/CAIu7PINQOyUrs6q8/le
         ybbuaMQ+c6g8hhFUuqhWrADl4ng+P1ToPLj7qhaZjlXL5dl2xagOo1OGGwu7mXlTQwGA
         Ffjw==
X-Gm-Message-State: AOJu0YzS4olOrTyP55KN0Gt1jSEo+Y+Lr7XXPloXoSoSy2KuP3UX6sHY
	cpBk3YuE8oglDTwh9Fs/UiieobBdI52C48lgXw5R9uqdfhxE6/zmneC5QjaF7a/L
X-Gm-Gg: ASbGnctwFTUerpQN7C9vOXw8/HFjWeJrVXtsBYgSWRIGnuvVvrHdpAWuaMRrtaPkMA/
	qNsOPVHr/aDYO+pZo6O96p0q2umKkXatmc7iCBL9dC8ehXGylfYjsEH2nvwR4lokMgIA3bpHEKF
	pArSlhEr2WmbT4JYBDnh/o0jYn4CBw6ol71bjGPgPk+KCoO9RRROxkgxXfHfKR1ovaP+uK2/gmt
	qw0IUMix/DQ5Jo4QxEOWYddNoj/IhOFicnjNfD1hebEVSI3PEDoIqwuhJszIwVvUKpq4zhsfP26
	2VKCcD4ZPdu7aQ6Miz4FflRD0IopkAUb+OK0nsyXNnI2VNIl9s9yW4MZ26L3e9ZkW6Cf5EtxWZ5
	M1MfNG0vK/Nc4l83M2PdA3AyjSBMGtcdxZdN5QMyQv0eCGB+9PnAoFUgAdFTzp6hPDTVWLoo8qB
	WWY/aA8lCj5K+yO/qE
X-Google-Smtp-Source: AGHT+IHcxdwpHkhgx4bx6bhCCrhmDPbhWf5p9x/BFk1Qsu0LkH89VOH4xmT8ZfSWgNKLsJylxiDZxw==
X-Received: by 2002:a17:903:1ac6:b0:248:614c:b8ca with SMTP id d9443c01a7336-248614cbc2emr74240555ad.48.1756293839333;
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:44 +1000
Subject: [PATCH v2 10/11] arm64: dts: apple: Add common hwmon sensors and
 fans
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5045;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Z3EXP1oVeh319IixHdWS8udDApNWGWy/kj1Vo/lfXn8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW772R/fPBE58YpzUVnanXkNGvM6h+v9QhJrJoX0
 erR9DWgo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIksl2D473I3yzi8O72BMZbd
 7MfEY2c85P5Gqk7UTp2zUVGptp9lDyPD/Tjt3Y/zf5r0HU2Q6bvscmfhNFe/7jNlfRk8nuu3npV
 hBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 37 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 24 ++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 19 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 35 +++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 17 ++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..bac4e44d3f9892fe8ad04125e47dcccb2bcf57a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardawre monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		compatible = "apple,smc-hwmon";
+
+		current-ID0R {
+			apple,key-id = "ID0R";
+			label = "AC Input Current";
+		};
+		power-PSTR {
+			apple,key-id = "PSTR";
+			label = "Total System Power";
+		};
+		power-PDTR {
+			apple,key-id = "PDTR";
+			label = "AC Input Power";
+		};
+		power-PMVR {
+			apple,key-id = "PMVR";
+			label = "3.8 V Rail Power";
+		};
+		temperature-TH0x {
+			apple,key-id = "TH0x";
+			label = "NAND Flash Temperature";
+		};
+		voltage-VD0R {
+			apple,key-id = "VD0R";
+			label = "AC Input Voltage";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f81047725de473b85d8f337af63fa10d3aa827a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,24 @@
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
+		fan-F0Ac {
+			label = "Fan 1";
+		};
+		fan-F1Ac {
+			apple,key-id = "F1Ac";
+			label = "Fan 2";
+			apple,fan-minimum = "F1Mn";
+			apple,fan-maximum = "F1Mx";
+			apple,fan-target = "F1Tg";
+			apple,fan-mode = "F1Md";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ae5e1a54b6b780ff880ca0a39bc2712d8cbafbe4
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		fan-F0Ac {
+			apple,key-id = "F0Ac";
+			label = "Fan";
+			apple,fan-minimum = "F0Mn";
+			apple,fan-maximum = "F0Mx";
+			apple,fan-target = "F0Tg";
+			apple,fan-mode = "F0Md";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..227dc5065bb2b74d9699019b71eed90501e1b4b1
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		power-PHPC {
+			apple,key-id = "PHPC";
+			label = "Heatpipe Power";
+		};
+		temperature-TB0T {
+			apple,key-id = "TB0T";
+			label = "Battery Hotspot Temperature";
+		};
+		temperature-TCHP {
+			apple,key-id = "TCHP";
+			label = "Charge Regulator Temperature";
+		};
+		temperature-TW0P {
+			apple,key-id = "TW0P";
+			label = "WiFi/BT Module Temperature";
+		};
+		voltage-SBAV {
+			apple,key-id = "SBAV";
+			label = "Battery Voltage";
+		};
+		voltage-VD0R {
+			apple,key-id = "VD0R";
+			label = "Charger Input Voltage";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6344deff06ebb9c1b0fbbf6b986db879eb5f19cc
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,17 @@
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
+		temperature-TW0P {
+			apple,key-id = "TW0P";
+			label = "WiFi/BT Module Temperature";
+		};
+	};
+};

-- 
2.51.0

