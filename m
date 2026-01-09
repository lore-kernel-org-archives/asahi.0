Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A335A952
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967642; cv=none; b=TLiAwutjoO7vsa6RXWs61Gr7mDMpOflZ9GOlW1s/HaLLHaBSL2YOtcR4PcZ9/mMRRU1nNPMQUwpi7bT/U7kiBL+Ps4UYXP/6OCVm6pgRzAuxQN+gJCDuefxvuYPG0Ey4p2tuf9tb9Hd2X/oCpAFBILo1TecPVkwd5mjdDFUn3to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967642; c=relaxed/simple;
	bh=8d465/+q+z5EchP2JvDpBdreXBOIINKCPLZ+m2kvg0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzHKMPrXqZmn+ZXp23sFpoNde92oinlwPVk8gXfA8baTk3y+UglP80V7dZYSbs1l+QdTAcfyUJvjxWM5THwf43dY5jp4GAPH6hj/S+Oa7yc3uTds13dC5T3yrKExfXQkBa2Kqlfku8pzxRY2C3QRPW329qhfEQpVYkOV64E8WVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=HH86rFiS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=evq5Rojp; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="HH86rFiS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="evq5Rojp"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7B0781400126;
	Fri,  9 Jan 2026 09:07:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 09 Jan 2026 09:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767967639;
	 x=1768054039; bh=osVo4rrNRkYVCXoozGTcNKAbrHVQPBhjbYl02EAsadU=; b=
	HH86rFiSLF3cKWUaJ5Gl2x+jhZhSQ3kopTfeN5/koqrdPjqyVUosHeWtUZUNS5nS
	Gex3vgafZXL5Chdwc+Sw/Knm4iQWzjAAj/zch7lELSoeSYvt2RJTDm0CJvn1hvHI
	lBEGaspgWIT69e71ttR0uZFUC93fVrUILXiRqzvwWGJyOaBYbWNukRLjbq3H8ZIh
	1YopI1TzMEbz/XLt874R9OF1F93Hkple+PYvEyU47xECAxJGiL3c2o1HodkClxTb
	gBpTEt0ZPK7mVkRyUcOAUiH6xfCkx5hZrIf1sPLXmgVXmCTeUDIax61iOgZKj4Vd
	P8kpW0pKtcXXUKPb1XlDVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767967639; x=
	1768054039; bh=osVo4rrNRkYVCXoozGTcNKAbrHVQPBhjbYl02EAsadU=; b=e
	vq5RojpeNAsD6pGWUYeruCK94Rd1/DLhrsl0Qk/olRnqs0Pkm2UpdI5TxlklB8ov
	0VxrgTDlIqiwZhwmgYZlWuc7GyIKCAAnc8AiBEUfIVsemdBOjUt/w/RxEQdyV0s6
	VqLaqshVrHSF1ZptvhXR1VBmJJF2t9Mwk8wSgGbb/wDoT/Wx9ajyGXgHtUtoa6es
	hsGCKzoe4A47ZDqafG075JqRajoVQWLodCPlRHvJ3ed3R9ttA3hcMG2qJOsX4mEI
	iiO8A9fvukraGJH79E0Xl+ZIO4IEj22nS7gn2MpNqNEreMXcObb/TFRG18bZ4y1J
	d8sngVFsanD5I6zqq7j1w==
X-ME-Sender: <xms:lwthafoYnuB2N4TylWtE7TEeAJaByBD1SCMQzoWShu9QvGoCLbAumA>
    <xme:lwthaVepaj2klwVd_eWw5ecPrOFi08U0wifFXXLAs_Y6ZvO9s7_WD5q9PF8yYf9AU
    OmIpOGSY_lOb0YKKHO4Gh9Ds4ZQwSmlhbdmJ1UXqaB69vLNyXRwR3Y>
X-ME-Received: <xmr:lwthaXl9E1HaAlsldxjG0175JaiCem51k_vaOwsRsPSA3Gj6gdqbjx-uCU_C04MU_NcpMTJjzMxB_6lcrWpI2O-Z2Lv0k01olihuEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeltdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopehkrhiikhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphht
    thhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrshgrhhhisehlihhsthhsrd
    hlihhnuhigrdguvghv
