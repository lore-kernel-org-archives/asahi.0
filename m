Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1B3988FB
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849474; cv=none; b=nfoYPHOWmOLqySHt0doQQUOoez/isDlhtprINF4Kjc0kjxZiFpe07HPl8jrvEauwwyaK66sj6CjeiNGP6KPGG6KAHU14+SKre/jaSkTUrPqpqmbtUPEEq0ldf4nYG7SFcVgoGX4EAvdXgwbdQkdzpe1nIZXvY7GvNbubCFkeUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849474; c=relaxed/simple;
	bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JlIJbpmxINrbrINLuPdgtFYnsEBUn0NlgaCOtQvDIqVUz8el2OczYx14Kbi5jgZjJQnzwpP1t4alPos2n5sNZXRS2yvE7+pXZd+drkjfI8HQW5NElNBc9KY0ARp7GwaHriAb21Zm8VigS09bEvToUBxeEy61U9vV63dPoBN+XLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pty7/T7Q; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pty7/T7Q"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso2520576a91.2
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849472; x=1784454272; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=pty7/T7Qybhz7cJpbylLlv/1tx4iLeqNvgDUWcniNWC4fr+l4mw/s9BvGGgot9/p7K
         F2ZLsSKy2v7dTD+63yw/nNVWmG4YHwSNQQcrze7N0/3mRGh8U8WOwOS993y+8SXjZClY
         W/QBrdGrDJOioDJNhI2cUYhvFBtvBAxBwjp3splmkKaL7N0VwgaPLcw1CYGJZrbS1kHW
         qxdvMm8Sfvmj7BAeNqRLfgHI3qa2ECrkIfV3ese7AyrOomVGEAtab/tspfEMxIIimBGc
         vKnsgc7vFLGNYQQBZ+RTqhAkrCs9MV0S30+agTZHi7tf5ktGbNxJgulfXmo4lNSpo7Jf
         qQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849472; x=1784454272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=q7XUn85ciLX6AoGyZg9l///rmR3N15qafBXP+Ezj8ay5exEJU4KlQgGLJKpCr/T0gd
         fPsUZTfFX77nVloHFO07b11Sft0NPJjGh2EoSjrYWj427im3sx6fbrW5gnitnd0Bdbkk
         gcS/VbOHEiP1ALfNBEsXvzFE4KUmS5duIJ6XYFwNhGy/ioJBVMTs5kVlQ36pE6uvoly0
         kY1iYkgALaY8FsG/tRWI17xIcd/FXTJCyzJYms+31OiCl2UReRHmQr/EV/nGX+5uD1sf
         9ZeFIovoWKnp9UUz04++SG+2qHb+llzJjYC4C8p7C5xu5JM5x1e9v5H4+7lT8wAgATXJ
         FQ5A==
X-Gm-Message-State: AOJu0YwnENrs6DWmANXZcdAK4Y4GkzKq6W2c4cfl/5rtwqWTZ+/gfoAw
	degP6FR3QBBHRn83pIfOl9KQdC3srdQ5Agi3ISR055sFnTLIlwGRmju5
X-Gm-Gg: AfdE7cmPSTTT2y2HvoI23qdPUyVEG5pzZ2iWb/ZBE1PJeanUGOUO85PUN3XlkJZYIPI
	4PbUjsifnB+8zEBL1tDCPyheSZpfnNLUd5nS+O+lzCDbjn1MamIDUj1maONBURlhxiMxCLTnCrO
	9bggVvbkQs8S6ph8DKhAUa01PsF8z+YRfbBhUt1KFsYPblCqgOLpybo+4a4Acph/JlJ0F3ZA7lk
	WFssC6GpxPqJYk1tV4xJLtbnYNEKC2X7mIQ7+QG7wy4D5cniL1XhfTCt1sCZzjpcSjfehdt2ph7
	SaTJms8AfZahzt2VD2h6Tz6nOGmLi4DWuTjGhPuuL7NmKrjWTVfpHYr00cZQKxfotTgzX/rswO7
	TwIlfq/H2LCCSS/7WDJgYCiPxNf+QWUZlYgVEoyZkKel7Xgbo7xQtokFb+vLziN+FLa1mea75vY
	bMtZXAUnPrBI1K7eVd0TrnBXAXhz2h94b1DxT97fsvNCUUdjU8AHfZdOGAkwSyaQUwgxPYXvzWV
	X6/B63IGIiU4vxFjHTtZdS4MB2ls89CvQoOHwVdrHXPgCanALsBYcuIl7E3+V01
X-Received: by 2002:a17:90b:510f:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38dc761aba3mr5422313a91.7.1783849472539;
        Sun, 12 Jul 2026 02:44:32 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:24 +1000
Subject: [PATCH 05/12] arm64: dts: apple: Add common SMC hwmon
 infrastructure
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-5-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5127;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/q9n14kjx3x7Iux5rQddGSwkUWB05b7AqZtzB45
 gctGTemjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQLajH807+hLVmZ0XV4l0rePFE2luOv82e2mLpa+pr9vfeaxbZ3AyPD1yt/pCo
 v/SuPD4tp+CN6R3Bj+qHZOYvmJ51k/bXv6+XNzAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple's System Management Controller exposes the readings
from numerous sensors scattered around the SoC and elsewhere
in the machine. Some of these sensors are reliably common
on all devices, whereas others are exposed at SMC keys
specific to either the SoC or even the particular device.

To account for this and expose the right sensors for the
right device without tedious Devicetree duplication, we
can include fragments of increasing specificity in the
per-device .dts files such that the individual keys
(of which there are potentially hundreds) do not need to
be copied in for every device.

Add the initial set of SMC hwmon sensors that are common
to multiple devices so that they can be included in
the per-device Devicetrees.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/hwmon-common.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi      | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi     | 16 ++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..a35c7b14fec8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all systems
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..e87997d21e22
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with 2 fan.
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+
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
index 000000000000..180eb8d7441f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with a single fan.
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
index 000000000000..cadffd000c76
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot";
+	};
+
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temp";
+	};
+
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
new file mode 100644
index 000000000000..7fd86e911acf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors common to the Mac mini desktop
+ * models, but not the Studio or Pro.
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+};

-- 
2.55.0

