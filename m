Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F0C107B1
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:07 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id B660626F79B;
	Tue, 14 Feb 2023 12:04:04 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:22 +0100
Subject: [PATCH v2 09/16] dt-bindings: pci: apple,pcie: Add t8112 support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-9-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=764; i=j@jannau.net;
 h=from:subject:message-id; bh=L3pbsgF1lEr4fUMeys/W3LjQUTDDXrZfL6NORoLzYpo=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfOF/hXOet+b8OeqnXvQRY9HTJaz3N4eep574Xuv2
 aoz0hF1HaUsDGIcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbSlsbwV2zCvpjkUIUkxWZp
 hyWt5y5kR0kL3yzpL2ybZKCaoDipkOE3W8R65b83Ves9jvh/qpXbZ64gb3VaP8Y2aF5EwgrFi0s
 5AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The block found in the Apple M2 SoC is compatible with the existing
driver, and supports 4 downstream ports like the t6000 one.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pci/apple,pcie.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index aa38680aaaca..215ff9a9c835 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -33,6 +33,7 @@ properties:
     items:
       - enum:
           - apple,t8103-pcie
+          - apple,t8112-pcie
           - apple,t6000-pcie
       - const: apple,pcie
 

-- 
2.39.1

