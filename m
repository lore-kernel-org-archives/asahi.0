Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4672583
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 13:51:11 +0000 (UTC)
Received: from robin.home.jannau.net (p54acc2ba.dip0.t-ipconnect.de [84.172.194.186])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 7EA8226EFEB;
	Fri,  9 Sep 2022 15:51:04 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	er <povik+lin@cutebit.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 02/10] dt-bindings: dma: apple,admac: Add iommus and power-domains properties
Date: Fri,  9 Sep 2022 15:50:55 +0200
Message-Id: <20220909135103.98179-3-j@jannau.net>
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

Apple's ADMAC is on all supported Apple silicon SoCs behind an IOMMU
and has its own power-domain.

Signed-off-by: Janne Grunau <j@jannau.net>
---

 Documentation/devicetree/bindings/dma/apple,admac.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
index bdc8c129c4f5..3b1e667f7ea0 100644
--- a/Documentation/devicetree/bindings/dma/apple,admac.yaml
+++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
@@ -49,6 +49,13 @@ properties:
       in an interrupts-extended list the disconnected positions will contain
       an empty phandle reference <0>.
 
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.35.1

