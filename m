Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD235CBD3
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 14:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967648; cv=none; b=gQ3deCAHFy3m+Oph4LGjdVkW1HEU8/bdYtYs4bCurBHYpIqPkRoIhwQmO61vPnA7t8MDZ9RlMMM49SNmGVfAmgryuull+ttVqqZk80sDI2Li9qoEmdAsDMbzaojNSbez2I4HTs0i77Jl8feFhTKS+nux/GMcSH0QT4EV0PRiuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967648; c=relaxed/simple;
	bh=5sAP2O0nEantlo5N0X+zOXwqVqOKaAbA1qOTtCpnRCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BbJ70VK2kWcCY+7Nv1aZGwn5W1upXSsNhOnP0S1bqtHxydNb+hBxYGwBOElIjhJmFuzgnxy3iG503Jeuch2GtSJeMYzQmLubv/KS0l5HdyQzkOE8lzHJWXS1uy92OtopwCWrycaMpEGaAfLNkMTPJNB1y0B92UXX5vo0fa2UgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Qoa+6I+k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ui8fE6HG; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Qoa+6I+k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ui8fE6HG"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3E785EC0122;
	Fri,  9 Jan 2026 09:07:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 09 Jan 2026 09:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767967641;
	 x=1768054041; bh=KNmaCI/nIJNZDotst6zL5fOOKuKgVRDXuDHciQkTYHE=; b=
	Qoa+6I+kIZNup22Ldm9LXuxROCC2j2ZHHxGehuO5sYR1rYfZix75gtiIfUwDXjBk
	A5RR+z1qqQsPGvpjM4CKzkcQAY1qwz/pAxlH00WgSZ8OkTXCAb4CSLSC18ZFvKca
	t+xLQZ30uNckxOpogc0h++dBm89A86gWBdftKrlondBU+hblmqVyIhaKGaI2X5cN
	cSnLiPOXlD7h+UPQxmPU7ftcu9c1B+L2c3tRx66nNn+MONFJnjOtXxM6d38rmxdv
	pJc20ukfTeWe8hfaPVpyaxMeJUwFwQ7EtGyKNVb0tXmCGU26NjfJ8vMs2WEEOz/l
	g+xEjw9UBCEj0D4XRya0vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767967641; x=
	1768054041; bh=KNmaCI/nIJNZDotst6zL5fOOKuKgVRDXuDHciQkTYHE=; b=u
	i8fE6HGjdDOoYtNZE/Rr1LGKiHsL9poar95ffCjFdoOv9Z8D2UIU2JP4nWJd0rJL
	hGheYzSEorUgzZJKYM4FNUpvCpUBUXepAsuvNVtfGcLf8d1DU+FFlFpd7bYL2Tyy
	5u/R8OhyFaesQ9UJT20/mGqTJKyIOQuSSUcUWaYoiGhVNH6wRd5fjRt8ytqDg2dW
	xOZxvkeA4eIG2LXhk+KipbSn6NJlnK6AZrH1z/I1jMFxk1EhBdoyOl0CRHRloVJV
	MaS3vYpig1FZeX66UcUF2+t7YEcOVk177aw2t42XXN8VhSrjFD3p/xd62VwThKZE
	THapvunM0ukjH0XR0O1VA==
X-ME-Sender: <xms:mQthaegsKYFJVsDsCA1UPA1GATciCD3rzfx3qBU7rHcYm9iVtZksWA>
    <xme:mQthaa358U92zenFJeC7GPL2iHKkPTxj60M2Vvt88GWjsRooseR0UBKoouCbT31AK
    u6U5pDA6SQJBKXmzpW2kR5HM4o65j8lLc_l7LrqL-7rUi0BBmcfdPU>
X-ME-Received: <xmr:mQthaRf2JWrC-iJ1qmcViOSiUr8Ft0aRtIX4WePHKG1GfCwhoWXCkholtoyQ_z9pWtKBaAl2E4Wd8nZDZtwzLYxGqBCvvXLGg5mUDw>
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
X-ME-Proxy: <xmx:mQthaQyvJE-LK1z7sdL73BbggGok1SxiB14FlybfVlNBpnsII_Qruw>
    <xmx:mQthaZzmfbWPzywHOUjLk96ad9imFYIq429z7SXg5ZIXyo-zmdKQNw>
    <xmx:mQthaRYqmm667nI7hMzie9-ltlFGZcdFA97-VCQhypfc_uf2ZoPtjg>
    <xmx:mQthaS29VEN6fRGANGlVqajQOqA6T6svRLy_7uhXBWxB9TgMXCbggQ>
    <xmx:mQthaTH9SDosWB801NHjj5PWCOm2XSu5luljW4Ddb9ZF40rrN65lZFnk>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 09:07:20 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 15:07:05 +0100
