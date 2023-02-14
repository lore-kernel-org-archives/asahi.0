Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0E1107AC
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:04 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 2DA6F26F790;
	Tue, 14 Feb 2023 12:04:02 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:16 +0100
Subject: [PATCH v2 03/16] dt-bindings: watchdog: apple,wdt: Add t8112-wdt
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-3-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=j@jannau.net;
 h=from:subject:message-id; bh=vSv6DA+BL0n7++LdpkJwgvEC0Bm7PRygajVVF4IxqfI=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfMW39ebmXwvRnaJy7ZPP5LrylYzSKs+/NS2p1I2k
 rv+qP/hjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNZz8jwV+76A9mnml6b5v5N
 P9y9cE/71Vdyqy7sVM22Z7E9FuJuwMHwh9fM076Ez18sf5axCLtASI67xvuT81Xk5lpz5PgE6gu
 wAAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block on the Apple M2 SoC is compatible with the existing driver so
add its per-SoC compatible.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index e58c56a6fdf6..3d7e2a2bf1f1 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - apple,t8103-wdt
+          - apple,t8112-wdt
           - apple,t6000-wdt
       - const: apple,wdt
 

-- 
2.39.1

