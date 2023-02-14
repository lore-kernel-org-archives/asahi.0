Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE3107AF
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:08 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id BEBC826F7A4;
	Tue, 14 Feb 2023 12:04:06 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:27 +0100
Subject: [PATCH v2 14/16] dt-bindings: dma: apple,admac: Add t8112-admac
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230202-asahi-t8112-dt-v2-14-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=j@jannau.net;
 h=from:subject:message-id; bh=y7s2ozUsI9QotQJbKKV7ZboXk+SXWka9vaUhbuvUAQ4=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWQtMPRV6rOSWmPBelfQ/IJ1Yq8LOHxixpfF0Nesej
 f368zd0lLIwiHEwyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmEjLCYb/lYlP+NxrM+tPPHsQ
 e+GAnqbiueUTlUs9Ev7sXRin+WxXGcMfvqCQfSE8C0NWh6kFbLL87XP57ZLEY4+Cp7p0fzwb/su
 YAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block found on Apple's M2 SoC is compatible with the existing driver
so add its per-SoC compatible.

Acked-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Martin Povišer <povik+lin@cutebit.org>
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
2.39.1

