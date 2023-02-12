Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060F46BB
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 15:51:34 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 185F226F779;
	Sun, 12 Feb 2023 16:41:30 +0100 (CET)
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/17] dt-bindings: arm: cpus: Add apple,avalanche & blizzard compatibles
Date: Sun, 12 Feb 2023 16:41:14 +0100
Message-Id: <20230202-asahi-t8112-dt-v1-4-cb5442d1c229@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=821; i=j@jannau.net; h=from:subject:message-id; bh=JDVXxH2rWzmb7GnkAaYgeojsclpJe8BD3FpRIBowJhA=; b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuSX7Ce6Dh9jXnrYNNf70Ra/ncW+HKai0lnLPdZpb5sul Kz3TuhjRykLgxgHg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIn0ODAyHK5uMD+/RtRb4Nvt mIUSKyp8WN7XP/pqZjWX/X0MJ79UICPDpqR/5wWWME0qTbx9WTKvtrDG+PkWvqpdezl5pNvNb5Z wAgA=
X-Developer-Key: i=j@jannau.net; a=openpgp; fpr=8B336A6BE4E5695E89B8532B81E806F586338419
Content-Transfer-Encoding: 8bit

These are the CPU cores in the Apple silicon M2 SoC.

Signed-off-by: Janne Grunau <j@jannau.net>

---
This trivial dt-bindings update should be merged through the asahi-soc
tree to ensure validation of the Apple M2 (t8112) devicetrees in this
series.
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

