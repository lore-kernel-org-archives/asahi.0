Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748AB4681
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 13:51:16 +0000 (UTC)
Received: from robin.home.jannau.net (p54acc2ba.dip0.t-ipconnect.de [84.172.194.186])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 4A67826EFF3;
	Fri,  9 Sep 2022 15:51:08 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 10/10] arm64: dts: apple: t600x: Add MCA and its support
Date: Fri,  9 Sep 2022 15:51:03 +0200
Message-Id: <20220909135103.98179-11-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909135103.98179-1-j@jannau.net>
References: <20220909135103.98179-1-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MCA I2S transceiver and its supporting ADMAC and NCO nodes.

Signed-off-by: Janne Grunau <j@jannau.net>
---

 arch/arm64/boot/dts/apple/t600x-common.dtsi   |  9 +++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi     | 62 +++++++++++++++++++
 .../arm64/boot/dts/apple/t600x-j314-j316.dtsi |  4 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi     |  4 ++
 4 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
index e29b88e2c853..f5fac1926a25 100644
--- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
@@ -125,4 +125,13 @@ clkref: clock-ref {
 		clock-output-names = "clkref";
 	};
 
+	/*
+	 * This is a fabulated representation of the input clock
+	 * to NCO since we don't know the true clock tree.
+	 */
+	nco_clkref: clock-ref-nco {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "nco_ref";
+	};
 };
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 2d66eead8aee..639c90e108a7 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -7,6 +7,13 @@
  */
 
 
+	nco: clock-controller@28e03c000 {
+		compatible = "apple,t6000-nco", "apple,nco";
+		reg = <0x2 0x8e03c000 0x0 0x14000>;
+		clocks = <&nco_clkref>;
+		#clock-cells = <1>;
+	};
+
 	aic: interrupt-controller@28e100000 {
 		compatible = "apple,t6000-aic", "apple,aic2";
 		#interrupt-cells = <4>;
@@ -46,6 +53,24 @@ wdt: watchdog@2922b0000 {
 		interrupts = <AIC_IRQ 0 631 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	dart_sio_0: iommu@39b004000 {
+		compatible = "apple,t6000-dart";
+		reg = <0x3 0x9b004000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1130 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&ps_sio_cpu>;
+	};
+
+	dart_sio_1: iommu@39b008000 {
+		compatible = "apple,t6000-dart";
+		reg = <0x3 0x9b008000 0x0 0x8000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1130 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&ps_sio_cpu>;
+	};
+
 	i2c0: i2c@39b040000 {
 		compatible = "apple,t6000-i2c", "apple,i2c";
 		reg = <0x3 0x9b040000 0x0 0x4000>;
@@ -145,6 +170,43 @@ serial0: serial@39b200000 {
 		status = "disabled";
 	};
 
+	admac: dma-controller@39b400000 {
+		compatible = "apple,t6000-admac", "apple,admac";
+		reg = <0x3 0x9b400000 0x0 0x34000>;
+		#dma-cells = <1>;
+		dma-channels = <16>;
+		interrupts-extended = <0>,
+				      <&aic AIC_IRQ 0 1118 IRQ_TYPE_LEVEL_HIGH>,
+				      <0>,
+				      <0>;
+		iommus = <&dart_sio_0 2>, <&dart_sio_1 2>;
+		power-domains = <&ps_sio_adma>;
+	};
+
+	mca: mca@39b600000 {
+		compatible = "apple,t6000-mca", "apple,mca";
+		reg = <0x3 0x9b600000 0x0 0x10000>,
+		      <0x3 0x9b500000 0x0 0x20000>;
+		clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
+		dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+		       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+		       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+		       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
+		dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+			    "tx1a", "rx1a", "tx1b", "rx1b",
+			    "tx2a", "rx2a", "tx2b", "rx2b",
+			    "tx3a", "rx3a", "tx3b", "rx3b";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 1112 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 1113 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 1114 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 0 1115 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+				<&ps_mca2>, <&ps_mca3>;
+		resets = <&ps_audio_p>;
+		#sound-dai-cells = <1>;
+	};
+
 	pcie0_dart_0: dart@581008000 {
 		compatible = "apple,t6000-dart";
 		reg = <0x5 0x81008000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 8079200aeb12..34906d522f0a 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -76,6 +76,10 @@ hpm5: usb-pd@3a {
 	};
 };
 
+&nco_clkref {
+	clock-frequency = <1068000000>;
+};
+
 /* PCIe devices */
 &port00 {
 	/* WLAN */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index c5444cb34389..216f0a952dff 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -77,6 +77,10 @@ hpm3: usb-pd@3c {
 	};
 };
 
+&nco_clkref {
+	clock-frequency = <1068000000>;
+};
+
 /* PCIe devices */
 &port00 {
 	/* WLAN */
-- 
2.35.1

