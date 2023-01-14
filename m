Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD62B80A
	for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 13:26:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m3so16905147wmq.0
        for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 05:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=LGJyVHoh7bFUcgHskMeiLfEebpwxP7jpmgJ2QOGPbwzKSPfWG88fc+eATSK+XMQdpH
         dl29IWyidRKX850QEHlEY9AjAVUJs6N9elD+IO36UMh0CgAFzFjFZsneML17Y6r8d5Uo
         486v15sjYIMPdBg8OIe7stsWi3cTazN5yxuSH6EhvKMhTEQIl4T7L5Mr4r1XPcVJVjt6
         geW5JjgujZPAqP0V0PumeOiPPuMMZ21Ftt+254U95MHyERyJxZ4RAnHCr9OL+qC7jRNs
         4Jw/DNgDxVrANr37/24gOXGzeiGqSMX9ApakFkaD6d8XliFOT1xkzqUXw68BXhQRGZ9a
         HSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=MgPTdOGcGY97lS7jdF0/99aKFnRqUbyAkSQGVDAUocO7nsOs7LtTnEHhO6C5Iiz5qh
         lLpcFU6Px6dOlqb1qSeJ0JRfNFm28qFaEp9+IS8PuVe96oFEoyuVo66lqh219I9i5Cm0
         Q0+KUUYD6X5gwcdDvS+5+udt+1mokLWFWmhxvO5aalRZihRfd/LGjLkmP7UtUvITC+T4
         21GJ08HwmryhySzMaxGCMIAGXHUXmj4YqLau9qjHeBjgdfIGhxp1VmusxUxFWgILkJUS
         XquLBiLIH4g5cVmz9aEPEigsFoed9wUifqw30FjJZGRFrr/9/sgA/hFrIztB3OCg6de7
         jCQQ==
X-Gm-Message-State: AFqh2krI34//0FOkqQOC1NDKHWIFDmH0vHsOXq5cUyVSf97tYsp9PX+s
	1KxAkOBlz2SGvbRQrtXcjIM=
X-Google-Smtp-Source: AMrXdXv2ygbzN0IqAO7jz1qfWtxdayFzAWT2QW9B4EUCVZZiRwTBzJY+EvkyQ1u9vF19laIqorIQHw==
X-Received: by 2002:a05:600c:4e02:b0:3d3:5c21:dd94 with SMTP id b2-20020a05600c4e0200b003d35c21dd94mr2715473wmq.9.1673702805919;
        Sat, 14 Jan 2023 05:26:45 -0800 (PST)
Received: from localhost ([176.234.9.57])
        by smtp.gmail.com with UTF8SMTPSA id u2-20020a05600c210200b003d98f92692fsm6221455wml.17.2023.01.14.05.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 05:26:45 -0800 (PST)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
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
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: pwm: Add Apple PWM controller
Date: Sat, 14 Jan 2023 16:25:04 +0300
Message-Id: <20230114132508.96600-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230114132508.96600-1-fnkl.kernel@gmail.com>
References: <20230114132508.96600-1-fnkl.kernel@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Sven Peter <sven@svenpeter.dev>
---
 .../bindings/pwm/apple,s5l-fpwm.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
new file mode 100644
index 000000000000..142157bff0cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple FPWM controller
+
+maintainers:
+  - asahi@lists.linux.dev
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: PWM controller used for keyboard backlight on ARM Macs
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-fpwm
+          - apple,t6000-fpwm
+          - apple,t8112-fpwm
+      - const: apple,s5l-fpwm
+
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
+    pwm@235044000 {
+      compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
+      reg = <0x35044000 0x4000>;
+      power-domains = <&ps_fpwm1>;
+      clocks = <&clkref>;
+      #pwm-cells = <2>;
+    };
-- 
2.37.1 (Apple Git-137.1)

