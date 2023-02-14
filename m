Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83753107AB
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:06 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 6550126F793;
	Tue, 14 Feb 2023 12:04:03 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:19 +0100
Subject: [PATCH v2 06/16] dt-bindings: iommu: apple,sart: Add
 apple,t8112-sart compatible string
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-6-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=j@jannau.net;
 h=from:subject:message-id; bh=Am2hpYfuFFOIDC8gMQnR51jsehRvPYk6LpgtY9k4U4A=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfMndfXlHLii9fVT+tlH5RNVEwWYVFlENn46+TBu6
 2tWk6apHaUsDGIcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACYSxsvIcJN93ln3at8Ze52u
 PU3WMtiyJ+ZBceK5bt6VrPYsx4NtWBl+s8QUP+WO7d1X9nWqtUncVNfuIBX+Js3pasJyWV+ruNf
 wAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

"apple,t8112-sart" as found on the Apple M2 SoC appears to be SART3 as
well. To allow for later discovered incompatibilities use
'"apple,t8112-sart", "apple,t6000-sart"' as compatible string.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index 1524fa3094ef..e87c1520fea6 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -28,9 +28,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - apple,t6000-sart
-      - apple,t8103-sart
+    oneOf:
+      - items:
+          - const: apple,t8112-sart
+          - const: apple,t6000-sart
+      - enum:
+          - apple,t6000-sart
+          - apple,t8103-sart
 
   reg:
     maxItems: 1

-- 
2.39.1

