Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF63D78
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 12:10:19 +0000 (UTC)
Received: from robin.home.jannau.net (p54accbe8.dip0.t-ipconnect.de [84.172.203.232])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 6FA3A26F88D;
	Tue,  7 Mar 2023 13:10:13 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 07 Mar 2023 13:10:14 +0100
Subject: [PATCH v3 08/15] dt-bindings: nvme: apple: Add
 apple,t8112-nvme-ans2 compatible string
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v3-8-d1a5f6383d95@jannau.net>
References: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=j@jannau.net;
 h=from:subject:message-id; bh=fHBkvAY6XhNS/kXyTd3/WQYda6VSGxdD5gGv92wX0ao=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhhR2zQWRO9lkI1PuGm+QrNx1Wmp5KtOn5VO2WtxPPfXnd
 9H9+9kvO0pZGMQ4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExE5TPDH/4bE1fsyZQ57+bN
 a7wg863npS3aPlNcp9w899KWPdnxwg5GhqnCFhu3G1mzu7xY+39yXnPSb/UTh9S913/9EDnJQft
 oAzMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

"apple,t8112-nvme-ans2" as found on Apple M2 SoCs is compatible with the
existing driver. Add its SoC specific compatible string to allow special
handling if it'll be necessary.
t8112 uses only 2 power-domains as no 4 and 8 TB configurations are
offered.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index 34dd1cc67124..fc6555724e18 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - apple,t8103-nvme-ans2
+          - apple,t8112-nvme-ans2
           - apple,t6000-nvme-ans2
       - const: apple,nvme-ans2
 
@@ -65,7 +66,9 @@ if:
   properties:
     compatible:
       contains:
-        const: apple,t8103-nvme-ans2
+        enum:
+          - apple,t8103-nvme-ans2
+          - apple,t8112-nvme-ans2
 then:
   properties:
     power-domains:

-- 
2.39.2

