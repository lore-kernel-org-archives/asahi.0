Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD853B3
	for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 14:25:54 +0000 (UTC)
Received: from robin.home.jannau.net (unknown [91.200.110.112])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 8485A26F07A;
	Fri, 16 Sep 2022 16:25:52 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] dt-bindings: apple,aic2: Add CPU PMU per-cpu pseudo-interrupts
Date: Fri, 16 Sep 2022 16:25:42 +0200
Message-Id: <20220916142550.269905-3-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916142550.269905-1-j@jannau.net>
References: <20220916142550.269905-1-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Advertise the two pseudo-interrupts that tied to the two PMU
flavours present in the Apple M1 Pro/Max/Ultra SoC.

We choose the expose two different pseudo-interrupts to the OS
as the e-core PMU is obviously different from the p-core one,
effectively presenting two different devices.

Imported from "apple,aic".

Signed-off-by: Janne Grunau <j@jannau.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Marc Zyngier <maz@kernel.org>

---

Changes in v1:
- Added Krzysztof's and Marc's ack


---
 .../interrupt-controller/apple,aic2.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 47a78a167aba..06948c0e36a5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -69,6 +69,35 @@ properties:
   power-domains:
     maxItems: 1
 
+  affinities:
+    type: object
+    additionalProperties: false
+    description:
+      FIQ affinity can be expressed as a single "affinities" node,
+      containing a set of sub-nodes, one per FIQ with a non-default
+      affinity.
+    patternProperties:
+      "^.+-affinity$":
+        type: object
+        additionalProperties: false
+        properties:
+          apple,fiq-index:
+            description:
+              The interrupt number specified as a FIQ, and for which
+              the affinity is not the default.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 5
+
+          cpus:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description:
+              Should be a list of phandles to CPU nodes (as described in
+              Documentation/devicetree/bindings/arm/cpus.yaml).
+
+        required:
+          - apple,fiq-index
+          - cpus
+
 required:
   - compatible
   - '#interrupt-cells'
-- 
2.35.1

