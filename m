Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5E107B9
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:04:07 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 2F1EB26F79C;
	Tue, 14 Feb 2023 12:04:05 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 12:03:23 +0100
Subject: [PATCH v2 10/16] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t8112-pinctrl compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230202-asahi-t8112-dt-v2-10-22926a283d92@jannau.net>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
In-Reply-To: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=821; i=j@jannau.net;
 h=from:subject:message-id; bh=jh6XjzB5WpgNn26BkBIm/HimbXvQgmtI1mfw0jO8dVw=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXWfOXZj3p6Kzwltb3LJn7ftrN+8+8Eu2XplQ4bRDUu
 5uk/vlRRykLgxgHg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgImwODH8j9ssuOuQ/o9LFfkO
 y5l3VAc69/n7qfI61HyZOZvhyumjAowMu8PajudU/T9+61Drkik/75wuc9i/XuhsoyffnEpJ1f7
 H7AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

This new SoC uses the same pinctrl hardware, so just add a new per-SoC
compatible.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index d3b11351ca45..684c03a6bd40 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -19,6 +19,7 @@ properties:
     items:
       - enum:
           - apple,t8103-pinctrl
+          - apple,t8112-pinctrl
           - apple,t6000-pinctrl
       - const: apple,pinctrl
 

-- 
2.39.1

