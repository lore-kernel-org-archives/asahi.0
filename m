Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400B3D78
	for <asahi@lists.linux.dev>; Tue, 31 May 2022 21:52:29 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1654033458; bh=CPWVSVHa28KDvdSstDaWFZDL9Ast1WCVvqOwg7GnnT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Os1rOH6XwiMKLoqEenByIV0k5qVxbh3QQbaCHEdIkDO1ywtyZ7NwBUcAWKM9CpF8f
	 4YL/NGmv8I3ttkzhhLYJdM5YK1Ek4hAWjOBjLhMKLrTW+ldCqtR/CwI6DzPrvo+aSA
	 9r/ZJ7klFn88cqx3X9Ns5CQqP9tEkRPK2gk3yyvY=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Mark Kettenis <kettenis@openbsd.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: dma: Add Apple ADMAC
Date: Tue, 31 May 2022 23:36:13 +0200
Message-Id: <20220531213615.7822-2-povik+lin@cutebit.org>
In-Reply-To: <20220531213615.7822-1-povik+lin@cutebit.org>
References: <20220531213615.7822-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apple's Audio DMA Controller (ADMAC) is used to fetch and store audio
samples on SoCs from the "Apple Silicon" family.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 .../devicetree/bindings/dma/apple,admac.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apple,admac.yaml

diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
new file mode 100644
index 000000000000..ab8a4ec7779f
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/apple,admac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Audio DMA Controller (ADMAC)
+
+description: |
+  Apple's Audio DMA Controller (ADMAC) is used to fetch and store audio samples
+  on SoCs from the "Apple Silicon" family.
+
+  The controller has been seen with up to 24 channels. Even-numbered channels
+  are TX-only, odd-numbered are RX-only. Individual channels are coupled to
+  fixed device endpoints.
+
+maintainers:
+  - Martin Povišer <povik+lin@cutebit.org>
+
+allOf:
+  - $ref: "dma-controller.yaml#"
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t6000-admac
+          - apple,t8103-admac
+      - const: apple,admac
+
+  reg:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 1
+    description:
+      Clients specify a single cell with channel number.
+
+  dma-channels:
+    maximum: 24
+
+  interrupts:
+    minItems: 4
+    maxItems: 4
+    description:
+      Interrupts that correspond to the 4 IRQ outputs of the controller. Usually
+      only one of the controller outputs will be connected as an usable interrupt
+      source. The remaining interrupts will be left without a valid value, e.g.
+      in an interrupts-extended list the disconnected positions will contain
+      an empty phandle reference <0>.
+
+required:
+  - compatible
+  - reg
+  - '#dma-cells'
+  - dma-channels
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    admac: dma-controller@238200000 {
+      compatible = "apple,t8103-admac", "apple,admac";
+      reg = <0x38200000 0x34000>;
+      dma-channels = <24>;
+      interrupts-extended = <0>,
+                            <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
+                            <0>,
+                            <0>;
+      #dma-cells = <1>;
+    };
-- 
2.33.0

