Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB782107AB
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:03 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id ABA2426F78F;
	Tue, 14 Feb 2023 12:04:01 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:15 +0100
Subject: [PATCH v2 02/16] dt-bindings: arm: apple: apple,pmgr: Add
 t8112-pmgr compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-2-22926a283d92@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=j@jannau.net;
 h=from:subject:message-id; bh=wHeht8pq0t5FEcVgQC5sfY8X8EgGkDKC3DolTYSHSlY=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfPUeTk6g9bON3E+Y6s2vezUkYCsc21GJoJKr586v
 XnffPFQRykLgxgHg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlM/snI8Mtpmd/FuS67X9yf
 /PjBz9+dJYmTfr//tvWc3Pa4G/xzZnMy/BVU2exw48ra0wu2sxdMfDN7SsIjw3DP19PTZ1TVm/q
 ZBrADAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block on Apple M2 SoCs is compatible with the existing driver so
just add its per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
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