X-ME-Proxy: <xmx:lwthacZfQdRhR_dcB71x5x6gRftUTXEjYbpICfNauSGsZgb65OBCeg>
    <xmx:lwthac5B9GDaKF3JWTcN3fWurYzyd4FmzpdKYfSSlVlxUK5p1hdmqA>
    <xmx:lwthaWDqBTQeOm7ujk2jKrArcrMxmpQGrT75iqNIGhuTCIrzeOreZQ>
    <xmx:lwthaa8YMJFQzyXElzPYjrisMHTT2ID5rClc5Z1CxSZYK_j3cWF2sw>
    <xmx:lwthaQvpokmWduXcaUdJHiyL8GnCGDgAa5nvk-aM21PmMTDKwm9533Bc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 09:07:18 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 15:07:04 +0100
Subject: [PATCH 1/3] arm64: dts: apple: t8103: Add nodes for integrated USB
 Type-C ports
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-usb-c-atc-dwc3-v1-1-ce0e92c1a016@jannau.net>
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11353; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Nq2mv8z2xinvTQJisOByyoINMdZyYEBNgxGHRRq2uTI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE7knJwXskl6Vv27j82+fPX9w4n7e06y7+8zipQ2ra/
 gTei1KcHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbiX8rwP/Sj0S1ZpRVL9hs5
 1E2aJqSuYPLm7MxbYvZbOE2alueVzGBkuPCmRuyDbfH79vPOrhaRE09fOHdRm8fssOiUVzMK9mw
 7zwkA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

From: Hector Martin <marcan@marcan.st>

