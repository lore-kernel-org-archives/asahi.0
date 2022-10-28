Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694D2916
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 16:53:31 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 21so8740101edv.3
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 09:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C33seGVoVdC4qa6odCGMM1UoRMAEyPpQFpcRe9CmJUc=;
        b=ovzgyGUxkoVOneqlKtvwiYv658V+dDonx3OJ+SBev41qlLDg1NpzyH+GqBCCnE5/wv
         adSab9LjklbHjXr2q9nMNuRdXkNXuB2fnFCTEWPh+xrJVTgfyXf3s8qbhbhrf373AULi
         dnpRsp+VcGt8w0RhxPNVBx/ZjfqOBxgbXFuABBSweMNzZmHg5YBRtx4Rj+ozu4bJhiI3
         B1X9dmEuc1tqAar4mMczvCBeEQ4W/aQx2njMj4QB2SodIrSm7s9C6wtJ22KYRAtH/4Jk
         VHPMotD+KziMDnWeFqOY3ADQhN5TcxjbT712+cPKrZ1c0PujS0Yj8VgRasDErFjMrXCv
         PBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C33seGVoVdC4qa6odCGMM1UoRMAEyPpQFpcRe9CmJUc=;
        b=rZSrH7dmn0d+wxcLwwsN/I8bS4NUcTc9zL3zc/bXeVIY2WhYoyoys2KiBkguCDEZBb
         zuU5Z7L8UYWY555fT06yuWjxe37Awj2Mm+vz2fCpvujzy9KvOb6eUqBhdQP125HSCBaq
         sZg+DEozs4aVxu7V8Ae08aq2952uxot2OFZSnAFG96D+3onZ89BvQBzTTV6uHq+EjbHV
         IjaM8X41p6zhwpRuBc8rGyWZcJIjDH3vSkWXT7Sn6Evd/y9nHQ7UF0Ya6EMWhstE2U/n
         PFiFyDrIkbLwPZJDbHwhs1cPbA6wrU8tyAAzT79j5NFCThMLGe+S+rEPQRk6f8bk0X7A
         pQNA==
X-Gm-Message-State: ACrzQf3KE0Uxcsu/DhJRoBk4MyMC8sZQTiY4IZWrVnJSOho6qUYmiNI8
	TFHYh63/SVPNRYYBjAXrmVc=
X-Google-Smtp-Source: AMsMyM7qjQeg/XqtG5uytmvtDH96ok5pg9w6JiGjPO1p1bwA9dri1+cSZQDgCvElbmA68t7nLMDJIg==
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id n10-20020a05640205ca00b0043b6e01482cmr340391edx.189.1666976009647;
        Fri, 28 Oct 2022 09:53:29 -0700 (PDT)
Received: from localhost ([88.227.58.131])
        by smtp.gmail.com with UTF8SMTPSA id j22-20020a170906411600b0073d638a7a89sm2411522ejk.99.2022.10.28.09.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 09:53:29 -0700 (PDT)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: thierry.reding@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH 1/4] dt-bindings: pwm: Add Apple PWM controller
Date: Fri, 28 Oct 2022 19:52:13 +0300
Message-Id: <20221028165215.43662-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221028165215.43662-1-fnkl.kernel@gmail.com>
References: <20221028165215.43662-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs such as the M1 contain a PWM controller used
among other things to control the keyboard backlight.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/pwm/pwm-apple.yaml    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-apple.yaml

diff --git a/Documentation/devicetree/bindings/pwm/pwm-apple.yaml b/Documentation/devicetree/bindings/pwm/pwm-apple.yaml
new file mode 100644
index 000000000000..39dc32e00a3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-apple.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/pwm-apple.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple FPWM controller
+
+maintainers:
+  - asahi@lists.linux.dev
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: |+
+  PWM controller used for keyboard backlight on ARM Macs
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-fpwm
+          - apple,t6000-fpwm
+          - apple,t8112-fpwm
+      - const: apple,s5l-fpwm
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm: fpwm@235044000 {
+      compatible = "apple,s5l-fpwm";
+      reg = <0x2 0x35044000 0x0 0x4000>;
+      power-domains = <&ps_fpwm1>;
+      clocks = <&clkref>;
+      #pwm-cells = <2>;
+    };
-- 
2.37.3

