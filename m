Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4C2C9D;
	Fri, 17 Mar 2023 23:36:46 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id j6so3561215ilr.7;
        Fri, 17 Mar 2023 16:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679096205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4XTbDitSJ3rKysE1DLB9E8NyDF7QczD+upv2sRYh/A=;
        b=qe+V9T1wNydKSLvAR16AIMlDtV8uHbQTAHdIXgWcmPRKUfvNh4+9/TPdypm7oUIy11
         IQAFIS5NFQXFM7zLMc+zwBkPRDXLdCYdqw1UnsqYCtqtzfYVkHA+WxVAN8TpuXwYGhW1
         YsbbyDYVZSnOEGrmhmDjCzZM79WDr0JzAzfG54KYjPZwt/ks+Gzxo7SVv3KvkpW/8/T+
         GGoJfQ7A2kAE4TG1kVNljejMtLOMyFGAzI7Pc+0jEEHTnIUohsARlMQ7trvxDsa/9yHt
         9y6cgrBHUzrlG/VTFiFJCjl1yh5BMOLmaYnSgdLlgWMUDQrZTD+AJOQLnemRWlUZNWzt
         E+HQ==
X-Gm-Message-State: AO0yUKVUPjy8SjYN/mgS3mXZJJTJqR2YrDAgJYb4KPF9PoyRoQl473il
	gH1XjDRJMp5q/7kDbxvBIQ==
X-Google-Smtp-Source: AK7set8aHEa/CzpkLLAxRrITL3AbBi24Em4TUycz18OMjy74rr/iSfbAP+RwpGIsk3i1yF/MYXGnsg==
X-Received: by 2002:a05:6e02:1ca3:b0:323:5d8:57d2 with SMTP id x3-20020a056e021ca300b0032305d857d2mr180521ill.4.1679096205572;
        Fri, 17 Mar 2023 16:36:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id y19-20020a056e02119300b0031830e2c987sm962469ili.20.2023.03.17.16.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 16:36:45 -0700 (PDT)
Received: (nullmailer pid 3968975 invoked by uid 1000);
	Fri, 17 Mar 2023 23:36:42 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: nvmem: Drop unneeded quotes
Date: Fri, 17 Mar 2023 18:36:39 -0500
Message-Id: <20230317233640.3968821-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-
 Documentation/devicetree/bindings/nvmem/apple,efuses.yaml       | 2 +-
 Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml         | 2 +-
 Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml | 2 +-
 Documentation/devicetree/bindings/nvmem/imx-iim.yaml            | 2 +-
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml          | 2 +-
 .../devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml         | 2 +-
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml     | 2 +-
 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml       | 2 +-
 Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml          | 2 +-
 Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml       | 2 +-
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml        | 2 +-
 Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml     | 2 +-
 Documentation/devicetree/bindings/nvmem/rmem.yaml               | 2 +-
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml     | 2 +-
 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml     | 2 +-
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
 .../devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml         | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 14c170c6a86e..296001e7f498 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
index 5ec8f2bdb3a5..e0860b6b85f3 100644
--- a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+++ b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
@@ -15,7 +15,7 @@ maintainers:
   - Sven Peter <sven@svenpeter.dev>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
index 25033de3ef6b..36def7128fca 100644
--- a/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
+++ b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
@@ -20,7 +20,7 @@ maintainers:
   - Rafał Miłecki <rafal@milecki.pl>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
index 3b4e6e94cb81..70fb2ad25103 100644
--- a/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
@@ -14,7 +14,7 @@ description: |
   unique identifier per part.
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
index 7aac1995cfaf..e9d9d8df4811 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
@@ -14,7 +14,7 @@ description: |
   i.MX25, i.MX27, i.MX31, i.MX35, i.MX51 and i.MX53 SoCs.
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index d0a239d7e199..9876243ff1e8 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -15,7 +15,7 @@ description: |
   i.MX7D/S, i.MX7ULP, i.MX8MQ, i.MX8MM, i.MX8MN and i.MX8MP SoCs.
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
index fe2cd7f1afba..e89fd879c968 100644
--- a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
@@ -10,7 +10,7 @@ maintainers:
   - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 75e0a516e59a..d16d42fb98b6 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -15,7 +15,7 @@ maintainers:
   - Lala Lin <lala.lin@mediatek.com>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index c3c96fd0baac..a296d348adb4 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -15,7 +15,7 @@ description: |
   settings, chip identifiers) or user specific data could be stored.
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
index ff317fd7c15b..8938eec22b52 100644
--- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml b/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
index f93bc50c40d7..6c26800f8b79 100644
--- a/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
@@ -17,7 +17,7 @@ maintainers:
   - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2173fe82317d..e952907ad1d5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
index e08504ef3b6e..34818683f80c 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
@@ -15,7 +15,7 @@ description: |
   to/from the PBUS.
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/rmem.yaml b/Documentation/devicetree/bindings/nvmem/rmem.yaml
index a4a755dcfc43..38a39c9b8c1c 100644
--- a/Documentation/devicetree/bindings/nvmem/rmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rmem.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index febee8129aa9..c5403e149080 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Heiko Stuebner <heiko@sntech.de>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
index dc790d2cd9f0..b8bca0599c45 100644
--- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   "#address-cells": true
diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index 172597cc5c63..a69de3e92282 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -16,7 +16,7 @@ maintainers:
   - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
index a7644ebbc2ca..8877c2283e9e 100644
--- a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Vincent Shih <vincent.sunplus@gmail.com>
 
 allOf:
-  - $ref: "nvmem.yaml#"
+  - $ref: nvmem.yaml#
 
 properties:
   compatible:
-- 
2.39.2

