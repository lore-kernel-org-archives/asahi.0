Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E39107AF
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:06 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 0CEFB26F792;
	Tue, 14 Feb 2023 12:04:03 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:18 +0100
Subject: [PATCH v2 05/16] dt-bindings: interrupt-controller: apple,aic2:
 Add apple,t8112-aic compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-5-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882; i=j@jannau.net;
 h=from:subject:message-id; bh=wApG879qmGNAbNwX8mIgzfzLAGPs9zJLCZHMZaAxgWk=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfMdNIpVkp93nr/G8mEl4xMVm/cCPCs+3xWctP++5
 vTAjLr4jlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPxvszI8OLrpNOPxBdcv93j
 sSfv2926x+lOLV5mu6LXzIwSUgqQ6GD472J9aZeCPvuLCTP3zc/kk53Z+vmiLK/yq0PP7NS/+6S
 2MAIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The Apple M2 SoC uses AICv2 and is compatible with the existing driver.
Add its per-SoC compatible.
Since multi-die versions of the M2 are not expected decrease
'#interrupt-cells' to 3 for apple,t8112-aic. This is seamlessly handled
inside the driver.

Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../bindings/interrupt-controller/apple,aic2.yaml  | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 06948c0e36a5..a99e7ed7c750 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -31,19 +31,22 @@ description: |
 properties:
   compatible:
     items:
-      - const: apple,t6000-aic
+      - enum:
+          - apple,t8112-aic
+          - apple,t6000-aic
       - const: apple,aic2
 
   interrupt-controller: true
 
   '#interrupt-cells':
-    const: 4
+    minimum: 3
+    maximum: 4
     description: |
       The 1st cell contains the interrupt type:
         - 0: Hardware IRQ
         - 1: FIQ
 
-      The 2nd cell contains the die ID.
+      The 2nd cell contains the die ID (only present on apple,t6000-aic).
 
       The next cell contains the interrupt number.
         - HW IRQs: interrupt number
@@ -110,6 +113,20 @@ additionalProperties: false
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: apple,t8112-aic
+then:
+  properties:
+    '#interrupt-cells':
+      const: 3
+else:
+  properties:
+    '#interrupt-cells':
+      const: 4
+
 examples:
   - |
     soc {

-- 
2.39.1

