Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50AA7B
	for <asahi@lists.linux.dev>; Tue,  4 Oct 2022 11:34:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2a00:f41:188c:1c74:dc7c:ae37:b483:8263])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D3DA920014;
	Tue,  4 Oct 2022 13:27:31 +0200 (CEST)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: towinchenmi@gmail.com,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: apple,aic: Document A7-A11 compatibles
Date: Tue,  4 Oct 2022 13:27:23 +0200
Message-Id: <20221004112724.31621-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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
Changes since v2:
- drop s5l8960x fallback for A8-A11, now apple,aic is the fallback for all

 .../bindings/interrupt-controller/apple,aic.yaml          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index e18107eafe7c..6b83ee18d1ca 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -37,7 +37,13 @@ allOf:
 properties:
   compatible:
     items:
-      - const: apple,t8103-aic
+      - enum:
+          - apple,s5l8960x-aic
+          - apple,s8000-aic
+          - apple,t7000-aic
+          - apple,t8010-aic
+          - apple,t8015-aic
+          - apple,t8103-aic
       - const: apple,aic
 
   interrupt-controller: true
-- 
2.30.2

