Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0826FA6
	for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 17:45:05 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id n21so30205312ejb.9
        for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 09:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc7s+j1I+v53zIS5PmltGaeTsanNeN5sDlFmwluvB4c=;
        b=ZW7YE20LBYtuKZLnhkZfVvIw0tdu4LjJ5muSHbTVqkWxOEaxDM8Po2OsAitkQgNX4N
         DCQRE1JY+E0OJ37N4H9hVjdHD4ey3PtMr/N9mT0uvoeDPkHFvMLu7XoAjx39++8TIXGe
         LK9WRn/LtxTMMLGBkR3t/ncaXH2UKpHENGAq6UDo6tZvxwbMLdBeA0hrnJKtHK7UkSWU
         icXlOnv+MYkFR33qMD0ZdcITLgMeWLPvkmKyatSwhzYY59G0hkl3kAVr/V7l07tAr8Iw
         qiN1gLFQIU13b/NL+NTJu4EM+IkkbKff7UkcxX/7o5AA/P75Pm+F1Y8bD9s1WDXD65SZ
         IEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vc7s+j1I+v53zIS5PmltGaeTsanNeN5sDlFmwluvB4c=;
        b=rOoUhHfi1AMpzZLizorr7AXdxseP43VpBoPy+CyjY6SmTI5dvUJ5B9rFpzZKVInv77
         q0yYfmO4zDWYYXV1vN95n1D5Wv4MZRdW1Skabikf3nxQ/csiearGLeAbPqmnX83A+QY3
         Fv00BpjtMm+wqPu6HPlk1kopZqwR56HoGiQtFUQ4UNObOVPdgGqV2ArEFhpR3i0TDrAd
         6RkW/rgOCMLU/foeQZR6Hbv1/KyxXRDACJ0Sng/mR4snMiqqCkgQ9iTbUZrd8aFGHgDM
         1Sc+DAYWYVxvgY+rC8YTDNcH6WnS+iZN7r09jdSpfynoDSLT2UrbneuOAya2JNgvGyE2
         27BQ==
X-Gm-Message-State: ANoB5pl8zYzGE8rqd36zizekk6dofbCeuB1pSXM2FW1qBr2LMG38jovl
	cztmKhFmj+QF+0mLiQBQ//k=
X-Google-Smtp-Source: AA0mqf7lXxnZYpevpsV858rlXSzg0QPJ3/LuKa1iCQAHnmOwNX3SpRCzIWR+qkYbpC56H0BsZIHzcQ==
X-Received: by 2002:a17:907:3ac2:b0:7b7:c1e7:eb54 with SMTP id fi2-20020a1709073ac200b007b7c1e7eb54mr353463ejc.393.1669052703924;
        Mon, 21 Nov 2022 09:45:03 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id x19-20020aa7cd93000000b00467f643585fsm5404201edv.64.2022.11.21.09.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:45:03 -0800 (PST)
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
Subject: [PATCH RESEND v3 1/4] dt-bindings: pwm: Add Apple PWM controller
Date: Mon, 21 Nov 2022 20:42:25 +0300
Message-Id: <20221121174228.93670-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121174228.93670-1-fnkl.kernel@gmail.com>
References: <20221121174228.93670-1-fnkl.kernel@gmail.com>
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
2.38.1

