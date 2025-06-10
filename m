Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B100295DB8
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563182; cv=none; b=o9l3fOT3Xqo0TPwgKYiA0PN3ziym+St4hZ2L6TJG7FJqA14lLlVWrW8bOtCVsj2qXweIhVTxfTC4FyOFalr0v9PcL4kNYvMeVbkd0Tzzmmq4JgUm0SViy7ucYn64B8FxW5wS3ZHTg6vPX8L7lwbtmIfwaJDmI+ckd87RCIGV6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563182; c=relaxed/simple;
	bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etzcONOvRX/1L2mJm910Piz8a5UYYDI17piuM8Eh83NB+ZT9L26QiRsS8vAObYamfHmhLDds+eUhnCYIhNQGsSZZVHEh7J+VgqJPWLb4vFGo+HFMB65emxCqLLJXI7DqoVW363cQ3jbUAYWf/OLqihI9jUtuILRFqhu74Wy/+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLcEptx/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLcEptx/"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so4709880a91.3
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563179; x=1750167979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=RLcEptx/De5kY+MCfvF+8mFfRp/evaT8QiXkaWIT8Zb1JAoLFsCr4VhFJVceM5ButH
         O+3sH1V6RKn3mGf0uJJNlRQlN883ZTFVaAScjrT3ipOXdg8JVe1J2vScnEmH8c7YCVpk
         Oorz5EFwWxnD6R1dRU7316yAmfDdn1pujFv7nC2kvIvfHd8BrstgF4VtRmsD35iaz1+c
         bfrIsJ14Kej08oYIn/bygmB0JMHG6T7GtUnO2P4VPFCZ0+5aChZP/3y+Lwy3R+bAssjs
         IG1mWEEsXFraYzLUCHrhuV59EtZFYLV0QKKkRjMftTShMkm0wVrTXakYPmw/3pGDrz8Z
         p9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563179; x=1750167979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=mJDouUR6KfhRow6hggiz8rQ2koksm714hyVLGUqCJPK2YRGYb5w0ektfSZWJHqor+A
         dm/RsB+IrBSPvTZygEAiW2QkpEiW2yVx2ZAPny4TdH3gNjcwlS1ccergkLhRk4GXm5dE
         r878RKtHIcCr4xAT7kJu5xWLioRJfN1816CDnscb9j568+D/REvxjJqsyDkW8aXNsn5z
         Sdm5J0vYyrNxY0w6bQRdgL7mVLcyuZ4ztnohJUIfbZvH1zuYR7gpBBhQjA1wxqDO0xBb
         LP5u/WU5InlDK0c6G42skMIpPc/+099mnzfdxWjWdbHjZTveXNx05JEmZ2T66w2Xk51u
         rOtg==
X-Gm-Message-State: AOJu0Yxo1L28K/3ZqSFy6vhxtcjIF3niIaMJmO7ZyMewlGg9b8oZxxwz
	mclCAOUemmCijFFdF/2mhfeBV32sIZ1OAkvZO+Qy282NOQRx21a5qtYlGDgXUg==
X-Gm-Gg: ASbGnctTH4H/4vodr0BtH0fqbSIkgA9vlQOkps+Zfgee98xhDnw7piG6cUywfFPDk3s
	e91o514dzU99EpAMxBs82Xl74v6z09PQI/JDPeUj9lj4idQEl0V+LeDH46oitrU0wXzDv3oBIuK
	6HT36QwVHS0GBh+65tzhjeV/+x/ppaZtPKG/cstsC4OdwtyhxCY2kUo3F8FoP+iQy1Ic1PJZtZl
	1DXxvvQTcjwkhXw2ABLBRab6gHmHcuBiGbeXqJSVn/pvLqD+VM/csNfgZVjHTfAZUe4wFAo5wU9
	gzkSg1JYXFrkoYQkZ0cdNs/uNQuUu0kHSBAcL+zr1cfmnvxbzHFtqxsf7n+lZR/ZzzOrgw5nIU4
	=
X-Google-Smtp-Source: AGHT+IFctLqPBuLJF6Nxsz5V/0JaXeCXOK3nPmNtUEuY/xg3IxZOthUn0avC8QEHugYTj8Kz3nPtCg==
X-Received: by 2002:a17:90b:2541:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-31347798ac5mr23723759a91.30.1749563179250;
        Tue, 10 Jun 2025 06:46:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:27 +0800
Subject: [PATCH v2 8/9] arm64: dts: apple: t8011: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-8-a5a71080fba9@gmail.com>
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
 h=from:subject:message-id; bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMsQdFKiLqPwEA1tJnzjRoKFEp0AQi1eP3z
 wi6m1nq0HSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JEoWEACte2synddwWI8BNIKdj+WoQ/wrydjezbkYaP+CKwGuQvmTW7iQArURwkFLc9eqT+XOlwk
 d7qSM39EiXpQIxp4DGk+TWCQUpYlnyW6eD+uyUShC6zPbvRR/HkNIXnvNqP3m+mAPWUPZ3dA0tH
 E/Ir4lOV4idUgIr5kotrt/kli8Ot1bDi8PKWw6COcNvWIlcwB81ZDgmSBRNoulVcCh6FnSDmz4k
 KrVKZum3yekd1dLiHBbbeS5Ph77/sR0mFk3Q5c0gOV/bPxI+syGUMgp1VQo8OQdhs7HJvTHpwbG
 QGe88RlEyRjxFIx8gQoy42tKE2sNcHMgczf1F45MkRaVJON6mIJ+hqw8R6iNOCjeAFGvniaVZkj
 6Kzo39oQJd05no+mYMtasdjxbS5U0nSEOODdRCgKiC8bmV/RoMRsAG8O5CbXAAx7qWQmP+J+FUa
 TkW5qG1upQKoUunNXM2cwZKKRONCwCmCxTTMqrroVEPgi1a0vv2uJZyuqbUxlSd7qAGV4HejRaC
 8YntqXNp3i/pbHSe42+5VqOqJ7/2aq0vjQoF69Yi/wRZtn2DNrAeVw5ZkEriw10ea1vbE8hs2xN
 ACc6JPZ8QhGLyZmzqMhzlU3sBUYaNp5SgZUhS6M7rxmezhZE/+dnYmtA1Tx8mQrLmchz+QjKZTt
 KtUhYdoSP/vhqaQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..039aa4d1e887625e7b6ad789bfd9aa032dc58d01 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -168,6 +168,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 230 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 231 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 232 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 233 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -204,6 +260,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(211, 1)>,
+					 <APPLE_PINMUX(210, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(156, 1)>,
+					 <APPLE_PINMUX(155, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(58, 1)>,
+					 <APPLE_PINMUX(57, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(158, 1)>,
+					 <APPLE_PINMUX(157, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0

