Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81FFEC1
	for <asahi@lists.linux.dev>; Fri,  9 Dec 2022 11:15:00 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so3163028wms.4
        for <asahi@lists.linux.dev>; Fri, 09 Dec 2022 03:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=hrhgHHiKsH7JP6w4UAYp9tudWblnD8ZqogfdP9k14lVZ6lXwBGwk0gcagrzu08jXes
         U69+zpsdP5w40wDcrxOc6UTPQBrM+zA8ETBzdH7MwItV3bTprVZJNnACsUR544QBV8LX
         AXE3pVSLox7781JxAax/vOlXJBwzpLgNGRELx/iuTvhCduJEuQd8YCSy01vpcVatdw2v
         E0FCqGrl9Vzf0dMHAas5NuqU2UPfbs3I7H4RHZlHQDJI6yKVvXGEXwFG6qsLaznEgzeB
         SMKc/aobVedkkLNA2fCVR+XKYyIXDqde20J0Qb25YA0sjxLzGS70P7+lMGLWMYCBJDNX
         oPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=XOzr417/LfT+0tLvlqSU0NEbYc0ppzWw0GX4+mVI17otPt97wNJakyQydmgznfswPa
         COe6aU70j+96xv55ZtZCJi3H6eMdNBS1Qjb0FsFOOg/qcrDFZMDa44FUZpWS9IATrbxS
         7CA8uLuD+hRDf8BnMZUrXXkdEVv7koEFwHpsoqHlc5mKtIMNGUzbMJierZj5Oq9gPW17
         zqiZ+IQSOD5YFJ8388bugRtyK7FY1YyQjKTztLbTTe439ccNui3Mawnp0WocYrbTL8bk
         0gnq796g3olhYSOAanyeVB1QJTSx1t2r/wCYmmXzVVTYjc7L8C37ESxtgeiIy/PRIA/m
         hT6w==
X-Gm-Message-State: ANoB5pkPrZIwqdKxePbQtuNi+o1U248oatNhNp+IKbiwGyeKSWuOT52G
	4EMDZCJ08xra+rysPbzXNpIkbjbDBCE=
X-Google-Smtp-Source: AA0mqf7AAF5pODM5Mn55YfbXa5rog8PuTL6atFFeVRuqeK0xc7uhmLmkSm8wyj6uOOF7D7B+tpHsJA==
X-Received: by 2002:a05:600c:1d02:b0:3cf:d365:1ea3 with SMTP id l2-20020a05600c1d0200b003cfd3651ea3mr4788859wms.12.1670584499097;
        Fri, 09 Dec 2022 03:14:59 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id x4-20020a05600c2d0400b003d1e763ba46sm1461344wmf.10.2022.12.09.03.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:14:58 -0800 (PST)
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
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/4] dt-bindings: pwm: Add Apple PWM controller
Date: Fri,  9 Dec 2022 14:13:10 +0300
Message-Id: <20221209111313.2701-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221209111313.2701-1-fnkl.kernel@gmail.com>
References: <20221209111313.2701-1-fnkl.kernel@gmail.com>
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

