Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496C46B8
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:41:41 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 35BBD26F795;
	Sun, 12 Feb 2023 16:41:37 +0100 (CET)
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] dt-bindings: arm: apple: Add t8112 j413/j473/j493 compatibles
Date: Sun, 12 Feb 2023 16:41:26 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-16-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=j@jannau.net; h=from:subject:message-id; bh=LZlfmrMLh355hrUXDWcy/Nqo+IlGvelXqULXx2QN1vU=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7Cd1W5Vm6KsVCumuuC4RJqnrceWhffae///vnrSf6 BWhcWVNRykLgxgHg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkcmMfwP9uyPe7jJbv98xj5 kx7+O7ztKLfUyYNFWk0qe7lc6szcvBgZbnnn9S7r2+nfIq2qYRA+My7Q49ztVYEdZ6QzxRdHy0j wAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

This adds the following apple,t8112 platforms:

- apple,j413 - MacBook Air (M2, 2022)
- apple,j473 - Mac mini (M2, 2023)
- apple,j493 - MacBook Pro (13-inch, M2, 2022)

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

