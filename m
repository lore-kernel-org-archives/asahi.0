Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207F259A
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 13:51:11 +0000 (UTC)
Received: from robin.home.jannau.net (p54acc2ba.dip0.t-ipconnect.de [84.172.194.186])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 0DDC426EFEA;
	Fri,  9 Sep 2022 15:51:04 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 01/10] dt-bindings: apple,aic: Fix required item "apple,fiq-index" in affinity description
Date: Fri,  9 Sep 2022 15:50:54 +0200
Message-Id: <20220909135103.98179-2-j@jannau.net>
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

Fixes: dba07ad11384 ("dt-bindings: apple,aic: Add affinity description for per-cpu pseudo-interrupts")
Signed-off-by: Janne Grunau <j@jannau.net>
---

 .../devicetree/bindings/interrupt-controller/apple,aic.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index 85c85b694217..e18107eafe7c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -96,7 +96,7 @@ properties:
               Documentation/devicetree/bindings/arm/cpus.yaml).
 
         required:
-          - fiq-index
+          - apple,fiq-index
           - cpus
 
 required:
-- 
2.35.1

