Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436522DC345
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835939; cv=none; b=uIyCHxlVJrF5qsEXLZ9JcP/VU0QIyM/M9U6/TzTupCL+8CSzV8gkHdZHS9Zlr9ReuRod53t8KYDrj2HjTlz1y5AKX0iUs5a7AdRTgBpusJJJQLDn+aFFv/wsbBd3EvI8lnegirXffso71VD08QjTSQ7jS1dcYKj5tbMI6f8dbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835939; c=relaxed/simple;
	bh=dMA8ghWVekTunsVu7XOstdzBbwszG1Yq/dFfXRCf/bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvYikquy7zY+rTYHEsY/cPxrRUsBOcSiG8N+PA3k+jgP6gemKjo9KDRuEHzchqVDmzg2x7cAn3+8bse/+WCntNfgx9K0tk+Hu1pWRCPE++8VxaU40wdClolprJGpuPFYI2igmHi3NLkZh/e+YW9JdCTcWo++Ik8m9iUXreFxTZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG8k6o6z; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG8k6o6z"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso4751255a12.3
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835937; x=1760440737; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dw9cqHmtj+JTcT9542JQD/91O64sVk3+jyfqTVqzQ4Y=;
        b=CG8k6o6zr4+IpcF5n4WUvIV9g4a23/zTg4WAaTu48Gg/PI5XECTclq2dex1kuKs+pv
         miRFr3bkgPxZ1g/s/1ACWd+MSvSxsb6O30B4sQSVRZGehYYOHz1JF/Qp8kNHRtLz2YMh
         TX9Jb3D0BadazVwh/LDHn08h/n8BZFilBKZyr7uOnwFSvUbCP/cOcuJDShOQCIt2sqMY
         rdit4Lkfif+GdPgPv6u3sEpTASLUVFs+kmIxd6R3HWReYgWDc43XSuAD0ixjeTeGSaG7
         28S3TmGt4BSHXKSl9gPl/8PAXb40Uktlqld40EyGWyK/w5VkteC3aqfZqKjzW4mGzwaB
         TIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835937; x=1760440737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw9cqHmtj+JTcT9542JQD/91O64sVk3+jyfqTVqzQ4Y=;
        b=FnO8qLeC9kPkBINuNgligjf7tXPkHC78QC8fVknd4Z6yPfzIZcSU3R6pPBnvdMcLAw
         QOoXKOCn9wgYLBtztV6OwBklIe4bzZQbdKQX7/ex2EorYafI8wS22P6KkGsrLgubWxRn
         c9jXFQuDGp8NL5AovcahltBmUg+IngUKfmm2kxDEIwhNpzmKhmGqvxLDMflApAPozEG1
         aYqFBF6CUw1oWYppcy5MvZlKHXIwYJ+NeyTnG2PmZerTiOvrtCZsX3ARBgkNfFOsKg6j
         WKeg/QBsp/bMb2iyd9ieVvCaRlhRshZZEckw9vMg1ZXE4YjVUqOlayZK+KY+/YFMUXRs
         zYdg==
X-Gm-Message-State: AOJu0YycMKCsL2vAGSEhBGGxR9HJaxdKY3wzr6sqjKR2f9fdw8/vqcUR
	UEr6NiPk95epLOVdbWSekXcLJTZOMQfw3hVjMpRAGb2kQnB2PKzgRKbc
X-Gm-Gg: ASbGnctbzCYCqpe45o4aqFExfmuoqLerbo4V9tH5BOLrO6QhCJyfy9VN0LqD7PVjT7X
	aCDT1+nNnLH3njqMjj2eqJgXrYxzvRnPKbVOxpw5qLY+5lYk12KV6E5O/XLUIfJPm17w8OLW7PV
	TD7Bs0W3QtFAHo3rjfPjOHUNaE+T7AadhvCqDW2A16qvsnF3YKbZKfarF6JUoGWvRz7MWn97/EK
	wOnSeaznsT0yW+EM67MCpEGt9S3ga96XbmSWP88tYJprgMj/KQVltr2Hqt83zHblLzd/CBrP4GO
	hibkMp7lIvFMXI9A37N4SOviQAKmV0KP8b9FO0gfH5jnDMY8NEj2g0C/nWlaQGQRPAzr2yWem5w
	VpNXuiIXP+T4cMJ3giOK/8kXEZf3Zz5JQgwFfUE+8SBMvuIEf7fUBHkPPyl9z2jcmxGTK8kH6Y5
	NOnQjsTSSu61N1mngjYLd3Pd7YX8KYQ1PBz7UdkaHE3Q==
X-Google-Smtp-Source: AGHT+IHC2LNmC/xUFVcWeK3yLywWA7GD9fZRA7+m31c3Vn2k7x7olct3JnOgC1orGXTqxPOFEWB82w==
X-Received: by 2002:a17:902:ccc8:b0:28e:80bc:46b4 with SMTP id d9443c01a7336-28e9a664f0dmr175025365ad.55.1759835936684;
        Tue, 07 Oct 2025 04:18:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:54 +1000
Subject: [PATCH v3 13/13] arm64: dts: apple: t8103, t60xx, t8112: Add
 common hwmon nodes to devices
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-13-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6022;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=dMA8ghWVekTunsVu7XOstdzBbwszG1Yq/dFfXRCf/bk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3jY15w+v9irk9rkrp+zvDZ//DCl5UBk87+iv7aZ
 ZqqumjV+Y5SFgYxLgZZMUWWDU1CHrON2G72i1TuhZnDygQyhIGLUwAmcm0Cwz+bGSzX5RgmqjHo
 y5znt+T57zzd66/K5hWSYuwTrSqWRDsyMrzjnabz55ZC+PGlEjuNczkDOffPrNJIyZ3CKOV6Kfp
 fGy8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the known, common hwmon-related SMC keys to the DTs for the devices
they pertain to.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts | 2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi     | 2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts | 2 ++
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 3 +++
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 1 +
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 1 +
 14 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index ffbe823b71bc..264df90f07d8 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -66,3 +66,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 2b7f80119618..d12c0ae418f7 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -56,3 +56,5 @@ &bluetooth0 {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index c0aac59a6fae..127814a9dfa4 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -131,3 +131,6 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46..f5b8cc087882 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6..abb88391635f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -119,3 +119,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca..491ead016b21 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4..c2ec6fbb633c 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 7089ccf3ce55..aeaab2482d54 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -56,3 +56,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 78eb931d6fb7..f1820bdc0910 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1145,3 +1145,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf..500dcdf2d4b5 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be..11db6a92493f 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a..a0da02c00f15 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 5a8fa6daa00a..c4d1e5ffaee9 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1184,3 +1184,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.51.0

