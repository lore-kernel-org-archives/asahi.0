Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554232C1798
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563175; cv=none; b=R9y530IjNF+QxOUn1cFVtyaxrREiWR+4CGEUe4JODbDSklJcB889211eRkUVmRRosV0zsnpaXwqI93uWVbOELJA2ZUQQS5qzgmxck1VzZAyBH5P+MxdLKiDzGiPgT12i9hFBZGeBcMssa3E91yqgUqSBWC5Yp8cYE3zmzBlZ9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563175; c=relaxed/simple;
	bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNhM8JWAgvMQ4Uxgr0r36i3nidxDdu4kkpFlQfNT9y3r15+NFKAo3uA9IXLCna4o2JV2BIdzM1zYHDCBCpk4BJA3bfAba9JkyQh4dmW5JuFtYlGJCW0fP/ixYI4GRebrmTnYjL3hW36PSRxCcWhu6jAVt54/L3lkx3juzL9vowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXTH68Yk; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXTH68Yk"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3137c20213cso2686078a91.3
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563173; x=1750167973; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=YXTH68YkymudwR8WB0LpyZML8EpPgIJAdg4285K6801FSX392prMbuVNlqAOKFJcVD
         +Ij/Gbr/nEQSf6l8syiJMlC26czVOprT/OIArjZXtB0K4d+afPlTyJu+4dkw7w//nFWt
         G/bt4VBCPrLBdE+dK6XFa+IIMJmfli3y/JUPQHG1vgyCv+BNjXscxpjTQvw9glKt+Rbn
         ASaY0dNIYtxIan3xp5+PQEhDGZkLzxf1Bmuk6mx+4YC7gHg533KhvbXBcTnR77kgOcC0
         PfZx2mkICy9OjaE2o0pTJ11vUarBnLvKecmbH/P3rvfBphEVJn7hL2ShZKbfW9lFVN8x
         wAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563173; x=1750167973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=E9CkOKeqYbypBQQuPHveJIDJV9Uy67QInNgSNcNFqDXZj6z5llHlT4OP1iqLjFEhZI
         6VzXLONu769pdVXO4ce29kdDfzj53dGZkqXXbaeGWhv5Sefx6b/oJH0Alst6fInhzxrU
         vbwbk49ff8Edj1Tnb1j62Mzbab5qxE2Lj4eDf3okXwe7pB3LylqNTsPJQP5qtMgtpSCK
         Kr3W1Fg3BMYEXnIaCSXIF+psjOy27twSHg4jXCjXYVf/9j07LVzY392tk/k8hWH62GNB
         NKmkkwOm3ztm0McQloQ3Rhk4qtwEBpbji44j+mheF+jE8rKEn3FeVPciJwl+leNCZnRE
         YP5g==
X-Gm-Message-State: AOJu0YzCWRCFLvFR7ODIoLYpKQNf/eqFjk36vO6CD0uwMz92UXYV3Ie1
	CBxXU39by2vCRejzfw1KNPWbiJG+xOivEzl4pHwT4UywjAyrtOJoZoyHD/stXw==
X-Gm-Gg: ASbGncsRxkMP/FPSbnW2IA1gpy+N6tq3G7OgpoD3RHZxQCu+qwEjMNdffuy0ji9uCjA
	4+FBSujbT3qvcMT4XwHCr2YqeRAykDJ+/lO03zSPp9l/htr5x7AbTOmJmH0R8n+NAMddE/7yQ2o
	zgygqMgyFs+y5XnwkiRpmj5CKTZazQHh3UY3dCBz1pGjVy1qPx9OgdPHQ3OyyyQbFAoDnbLUW/C
	CbvyWVZSyFUUHAdvStPdiNpw5RHfx1o+BDzMI1Prg1kA/5p9GZdKT2fkZNz5R0KQq3ZSq9gVF8S
	ZghrMKDqfXn780xYdtwmSqbSPWpRw+pGCt9gYOEiBAG1E/YsqYV/qXPoTlf5MRZK
X-Google-Smtp-Source: AGHT+IGWLnHsznkJ/Da/EQnD3kporOvoVzQzAShfY9FI0ZIFQMZIr+5VR8cBdQf/AsoVqaF8p64zzQ==
X-Received: by 2002:a17:90b:1646:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-313472eb280mr24147530a91.8.1749563173273;
        Tue, 10 Jun 2025 06:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:25 +0800
Subject: [PATCH v2 6/9] arm64: dts: apple: s8001: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-6-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMUl2/apVzAT/V/KkKkeb6CQjlyBAid7HYa
 M99AEPEte+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JGMrEACVFL6WIOESUBESHHupcLhxC37GYnackPUmK1c3JVn74JsDd4FZOTvqH9l/z/I15UWLS2G
 DXc6QT0Zhlh5Q127sMKncN3SgyYxoYEhtuBzr8DZNdTgUOu06rggIC/s/rrT7vBOLpFbf4WNN7G
 f61RjdR7OU2lYvyIp1h8NpoxmqMYhe9BCbIf7044KRaHWnGY/fJe5yNxbLi0UUbVPzi6AJmszcM
 0KCYyJkFWR5p2z/CJHMWJTYOc39SOk/I4zqLCYPjDU1y5beBohG4fbZqAKUq81SToOlqvbW082y
 iG13lNqMyRnLZLMukmZB8Ko8uvWKL/xzwxRQTyN54aPx03+qOQ6ccV2UHKj8SxNoNlhbHRelkJk
 Fb2N+g/Atl/U9wY4pC2bmD3jQtbrRY4Aed8Fr2Lq2BbGD23ZwHvpIKEiAMvKYd4YIyazQH4d1Ep
 RRC0CZOGCFGCt32VG3i+Jx8MCWNS6OzU9GRVRE+GbUcNxYwVX+/wWQVfJen1IWGijaFigdozcUc
 cGEiycJ742rkbUen+z3iQZrMcjMujFqDh95NK/Hq2kII4rBz45TowZDzIYZ1oMr+8hIJKvRWJB/
 J65N/tZq5Gd2Hnf0yymVCjwBwFPM+usFe+9r/kLSBTFjlz6WPh1B5iKemTEDR/1uJUygrtA63bZ
 zbMai8ah9rXRDJA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index fee3507658948a9b4db6a185665fdff9f5acc446..b5b00dca6ffa4caa1d504860693da001a8ced80e 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -137,6 +137,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 234 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s8000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 235 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -173,6 +229,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(165, 1)>,
+					 <APPLE_PINMUX(164, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(178, 1)>,
+					 <APPLE_PINMUX(177, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(131, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(115, 1)>,
+					 <APPLE_PINMUX(114, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0

