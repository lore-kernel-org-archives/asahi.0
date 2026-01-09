Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB4333C191
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967649; cv=none; b=qkuTcwcMa9tyXsThKax04sax4XEWtwNbTrpP7wlATmGSJimMrK8Xp8DkQdrpG1ZmOjD+LfljU+uvIILEwHp9qu+Lki+Z/p7akLfsivmKUr3HFm93nZkM9vV+2dMnXaJnebD4IDSVXkhW/AWOJjC4lsF4QZcXO85ppqMXR49KmtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967649; c=relaxed/simple;
	bh=pY00bmpKQG1UN2/H+9l1pXuuxPTjh6Xqwip9IICVXi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHDqHo4+x/1b47RX/f/0+TqClgD9ygZVpOWcUHTUsdrjLLtQ8idRsbwP5GI3HiwTZPMrW292B+vAVcpD9Wy8KKbySauFninfl1LcMQS0kDalMTrrNDVvtjZ73wbRfis/SGndi6N2KXUlyqryFLZx4qPvNQLU7hA7IxaANPRkpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=IwksptNY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UQT/GNIF; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="IwksptNY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UQT/GNIF"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0FA89EC018E;
	Fri,  9 Jan 2026 09:07:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 09 Jan 2026 09:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767967643;
	 x=1768054043; bh=Wx5veIZDS8HTakZsnfN1par0BLzsxH0YHpeFGnZIlSk=; b=
	IwksptNYKCUXtSQPdlcaCVUzp+HlD7n6iUJ/W09gLDEhzrRQZCFL/DxtUlrDPWbb
	7mJ6crQm9Rgg9+OhkRKzivupTFTgNdexHcxXmJphwb5egnmzub1eWL7VpmsaKK2J
	ZTdfKpUhktys06e5v9dOXyNtGNbv7oubMd96T33khEZwwhnfF+iqvNJ10FixZp5F
	jtl7SMvGYWrq88X984O0lrNw8XUO+iwLBIH/OAO2R7nvZ46saSK+/FfngssGCFJt
	u//RaSDtBAZgpj7a4NvL5FyvBVYAVS/y68wi83RkYMCwc9nMhWAdYJaIggBpzOhj
	urg2MEMNVZyBznnA1cc3nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767967643; x=
	1768054043; bh=Wx5veIZDS8HTakZsnfN1par0BLzsxH0YHpeFGnZIlSk=; b=U
	QT/GNIFVlQcoE1KYXxfCMSjKTshjste7nNKNapwrayJCj5jHEVHu50tgu3xNqcSO
	iCK89GVKRYQpidwYmaJh82d4Si0i5opBu7Mn7mFKEVqB9rdq0xKQVqv/hq3CEQJS
	UKUVbJiXuNdMCcvDKJ8iocBf7F088A/H0Lyh3a6lvsPqB+mD4sogUg/q5a/Y2Ymi
	HWycHOM1dtwVoJn2Zv5POscWxIpWPM0iPGsI2INWXzeBwEPCZs4XDGdeckwYM1uK
	qxbNz1ArCly0cAxy5WEcxLh99bnRZ74hvMDGDsr72e5d3qpl7mdoE4T+bEHSYz0I
	Gw+H4ckzIZcdM3npvQAsg==
X-ME-Sender: <xms:mgthaS0wJNvDa8vG9EWK2QUpvCDNDbI9lZ33dOt2noXzrNpTac5-nQ>
    <xme:mgthabdvl5MZgMSe2_WjKUM-Xj7huDyfk2o7So-nUB0jhc0ipoC01N_E-LonwOeFp
    FwqiHWnjP2cDUF3bzltPnBB6B4D2yPmhdw4xj_FaC1CfUYzNgMUmJU>
X-ME-Received: <xmr:mgthaXIcfRGdd6kCDCCPNvlTaoKChDvNah1BDZu0Krj8mkUgveqGEfTZm47dGH-7lPrdAqPA3fsgqINpEqH6LkZd-W1GQsM-vKeGPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeltddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopehkrhiikhdoughtsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphht
    thhopehrqhhouhessggvrhhkvghlvgihrdgvughupdhrtghpthhtohepjhesjhgrnhhnrg
    hurdhnvght
