Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1609C14F112
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351904; cv=none; b=dOB6B+aRtllj1RhShkUGqnV5DmpOE8s+iiu94V+UrNeFIdO1yuPXvDjH44WV+X/FqvNP581K4I++caZDBjjoqfpdzUerb7if2xQZyQ28/2DGobZd9rL6fu75jgM5D6Lsrt2irnsECU+nhmUvcqQxSOsJx2+JdOYJ99/eJKqxd1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351904; c=relaxed/simple;
	bh=doc6D/qsvutmJbzXvdZDYSYz0ZxXLQM+iyKROYiaouk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsuUU/QhcSbvDZPO97iTGWcJ5znWmYdKb7bkRrDRmQb9sRijrimvP/oihVUUC+y8Njth3xvFkTSNG4LRHzYXqfB41rdwnEXryE2dhjmuwSXAJzU4bY9WvXn3oPfIrPzoetU5Bh9L4oFx6YHhXSRkyRjjeaBWK3/YGdzPPna0NKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUTqZhR4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUTqZhR4"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b6cf1a95274so1886565a12.1
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351902; x=1761956702; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=IUTqZhR4600jvWQvSgpGstI1vbVi0jJZpeQTyyja++OXfXBJ8H/byUmM35Afk6ngeM
         RIcOh3Qh3oqWjpCysJNWH2lQGmSJp6tdwu0ofdRSS9bDA3QD5Ex8mhJmM1rCw6DmfwUO
         UELBp+uRVOrn7Jg+eidgKbYQj17u5K3bLAcHblc0LmwRdLaGUHh7TG9dDG9p0xUjTYQ8
         UbKvw1RaaNStdXtmc6lwS8o/wrcaAexwFLRcas1LahE97gFbMPfU+fnWEzbhtdg0nEVM
         Kc+yDeWqL/WaZAD0cvOaOdzBPxNSZqU6R6f7MCbPGgXTu6cwV/jmgj0rrT8qtsTSn1xg
         krVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351902; x=1761956702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=dDSQ71Q4rv1EOKH2HE/iZIq1qa4+yESn3H7D6F1nWtJMnXQ30e/1knleJ/mAK4O+Uu
         jkqRXpCqetJKxBkotPCu1t+k2m6CSr7xloI696W6sp3tD2UTziotOkEzmrgyH20o2Hn/
         L+6KVABtcLK4xKdmcAj701Htb1nhM92QYnGRni5+kPB+xDuHjXMkWeJfinHV6cTNxE37
         Lm7TOOsoby4hzkGARbrnNYrHUVSUxVbiJiJeB//UjwxvXgc39WvkVTKeeShvRAGKyuMW
         r/eheJz0jdP9ibXrXRCNAMzSzs2F6WCt80fDjvG179QDQfCzl0MaeN9NCNumMJ8yeMEF
         3adQ==
X-Gm-Message-State: AOJu0YxvJvMdCF8S9hRea3IRlzu6qfpvFx66MXkG/fe53iCQ+cCxzg8w
	h4gANmvx2uzqqnN/dX2P+8eg4VICUxx6Upy5/iQfrSai8BWSAgvLXQOT
X-Gm-Gg: ASbGncuq3KLfZJuHinQiDhWaa4Zxzte69GzUPOFsS0QZVTuDsWjuOCai3o9W+tarkBr
	1erMX7GnTLQub0U9ytRfVkbzB0HgxhlVhBM32D/XVtXQYJsXt7UbSD5cMiZbSvoden1CpvwC2F2
	WNx4bdC8w8ArnQCjzbdscal4whrA95M1vJ6W+jkQ+p/8FARlfIdDJEiksAFQCf8TRRid6Rk9Gc7
	zH5k9iDfqEmRqx4UBVNU2+RG7R+GMRhMzxXMjfaodFa2kuYJiy02+HcUmY1mGhVqy4j0+YfSRKV
	UICQyOia5R7h2Xm6L9M6zo97tkH2NV0s890e+vHNAQn86FY105kDHVVTje/WS03ApnyRAZ6YLT9
	rgGhbr6K3qr7YLw2ErT+Q/5/TAMEMFYi+8uwLtXMw7zUQHA+r6YcUIZ6xuAjB4C4cx3T2UWnS4e
	rq9RpnJNrVyP6xISgf6yccrmqO/d5WXkDuZIlKbP2KH1JrMXLuZ16DTubgqLaYYkrc7BKz5CR8p
	yzXP4i83nGrHLzCXuVImH3xee/NE4Hf85eZSu3rNTTnXTz4oPLN+A==
X-Google-Smtp-Source: AGHT+IFEqmXz9bRiukdYngtpXwv8pFo+7VapY1AMW8bk3PUTqtg9ECS2KTxI+6Fj45sxyikhlb2EeQ==
X-Received: by 2002:a17:902:cec7:b0:269:8edf:67f8 with SMTP id d9443c01a7336-290cb27f40emr370038515ad.52.1761351902363;
        Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:32 +1000
Subject: [PATCH v4 01/11] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-1-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mFOSrinm6mR52T1DXQZDpIdEAeTd/TshZKSbr4XqCgw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM5KOUU19IWnm920k5nipVbb7c99zz1Ye9FD1RWXL
 bg5V1p2TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApnpmICPD/JeKQcuVJpTJ5a0VO/JY8PkWXavfna5xi4x7tfR/GthfZmQ4vNRKL0n
 +VX/I1WCGLzziV2SPLPpV/aN1bcasfeJRCZ94AQ==
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
index 5429538f7e2e..0410e712c900 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -46,6 +46,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -80,5 +83,11 @@ examples:
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
index 000000000000..607b610665a2
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
index b45db73e55df..745d85b66365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2435,6 +2435,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0

