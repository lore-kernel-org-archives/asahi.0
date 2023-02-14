Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E093C087
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 14:07:37 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 94F2B26F790;
	Tue, 14 Feb 2023 15:07:35 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 14 Feb 2023 15:07:22 +0100
Subject: [PATCH 1/2] arm64: dts: apple: t8103: Disable unused PCIe ports
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230214-apple_dts_pcie_disable_unused-v1-1-5ea0d3ddcde3@jannau.net>
References: <20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net>
In-Reply-To: <20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4864; i=j@jannau.net;
 h=from:subject:message-id; bh=I0e5oauNrijyIdi2VXTzOBmrHV4GlyY8HRt7c4tuU8A=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXU5dlCh7hn1JZtH1yEM+9y5yLXsTbfCx6Y/qdfYbIi
 spDQjP3dJSyMIhxMMiKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiIhCLDP0tRJsGm7cmapr8i
 FWYyTgtLPxp4yY97U7nVFcP58h94vBj+J/JMUTZ8x83Cezmh6vDXK3LXipx9M+4Jt9yaopfjktf
 GCgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The PCIe ports are unused (without devices) so disable them instead of
removing them.

Fixes: 7c77ab91b33d ("arm64: dts: apple: Add missing M1 (t8103) devices")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 15 ---------------
 arch/arm64/boot/dts/apple/t8103-j313.dts | 15 ---------------
 arch/arm64/boot/dts/apple/t8103-j456.dts | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 11 +++--------
 arch/arm64/boot/dts/apple/t8103.dtsi     |  4 ++++
 6 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index b52ddc409893..1c3e37f86d46 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -37,10 +37,12 @@ &wifi0 {
 
 &port01 {
 	bus-range = <2 2>;
+	status = "okay";
 };
 
 &port02 {
 	bus-range = <3 3>;
+	status = "okay";
 	ethernet0: ethernet@0,0 {
 		reg = <0x30000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
@@ -48,6 +50,14 @@ ethernet0: ethernet@0,0 {
 	};
 };
 
+&pcie0_dart_1 {
+	status = "okay";
+};
+
+&pcie0_dart_2 {
+	status = "okay";
+};
+
 &i2c2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 151074109a11..c363dfef8070 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -25,21 +25,6 @@ &wifi0 {
 	brcm,board-type = "apple,honshu";
 };
 
-/*
- * Remove unused PCIe ports and disable the associated DARTs.
- */
-
-&pcie0_dart_1 {
-	status = "disabled";
-};
-
-&pcie0_dart_2 {
-	status = "disabled";
-};
-
-/delete-node/ &port01;
-/delete-node/ &port02;
-
 &i2c2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index bc1f865aa790..08409be1cf35 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -24,18 +24,3 @@ &bluetooth0 {
 &wifi0 {
 	brcm,board-type = "apple,shikoku";
 };
-
-/*
- * Remove unused PCIe ports and disable the associated DARTs.
- */
-
-&pcie0_dart_1 {
-	status = "disabled";
-};
-
-&pcie0_dart_2 {
-	status = "disabled";
-};
-
-/delete-node/ &port01;
-/delete-node/ &port02;
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 2db425ceb30f..58c8e43789b4 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -55,13 +55,23 @@ hpm3: usb-pd@3c {
 
 &port01 {
 	bus-range = <2 2>;
+	status = "okay";
 };
 
 &port02 {
 	bus-range = <3 3>;
+	status = "okay";
 	ethernet0: ethernet@0,0 {
 		reg = <0x30000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 10 18 00 00 00];
 	};
 };
+
+&pcie0_dart_1 {
+	status = "okay";
+};
+
+&pcie0_dart_2 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 3821ff146c56..152f95fd49a2 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -37,6 +37,7 @@ &wifi0 {
 
 &port02 {
 	bus-range = <3 3>;
+	status = "okay";
 	ethernet0: ethernet@0,0 {
 		reg = <0x30000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
@@ -44,12 +45,6 @@ ethernet0: ethernet@0,0 {
 	};
 };
 
-/*
- * Remove unused PCIe port and disable the associated DART.
- */
-
-&pcie0_dart_1 {
-	status = "disabled";
+&pcie0_dart_2 {
+	status = "okay";
 };
-
-/delete-node/ &port01;
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9859219699f4..87a9c1ba6d0f 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -724,6 +724,7 @@ pcie0_dart_1: iommu@682008000 {
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&ps_apcie_gp>;
+			status = "disabled";
 		};
 
 		pcie0_dart_2: iommu@683008000 {
@@ -733,6 +734,7 @@ pcie0_dart_2: iommu@683008000 {
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&ps_apcie_gp>;
+			status = "disabled";
 		};
 
 		pcie0: pcie@690000000 {
@@ -807,6 +809,7 @@ port01: pci@1,0 {
 						<0 0 0 2 &port01 0 0 0 1>,
 						<0 0 0 3 &port01 0 0 0 2>,
 						<0 0 0 4 &port01 0 0 0 3>;
+				status = "disabled";
 			};
 
 			port02: pci@2,0 {
@@ -826,6 +829,7 @@ port02: pci@2,0 {
 						<0 0 0 2 &port02 0 0 0 1>,
 						<0 0 0 3 &port02 0 0 0 2>,
 						<0 0 0 4 &port02 0 0 0 3>;
+				status = "disabled";
 			};
 		};
 	};

-- 
2.39.1

