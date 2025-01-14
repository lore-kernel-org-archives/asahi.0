Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108E212B18;
	Tue, 14 Jan 2025 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736890739; cv=none; b=FH0gvi2h4lDFjk3+PyVS/KqN8IvPKv+l6TbLZJYgKXhFm+OM0cNT2O/wMZlmcnZGIllsQcCx8VgaLudXZsVsmiLgFHT43XEMmq27Lc4d6tr8jQmrUVCedFEnirnGSFPBE0U/jF0Sch5DSySbkL+ad6HTUMYZ4lDGLnLbxJJkuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736890739; c=relaxed/simple;
	bh=UXXVGCa+xRNk2SvCaJv+CA8sBSVJyc/q/PCalr6FFr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD29OsE+OJ8Gb3u2wZKwwAky+fXI5SPSvrP5fpnLWkjKoUDG3gulKWPqCyys/uVbHH616p6a67zFxVqIKBg3cbrjz9THc47n3/FMLtiaCdvJmAjnfFhAPXgKeXrBNZbuyqHt0yuQcFvWel5Se2UXW3wRvvkhER84nJBHfM+xsFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aogGzLd2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aogGzLd2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02CA3C4CEE8;
	Tue, 14 Jan 2025 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736890739;
	bh=UXXVGCa+xRNk2SvCaJv+CA8sBSVJyc/q/PCalr6FFr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aogGzLd2OElPgWP2HcJl0uvj5wzuitQOE2ks2iX21lqPvguuAMQAvNsiGgFu9vEL9
	 KplrAyr14fruNDmcTSJITqwCvfR5qD1c63o91/9ISm3iHHzyqR6lBg5N+3bVYf0Jof
	 HXiqNEatVVrYNB14a+0KnYBfSIUaihrhJunc2rXyrs283K39HfJjSlUcoBRmvk48HT
	 1XEg5ADEBQZAgFjRu0SgQu8xxUKwD5B9uPTM1cdK8rkRqI1Xz0gc4y1uK6uoZGLKlr
	 fXolBXoiqDTL3R9JPZ7QOOiwT3UcI/86Gdvj+/RHiHurYFniXDbIRf5YgQTUj3IHZv
	 11hlkkAGxXWRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2ADC02185;
	Tue, 14 Jan 2025 21:38:58 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:38:55 +0100
Subject: [PATCH v4 4/5] arm64: dts: apple: Add touchbar screen nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-adpdrm-v4-4-e9b5260a39f1@gmail.com>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736890736; l=6646;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=WG7cNcrZYygeOthLbnszjYaIOX1Y805VEv9FfVcvhss=;
 b=o/jumD5ywnvP47pU8fvmvrE54J36qvFj3S775lM4S+d0YzK1XqGV3Z9/28CRKS+9tG+UpuhLy
 ZabX0J3MbaqCtNHjwzNHIuPrVoE5SOsPOy/HBHfaiL2Ds49CvhTMZy+
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds device tree entries for the touchbar screen

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 60 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 31 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 61 ++++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 56b0c67bfcda321b60c621de092643017693ff91..3af8536da779b56bf856cf40befd74d4737baa8f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -49,3 +49,34 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&display_dfr {
+	status = "okay";
+};
+
+&dfr_mipi_out {
+	dfr_mipi_out_panel: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&dfr_panel_in>;
+	};
+};
+
+&displaydfr_mipi {
+	status = "okay";
+
+	dfr_panel: panel@0 {
+		compatible = "apple,j293-summit", "apple,summit";
+		reg = <0>;
+		max-brightness = <255>;
+
+		port {
+			dfr_panel_in: endpoint {
+				remote-endpoint = <&dfr_mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&displaydfr_dart {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..9b088f74e0cb9f42fbc8df822fca6451dcd1b717 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -356,6 +356,66 @@ cpufreq_p: performance-controller@211e20000 {
 			#performance-domain-cells = <0>;
 		};
 
+		display_dfr: display-pipe@228200000 {
+			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
+			reg = <0x2 0x28200000 0x0 0xc000>,
+			      <0x2 0x28400000 0x0 0x4000>;
+			reg-names = "be", "fe";
+			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "be", "fe";
+			iommus = <&displaydfr_dart 0>;
+			status = "disabled";
+
+			port {
+				dfr_adp_out_mipi: endpoint {
+					remote-endpoint = <&dfr_mipi_in_adp>;
+				};
+			};
+		};
+
+		displaydfr_dart: iommu@228304000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x2 0x28304000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_dispdfr_fe>;
+			status = "disabled";
+		};
+
+		displaydfr_mipi: dsi@228600000 {
+			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
+			reg = <0x2 0x28600000 0x0 0x100000>;
+			power-domains = <&ps_mipi_dsi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dfr_mipi_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dfr_mipi_in_adp: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dfr_adp_out_mipi>;
+					};
+				};
+
+				dfr_mipi_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		sio_dart: iommu@235004000 {
 			compatible = "apple,t8103-dart";
 			reg = <0x2 0x35004000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 0ad908349f55406783942735a2e9dad54cda00ec..372fe69a96f6b84f576221101a4127d68bb54691 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -35,6 +35,37 @@ led-0 {
 	};
 };
 
+&display_dfr {
+	status = "okay";
+};
+
+&dfr_mipi_out {
+	dfr_mipi_out_panel: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&dfr_panel_in>;
+	};
+};
+
+&displaydfr_mipi {
+	status = "okay";
+
+	dfr_panel: panel@0 {
+		compatible = "apple,j493-summit", "apple,summit";
+		reg = <0>;
+		max-brightness = <255>;
+
+		port {
+			dfr_panel_in: endpoint {
+				remote-endpoint = <&dfr_mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&displaydfr_dart {
+	status = "okay";
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..1eead9640543632c3ba86c1ff766258e3158c84c 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -379,6 +379,67 @@ cpufreq_p: cpufreq@211e20000 {
 			#performance-domain-cells = <0>;
 		};
 
+		display_dfr: display-pipe@228200000 {
+			compatible = "apple,t8112-display-pipe", "apple,h7-display-pipe";
+			reg = <0x2 0x28200000 0x0 0xc000>,
+			      <0x2 0x28400000 0x0 0x4000>;
+			reg-names = "be", "fe";
+			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 618 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "be", "fe";
+			iommus = <&displaydfr_dart 0>;
+			status = "disabled";
+
+			port {
+				dfr_adp_out_mipi: endpoint {
+					remote-endpoint = <&dfr_mipi_in_adp>;
+				};
+			};
+		};
+
+		displaydfr_dart: iommu@228304000 {
+			compatible = "apple,t8110-dart";
+			reg = <0x2 0x28304000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 616 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_dispdfr_fe>;
+			status = "disabled";
+		};
+
+		displaydfr_mipi: dsi@228600000 {
+			compatible = "apple,t8112-display-pipe-mipi", "apple,h7-display-pipe-mipi";
+			reg = <0x2 0x28600000 0x0 0x100000>;
+			power-domains = <&ps_mipi_dsi>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				dfr_mipi_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dfr_mipi_in_adp: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dfr_adp_out_mipi>;
+					};
+				};
+
+				dfr_mipi_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		sio_dart: iommu@235004000 {
 			compatible = "apple,t8110-dart";
 			reg = <0x2 0x35004000 0x0 0x4000>;

-- 
2.48.0