Add device nodes and connections to support USB 3.x on the SoC's
integrated USB-C ports of M1-based devices.
Each Type-C port has an Apple Type-C PHY for USB 2.0, USB 3.x,
USB4/Thunderbolt, and DisplayPort, a Synopsys Designware USB 3.x
controller, two DART iommu instances and a CD321x USB PD controller.
The iMac variant with four USB-C ports has two SoC integrated USB-C
ports and two additional USB-C ports driven by an AsMedia PCIe USB
controller. The latter ports are not covered by this change.
The port labels use Apple's established naming scheme for the ports.

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j293.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j456.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-j457.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 134 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 105 +++++++++++++++++++++++
 7 files changed, 299 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..968fe22163d4431fe5e7049854687e61e0ec50f1 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -29,6 +29,18 @@ &wifi0 {
 	brcm,board-type = "apple,atlantisb";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-left";
+};
+
+&typec1 {
+	label = "USB-C Back-right";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..678f89c3d47fbf2d0705b46bb8feba3fa018ca7a 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -46,6 +46,18 @@ &wifi0 {
 	brcm,board-type = "apple,honshu";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Left-back";
+};
+
+&typec1 {
+	label = "USB-C Left-front";
+};
+
 &i2c2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca685708aff136af92a1b316f3c3dd..bce9b911009e2b0caa9d8b2222cd1e8c3215f3b9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,15 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Left-back";
+};
+
+&typec1 {
+	label = "USB-C Left-front";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..9983e11cacdf19d0a92ede108ceac21b7a02d5da 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -47,6 +47,18 @@ hpm3: usb-pd@3c {
 	};
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-right";
+};
+
+&typec1 {
+	label = "USB-C Back-right-middle";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 7089ccf3ce55661f3f83810496daed40c8199189..6703f4a3d3db4c51a4897b77948eba13489b1e43 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -37,6 +37,18 @@ &wifi0 {
 	brcm,board-type = "apple,santorini";
 };
 
+/*
+ * Provide labels for the USB type C ports.
+ */
+
+&typec0 {
+	label = "USB-C Back-right";
+};
+
+&typec1 {
+	label = "USB-C Back-left";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 0c8206156bfefda8a32c869787b2e0c8e67a9d17..686fb1dd215d2d11e736826a254e17b6eab27c3e 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,6 +15,8 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
 	};
 
 	chosen {
@@ -53,6 +55,29 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <106 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec0: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec0_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_0_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec0_connector_ss: endpoint {
+						remote-endpoint = <&atcphy0_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	hpm1: usb-pd@3f {
@@ -61,6 +86,115 @@ hpm1: usb-pd@3f {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <106 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec1: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec1_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_1_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec1_connector_ss: endpoint {
+						remote-endpoint = <&atcphy1_typec_lanes>;
+					};
+				};
+			};
+		};
+	};
+};
+
+/* USB controllers */
+&dwc3_0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_0_hs: endpoint {
+				remote-endpoint = <&typec0_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_0_ss: endpoint {
+				remote-endpoint = <&atcphy0_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_1_hs: endpoint {
+				remote-endpoint = <&typec1_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_1_ss: endpoint {
+				remote-endpoint = <&atcphy1_usb3>;
+			};
+		};
+	};
+};
+
+/* Type-C PHYs */
+&atcphy0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy0_typec_lanes: endpoint {
+				remote-endpoint = <&typec0_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy0_usb3: endpoint {
+				remote-endpoint = <&dwc3_0_ss>;
+			};
+		};
+	};
+};
+
+&atcphy1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy1_typec_lanes: endpoint {
+				remote-endpoint = <&typec1_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy1_usb3: endpoint {
+				remote-endpoint = <&dwc3_1_ss>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..c48b10ac65efcc9c5211c3cdb0a5be63bf60a859 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	compatible = "apple,t8103", "apple,arm-platform";
@@ -1007,6 +1008,110 @@ nvme@27bcc0000 {
 			resets = <&ps_ans2>;
 		};
 
+		dwc3_0: usb@382280000 {
+			compatible = "apple,t8103-dwc3";
+			reg = <0x3 0x82280000 0x0 0xcd00>, <0x3 0x8228cd00 0x0 0x3200>;
+			reg-names = "dwc3-core", "dwc3-apple";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			usb-role-switch;
+			role-switch-default-mode = "host";
+			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
+			power-domains = <&ps_atc0_usb>;
+			resets = <&atcphy0>;
+			phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		dwc3_0_dart_0: iommu@382f00000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x3 0x82f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		dwc3_0_dart_1: iommu@382f80000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x3 0x82f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		atcphy0: phy@383000000 {
+			compatible = "apple,t8103-atcphy";
+			reg = <0x3 0x83000000 0x0 0x4c000>,
+				<0x3 0x83050000 0x0 0x8000>,
+				<0x3 0x80000000 0x0 0x4000>,
+				<0x3 0x82a90000 0x0 0x4000>,
+				<0x3 0x82a84000 0x0 0x4000>;
+			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+				"pipehandler";
+
+			#phy-cells = <1>;
+			#reset-cells = <0>;
+
+			orientation-switch;
+			mode-switch;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		dwc3_1: usb@502280000 {
+			compatible = "apple,t8103-dwc3";
+			reg = <0x5 0x02280000 0x0 0xcd00>, <0x5 0x0228cd00 0x0 0x3200>;
+			reg-names = "dwc3-core", "dwc3-apple";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			usb-role-switch;
+			role-switch-default-mode = "host";
+			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
+			power-domains = <&ps_atc1_usb>;
+			resets = <&atcphy1>;
+			phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+
+		dwc3_1_dart_0: iommu@502f00000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x5 0x02f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		dwc3_1_dart_1: iommu@502f80000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x5 0x02f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		atcphy1: phy@503000000 {
+			compatible = "apple,t8103-atcphy";
+			reg = <0x5 0x03000000 0x0 0x4c000>,
+				<0x5 0x03050000 0x0 0x8000>,
+				<0x5 0x0 0x0 0x4000>,
+				<0x5 0x02a90000 0x0 0x4000>,
+				<0x5 0x02a84000 0x0 0x4000>;
+			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+				"pipehandler";
+
+			#phy-cells = <1>;
+			#reset-cells = <0>;
+
+			orientation-switch;
+			mode-switch;
+			power-domains = <&ps_atc1_usb>;
+		};
+
 		pcie0_dart_0: iommu@681008000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x6 0x81008000 0x0 0x4000>;

-- 
2.52.0

