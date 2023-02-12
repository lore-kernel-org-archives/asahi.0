Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99346B5
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:51:34 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 7274F26F778;
	Sun, 12 Feb 2023 16:41:29 +0100 (CET)
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 03/17] dt-bindings: watchdog: apple,wdt: Add t8112-wdt compatible
Date: Sun, 12 Feb 2023 16:41:13 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-3-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=j@jannau.net; h=from:subject:message-id; bh=+69NoRn07oX1kEzEXqbbrxc9N6YJ6elGhnhIqdxBYk0=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7MePzdh94bPHm7R2pcD9Pmm5Zk5ub1oKQ3duzCv+2 lRuZbGmo5SFQYyDQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwES0rzEyrLGrYeLp07l58s4S 6RW3Sws9ys7WCEb+zVT/PUtcXMc+hZGhseDjequGOTyni0weedad6X2/vPv0VrkTepNvvD209uc jfgA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

The block on the Apple M2 SoC is compatible with the existing driver so
add its per-SoC compatible.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
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

