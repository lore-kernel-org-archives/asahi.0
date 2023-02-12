Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913FF2595
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:41:38 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 00EDB26F77E;
	Sun, 12 Feb 2023 16:41:32 +0100 (CET)
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
Subject: [PATCH 09/17] dt-bindings: nvme: apple: Add apple,t8112-nvme-ans2 compatible string
Date: Sun, 12 Feb 2023 16:41:19 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-9-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=j@jannau.net; h=from:subject:message-id; bh=DeFrvPpwtRa0oCuCDcxsondrWycOzD87NFx3HOmPXHc=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7CcqLbOviu3ZGGJwd7bLIs57L4ulpJRnzC7pfHVp5 rwWr1jfjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNRz2H4p73g1aM/M9kddvyr nLOy6J1bxtSduRdm/FK/XRR4z6ibI5SRoaPaf4Hmn/3zv6k1ca74a1bpUszwocw3aYpeiG4s29E /vAA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

"apple,t8112-nvme-ans2" as found on Apple M2 SoCs is compatible with the
existing driver. Add its SoC specific compatible string to allow special
handling if it'll be necessary.
t8112 uses only 2 power-domains as no 4 and 8 TB configurations are
offered.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
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

