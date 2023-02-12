Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E605257A
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:41:38 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id A76EC26F77A;
	Sun, 12 Feb 2023 16:41:30 +0100 (CET)
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] dt-bindings: interrupt-controller: apple,aic2: Add apple,t8112-aic compatible
Date: Sun, 12 Feb 2023 16:41:15 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-5-cb5442d1c229@jannau.net>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=j@jannau.net; h=from:subject:message-id; bh=9s42KFAgCWAeCi1wiBerzppTPEA8YEq8gDQ5kBlwTI8=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7CdMPyV9KFeed+Hg6fDPDiqSuwRqN4rc+KCavJJ91 VPvJaGRHaUsDGIcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTAC7SzfCH8xyfz82S6xMsvs48 HCa16xKbzrGWNGaTT/4LV3Er+d41Z2S4uWfqmk0x53O1eGPXblPU+qKVIpTwetn/BE0x2zuKGyO 5AA==
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

The Apple M2 SoC uses AICv2 and is compatible with the existing driver.
Add its per-SoC compatible.
Since multi-die versions of the M2 are not expected decrease
'#interrupt-cells' to 3 for apple,t8112-aic. This is seamlessly handled
inside the driver.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
---
 .../bindings/interrupt-controller/apple,aic2.yaml  | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 06948c0e36a5..120e23ff668c 100644
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
+      The 2nd cell contains the die ID (optional).
 
       The next cell contains the interrupt number.
         - HW IRQs: interrupt number
@@ -98,6 +101,20 @@ properties:
           - apple,fiq-index
           - cpus
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: apple,t8112-aic
+then:
+  properties:
+    '#interrupt-cells':
+      maximum: 3
+else:
+  properties:
+    '#interrupt-cells':
+      minimum: 4
+
 required:
   - compatible
   - '#interrupt-cells'

-- 
2.39.1

