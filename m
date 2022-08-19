Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7957A2C9C
	for <asahi@lists.linux.dev>; Fri, 19 Aug 2022 12:54:41 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1660913679; bh=Gkj3zv8/AM0qe5Jje8Bp7iYtlxqcO626XnrNO1Cj3wY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=keSH+EIT5pxyg9zlrBLaHmVDb0kTl6hmA4nfblgxgR4YNeHQlAYHfO+l5qvJo926l
	 G9Om5eu9TQLcHcs+FkrzPNSsXU20Bf3avCCdsnMsch0yEscQbl4clP1ruBz1cZe1VK
	 nzshyHi6HRupXMQfwDwie9Gxv5mlbJEUe/EUxwes=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Date: Fri, 19 Aug 2022 14:54:27 +0200
Message-Id: <20220819125430.4920-2-povik+lin@cutebit.org>
In-Reply-To: <20220819125430.4920-1-povik+lin@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add binding schema for MCA I2S transceiver found on Apple M1 and other
chips.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 .../devicetree/bindings/sound/apple,mca.yaml  | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml

diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
new file mode 100644
index 000000000000..7b4f348c2be3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,mca.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple MCA I2S transceiver
+
+description: |
+  MCA is an I2S transceiver peripheral found on M1 and other Apple chips. It is
+  composed of a number of identical clusters which can operate independently
+  or in an interlinked fashion. Up to 6 clusters have been seen on an MCA.
+
+maintainers:
+  - Martin Povišer <povik+lin@cutebit.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-mca
+          - apple,t6000-mca
+      - const: apple,mca
+
+  reg:
+    items:
+      - description: Register region of the MCA clusters proper
+      - description: Register region of the DMA glue and its FIFOs
+
+  interrupts:
+    minItems: 4
+    maxItems: 6
+    description:
+      One interrupt per each cluster
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  dmas:
+    minItems: 16
+    maxItems: 24
+    description:
+      DMA channels corresponding to the SERDES units in the peripheral. They are
+      listed in groups of four per cluster, and within the group they are given
+      as associated to the TXA, RXA, TXB, RXB units.
+
+  dma-names:
+    minItems: 16
+    items:
+      - const: tx0a
+      - const: rx0a
+      - const: tx0b
+      - const: rx0b
+      - const: tx1a
+      - const: rx1a
+      - const: tx1b
+      - const: rx1b
+      - const: tx2a
+      - const: rx2a
+      - const: tx2b
+      - const: rx2b
+      - const: tx3a
+      - const: rx3a
+      - const: tx3b
+      - const: rx3b
+      - const: tx4a
+      - const: rx4a
+      - const: tx4b
+      - const: rx4b
+      - const: tx5a
+      - const: rx5a
+      - const: tx5b
+      - const: rx5b
+    description: |
+      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
+      based on the associated SERDES unit.
+
+  clocks:
+    minItems: 4
+    maxItems: 6
+    description:
+      Clusters' input reference clock.
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    minItems: 5
+    maxItems: 7
+    description:
+      First a general power domain for register access, then the power
+      domains of individual clusters for their operation.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - power-domains
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    mca: i2s@9b600000 {
+      compatible = "apple,t6000-mca", "apple,mca";
+      reg = <0x9b600000 0x10000>,
+            <0x9b200000 0x20000>;
+
+      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
+      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+                      <&ps_mca2>, <&ps_mca3>;
+      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
+      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+                  "tx1a", "rx1a", "tx1b", "rx1b",
+                  "tx2a", "rx2a", "tx2b", "rx2b",
+                  "tx3a", "rx3a", "tx3b", "rx3b";
+
+      #sound-dai-cells = <1>;
+    };
-- 
2.33.0