X-ME-Proxy: <xmx:mgthaRooWVTLG74U9hLeqTnWLuX1JJv71SzzA2uKfUh5a8yyaxdQvg>
    <xmx:mgthadt53yDB2NjMafrPfEu3csrTpuay9N4Amxl__oefYucteBMgqw>
    <xmx:mgthaTLwLxQf7wu9clLuVBJAwFMBrRZJ6_0_j18ix32WzL-oDb6yKA>
    <xmx:mgthaUoUPO7M4VnWXYRsr34v1Es3k-jnHYAlaXOlr_GSgbz1qizHAg>
    <xmx:mwthaflx2ehELWxPJF67aG0-bGn9gXAvSMIDcZwbZePDNeZqmbw7W0tt>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 09:07:22 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 15:07:06 +0100
Subject: [PATCH 3/3] arm64: dts: apple: t60xx: Add nodes for integrated USB
 Type-C ports
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-usb-c-atc-dwc3-v1-3-ce0e92c1a016@jannau.net>
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, R <rqou@berkeley.edu>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=45947; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=pY00bmpKQG1UN2/H+9l1pXuuxPTjh6Xqwip9IICVXi8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE7kkHgpl2zvd+eVK1zjT+ZMgiO+mD7o9VTBo1OuxWh
 z5+krGxo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwETM/zH89977pq38uM1friyR
 tNL813v+PubLP8creLk8JEdW1qT6I8P/sK5K/Ux9kQb3Fm4Wxf3Bi8x2xxn+uP9/3tkMlTeKc7+
 yAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Add device nodes and connections to support USB 3.x on the SoC's
integrated Type-C ports of M1 and M2 Pro, Max and Ultra based devices.
Each Type-C port has an Apple Type-C PHY for USB 2.0, USB 3.x,
USB4/Thunderbolt, and DisplayPort, a Synopsys Designware USB 3.x
controller, two DART iommu instances and a CD321x USB PD controller.
M1 and M2 Max based Mac Studio device have two additional USB Type-C
ports on the front which are driven by an AsMedia PCIe USB controller
and integrated USB hub. These ports are not covered by this change.
The port labels use Apple's established naming scheme for the ports.

Co-developed-by: R <rqou@berkeley.edu>
Signed-off-by: R <rqou@berkeley.edu>
Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6001.dtsi           |   1 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 150 +++++++++
 arch/arm64/boot/dts/apple/t6002.dtsi           |   1 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi      | 212 +++++++++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 234 ++++++++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 270 ++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 415 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  31 ++
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 133 ++++++++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi      | 212 +++++++++++++
 10 files changed, 1659 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index ffbe823b71bc8d9c0975524aa04efa9bf520a89e..6dcb71a1d65a8da82a512653a34ce6af3df8aee0 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/spmi/spmi.h>
 
 #include "multi-die-cpp.h"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 2b7f80119618ad1b497b67597c55968585bd92a9..a2a24d028cbbf5f1703565e8bcdfd53826226a01 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -15,6 +15,10 @@
 / {
 	compatible = "apple,j375d", "apple,t6002", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Ultra, 2022)";
+	aliases {
+		atcphy4 = &atcphy0_die1;
+		atcphy5 = &atcphy1_die1;
+	};
 };
 
 /* USB Type C */
@@ -26,6 +30,30 @@ hpm4: usb-pd@39 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec4: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Front Right";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec4_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_4_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec4_connector_ss: endpoint {
+						remote-endpoint = <&atcphy4_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	/* front-left */
@@ -35,6 +63,30 @@ hpm5: usb-pd@3a {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec5: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Front Left";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec5_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_5_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec5_connector_ss: endpoint {
+						remote-endpoint = <&atcphy5_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 };
 
