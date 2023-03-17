Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0164846F;
	Fri, 17 Mar 2023 23:36:49 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id l9so3574187iln.1;
        Fri, 17 Mar 2023 16:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679096209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAHQJreSYJUlrT+IWgaDZLHiEodZJxHN75boCiP/aRQ=;
        b=EiOpbI06FjCW5UxE1xWHhL/gEIPm2Uvbhonxaa/cmHrdOl5OXn9hcqHvL1FXOmeNWH
         ElmNx3SD+eyqYWnKNa5b9JxSsjqvq+F6hGRVcIxHLbFSAEZW0gvIQse5TOvMRDzHnjAV
         SL7VeIrwS5Vk8kJLZVFo9H24SzZualeTcuMyv4xMiBR7Hl7zEm40Sboq9XilR6WuDI4l
         TYraQjZFEF5xOkCr2t6cQvbfDByrsV5VE8suMyp+wknepNjWU9Y7Kof/tgOtS075HHtT
         bfhq0plCl99+fldKs/22Fgc9t/5n+1+mU6uyfCKNkEaHIJ+Awod5gHoHA0DHLImBh2sH
         6l5w==
X-Gm-Message-State: AO0yUKWqiygmTeQD6/mFUp+kROwLdL4on6BykvawSFmzRBpfxGrRYrXE
	q55sBf67cdXDdBVXxIJ/uQ==
X-Google-Smtp-Source: AK7set+bbXkjcJT9X/VWDLFNFuBmQoYVTrpjH8hskh+AOpG1gVqr8N6gPAvuv661Er+6JAbYzyVatg==
X-Received: by 2002:a05:6e02:811:b0:317:6ead:2e4e with SMTP id u17-20020a056e02081100b003176ead2e4emr272922ilm.5.1679096209476;
        Fri, 17 Mar 2023 16:36:49 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id v5-20020a056e020f8500b00317b8e2c2b4sm957361ilo.39.2023.03.17.16.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 16:36:48 -0700 (PDT)
Received: (nullmailer pid 3969112 invoked by uid 1000);
	Fri, 17 Mar 2023 23:36:45 -0000
From: Rob Herring <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: watchdog: Drop unneeded quotes
Date: Fri, 17 Mar 2023 18:36:42 -0500
Message-Id: <20230317233643.3969019-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml       | 2 +-
 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml     | 2 +-
 .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml          | 2 +-
 .../devicetree/bindings/watchdog/faraday,ftwdt010.yaml          | 2 +-
 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml | 2 +-
 Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml   | 2 +-
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml     | 2 +-
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml     | 2 +-
 .../devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml    | 2 +-
 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml   | 2 +-
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml      | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index 026c2e5e77aa..274519fc24fd 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Allwinner A10 Watchdog
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index e58c56a6fdf6..20435a77e079 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Apple SoC Watchdog
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 maintainers:
   - Sven Peter <sven@svenpeter.dev>
diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
index e3a1d79574e2..fa05d6252982 100644
--- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: ARM Secure Monitor Call based watchdog
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
index a9635c03761c..b28f7b57c36b 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Eugen Hristev <eugen.hristev@microchip.com>
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index a926809352b8..428004e7f0c3 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: BCM63xx and BCM7038 watchdog timer
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 maintainers:
   - Florian Fainelli <f.fainelli@gmail.com>
diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
index 6ecd429f76b5..6e135f48b3ba 100644
--- a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
+++ b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
@@ -15,7 +15,7 @@ description: |
   SoCs and others.
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index 8562978aa0c8..d3790f1a96a2 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
index 38079e1b6a44..1a6490c43d89 100644
--- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
+++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim 63xx Watchdog Timers
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
   - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 maintainers:
diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index e2c9bf1aec38..50c5c48ee6fb 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -115,7 +115,7 @@ required:
   - clocks
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
   - if:
       not:
diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 92df6e453f64..9387e4caa0fd 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Synopsys Designware Watchdog Timer
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 maintainers:
   - Jamie Iles <jamie@jamieiles.com>
diff --git a/Documentation/devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml b/Documentation/devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml
index 70c005fdd197..ba0709314360 100644
--- a/Documentation/devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Keiji Hayashibara <hayashibara.keiji@socionext.com>
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
index a8e266f80c20..2cb1a2ed0f7b 100644
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Christophe Roullier <christophe.roullier@foss.st.com>
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index 2f33635876ff..fc553211e42d 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -18,7 +18,7 @@ description:
   to directly reset the SoC.
 
 allOf:
-  - $ref: "watchdog.yaml#"
+  - $ref: watchdog.yaml#
 
 properties:
   compatible:
-- 
2.39.2