Subject: [PATCH 2/3] arm64: dts: apple: t8112: Add nodes for integrated USB
 Type-C ports
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-usb-c-atc-dwc3-v1-2-ce0e92c1a016@jannau.net>
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10233; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=HVy2+R6HXjapYu4fYsJD5sDEtHI1CFXmrBKtTY5Nwvc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE7kn9AbVSD2LnS2y5+NJL5NO8W+3KXbaxuSkt/Mf3L
 945S9Cwo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwESczzP8TzslL9f63v3/282S
 NqudYy593mlXvibw+fP0vjVLbPblz2f4n+Y+t/T6hG2SeR+j7DcWfbvb2tgd5ep2QoXjl2GwnZI
 sNwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

From: Hector Martin <marcan@marcan.st>

Add device nodes and connections to support USB 3.x on the SoC's
integrated USBi Type-C ports of M2-based devices.
Each Type-C port has an Apple Type-C PHY for USB 2.0, USB 3.x,
USB4/Thunderbolt, and DisplayPort, a Synopsys Designware USB 3.x
controller, two DART iommu instances and a CD321x USB PD controller.
The port labels use Apple's established naming scheme for the ports.

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8112-j415.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8112-j473.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8112-j493.dts  |  12 +++
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi | 134 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 105 +++++++++++++++++++++++
 6 files changed, 287 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf89ce73e3486bce504f1f5f8003f3..21e81a8899d8d7ff5461db085b53feccc7c53f64 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -60,6 +60,18 @@ bluetooth0: bluetooth@0,1 {
 	};
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
 &i2c0 {
 	/* MagSafe port */
 	hpm5: usb-pd@3a {
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index b54e218e5384ca89155e4350d6680a28a531f408..b4f72fbafaf104573c86ceff9283c05d43aee080 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -60,6 +60,18 @@ bluetooth0: bluetooth@0,1 {
 	};
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
 &i2c0 {
 	/* MagSafe port */
 	hpm5: usb-pd@3a {
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..81994f0a7df962d982b675deb4c35b25fa3c29f6 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,15 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
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
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a8fe7966f5541f24f03a379143cfb..f8e442152ff23f21a46916ac111e5f6bbc87cf83 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -108,6 +108,18 @@ bluetooth0: bluetooth@0,1 {
 	};
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
 &i2c4 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 6da35496a4c88dbaba125ebbe8c5a4a428c647c3..562e7a25a1e8843f516c3d7327254049332cd08d 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -11,6 +11,8 @@
 
 / {
 	aliases {
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
 		serial0 = &serial0;
 		serial2 = &serial2;
 	};
@@ -53,6 +55,29 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
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
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
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
 
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af1f7760088aa552589494d67347fb..2d645cdec4a75fcfe1897d42f9af460e2752f2eb 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/spmi/spmi.h>
 
 / {
@@ -1010,6 +1011,110 @@ nvme@27bcc0000 {
 			resets = <&ps_ans>;
 		};
 
+		dwc3_0: usb@382280000 {
+			compatible = "apple,t8112-dwc3", "apple,t8103-dwc3";
+			reg = <0x3 0x82280000 0x0 0xcd00>, <0x3 0x8228cd00 0x0 0x3200>;
+			reg-names = "dwc3-core", "dwc3-apple";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1031 IRQ_TYPE_LEVEL_HIGH>;
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
+			compatible = "apple,t8110-dart";
+			reg = <0x3 0x82f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		dwc3_0_dart_1: iommu@382f80000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x3 0x82f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1035 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc0_usb>;
+		};
+
+		atcphy0: phy@383000000 {
+			compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
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
+			compatible = "apple,t8112-dwc3", "apple,t8103-dwc3";
+			reg = <0x5 0x02280000 0x0 0xcd00>, <0x5 0x0228cd00 0x0 0x3200>;
+			reg-names = "dwc3-core", "dwc3-apple";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1112 IRQ_TYPE_LEVEL_HIGH>;
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
+			compatible = "apple,t8110-dart";
+			reg = <0x5 0x02f00000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		dwc3_1_dart_1: iommu@502f80000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x5 0x02f80000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1116 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_atc1_usb>;
+		};
+
+		atcphy1: phy@503000000 {
+			compatible = "apple,t8112-atcphy", "apple,t8103-atcphy";
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
 		pcie0_dart: iommu@681008000 {
 			compatible = "apple,t8110-dart";
 			reg = <0x6 0x81008000 0x0 0x4000>;

-- 
2.52.0

