Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC802BD598
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563163; cv=none; b=cDwFjuAQ/TdR4kDDYmU03nFTII0HMMAePEqUEH8QknPFFOcXDg/U4pe0EQmVtrzjuGu3D0Uz+Gri/6qP+XLoZmvcXmdyj/8lAXDT7T12d41cuSlQItvt75xuJoMwUqIimpiwBIiSk5HKI81oopCQBkFKQSC3ZQ5HYWL4PBUjpbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563163; c=relaxed/simple;
	bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJ2vRy/UhZ1M+MZycPeh7xQ3EcDB2//E1HL8cRQog2pfa2Dp3WZNDUl1bnF2r/racFvrQmxXXONorWX13kLuHoN8QV+FsGggBOnjO21L2ex8VBnnRX3ARZAg5tVPPtJwNYG3e4gh4q3vXrSuUy/gVhcEsfkZiADNLAX2hrOUOCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU2iabRx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU2iabRx"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso3825396a91.1
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563161; x=1750167961; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=YU2iabRxFbmdVPn+QNTaH1aPvgPtcDza4XDpniq6Meou0mtP0KQ6GNLRIF80ZflKor
         D0joBdCEgJT0C0sYjJpgHK2dVbP7QzT3jh3vKJdNMoV8+PmzfeMtPiQ8wLW7AUrjX5ZZ
         oZQYYDOgu4T5Lp2gE/UMMCCvVYa4igF1irEQJplAT/cnxqPuSzdwGkriYzxOse9tsoED
         XqrWQgXIQwDUwd0Zk5QzHgGjcuxf+4fbl98VxqfC8yXdJNMF//4iR1V4JQ5xP38zbryu
         DL1R02nKIXYXQ+Q6E4hZuDuxq66CbtnLhgbdNy2vGf5lbL1Rt0bR6HALqJ4u12/0/foD
         hhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563161; x=1750167961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=xAXABuAoD40gtdQ1egoEXQlOQpgJmyJJkN7GK84RLC69QU/P/a4zLccgAZJtVsylPv
         Bmxh1KlkQ16GbbwcXlz3RwV5+KIS91MxMZ2XjZ+/b4OVz0839rq0j+f1+nP18zHfFJir
         MOueVa4HRZQv1/Q3Kusx5wykoxv6k2tnb/UUZFnFnt7CfUCh//+tbK2NdHxnAGYU73ga
         yOA2lTInhxVtLJV0no+hrRlsEPHs228VizQDwMzKkM+WGhYY3J/Ey3grVyoj68YQlRhd
         R+K6sN123O92mIsfcWPkfNLJB4Vn81qwiv3gSiIuNm946pmlBUZYhk32j32peosSD1UN
         89sA==
X-Gm-Message-State: AOJu0Ywym2bMhFD96EAaAr+Gi0LjFVdUypWaZlJLyixQ+3VcCu2gaVib
	NHrV6Re/rnlHB/TBo5QfnsJVb0upD8xkCp5Fe1t/4M8dVZ1Txj2LDjRYIZexew==
X-Gm-Gg: ASbGncsjNpz6IwXQmm8ny/4mMZhqvVSQWoP6SrMC8oP9MUXVNqwrvT0zhiFP7omyHSl
	DBAYRbzD6Uo5bfpSX5FqsfW6CuGQMjWsU1YVRsor3f5f5YBDo10jDBjAjwLPD/RQdGx41O2flUJ
	qTYf35njx756HShx1MyOwqvMt/ZfvDb53r89nJeX990nuSmmoC1r1keAx8jc6RCYydKuKSgcYn+
	oBfFTmduCYuYePNvHBlcyebK2SSVn1LqLYtea6m5tdRLryT5XNC4pLsZELpFHhm2bwzSziMShup
	3nNoNQGJf8R+ma/a5dnbRwPxnTZnHhuV5QAyBALSi5V6ByyiOIK7m1IlOy/Ph8TgFFONzO4WyG0
	=
X-Google-Smtp-Source: AGHT+IGK3m/b8ShwDnwkYQZ/3bSby/VP+fZbQmhnnLuecG6P6WZWJdU842YzUVSnJPIZkmbsxKKkZA==
X-Received: by 2002:a17:90b:1d92:b0:311:ff02:3fcc with SMTP id 98e67ed59e1d1-313472e8c90mr26139241a91.14.1749563160859;
        Tue, 10 Jun 2025 06:46:00 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:21 +0800
Subject: [PATCH v2 2/9] arm64: dts: apple: s5l8960x: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-2-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLg9pYRCfUltZiRuv+/WgyjKGV8lBNWbqxY
 qU16qGuOmCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JGwLD/9PEKpo3DwC+3IfppSQTT4jUzKdpJwc1f0qRO2CialwUZjPjxG6RTj7G6qIJ/BcwTkM3U/
 TvVZzjvuu1FsjZPlXli/Ma+g0x3z+jfT+dFmQxy2fjayUhq6HQEY7rlC5iQqzsWqvaDNuZjSgeO
 IQb9jFfizSAN9JyIyLmovJ2txQUq3kA4sEhY9NBp304PF1Td/7YgK/L2Oj1sylYc/V4ISBLIMYr
 CiXAybU0AcimfFgB5VPZ2TY6eLL6Jk6oWXjbJJnWo2kfWiZ59gyaZdqCx25/w+rUMNgFzdivyKl
 TF+3KYE7bxmSAAXrwAfLNTMbd3LhBf/APsTCLptDM65pxnIxU8ptghByHb/C2gjaJie6OSSS3ta
 7Wk4bxqhdhKC075OlJI/HrCYGnVJ5A+wBlgWcjLltJiIwpmEDb6FG9HOO+n5Nx1/Gpsgws9GZi6
 Pi2E6K6AK20xW9zs8Fu8bCnh/lYvAh/t4/TUoNAyHU87UivyICY+76Orn880MS6yldl/X4I2qmg
 hXRZYwQU+TcCLKb1Noxp16e1s86WfohCE9znu9EUqh+M2WP2B2lw0CJrz3UHG48H62Z4UCxevAX
 nMkO2coB90vplqyKgq2WGptBwkrANOyixxNJzaYvZteq8TJsXiyUUTTBPd06YkU2QagRUeShk0d
 cUqN1Ns1Ty98yUA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..462ffdd348fc893d8e1d597b11d063dc5f88bdf3 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -89,6 +89,62 @@ serial0: serial@20a0a0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 154 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 155 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 156 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,s5l8960x-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 157 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,s5l8960x-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -140,6 +196,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 112 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 113 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 114 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(81, 1)>,
+					 <APPLE_PINMUX(80, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(83, 1)>,
+					 <APPLE_PINMUX(82, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(101, 1)>,
+					 <APPLE_PINMUX(100, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(172, 1)>,
+					 <APPLE_PINMUX(171, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0

