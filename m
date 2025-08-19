Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2E832C323
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604096; cv=none; b=mZQYcKVCMsji/Ztb/BtAex6K9SxiPlt82arHeUz2c/E+t3WoQEbSDQiKzIwvEw1toqOX3paxKFIpgeI/x1bgwXuJ0l9AJqIbTtkOyuGwbl6WroLsdO0KqgYihCCYmtYEmDkbpn1KW8mLdrl2ptq0k5MCpSODLrmsDG2X1Xz+AgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604096; c=relaxed/simple;
	bh=HRZjz/PDQepfTTL+nFEADTvkRMXX9VLy0qMaACyKeNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUip0kpscSjS89+d26s8Nj4qXPs640KFqMadUV/NVfwjorkOtDjpmxjlxQJwj2L0zhro/XsJCdiiz9b0z5cjR6qSUpcuWkENe6qXAXxY+nioO5Gi396CSFejfT13cRWdkHywDupQiwFl3t4Hh7CbaOpxN2QShlI8kru3ttbgr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9cSormN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9cSormN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2eb4a171so6270884b3a.3
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604094; x=1756208894; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=;
        b=K9cSormNZpRUFwOvMTmpLF6QFOuUFhKdorU0b+jpPU67KGTii6aij1cem5zIsKi4r6
         yw8wZpYnqiER4+PZWaHNXoE29a3ML2Jh12UKUoTonSN5v7sydrK9UjXe43Rct7b1UC9v
         KWqjVSfwtlZ0iYsTTTMsAlF5VewskoBmMPdjfOi1cnov1qn4PS3bIfEGIDiJwUDSAKU8
         sg3nynzIHk5K5gKqt7mwLDZDV8g2YLx3JgIQ43f4GIkh+VbcKAP+BPTAYoUUT9zlhYlM
         lYp5MMgUW+Wqlxw1GsHY5KqnvWwED25AqecZGAulDCISrYFo9gQp+mdzMmibREHYVJI5
         ndnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604094; x=1756208894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=;
        b=cFmMg9DtE9wsQopc5oj7BeZg1Dyq78Ddl3C3QO02RBCUuhJCnqvVeDyuDZW6GrSyRX
         9CGT4XNyPp2eBZ4crkrXdlm02kNm08b+CeWv7wjdgoSRRAuKXzAUa7OhalU+zoWqf7Cy
         ilzVMDjfbbvGOResgkru6jX8EyMgEWjezYDIujFH6lRpPaf/Yaiy0l2k7mu1nlZkAjzz
         IxsTbrPSy8KwFrGernOjhl7CnUUCd/AJHiMGQcIFJ7WGoTPnp/BTsfwM9TEh74LcsrPU
         7jvsgpkTli50H/oJoIhI8NeUHLnk/An0+OYyK8k9ecnpoMG2rSr4ZhZhAeDRzGnI8cJE
         kbtg==
X-Gm-Message-State: AOJu0Yxd9hhXU6HaLHX39rLgP78htvfUbq2yfzmikZkqnBO6Z4agx3Lc
	Q2Ti/vWzlqB9gnuyulm2yyYumBMLMPGQey+A7Ats6zN/+8i/EMptOkFmpwiCdEeB
X-Gm-Gg: ASbGncszQwMEKWkUv2p4CpkjXh+9GzuSvnnyXCWWjSTc6Sm7XajpW7/dvop7eigVi14
	q7Oxn3DikPTC/95zhbEvbAdOehy5pqm4EZzQ/PhD8z6hBK0PV0dEPvWtLuQW3UNwzQx7oGoSzJ/
	wXB7Caih9AezUVjgakCgY7kT77+Ry3eRe8RyQVVtgrnbiHNR8PH4/c2yelq1kpUpAO+GohIdoqi
	qYLLjS4oCkjrMelliT8IRN5iDnSBw+cDJLl54NGqFsJCQnD4vNJRGAa8kRrsk/Y8MfLvVpr41f5
	o6sSje/RRXUd7tFBm7NrRoj0y7VsEVVU9MkwFIAZPmzAQTUFraBX9GBJPZBvfM/34HW+QvF5YzK
	bVj3WLhjdu5F3PwvAdUFap8BnDi2JVNSdpeoa4CvP9R79UQ4uAHxUtX0roM4JU52xybDFrT88DC
	y4wEUnGcWlX1gGjcw=
X-Google-Smtp-Source: AGHT+IFjTYI7L8+Tc1wo47L6JKf/YYDxT3E6ajTWF/Wb72qSoljfkLbdAWqppksKIyFsvHI6OufsKg==
X-Received: by 2002:a05:6a20:e02:b0:243:15b9:7662 with SMTP id adf61e73a8af0-24315b97a4fmr453322637.60.1755604094461;
        Tue, 19 Aug 2025 04:48:14 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:53 +1000
Subject: [PATCH 1/8] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>
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
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qrLflRK+GGZAbgfPL/rFlU+6xRQThTOb/YM9H8lO9nI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvLW/t9TY3X828uY+j3N4tfaNPs36lVfYtfSUT/vz
 aUtnny4o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlcnsbwi9lA+FqsqeAjBbeZ
 BrLPr01d/llLcuo8Nj1Wk7Ub5VyfODIyTOup3rVm68M7nlNTVf5xK6zZPSf11ynGC3bdnmIcSq7
 buAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -41,6 +41,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -75,5 +78,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.50.1

