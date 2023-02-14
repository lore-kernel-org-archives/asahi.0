Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80075107BD
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:09 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 3FECF26F7A7;
	Tue, 14 Feb 2023 12:04:07 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:28 +0100
Subject: [PATCH v2 15/16] dt-bindings: arm: apple: Add t8112 j413/j473/j493
 compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-15-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950; i=j@jannau.net;
 h=from:subject:message-id; bh=fGtnn563m9gj1SmkVQb3EsEjU3CjpYXUqOaNJO5jR0c=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWQvYvfVYjkV8WaU5s+9g369LYRHx6kdLKx6eWV3ue
 dXbfMrSjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNZtoCRYWnMXlkDMdGbJ4Ky
 042Vw1by/S472WDeGH/+x13TPUlr3jP8MzuRcODS8tzJ4Sdd/ZSPfzxsciZPVOHtk/WzCrlqvm6
 ezg4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

This adds the following apple,t8112 platforms:

- apple,j413 - MacBook Air (M2, 2022)
- apple,j473 - Mac mini (M2, 2023)
- apple,j493 - MacBook Pro (13-inch, M2, 2022)

The sort order logic here is having SoC numeric code families in release
order, and SoCs within each family in release order:

- t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
  - t8103 (Apple H13G/M1)
  - t8112 (Apple H14G/M2)
- t6xxx (Apple HxxJ series, "desktop" chips)
  - t6000 (Apple H13J(S)/M1 Pro)
  - t6001 (Apple H13J(C)/M1 Max)
  - t6002 (Apple H13J(D)/M1 Ultra)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index da78c69774f2..883fd67e3752 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,12 @@ description: |
   - MacBook Air (M1, 2020)
   - iMac (24-inch, M1, 2021)
 
+  Devices based on the "M2" SoC:
+
+  - MacBook Air (M2, 2022)
+  - MacBook Pro (13-inch, M2, 2022)
+  - Mac mini (M2, 2023)
+
   And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
@@ -70,6 +76,15 @@ properties:
           - const: apple,t8103
           - const: apple,arm-platform
 
+      - description: Apple M2 SoC based platforms
+        items:
+          - enum:
+              - apple,j413 # MacBook Air (M2, 2022)
+              - apple,j473 # Mac mini (M2, 2023)
+              - apple,j493 # MacBook Pro (13-inch, M2, 2022)
+          - const: apple,t8112
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:

-- 
2.39.1

