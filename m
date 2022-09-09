Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65D433EC
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 13:51:12 +0000 (UTC)
Received: from robin.home.jannau.net (p54acc2ba.dip0.t-ipconnect.de [84.172.194.186])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 68AFA26EFED;
	Fri,  9 Sep 2022 15:51:05 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 04/10] dt-bindings: arm: apple: Add t6001/t6002 Mac Studio compatibles
Date: Fri,  9 Sep 2022 15:50:57 +0200
Message-Id: <20220909135103.98179-5-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909135103.98179-1-j@jannau.net>
References: <20220909135103.98179-1-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,t6001 platform:

- apple,j375c - Mac Studio (M1 Max, 2022)

And the initial apple,t6002 platform:

- apple,j375d - Mac Studio (M1 Ultra, 2022)

Signed-off-by: Janne Grunau <j@jannau.net>
---

 Documentation/devicetree/bindings/arm/apple.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 8d93e8a6cc18..b34e56b9dc59 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,12 +19,14 @@ description: |
   - MacBook Air (M1, 2020)
   - iMac (24-inch, M1, 2021)
 
-  And devices based on the "M1 Pro" and "M1 Max" SoCs:
+  And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
   - MacBook Pro (14-inch, M1 Max, 2021)
   - MacBook Pro (16-inch, M1 Pro, 2021)
   - MacBook Pro (16-inch, M1 Max, 2021)
+  - Mac Studio (M1 Max, 2022)
+  - Mac Studio (M1 Ultra, 2022)
 
   The compatible property should follow this format:
 
@@ -79,8 +81,15 @@ properties:
           - enum:
               - apple,j314c # MacBook Pro (14-inch, M1 Max, 2021)
               - apple,j316c # MacBook Pro (16-inch, M1 Max, 2021)
+              - apple,j375c # Mac Studio (M1 Max, 2022)
           - const: apple,t6001
           - const: apple,arm-platform
+      - description: Apple M1 Ultra SoC based platforms
+        items:
+          - enum:
+              - apple,j375d # Mac Studio (M1 Ultra, 2022)
+          - const: apple,t6002
+          - const: apple,arm-platform
 
 additionalProperties: true
 
-- 
2.35.1

