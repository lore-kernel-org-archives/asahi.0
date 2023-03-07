Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC36131
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 12:18:48 +0000 (UTC)
Received: from robin.home.jannau.net (p54accbe8.dip0.t-ipconnect.de [84.172.203.232])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 39EE326F886;
	Tue,  7 Mar 2023 13:10:10 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 07 Mar 2023 13:10:07 +0100
Subject: [PATCH v3 01/15] dt-bindings: power: apple,pmgr-pwrstate: Add
 t8112 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v3-1-d1a5f6383d95@jannau.net>
References: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=j@jannau.net;
 h=from:subject:message-id; bh=5sGxEKFsM7Xw7GaCGqyKYguwe6Up2BPnOTTHMCNSZ0Y=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhhR2zfnTvXRUVznFLBI453MjIrtYbqd0ZvYZN9u48Bf8r
 /zf3bTqKGVhEONgkBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBGNRIb/jqZ5OhcSd0z6Y+Qa
 oyod++e2Zzvfo18XYwrFeqN5XsV/Z/ifP8fibU1u2wmtKeu9ZQy2r0nfdursZNbqicwTexeZ3Wp
 iBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

From: Hector Martin <marcan@marcan.st>

Add the apple,t8112-pmgr-pwrstate compatible for the Apple M2 SoC.

This goes after t8103. The sort order logic here is having SoC numeric
code families in release order, and SoCs within each family in release
order:

- t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
  - t8103 (Apple H13G/M1)
  - t8112 (Apple H14G/M2)
- t6xxx (Apple HxxJ series, "desktop" chips)
  - t6000 (Apple H13J(S)/M1 Pro)
  - t6001 (Apple H13J(C)/M1 Max)
  - t6002 (Apple H13J(D)/M1 Ultra)

Note that t600[0-2] share the t6000 compatible where the hardware is
100% compatible, which is usually the case in this highly related set
of SoCs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Janne Grunau <j@jannau.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 94d369eb85de..59a6af735a21 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -32,6 +32,7 @@ properties:
     items:
       - enum:
           - apple,t8103-pmgr-pwrstate
+          - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
       - const: apple,pmgr-pwrstate
 

-- 
2.39.2

