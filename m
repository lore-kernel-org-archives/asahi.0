Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1DB63D9
	for <asahi@lists.linux.dev>; Fri,  6 Jan 2023 13:59:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id g10so1112960wmo.1
        for <asahi@lists.linux.dev>; Fri, 06 Jan 2023 05:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=d5wSGisgrvwYafyq3ycpqsF857ErZCeCRhvsVrA0CxojhnPy9m3G6+nR0o9CYOCKmo
         i1y22ry6WnjF/LXPgItplCXXO1SrDVbma1vah1FnmoxWLn4H4YszS9Qmkk50umr0kFKI
         CsDUoT/xIu/DzkgvRHNgUqPvRPIahVJnjkKyUHCAcDbtgXphQ6KNff85c+4ZFa2JuVnm
         Twrir9GN22TLT0YA4g0x6z167dCCtcCHWQUxwedJhNhoHU4Z0GI3SXzGhPpshJltvOXZ
         eD5twvkn68nUmYsqXEqH/Q35X3BFfWXqL8RRpNX568bS/rHGlifExpQFdBR5PjN8N6hY
         LXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=8GxcHj8RzIy6cs4nsHqtaIUVA6roIpgr2RGz8NZNi47BqgtRmQot/gVQvTIV5TUo6S
         PYfaBCJwYd8bAz1wW4I7xqdv5qj7sypUcZ8jkQHVsOuHx6BKozp5awvADEei7lM07TAo
         C9DvMyqfClQc8QoToya/DPZZHX507IXknVqzWa5UUTtMrxMNob/FXMZJNJf24k2VV4OW
         ojJVoBq5E5LfiqE5q4TyiCE9KSRyI5fbY+yJ09audu9Tpjd6zxJAcxwJWRlKVfwAUKky
         YuD7FnHAyZGlDudkPggsb8iq/eOmUwIczEJooO4gT1akCZaOZXVhoXCRLpAoBLD+sHi2
         QikA==
X-Gm-Message-State: AFqh2koFHyJs8O3IUpoD+VBYFNbmifkBD8vND5lmbj4qWI+AkY1TB9CQ
	I978WCQqjz0B9GlRHXJKbg8=
X-Google-Smtp-Source: AMrXdXuygvfm8mRFWYnSTzY5jUBvxaGI27pFQrKR8DN0dYm+bpUC4Egl9CsTDYkvmgxAFoOm5QyGXg==
X-Received: by 2002:a05:600c:2d91:b0:3cf:735c:9d54 with SMTP id i17-20020a05600c2d9100b003cf735c9d54mr38771335wmg.1.1673013583162;
        Fri, 06 Jan 2023 05:59:43 -0800 (PST)
Received: from localhost ([212.253.112.114])
        by smtp.gmail.com with UTF8SMTPSA id o9-20020a05600c510900b003c6f8d30e40sm7279485wms.31.2023.01.06.05.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 05:59:42 -0800 (PST)
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
Subject: [PATCH v6 1/5] dt-bindings: pwm: Add Apple PWM controller
Date: Fri,  6 Jan 2023 16:58:37 +0300
Message-Id: <20230106135839.18676-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230106135839.18676-1-fnkl.kernel@gmail.com>
References: <20230106135839.18676-1-fnkl.kernel@gmail.com>
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

