Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850F73212
	for <asahi@lists.linux.dev>; Wed, 21 Dec 2022 21:07:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso2480058wms.4
        for <asahi@lists.linux.dev>; Wed, 21 Dec 2022 13:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=TV7HOi/nDk6tN6Btf7NEWSQXW12jGkXqBc1ZJZCpH7rHo1bIES6jPHXyDmr0LSxqbo
         b5uA3Oar5vljGcFFGzJfAEtkP83r+gCzHBOsSCdOBCVWDhP++QpHCL6iZoaFO81DDjOp
         +ln2VaE4F/NLkO8nhyNKGYtqHD7HyPc5ztIKFo8uEpxmAOy8vaB5ZgTRNQ33jW9Klc5d
         4C3KidpPrCRZFnnd84lnlzKTBA7BtjKQco9hL0K1ntYXZFvcmLYkpUELHmd5cmHheaWA
         ppkuj5BGp+nUHilJygcVRcX3rztLrHkZB0rn2+VypnYZDGo0RF94KAxBcymdTpfPNrGM
         m1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=LMePsSem8luW6IsVn085oj/a9AgOkufl+qIkDEYBE1XXdv2mBcChdG+E0Z77ZCR/OH
         Gbirstzgf0mrYIqgmnW/416Qj37xBgBP33+33Qpy2KBbED1+wQ1bTmtZaE36loHWLVDJ
         qrFBDbgCQZbMye3js4gln1EqLIlL76QRf3a5Ezim8KFLwTLZrn4lVJvQFHbpcyA7YxRQ
         PvjEUnz9uE5//Go1GcLi/aNkTR5C3yLtEQ4LniYrH8356V6sFk46vP6+wzzwTegzdv6O
         q/s+C6Yx3Ev7fn0M7GNgByZootMXf1YhmuzkuzEB/3uoZajta/qQvt1Hcnmx3j3oK7yJ
         C7wQ==
X-Gm-Message-State: AFqh2ko/SGXZMPZnv100ZKqr+ThnnYnBBUeY63CI48lCzkqP0QMsXck4
	9ife+j6pduWe+NpCDOLlj3k=
X-Google-Smtp-Source: AMrXdXtPsFcQ9nULzy25sD18SHnQ2BII+Hj9pyW0qhYMJrpKlYHMDezmfPea/fZ/j/2g/LCcQ8OxMA==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id n2-20020a05600c3b8200b003cf900cde6bmr2673465wms.15.1671656818782;
        Wed, 21 Dec 2022 13:06:58 -0800 (PST)
Received: from localhost ([176.234.10.188])
        by smtp.gmail.com with UTF8SMTPSA id iv7-20020a05600c548700b003d35c09d4b9sm4134856wmb.40.2022.12.21.13.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 13:06:58 -0800 (PST)
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
Subject: [PATCH v5 1/4] dt-bindings: pwm: Add Apple PWM controller
Date: Thu, 22 Dec 2022 00:06:45 +0300
Message-Id: <20221221210648.2735-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221221210648.2735-1-fnkl.kernel@gmail.com>
References: <20221221210648.2735-1-fnkl.kernel@gmail.com>
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

