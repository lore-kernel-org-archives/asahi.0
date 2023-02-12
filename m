Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0123BE
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:41:38 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 3CFC226F77B;
	Sun, 12 Feb 2023 16:41:31 +0100 (CET)
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/17] dt-bindings: arm-pmu: Add PMU compatible strings for Apple M2 cores
Date: Sun, 12 Feb 2023 16:41:16 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-6-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=j@jannau.net; h=from:subject:message-id; bh=70aLQCthrgk4W+FY4KI9HKrMII5ATNhhq2xdSLcypVA=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7CcCeL9Zvn94+H61XxdDZp1V5f0nxf4MJZPMP7+rf JUwMTC5o5SFQYyDQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwESuWDAybNIIEExaFTNhyeNf F867/Ta6Y1zWtp4pbtfLNC4dC0cRRoZ/Kinfbq45skn61eU1jdI3LY4fOFCWpvCoWWW1Ypd/yt1 qNgA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

The PMUs on the avalanche and blizzard CPU two micro-architectures are
mostly compatible with M1 ones. They miss support for a single counter
according to Apple's PMU counter list.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.

The necessary driver update will be sent separately.
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index dbb6f3dc5ae5..e14358bf0b9c 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -20,6 +20,8 @@ properties:
     items:
       - enum:
           - apm,potenza-pmu
+          - apple,avalanche-pmu
+          - apple,blizzard-pmu
           - apple,firestorm-pmu
           - apple,icestorm-pmu
           - arm,armv8-pmuv3 # Only for s/w models

-- 
2.39.1

