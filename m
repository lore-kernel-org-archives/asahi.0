Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82142107AD
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:04 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 9B83E26F791;
	Tue, 14 Feb 2023 12:04:02 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:17 +0100
Subject: [PATCH v2 04/16] dt-bindings: arm: cpus: Add apple,avalanche &
 blizzard compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-4-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=726; i=j@jannau.net;
 h=from:subject:message-id; bh=I8UNgXoM4aOJK60hhdw7e6XwgVQrkjD60ZrLrtDoOww=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfP9e/ibLC/VsOcvmXunp+Sl+0onq1SlzWkP7zsH3
 hEyXBfZUcrCIMbBICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCKmUxn+hzqp+WzxvjFTxbjg
 fuSLtn8p0m03koSeH9DjfcSVedh7DyPDvW+u+/9+ztyt5qUpHGXxxGjm4YPmd7/pNNfdPD3xpN0
 URgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

These are the CPU cores in the Apple silicon M2 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 01b5a9c689a2..ac79fbb1479d 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -85,6 +85,8 @@ properties:
 
   compatible:
     enum:
+      - apple,avalanche
+      - apple,blizzard
       - apple,icestorm
       - apple,firestorm
       - arm,arm710t

-- 
2.39.1

