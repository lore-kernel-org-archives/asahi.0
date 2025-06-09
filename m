Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8BE1A257D
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481110; cv=none; b=u/juAoy4XHp51nsLCBMKytIU1tVsxCEGNlMQxcRxcJKFAl1xXn3AZM6uBV/nFD5qUK0nCPEm1Y8zI1IKuVqIaEQo9Z3vrpJVk29IWSlmfe4RWbSfNVG/H+XmetuBV7yhirzLTptO8Nmz+ZziFOnMYqKtbXeYaYBWeRBM8WiDvRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481110; c=relaxed/simple;
	bh=UtUXsBApERv0HSkBqesHqqsf4hnDJMVAjhLKU618wUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhRkKCWGmxdpZ3ph/HhBm34PC5lvGnT3nBi9fNsrTS+M0Xn1tnTDfELs00eYmEo1QKmKvhjOFt42yOKc7CM7iPuZl0FvZqH+149JaJYIigNxCTArAdeuxUc3AFG8RV+4P9HMSpQwCOp4wwd7I0koc7Gp3tKQsp4ZW9p4L9RBQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moI7kv44; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moI7kv44"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7481600130eso4343409b3a.3
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481108; x=1750085908; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=moI7kv44b/f7L+0t8KF/mASWCB58L3h4A6JiPKnuiZKViby8FAL0mqimydgcMZPGLo
         u7Onvm7G5++ABaLJmB/uWy6Njbsey0fTq6S/WMJwkgx7iiidY/f1r9tZlCUDytoZMV7b
         dVLzYC4P1zJGdjb6Qh/4/LyEMC8vo1M+aLtj/HZbJyCymd+5QVi4L/APxzI0sDkgAXll
         vNrUyDdy3iCI96ysJjx6DmCWCwq6HCpTxqKozxvcIIqmo5IrqHKdQfsas9afie9QGbsi
         FhvfP8VZXhggabt8dTZCqZ6uYAUKlA2WzvnOmKEks41oid+CyYc6Mn/OmeVl8fR6OwGG
         SE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481108; x=1750085908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgzxLDD1EDoYAqcznGOnUvDBEtdRSzSN7d1ImoC53nA=;
        b=eV3b7UQaxaqOlVgfzYplDG5GKCA9iEJH4PJkhOO62oF6J9emVSJzioGJ3/qbEPppIP
         +n44Q1Sra6jp8pyVqiEDyygsr43nZqztrgJ6t75IOpj8XdgE0OgbOlAitFbgRWLDYLu/
         43MfiaBTfcR8Nw7qFLEbgC4o1nKUS6zosHYHU5aiCfCUIvF1hQw+6lL2NYcJdlQ0D2Wt
         7liarPg7lpay9gX9P/w2dQ9ipMaDEMoipA5CH4NJvNvrvayJyE0tfZlwHWVpbVPjwxrx
         RO5KnLTzCCsklxyCMMsw3A8oJLs87v3jTs2yjfXOTJehMqwuD5WpJB4LCM+HTOt/Aabh
         R4eQ==
X-Gm-Message-State: AOJu0Yzo7PTLHo9DaDpfBvYWXM3OvV7MbkgDLyqLaowqLP51yUw8XLc8
	Kxtj6n7p7xz9y67EHAuAZObknH4HntCq2Fm8Py6V2Z3DNWyO9wEATQ76
X-Gm-Gg: ASbGncvVSxkkYpFH8z3EPVC6V0vQabUA2cgdcL/sVByZOv1G/oVIB3OkqV82ZwpeXD/
	OpLf5Zj8LoPL+nDtav7CqltWV8dp3oswbtwWqtbH9bhivYv6tIEX3IWytSMV+WMnx3ecMq0WRkw
	69OGt3Z0sv7IF+PGevXwvZvCArJvFguIwhyr2n4rek7bPX4LgBOH28nDmGGAI73qsniGSF6iGZM
	NXde7GlM0xqfs2l5LuT52SBDAJO8QNMUAWknkoSiGR6xr2ms8mATMjbG2pPD6UQV6PBEaStT7G1
	WaMAUj89EyLgEeIPum33c7AIWVpoXrQfbrY3wHCdWLure3lKIYBSow==
X-Google-Smtp-Source: AGHT+IHlBqNiRN/VzjCmH+GccWEqdp0qoeYXb4Bn1Al96nJIn7YSkT+omzOCGqLdFgbUeF7GTn8deg==
X-Received: by 2002:a05:6a21:a43:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-21ee6851aeamr18131835637.1.1749481108259;
        Mon, 09 Jun 2025 07:58:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:27 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:18 +0800
Subject: [PATCH 1/8] arm64: dts: apple: s5l8960x: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-1-789c4693106f@gmail.com>
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
In-Reply-To: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaMq1tbvO1pHM4ifn1yfNOZ+7YnNCeDkJchC
 OWw3fzANbuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jAAKCRABygi3psUI
 JKZyD/9GgjSg0Tw4TSvf4ue2tv+yyhIWjc6Xj3LpbN2mHLSWgl6xkpys6vomEF//9NaCKiWvq3e
 9uaJSGdvP3PZQsVYpd+riUXwsdKndS/xPI/82j8e0pEdQ7+XXggqjWjQ4b8Mp+qHSv4FAWNOLGz
 WOsHsU/r8U4077WjWetPAcEInMUgG7VGFIaOKgwEbpaKOtQyDi8wx2UgVft0wO7AMjiuP9xQZCl
 TOmVfQXOTlSqTmQKcI7qMo3brDohSbJumG896goKofidmw22/s7YUR28T/b3eRS/7GqCwuws70n
 qICo4AXPr1b+tYRW1aerQzxlxkL/oK3/pWCwZ5z4eI7DqigTAhe8G64/aJ6rWdU7SWK+kH43n3G
 T8Deu3zhl7/zq7xAOo8DA8AwvaOD42Lsppun4fPdzxVf1Alr4G3j1mC1pTasv44ZQGPGDbaTmF8
 CMvu34V8tmzN7SSw/9M3Ll3JC4HEYzrcn4n143IqZnA8tpQ7pUkw7vjyumvkqAjmOV36YwN3g7A
 ZHusSectPWalpWiQQh008rvE4PnwOoeQx/hS2R3uBvF+YFTiih9vVFbKeggQdDtnQ2unMFj2FpI
 Mw4/ztyz6RwQLM7o8qmFy13YRdHmeiEeIzUzUsrk3TRgRWzI+p2Kv9NWxFucsdm9sXdKtSifiCn
 9TtI+4Dmdcyl7FA==
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

