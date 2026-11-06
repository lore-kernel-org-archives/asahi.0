Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984197;
	b=citu0y8zJKip3x/t5sqOmjtdqtOb+3CXKnDxzdm0ZXa5auHgernw24WeagpUzfph5sNl
	 6QuRrsIkse7q5qntm8MY+uTH6M34Yq8AzGWlZn/hUtgv1BAIVLeB3uwayt0XP6FHIyA/w
	 20onQYlNOrXW9g/hgUqfLImahGvy6hcSNMl7sUiceaDZtFtwpQAgoeW1YdIdCUjOHufTA
	 A59rYdgQ3M+9oNifgq4R2oac2ayXpC9bv0+pM+/IQU7+u6thTtJnObnYsVzABungEHNmY
	 CudG4FfCjLoF8xPK4OevYoOMyqZGB6wN5Jibm1FQ8SmiPg3Aw8BIabQBWBHfcWN+ENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984197;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=WWqOS7cTYH7Hfu4TugC2jyBdj65ccrW05fQttvi8nt4=;
	b=cPG6RrmDUHgMO2BVs6PQr94IrTXdvaQhkKT8N8UcArV1di+IEWPH3s6MFR5JOMqerHGs
	 MT2GQ91/dmcWOQXWNkh9epk9lXKsv2pOL+8cSm4wJWlNZGtZ3P0bgRPe1hq0a/HYt2paM
	 uGCOfEsQfdJGwDPja0A1Cxs/lH1qB7pG98GAU4XeLtasTEPcXbT6w8i1qJUw+u9ZFZ5cA
	 FJcrliAf4zMFMb3O538lQiIJqdczYEX8RPDRfRdtPSeoK/Wi6ek27SYLMJ3dL10VrJWEg
	 KuK/rWAzoD+6MWxoGMjleeKa6A8fb9XXkgeuf0iC2m2OX/2LinhioKQUl1T2LG1mS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=GHG5A8Xj;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5927A606D82E
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 16:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5927A606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=GHG5A8Xj
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWqOS7cTYH7Hfu4TugC2jyBdj65ccrW05fQttvi8nt4=;
	b=GHG5A8Xjj3WiwVI/va3LbQdnVheYXYGExWEypmIo+qqitqsDUqjFDTLHjRTUvCFVEz1Ei8
	zV6Um8AmqvlZjhkqiHMdLMROF/YqdUge2CPFlgiQ47cq1r3tpO9iemIFrX72cpzP5B/Sh4
	4IwksEowov78quaxhq6kwECoYnUXzws=
Date: Fri, 06 Nov 2026 17:56:15 +0100
Subject: [PATCH v2 3/4] arm64: dts: apple: t8132: Fix line-length-related
 dt-check-style issues
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-3-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

This fixes `dt-check-style --mode=strict` issues related to line
length.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  3 ++-
 arch/arm64/boot/dts/apple/t8132.dtsi      | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index b0c5d71943b6..9d9aeb4d074e 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -22,7 +22,8 @@ chosen {
 		stdout-path = "serial0";
 
 		framebuffer0: framebuffer@0 {
-			compatible = "apple,simple-framebuffer", "simple-framebuffer";
+			compatible = "apple,simple-framebuffer",
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index 6d070306e29a..b1e77a8ae406 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -206,7 +206,8 @@ soc: soc {
 		nonposted-mmio;
 
 		pmgr: power-management@380700000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x3 0x80700000 0 0x14000>;
@@ -225,18 +226,21 @@ aic: interrupt-controller@381000000 {
 			affinities {
 				e-core-pmu-affinity {
 					apple,fiq-index = <AIC_CPU_PMU_E>;
-					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3 &cpu_e4 &cpu_e5>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2
+						&cpu_e3 &cpu_e4 &cpu_e5>;
 				};
 
 				p-core-pmu-affinity {
 					apple,fiq-index = <AIC_CPU_PMU_P>;
-					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
+					cpus = <&cpu_p0 &cpu_p1
+						&cpu_p2 &cpu_p3>;
 				};
 			};
 		};
 
 		pinctrl_nub: pinctrl@3881f0000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x881f0000 0x0 0x4000>;
 			power-domains = <&ps_nub_gpio>;
 
@@ -258,7 +262,8 @@ pinctrl_nub: pinctrl@3881f0000 {
 		};
 
 		pmgr_mini: power-management@388280000 {
-			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8132-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x3 0x88280000 0 0x4000>;
@@ -274,7 +279,8 @@ wdt: watchdog@3882b0000 {
 		};
 
 		pinctrl_smc: pinctrl@38c820000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x8c820000 0x0 0x4000>;
 
 			gpio-controller;
@@ -295,7 +301,8 @@ pinctrl_smc: pinctrl@38c820000 {
 		};
 
 		pinctrl_aop: pinctrl@390824000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x90824000 0x0 0x4000>;
 
 			gpio-controller;
@@ -316,7 +323,8 @@ pinctrl_aop: pinctrl@390824000 {
 		};
 
 		pinctrl_ap: pinctrl@39a000000 {
-			compatible = "apple,t8132-pinctrl", "apple,t8103-pinctrl";
+			compatible = "apple,t8132-pinctrl",
+				     "apple,t8103-pinctrl";
 			reg = <0x3 0x9a000000 0x0 0x100000>;
 			power-domains = <&ps_gpio>;
 

-- 
2.56.0

