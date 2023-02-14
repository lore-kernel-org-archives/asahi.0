Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60015107B6
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:07 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 49F8126F797;
	Tue, 14 Feb 2023 12:04:04 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:21 +0100
Subject: [PATCH v2 08/16] dt-bindings: nvme: apple: Add
 apple,t8112-nvme-ans2 compatible string
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-8-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206; i=j@jannau.net;
 h=from:subject:message-id; bh=BnVG0wAdil1oj+bMWBydPENm7hlDIX32bb1ZtcztMcw=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfMPsGiezXlzvHlysmjsqW0ZW2VtDa9HBryx5NxU/
 Z7vUuK8jlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPpz2Vk6I7W++g9yS+1xUzz
 0ZJy5ccFQofLZvLt4RCV/qx233V5PCPD7Pt1FgdbNnD+j9h7fv45//vsuno7g05NY3Td/1Popul
 qbgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

"apple,t8112-nvme-ans2" as found on Apple M2 SoCs is compatible with the
existing driver. Add its SoC specific compatible string to allow special
handling if it'll be necessary.
t8112 uses only 2 power-domains as no 4 and 8 TB configurations are
offered.

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
2.39.1

