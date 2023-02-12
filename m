Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D733C4
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:41:39 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 45D4C26F788;
	Sun, 12 Feb 2023 16:41:35 +0100 (CET)
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 13/17] dt-bindings: clock: apple,nco: Add t8112-nco compatible
Date: Sun, 12 Feb 2023 16:41:23 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-13-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=j@jannau.net; h=from:subject:message-id; bh=guQoP4sTJ6J0hvW04dgo+MfAOGedfXRIgUStRwklrig=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7Cdmzdm4cvfPzkT7S7f/Td73YFm/q9f11hkiCczba pqWSG5q6ShlYRDjYJAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRdUqMDBP4hOfF2UxsvX+7 uHJx+I1rxsHhz3k56tpulZkZPbObOZfhf3SHwizzmt/LuC2PB8/eNOu7u/rW1ur48O8RJaHvn1i 3MwAA
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

The block found on Apple's M2 SoC is compatible with the existing driver
so add its per-SoC compatible.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
---
 Documentation/devicetree/bindings/clock/apple,nco.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/Documentation/devicetree/bindings/clock/apple,nco.yaml
index 74eab5c0d24a..8b8411dc42f6 100644
--- a/Documentation/devicetree/bindings/clock/apple,nco.yaml
+++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - apple,t6000-nco
           - apple,t8103-nco
+          - apple,t8112-nco
       - const: apple,nco
 
   clocks:

-- 
2.39.1

