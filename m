Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA734DCD7
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293780; cv=none; b=GuAG+LjaqkHN8OLKvvOGpW6dmwdwqSJQWguRYqmfOFaiAlyf+/eX1H7xSLJ9jybhQA09QHCRu+Syof3wApoqRwb1Yvhos6tkOW/6oDxMZWT4ONF86IXWoJQ22fRp49HUMduVc5IckDjv2gZ+Acdv8eDwXnOaIu7XpMCTkPl8pQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293780; c=relaxed/simple;
	bh=xomdpeLOMSZJEhkz965+CaS+Vdhm+5amA+tX9TAShNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mB21+TiPmO7ly34qfnuyQ6Vjo57ak8PC7Zi+62mtCQ1pEviIVNsdnSFVoaA6zY+sypvroHen1iTnlL/Vepvt/GlgI4ggsMHPXQ/5E3JN0K3ck18xkH/OTqLOXfux40rFs4XToRVvDJvNTsIVY3k2x4/4ov7ce+DgzU/169NMCIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWJZCpSJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWJZCpSJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2465cb0e81bso32590655ad.1
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293778; x=1756898578; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=;
        b=iWJZCpSJEePRuzWEJ0w7rd+oZHZbhyL4NqwqChVJUmlQO0XRTpLv2CkFgda/PKy8qz
         NQ3t+krIhBKgX+Q3+qWr7JjMDprq2YdfU+kffyeE7KUEqYz3FAp0Dzt+GKycssmGHlTO
         9ZHYe5vsEVVYDNB8IQsC9/TnLPa9joMTTB3ctTC71jzqzE5ZblyYwZ3Iqfqjg8aj8Vnu
         xewFJeu3YNmBaPf7WfK+rrxJP3wyXNMG9MpNapZeSQoAA8fjmh+RxraLFAgXzkwGEoP8
         d/IfSmbne2vzM3T6gRMQYsDJEvCWQpgfljj+lBFdFUC6rXkcUM8eot4HN5pZGLZVMw89
         1auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293778; x=1756898578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=;
        b=ZjqikOZtPl8VgnRbQ7YCxjkDqSY/h0qqyZoQcZOdHBGETiEi4o/1iR/1NAADrrkmUc
         moSZXmujmYHY1a0m2CM9nZzMqOMXFfDvZV4vsN+mtC6P7A6skYfN9qxp513pIk+QC11G
         uHKu99Vvmh49rmtpHAWYFgW2BYGiUul+DAkr9uoFxMfM9MvMhBV5iZZzWzzCb4FKCnb7
         Sxd/7vWssqeXjsMMvSxQbYuPezchw2x4piYq8xj6vKmICw+RHPDOpOGQk9VCN6dp+5y4
         K4OoBtcypD5pzY63XwfZhSm+6vTjvgy5y8OT6LHu8yhjujKfNOKgzqDyOLcf2VTADASk
         9aug==
X-Gm-Message-State: AOJu0YwRjXKmjjT1Hg1v3Sin+FhL5UDZS0ie2sgzw8L35kFnkU06t+8b
	Q51mUDu8lBdWO92GBLM4mNwg4MtDA+IuPTLz8AdLEQuaOohEdsQ+rocd
X-Gm-Gg: ASbGncsDFnjPppx65wjpwiRozWd+Rw2U8mrbtDUwIrkwa5JFyb/f2vUKMKR6/VvWGGJ
	e1v5bwowRAc/4qSNX6BjJtYDzbVfrIsDIAzOLR72SHJ6jPBgom1mW4hbagEO71tnMcFF+xH/tBs
	QvfTYyXGyYnoPvPaS+q4gDnJo9q4ARFyXByQhmwQbGxhl20tWKBINaZI7Ni6mm5kQbSl1EDFwoX
	o4smC7Nl1xv8wCnYpWFG0WDBdzJPEAWuX15vX/e+lVzt59Erd0MVuRTr37+PbzqVn4OeMlFDKiH
	A3reOIpR2EBXrbFy65aHD7AJjuM999y/JrytE/dnONCMPEqSlgdIur0iUjthkrSNwFjpus1UKLY
	LdpLIxkWS8NfeGGxFCjl2jqJ1dVDge914pWhwe+ostz2qrZCY1BQPHzqN8R2wqi5XfyRMVLG2GR
	aGVQk1e4GYC7buZbn6
X-Google-Smtp-Source: AGHT+IEHQ8zv3Iwk3K5n+Debu6cIiDOuY8nhm+ii5lcJ3ZyQ2oPc2V5kSWO6f+JtCHeV333/NyZa4Q==
X-Received: by 2002:a17:902:d603:b0:246:a42b:a31d with SMTP id d9443c01a7336-246a42ba453mr172730475ad.44.1756293778541;
        Wed, 27 Aug 2025 04:22:58 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:22:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:35 +1000
Subject: [PATCH v2 01/11] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-1-ce5e99d54c28@gmail.com>
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
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QnTrhwUPyGjBEFWqrKCYz13PtbjM0UoOPM4Jc23FSf0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUla00QuHr05soLs1Lerqr6uSjCZgdr0LsnPitOs
 Rm8fr9EpKOUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJrFjFyLA7dNKavG3hfy8K
 1/jqHtylvSDV8LBG+peNm92rq4VWb7/PyPDT4NCpQ2YVrF+W8EzKfXL+yNML10+VcnG+/Fr57xs
 D50x+AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.51.0

