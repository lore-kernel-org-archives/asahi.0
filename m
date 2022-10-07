Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF284C80
	for <asahi@lists.linux.dev>; Fri,  7 Oct 2022 20:00:55 +0000 (UTC)
Received: from localhost.localdomain (95.49.30.201.neoplus.adsl.tpnet.pl [95.49.30.201])
	by m-r2.th.seeweb.it (Postfix) with ESMTPA id 7D0E13F359;
	Fri,  7 Oct 2022 22:00:45 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: martin.botka@somainline.org,
	angelogioacchino.delregno@somainline.org,
	marijn.suijten@somainline.org,
	jamipkettunen@somainline.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: apple,aic: Document A7-A11 compatibles
Date: Fri,  7 Oct 2022 22:00:21 +0200
Message-Id: <20221007200022.22844-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007200022.22844-1-konrad.dybcio@somainline.org>
References: <20221007200022.22844-1-konrad.dybcio@somainline.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatibles for Apple A7-A11 SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v3:
- Bindings: A7-A10+M1 only get SoC compat and generic fallback,
A11 gets M1 fallback and generic fallback (removed A11 compatible)
- Drop Rob's A-b as this is essentially yet another rewrite..

 .../bindings/interrupt-controller/apple,aic.yaml | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index e18107eafe7c..1427ea9b04a2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -36,9 +36,19 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: apple,t8103-aic
-      - const: apple,aic
+    oneOf:
+      - items:
+          - enum:
+              - apple,s5l8960x-aic
+              - apple,s8000-aic
+              - apple,t7000-aic
+              - apple,t8010-aic
+              - apple,t8103-aic
+          - const: apple,aic
+      - items:
+          - const: apple,t8015-aic
+          - const: apple,t8103-aic
+          - const: apple,aic
 
   interrupt-controller: true
 
-- 
2.37.3

