Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF3A37DEAA
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010525; cv=none; b=NLJ48ToD4aZGhoBCP9efl2EI/9D4q5mYvzc3/tlWl++rqjShC21uXnCOk99Y2oTgQbEtPxVsj66ywa80tHJgovO3SvvcfbNo+gwaL9xVb4nZHGA1Tfox5qOPya0SQXz8j2tlbeLVmVdVl3C1m17WyNLIXOCItEJBhHMKudTjt8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010525; c=relaxed/simple;
	bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLmJ0sXfsZxeHunLEE0h0jlBFZpAXeCRurztaaYx3FKRKTUYpBV6meUQL0v65huMy9/KsFZvDkWxVi02QaOEPaXk9Q+eh0iIcENO7TbocIU/1OtbKrWVCzwbJPtOo4+Okh2s+8uSpPvxOi0ZArW1goYK9Wh0fgvBvsajEjv5bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vv2QE6qC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv2QE6qC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso591793a91.1
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010523; x=1784615323; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=Vv2QE6qCeZIO1oVoToGnwVf6YZLNyOjhdEG7PNo5ETMBMRcSxtnKNoS5OxpxZhGQCr
         JPeMt72K/MuRkm4nZka5Tuo/a7h/Rk/RcMB0pr3EEjSltA46CZhyK5vr7UpzmYtyNOC0
         W92St0yy16SUFnXk2m7rtJ3go3gjFaFTAu98r57083E+4VHjXKdodDB8XKtIbS/XUS74
         bjzib89dAN3gYgWVEeLnu6lT/gdtdG67d+8qKrUy+XYD4C53i3CvyfAIRyJg9LsaRYCp
         Ri7VegK/lZhZQGIvVjgG/atPuYCDSknONP3sI3pGR8s8uin5jG6PQaiHoJTAvDCS3ymz
         zuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010523; x=1784615323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=R2g7UWTolGAarel0M+pOLuJN8NexyZOPupVz1weldNKPOTxmbLWqj27EI65m0btRPb
         Ntsj9On7AhGTuRp+hjJGD4E6issdVYCx52lw6DUJSxBuyL7rdP7x6xiAnVs2Qj4uHDxr
         QHOeZHDWtM3fd9kxUawMIbfAHjkMDFZbxUNuJ4eathkWrnmv3rmYecn2xjv5gtE6U4a0
         7xEJ0iu6d4RcRf9dN6he2AnQvb87TjMj81NNaYUAvY0QR3766j8iaa/NegTY0HqWJ/hN
         ctmk8EDXBq9/Ck06UIjzSI99M0bncfCygyL9Qc18P8R+J80wC037d6N/6aUtT2AC4wyR
         Wz+Q==
X-Gm-Message-State: AOJu0YyA0BfZXneeXWIraY6CnzfBmvUSd08m0JcDFlJUSKR3Of8Nnr4H
	u9IvQHSlB4oO0/Cb8oCce2oGrHnuQbk14sbu/MhlcAYlacSsbNPeRIld
X-Gm-Gg: AfdE7cl8lAxXvUet6AcUroldMVKwIbW5Gjj22kUe43hWPSG98Zsx8U1GjI4qn6bM3Ac
	vFRQlLAI58YYyjeqleorA24NKlK65Dh0UpCxd9KGDLtOs+kGnI/gKLCEMmR5EFaSs+JSigGaYPf
	oiptyoZnGy4s0g0wkjV2SpjI9sJ58LgO1kuSb0Ce5rnPtkQd8RUF9DJ1rPjuVPLKvVpsKlF5A7I
	lclp7Z0FJbIEAZHmVn1YxY04GNjwsYsu96t02pD5PHF6LxjUBT6IBE+kz26XFWuTpPXG7uQLVcB
	uWfKYTs23E4JxP1qSiokza34FDkoNYdYdxas8w1NeIUD/G6/GBOSQ4CVctgWTr3IPuO75WvnI30
	ov5tIa00cq1VApl7Lr2lPXFIcKg8MQt8pYYGDXXCJvaiekGMfNZZTheTJFMqUWzts15tgaLEsEf
	Sls4HHMQg6ovHdtofyNcyx9if0CW2TIYo1mkyl8FglzcoGdpjFOlosBBpiYRO408GSPJ8rSa8PK
	VvcuMm5qYp8tLzFolwGDs2D1Qu1HFGsvFFl0Aj8m4f7P/tyKVHeNIe7L2kDiALJ
X-Received: by 2002:a17:90b:3e44:b0:38e:21da:9257 with SMTP id 98e67ed59e1d1-38e21da9302mr1670a91.37.1784010523324;
        Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:43 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:12 +1000
Subject: [PATCH v2 05/12] arm64: dts: apple: Add common SMC hwmon
 infrastructure
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-5-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xka6jk+65YWZOUf4s7+HZpuvFN036yOdsHm5IUWS
 W9D553tmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWxJoZ/minvdaRu3zLs22cnV8L7I4LpiP6550ad2eafcw+pxixMZvgrFRk65dW
 D7+YBO3OeK8g/snqz4ciGi/I5F4MP/pzaoPSXEwA=
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

