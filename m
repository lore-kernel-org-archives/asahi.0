Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC692F22
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 23:05:31 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 9145B26F48D;
	Tue,  6 Dec 2022 23:57:43 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 06 Dec 2022 23:57:36 +0100
Subject: [PATCH 1/2] arch: arm64: apple: t8103: Use standard "iommu" node name
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221206-arm64-dts-apple-pcie-iommu-v1-1-210c56e48c01@jannau.net>
References: <20221206-arm64-dts-apple-pcie-iommu-v1-0-210c56e48c01@jannau.net>
In-Reply-To:
 <20221206-arm64-dts-apple-pcie-iommu-v1-0-210c56e48c01@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.11.0-dev-022da
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; i=j@jannau.net;
 h=from:subject:message-id; bh=F7sZGqebhAJ1QvEgrJxgqLGIl3IjdM+0J9GExb1e1Cw=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuT+E8+Mm2w36Sn533aLrptzLqAmOOTfNwW/8p5jO2bWrTu4
 r5eno5SFQYyDQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwESiNRn+l7yYumAFz+3NS1rr3XOunf
 JW37AkzVSJ570I04alF5qrdBgZTq74pWBndntS6WWPtKfp9znvMS9lsbj3bGaf1aF4pwlCvAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The PCIe iommu nodes use "dart" as node names. Replace it with the
the standard "iommu" node name as all other iommu nodes.

Fixes: 3c866bb79577 ("arm64: dts: apple: t8103: Add PCIe DARTs")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 6f5a2334e5b1..daf46f7b8a6e 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -670,7 +670,7 @@ nvme@27bcc0000 {
 			resets = <&ps_ans2>;
 		};
 
-		pcie0_dart_0: dart@681008000 {
+		pcie0_dart_0: iommu@681008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x81008000 0x0 0x4000>;
 			#iommu-cells = <1>;
@@ -679,7 +679,7 @@ pcie0_dart_0: dart@681008000 {
 			power-domains = <&ps_apcie_gp>;
 		};
 
-		pcie0_dart_1: dart@682008000 {
+		pcie0_dart_1: iommu@682008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x82008000 0x0 0x4000>;
 			#iommu-cells = <1>;
@@ -688,7 +688,7 @@ pcie0_dart_1: dart@682008000 {
 			power-domains = <&ps_apcie_gp>;
 		};
 
-		pcie0_dart_2: dart@683008000 {
+		pcie0_dart_2: iommu@683008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x83008000 0x0 0x4000>;
 			#iommu-cells = <1>;

-- 
2.38.1
