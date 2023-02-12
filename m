Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8D46B7
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:51:34 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id D840226F777;
	Sun, 12 Feb 2023 16:41:28 +0100 (CET)
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
Subject: [PATCH 02/17] dt-bindings: arm: apple: apple,pmgr: Add t8112-pmgr compatible
Date: Sun, 12 Feb 2023 16:41:12 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-2-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=j@jannau.net; h=from:subject:message-id; bh=jYsdnfO8rQR9P/6ssMV7SEuJ1YuSh9hjxO/Vv6MxYns=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7Mc5uEtjN808e3DJg72XzfpsPzo5Zi2KPvvb52ZXN DdLK/vhjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNpWMzwP0+S8bnpg/P2M+4t 4X0a97ohubv6TPTfDUWL+TmZlQJNfRn+qeV4npuTXGd/rkRRd2qsWEqBvEpME6f5ydkB9VNXVYd zAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

The block on Apple M2 SoCs is compatible with the existing driver so
just add its per-SoC compatible.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 0dc957a56d35..673277a7a224 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - apple,t8103-pmgr
+          - apple,t8112-pmgr
           - apple,t6000-pmgr
       - const: apple,pmgr
       - const: syscon

-- 
2.39.1

