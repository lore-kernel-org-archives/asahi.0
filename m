Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EC22CA4
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:41:39 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id B048926F783;
	Sun, 12 Feb 2023 16:41:34 +0100 (CET)
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
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 12/17] dt-bindings: i2c: apple,i2c: Add apple,t8112-i2c compatible
Date: Sun, 12 Feb 2023 16:41:22 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-12-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=j@jannau.net; h=from:subject:message-id; bh=GaccuGqSFZ+kRH1Vtme6IeBfNnC5UeTcePpsKodussA=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7CfcDDwtBNkLGA7LdU/+K5KvWZi6g13v7cR/0Yzzl l7q6fbuKGVhEONgkBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJFJBxkZFsq0uJh8ERItj1YR bpnWkviPIfb5bKtdcrvXvT0zffpZAYb/CT27l/M9W+WeeYWz+9M926mSka6PTk99PHXN20tmG/1 5eQA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

This block on the Apple M2 is compatible with the existing driver so
just add the per-SoC compatible.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 4ac61fec90e2..3f0e94189f2d 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - apple,t8103-i2c
+          - apple,t8112-i2c
           - apple,t6000-i2c
       - const: apple,i2c
 

-- 
2.39.1