@@ -46,6 +98,104 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+/* USB controllers on die 1 */
+&dwc3_0_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_4_hs: endpoint {
+				remote-endpoint = <&typec4_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_4_ss: endpoint {
+				remote-endpoint = <&atcphy4_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_1_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_5_hs: endpoint {
+				remote-endpoint = <&typec5_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_5_ss: endpoint {
+				remote-endpoint = <&atcphy5_usb3>;
+			};
+		};
+	};
+};
+
+/* Type-C PHYs */
+&atcphy0_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy4_typec_lanes: endpoint {
+				remote-endpoint = <&typec4_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy4_usb3: endpoint {
+				remote-endpoint = <&dwc3_4_ss>;
+			};
+		};
+	};
+};
+
+&atcphy1_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy5_typec_lanes: endpoint {
+				remote-endpoint = <&typec5_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy5_usb3: endpoint {
+				remote-endpoint = <&dwc3_5_ss>;
+			};
+		};
+	};
+};
+
+/* delete unused USB nodes on die 1 */
+
+/delete-node/ &dwc3_2_dart_0_die1;
+/delete-node/ &dwc3_2_dart_1_die1;
+/delete-node/ &dwc3_2_die1;
+/delete-node/ &atcphy2_die1;
+
+/delete-node/ &dwc3_3_dart_0_die1;
+/delete-node/ &dwc3_3_dart_1_die1;
+/delete-node/ &dwc3_3_die1;
+/delete-node/ &atcphy3_die1;
+
 /* delete unused always-on power-domains on die 1 */
 
 /delete-node/ &ps_atc2_usb_aon_die1;
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index 8fb648836b538bbd9efdccd6cec5d08d868a0d39..a532e5401c4ec430d8ff649a92459c80e9b6bb2b 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/spmi/spmi.h>
 
 #include "multi-die-cpp.h"
diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index a32ff0c9d7b0c2ec720e9d4cf8e769da6431fbba..9676d5127039b76bdd53d5f8fa634118929af9db 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -119,3 +119,215 @@ DIE_NODE(pinctrl_ap): pinctrl@39b028000 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
+	DIE_NODE(dwc3_0): usb@702280000 {
+		compatible = "apple,t6000-dwc3", "apple,t8103-dwc3";
+		reg = <0x7 0x02280000 0x0 0xcd00>, <0x7 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1190 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_0_dart_0) 0>,
+			<&DIE_NODE(dwc3_0_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+		resets = <&DIE_NODE(atcphy0)>;
+		phys = <&DIE_NODE(atcphy0) PHY_TYPE_USB2>, <&DIE_NODE(atcphy0) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_0_dart_0): iommu@702f00000 {
+		compatible = "apple,t6000-dart";
+		reg = <0x7 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1194 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_0_dart_1): iommu@702f80000 {
+		compatible = "apple,t6000-dart";
+		reg = <0x7 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1194 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy0): phy@703000000 {
+		compatible = "apple,t6000-atcphy", "apple,t8103-atcphy";
+		reg = <0x7 0x03000000 0x0 0x4c000>,
+			<0x7 0x03050000 0x0 0x8000>,
+			<0x7 0x00000000 0x0 0x4000>,
+			<0x7 0x02a90000 0x0 0x4000>,
+			<0x7 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+	};
+
+	DIE_NODE(dwc3_1): usb@b02280000 {
+		compatible = "apple,t6000-dwc3", "apple,t8103-dwc3";
+		reg = <0xb 0x02280000 0x0 0xcd00>, <0xb 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1207 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_1_dart_0) 0>,
+			<&DIE_NODE(dwc3_1_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+		resets = <&DIE_NODE(atcphy1)>;
+		phys = <&DIE_NODE(atcphy1) PHY_TYPE_USB2>, <&DIE_NODE(atcphy1) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_1_dart_0): iommu@b02f00000 {
+		compatible = "apple,t6000-dart";
+		reg = <0xb 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1211 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_1_dart_1): iommu@b02f80000 {
+		compatible = "apple,t6000-dart";
+		reg = <0xb 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1211 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy1): phy@b03000000 {
+		compatible = "apple,t6000-atcphy", "apple,t8103-atcphy";
+		reg = <0xb 0x03000000 0x0 0x4c000>,
+			<0xb 0x03050000 0x0 0x8000>,
+			<0xb 0x00000000 0x0 0x4000>,
+			<0xb 0x02a90000 0x0 0x4000>,
+			<0xb 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+	};
+
+	DIE_NODE(dwc3_2): usb@f02280000 {
+		compatible = "apple,t6000-dwc3", "apple,t8103-dwc3";
+		reg = <0xf 0x02280000 0x0 0xcd00>, <0xf 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1224 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_2_dart_0) 0>,
+			<&DIE_NODE(dwc3_2_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+		resets = <&DIE_NODE(atcphy2)>;
+		phys = <&DIE_NODE(atcphy2) PHY_TYPE_USB2>, <&DIE_NODE(atcphy2) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_2_dart_0): iommu@f02f00000 {
+		compatible = "apple,t6000-dart";
+		reg = <0xf 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1228 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_2_dart_1): iommu@f02f80000 {
+		compatible = "apple,t6000-dart";
+		reg = <0xf 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1228 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy2): phy@f03000000 {
+		compatible = "apple,t6000-atcphy", "apple,t8103-atcphy";
+		reg = <0xf 0x03000000 0x0 0x4c000>,
+			<0xf 0x03050000 0x0 0x8000>,
+			<0xf 0x00000000 0x0 0x4000>,
+			<0xf 0x02a90000 0x0 0x4000>,
+			<0xf 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+	};
+
+	DIE_NODE(dwc3_3): usb@1302280000 {
+		compatible = "apple,t6000-dwc3", "apple,t8103-dwc3";
+		reg = <0x13 0x02280000 0x0 0xcd00>, <0x13 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1241 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_3_dart_0) 0>,
+			<&DIE_NODE(dwc3_3_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+		resets = <&DIE_NODE(atcphy3)>;
+		phys = <&DIE_NODE(atcphy3) PHY_TYPE_USB2>, <&DIE_NODE(atcphy3) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_3_dart_0): iommu@1302f00000 {
+		compatible = "apple,t6000-dart";
+		reg = <0x13 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1245 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_3_dart_1): iommu@1302f80000 {
+		compatible = "apple,t6000-dart";
+		reg = <0x13 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1245 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy3): phy@1303000000 {
+		compatible = "apple,t6000-atcphy", "apple,t8103-atcphy";
+		reg = <0x13 0x03000000 0x0 0x4c000>,
+			<0x13 0x03050000 0x0 0x8000>,
+			<0x13 0x00000000 0x0 0x4000>,
+			<0x13 0x02a90000 0x0 0x4000>,
+			<0x13 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+	};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index c0aac59a6fae4f6f4b387483665349a8e2521c1e..6b3b327230818445b8f64ecfa5b16145c6cb08d4 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -13,6 +13,10 @@
 
 / {
 	aliases {
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
+		atcphy2 = &atcphy2;
+		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
@@ -63,6 +67,30 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec0: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Left Rear";
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
@@ -71,6 +99,30 @@ hpm1: usb-pd@3f {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec1: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Left Front";
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
 	};
 
 	hpm2: usb-pd@3b {
@@ -79,6 +131,30 @@ hpm2: usb-pd@3b {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec2: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Right";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec2_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_2_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec2_connector_ss: endpoint {
+						remote-endpoint = <&atcphy2_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	/* MagSafe port */
@@ -130,4 +206,162 @@ &fpwm0 {
 	status = "okay";
 };
 
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
+&dwc3_2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_2_hs: endpoint {
+				remote-endpoint = <&typec2_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_2_ss: endpoint {
+				remote-endpoint = <&atcphy2_usb3>;
+			};
+		};
+	};
+};
+
+/*
+ * ps_atc3_usb_aon power-domain is always-on to keep dwc3 working over suspend.
+ * atc3 is used exclusively for the DP-to-HDMI so do not keep this always on.
+ */
+&ps_atc3_usb_aon {
+	/delete-property/ apple,always-on;
+};
+
+/* ATC3 is used for DisplayPort -> HDMI only */
+&dwc3_3_dart_0 {
+	status = "disabled";
+};
+
+&dwc3_3_dart_1 {
+	status = "disabled";
+};
+
+&dwc3_3 {
+	status = "disabled";
+};
+
+/* Delete unused dwc3_3 to prevent dt_disable_missing_devs() from disabling
+ * atcphy3 via phandle references from a disablecd device.
+ */
+/delete-node/ &dwc3_3;
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
+	};
+};
+
+&atcphy2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy2_typec_lanes: endpoint {
+				remote-endpoint = <&typec2_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy2_usb3: endpoint {
+				remote-endpoint = <&dwc3_2_ss>;
+			};
+		};
+	};
+};
+
+&atcphy3 {
+	status = "disabled";
+};
+
 #include "spi1-nvram.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index c0fb93ae72f4d4fcb254a36dc408d55ab1bca0e9..a4bb5cbb67a0678a801059281160f6d6d0f1abe8 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -11,6 +11,10 @@
 
 / {
 	aliases {
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
+		atcphy2 = &atcphy2;
+		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
 		serial0 = &serial0;
@@ -50,6 +54,30 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec0: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back Left";
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
@@ -58,6 +86,30 @@ hpm1: usb-pd@3f {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec1: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back Left Middle";
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
 	};
 
 	hpm2: usb-pd@3b {
@@ -66,6 +118,30 @@ hpm2: usb-pd@3b {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec2: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back Right Middle";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec2_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_2_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec2_connector_ss: endpoint {
+						remote-endpoint = <&atcphy2_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	hpm3: usb-pd@3c {
@@ -74,6 +150,200 @@ hpm3: usb-pd@3c {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec3: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back Right";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec3_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_3_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec3_connector_ss: endpoint {
+						remote-endpoint = <&atcphy3_typec_lanes>;
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
+&dwc3_2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_2_hs: endpoint {
+				remote-endpoint = <&typec2_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_2_ss: endpoint {
+				remote-endpoint = <&atcphy2_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_3 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_3_hs: endpoint {
+				remote-endpoint = <&typec3_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_3_ss: endpoint {
+				remote-endpoint = <&atcphy3_usb3>;
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
+	};
+};
+
+&atcphy2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy2_typec_lanes: endpoint {
+				remote-endpoint = <&typec2_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy2_usb3: endpoint {
+				remote-endpoint = <&dwc3_2_ss>;
+			};
+		};
+	};
+};
+
+&atcphy3 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy3_typec_lanes: endpoint {
+				remote-endpoint = <&typec3_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy3_usb3: endpoint {
+				remote-endpoint = <&dwc3_3_ss>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apple/t6022-j180d.dts b/arch/arm64/boot/dts/apple/t6022-j180d.dts
index dca6bd167c225aa23e78e1c644bf6c97f42d46b5..741199d456fba48d373dd6ee1421caaded35fe5c 100644
--- a/arch/arm64/boot/dts/apple/t6022-j180d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j180d.dts
@@ -16,6 +16,14 @@ / {
 	compatible = "apple,j180d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Pro (M2 Ultra, 2023)";
 	aliases {
+		atcphy0 = &atcphy0;
+		atcphy1 = &atcphy1;
+		atcphy2 = &atcphy2;
+		atcphy3 = &atcphy3;
+		atcphy4 = &atcphy0_die1;
+		atcphy5 = &atcphy1_die1;
+		atcphy6 = &atcphy2_die1;
+		atcphy7 = &atcphy3_die1;
 		nvram = &nvram;
 		serial0 = &serial0;
 	};
@@ -54,6 +62,30 @@ hpm2: usb-pd@3b {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec2: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back 1";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec2_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_2_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec2_connector_ss: endpoint {
+						remote-endpoint = <&atcphy2_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	hpm3: usb-pd@3c {
@@ -62,6 +94,30 @@ hpm3: usb-pd@3c {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec3: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back 2";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec3_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_3_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec3_connector_ss: endpoint {
+						remote-endpoint = <&atcphy3_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	/* hpm4 and hpm5 included from t6022-jxxxd.dtsi */
@@ -72,6 +128,30 @@ hpm6: usb-pd@3d {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec6: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back 5";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec6_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_6_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec6_connector_ss: endpoint {
+						remote-endpoint = <&atcphy6_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	hpm7: usb-pd@3e {
@@ -80,9 +160,41 @@ hpm7: usb-pd@3e {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec7: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Back 6";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec7_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_7_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec7_connector_ss: endpoint {
+						remote-endpoint = <&atcphy7_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 };
 
+&typec4 {
+	label = "USB-C Back 3";
+};
+
+&typec5 {
+	label = "USB-C Back 4";
+};
+
 /* USB Type C Front */
 &i2c3 {
 	status = "okay";
@@ -93,6 +205,30 @@ hpm0: usb-pd@38 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <60 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec0: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Top Right";
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
@@ -101,6 +237,285 @@ hpm1: usb-pd@3f {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <60 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec1: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C Top Left";
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
+&dwc3_2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_2_hs: endpoint {
+				remote-endpoint = <&typec2_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_2_ss: endpoint {
+				remote-endpoint = <&atcphy2_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_3 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_3_hs: endpoint {
+				remote-endpoint = <&typec3_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_3_ss: endpoint {
+				remote-endpoint = <&atcphy3_usb3>;
+			};
+		};
+	};
+};
+
+/* USB controllers on die 1 */
+&dwc3_2_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_6_hs: endpoint {
+				remote-endpoint = <&typec6_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_6_ss: endpoint {
+				remote-endpoint = <&atcphy6_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_3_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_7_hs: endpoint {
+				remote-endpoint = <&typec7_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_7_ss: endpoint {
+				remote-endpoint = <&atcphy7_usb3>;
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
+	};
+};
+
+&atcphy2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy2_typec_lanes: endpoint {
+				remote-endpoint = <&typec2_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy2_usb3: endpoint {
+				remote-endpoint = <&dwc3_2_ss>;
+			};
+		};
+	};
+};
+
+&atcphy3 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy3_typec_lanes: endpoint {
+				remote-endpoint = <&typec3_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy3_usb3: endpoint {
+				remote-endpoint = <&dwc3_3_ss>;
+			};
+		};
+	};
+};
+
+&atcphy2_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy6_typec_lanes: endpoint {
+				remote-endpoint = <&typec6_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy6_usb3: endpoint {
+				remote-endpoint = <&dwc3_6_ss>;
+			};
+		};
+	};
+};
+
+&atcphy3_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy7_typec_lanes: endpoint {
+				remote-endpoint = <&typec7_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy7_usb3: endpoint {
+				remote-endpoint = <&dwc3_7_ss>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 736594544f79b5e45f6ea0c98e6c71d948ef7a43..31f24bbda9689b51c54a8f6cd42b2ad396082be5 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -16,6 +16,11 @@
 / {
 	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Studio (M2 Ultra, 2023)";
+
+	aliases {
+		atcphy4 = &atcphy0_die1;
+		atcphy5 = &atcphy1_die1;
+	};
 };
 
 &framebuffer0 {
@@ -31,6 +36,32 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&typec4 {
+	label = "USB-C Front Right";
+};
+
+&typec5 {
+	label = "USB-C Front Left";
+};
+
+/* delete unused USB nodes on die 1 */
+/delete-node/ &dwc3_2_dart_0_die1;
+/delete-node/ &dwc3_2_dart_1_die1;
+/delete-node/ &dwc3_2_die1;
+/delete-node/ &atcphy2_die1;
+
+/delete-node/ &dwc3_3_dart_0_die1;
+/delete-node/ &dwc3_3_dart_1_die1;
+/delete-node/ &dwc3_3_die1;
+/delete-node/ &atcphy3_die1;
+
+/* delete unused always-on power-domains on die 1 */
+/delete-node/ &ps_atc2_usb_aon_die1;
+/delete-node/ &ps_atc2_usb_die1;
+
+/delete-node/ &ps_atc3_usb_aon_die1;
+/delete-node/ &ps_atc3_usb_die1;
+
 &wifi0 {
 	compatible = "pci14e4,4434";
 	brcm,board-type = "apple,canary";
diff --git a/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi b/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
index 4f7bf2ebfe397dbde6451672d74ef76fe782bcd0..dc877bd604f827fdb944e2111309045e33b8370f 100644
--- a/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
@@ -25,6 +25,29 @@ hpm4: usb-pd@39 {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec4: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec4_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_4_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec4_connector_ss: endpoint {
+						remote-endpoint = <&atcphy4_typec_lanes>;
+					};
+				};
+			};
+		};
 	};
 
 	/* front-left */
@@ -34,5 +57,115 @@ hpm5: usb-pd@3a {
 		interrupt-parent = <&pinctrl_ap>;
 		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "irq";
+
+		typec5: connector {
+			compatible = "usb-c-connector";
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					typec5_connector_hs: endpoint {
+						remote-endpoint = <&dwc3_5_hs>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					typec5_connector_ss: endpoint {
+						remote-endpoint = <&atcphy5_typec_lanes>;
+					};
+				};
+			};
+		};
+	};
+};
+
+
+/* USB controllers on die 1 */
+&dwc3_0_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_4_hs: endpoint {
+				remote-endpoint = <&typec4_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_4_ss: endpoint {
+				remote-endpoint = <&atcphy4_usb3>;
+			};
+		};
+	};
+};
+
+&dwc3_1_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dwc3_5_hs: endpoint {
+				remote-endpoint = <&typec5_connector_hs>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dwc3_5_ss: endpoint {
+				remote-endpoint = <&atcphy5_usb3>;
+			};
+		};
+	};
+};
+
+/* Type-C PHYs */
+&atcphy0_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy4_typec_lanes: endpoint {
+				remote-endpoint = <&typec4_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy4_usb3: endpoint {
+				remote-endpoint = <&dwc3_4_ss>;
+			};
+		};
+	};
+};
+
+&atcphy1_die1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			atcphy5_typec_lanes: endpoint {
+				remote-endpoint = <&typec5_connector_ss>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			atcphy5_usb3: endpoint {
+				remote-endpoint = <&dwc3_5_ss>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index cb07fd82b32e67a41d8290bf8347d4eca474af23..ae3d535c5acb372cc94b4891e104d2248394484d 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -126,3 +126,215 @@ DIE_NODE(pmgr_gfx): power-management@404e80000 {
 
 		reg = <0x4 0x4e80000 0 0x4000>;
 	};
+
+	DIE_NODE(dwc3_0): usb@702280000 {
+		compatible = "apple,t6020-dwc3", "apple,t8103-dwc3";
+		reg = <0x7 0x02280000 0x0 0xcd00>, <0x7 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1256 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_0_dart_0) 0>,
+			<&DIE_NODE(dwc3_0_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+		resets = <&DIE_NODE(atcphy0)>;
+		phys = <&DIE_NODE(atcphy0) PHY_TYPE_USB2>, <&DIE_NODE(atcphy0) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_0_dart_0): iommu@702f00000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x7 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1260 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_0_dart_1): iommu@702f80000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x7 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1260 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy0): phy@703000000 {
+		compatible = "apple,t6020-atcphy", "apple,t8103-atcphy";
+		reg = <0x7 0x03000000 0x0 0x4c000>,
+			<0x7 0x03050000 0x0 0x8000>,
+			<0x7 0x00000000 0x0 0x4000>,
+			<0x7 0x02a90000 0x0 0x4000>,
+			<0x7 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc0_usb)>;
+	};
+
+	DIE_NODE(dwc3_1): usb@b02280000 {
+		compatible = "apple,t6020-dwc3", "apple,t8103-dwc3";
+		reg = <0xb 0x02280000 0x0 0xcd00>, <0xb 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1274 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_1_dart_0) 0>,
+			<&DIE_NODE(dwc3_1_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+		resets = <&DIE_NODE(atcphy1)>;
+		phys = <&DIE_NODE(atcphy1) PHY_TYPE_USB2>, <&DIE_NODE(atcphy1) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_1_dart_0): iommu@b02f00000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0xb 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1278 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_1_dart_1): iommu@b02f80000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0xb 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1278 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy1): phy@b03000000 {
+		compatible = "apple,t6020-atcphy", "apple,t8103-atcphy";
+		reg = <0xb 0x03000000 0x0 0x4c000>,
+			<0xb 0x03050000 0x0 0x8000>,
+			<0xb 0x00000000 0x0 0x4000>,
+			<0xb 0x02a90000 0x0 0x4000>,
+			<0xb 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc1_usb)>;
+	};
+
+	DIE_NODE(dwc3_2): usb@f02280000 {
+		compatible = "apple,t6020-dwc3", "apple,t8103-dwc3";
+		reg = <0xf 0x02280000 0x0 0xcd00>, <0xf 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1292 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_2_dart_0) 0>,
+			<&DIE_NODE(dwc3_2_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+		resets = <&DIE_NODE(atcphy2)>;
+		phys = <&DIE_NODE(atcphy2) PHY_TYPE_USB2>, <&DIE_NODE(atcphy2) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_2_dart_0): iommu@f02f00000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0xf 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1296 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_2_dart_1): iommu@f02f80000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0xf 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1296 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy2): phy@f03000000 {
+		compatible = "apple,t6020-atcphy", "apple,t8103-atcphy";
+		reg = <0xf 0x03000000 0x0 0x4c000>,
+			<0xf 0x03050000 0x0 0x8000>,
+			<0xf 0x00000000 0x0 0x4000>,
+			<0xf 0x02a90000 0x0 0x4000>,
+			<0xf 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc2_usb)>;
+	};
+
+	DIE_NODE(dwc3_3): usb@1302280000 {
+		compatible = "apple,t6020-dwc3", "apple,t8103-dwc3";
+		reg = <0x13 0x02280000 0x0 0xcd00>, <0x13 0x0228cd00 0x0 0x3200>;
+		reg-names = "dwc3-core", "dwc3-apple";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1310 IRQ_TYPE_LEVEL_HIGH>;
+		dr_mode = "otg";
+		usb-role-switch;
+		role-switch-default-mode = "host";
+		iommus = <&DIE_NODE(dwc3_3_dart_0) 0>,
+			<&DIE_NODE(dwc3_3_dart_1) 1>;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+		resets = <&DIE_NODE(atcphy3)>;
+		phys = <&DIE_NODE(atcphy3) PHY_TYPE_USB2>, <&DIE_NODE(atcphy3) PHY_TYPE_USB3>;
+		phy-names = "usb2-phy", "usb3-phy";
+	};
+
+	DIE_NODE(dwc3_3_dart_0): iommu@1302f00000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x13 0x02f00000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1314 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(dwc3_3_dart_1): iommu@1302f80000 {
+		compatible = "apple,t6020-dart", "apple,t8110-dart";
+		reg = <0x13 0x02f80000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1314 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+		#iommu-cells = <1>;
+	};
+
+	DIE_NODE(atcphy3): phy@1303000000 {
+		compatible = "apple,t6020-atcphy", "apple,t8103-atcphy";
+		reg = <0x13 0x03000000 0x0 0x4c000>,
+			<0x13 0x03050000 0x0 0x8000>,
+			<0x13 0x00000000 0x0 0x4000>,
+			<0x13 0x02a90000 0x0 0x4000>,
+			<0x13 0x02a84000 0x0 0x4000>;
+		reg-names = "core", "lpdptx", "axi2af", "usb2phy",
+			"pipehandler";
+
+		#phy-cells = <1>;
+		#reset-cells = <0>;
+
+		orientation-switch;
+		mode-switch;
+		power-domains = <&DIE_NODE(ps_atc3_usb)>;
+	};

-- 
2.52.0

