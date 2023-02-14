Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E21107BE
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:08 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 563E726F7A2;
	Tue, 14 Feb 2023 12:04:06 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:26 +0100
Subject: [PATCH v2 13/16] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230202-asahi-t8112-dt-v2-13-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=j@jannau.net;
 h=from:subject:message-id; bh=rV6CXtRRgp+5w6DI1HpO9PipUGv/TO/OETszmuRJx6o=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWQvinpXvebbq/KVp7cmR9S3b9okzcSr0MfBXP7Tyl
 qiue1LTUcrCIMbBICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCLz/Rn+2T/x6ehcHD+NtVVN
 d66K6J6Termv3b9fCH4Rybf90ZvWeYwMV/jib3/bURKVbmV1+Px3Le9P+rr/fCzONq5Lvsog5+z
 HCgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block found on Apple's M2 SoC is compatible with the existing driver
so add its per-SoC compatible.

Acked-by: Martin Povišer <povik+lin@cutebit.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/sound/apple,mca.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
index 40e3a202f443..5c6ec08c7d24 100644
--- a/Documentation/devicetree/bindings/sound/apple,mca.yaml
+++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - apple,t6000-mca
           - apple,t8103-mca
+          - apple,t8112-mca
       - const: apple,mca
 
   reg:

-- 
2.39.1

