Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1C569D
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 12:10:21 +0000 (UTC)
Received: from robin.home.jannau.net (p54accbe8.dip0.t-ipconnect.de [84.172.203.232])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 786E426F892;
	Tue,  7 Mar 2023 13:10:15 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 07 Mar 2023 13:10:19 +0100
Subject: [PATCH v3 13/15] dt-bindings: dma: apple,admac: Add t8112-admac
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230202-asahi-t8112-dt-v3-13-d1a5f6383d95@jannau.net>
References: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=j@jannau.net;
 h=from:subject:message-id; bh=ENxJR/4ec2wFqwP1J+M9quJhlxwuKaKTGKKe7sCvoAk=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhhR2zYU2vtOffP8fqyRvuWXyhq/bExaKVr0W9G2+O1Grc
 HGUe4FrRykLgxgHg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIm8esHw30ksd53Fx/gPAUJJ
 7k6T3hZfW9eio8Kolhlv+PLHu2LfBUAVJ/d3lm9ROdEspVwfHn95dlpPbuO+f/GT5y78sMFgRwA
 LAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block found on Apple's M2 SoC is compatible with the existing driver
so add its per-SoC compatible.

Acked-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Martin Povišer <povik+lin@cutebit.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/dma/apple,admac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
index 97282469e4af..beb09f115f40 100644
--- a/Documentation/devicetree/bindings/dma/apple,admac.yaml
+++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - apple,t6000-admac
           - apple,t8103-admac
+          - apple,t8112-admac
       - const: apple,admac
 
   reg:

-- 
2.39.2

