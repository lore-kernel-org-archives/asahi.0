Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FE2BEC43
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563166; cv=none; b=Z+90J+FyD4/1Fh6fGjZHZMNn4d8+crP7TZznZ/k4aknyRegWrfERGXmDo+SBm6qVpL2CcOOFBqNijyOBe98+QsZ+8su9cAViTM6RBgtUUNZrSOJGZ/QUn2fh6dt8Y/vs3R3epuJXtBLSS05Lp92erHkpWfHf+i0MWWhdW/yGtOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563166; c=relaxed/simple;
	bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpSnccNPOZDzUUs0959eWcMT6NHA4C1GqdocsmnDiGEVlisISmyQ8jzALmo8mNavHKHo3KwjWE1wai6lPHJuoWbGhYqT0L3MscS1f6JcRkMyyDSbooDxWiPXwvF1d0QLthxuisnm5bockRcWpbNQ+gWUQPOUQiRZ8CHW/Ghbps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjXx1f9f; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjXx1f9f"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235f9ea8d08so43594825ad.1
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563164; x=1750167964; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=fjXx1f9f5EresOAf29yRRMZIQvy+8gIIIZP8/Jb9Lal/RC2eznBRWVyg/g6ktpHipS
         jlYgXHw7N7Wq73wBlHr8z6S+Gl8di7buVIrojQJPyGnxKDzh7zUTdIAoaQRBe8PlcYoQ
         4z0PKAZV+RdTiTN7MdQOo3md15RefS+LnaqJ+Agg7T4MlDpYLOCzZfCdYGLx1nlFp+vI
         8W4whrUpdb0/ZZauzxi+BLVGXC0r1oQBCecpCzjbms5fz8F9RavBRot9GSmNmtRrCG0/
         LdzYW9GvR+b3MKZLUfQ4BpaT2OWFLVBYNCtc2iD5fXzGi8wuF6GDZ8oYLQQUXdN/QWev
         N+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563164; x=1750167964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=K9efDwG3aXaCk04eM5RYkCd8uCm9ldfpAxaukvbYXnPMoYM2Ab9fsLoCJVl44pqr9m
         +kAIY3oFeZqg7nUYQsNJ9/BrOXXn2m7xKVMqGkdhN8vcw8juZuLq7DkkuY7YMaS3w4S8
         mJjfLUI1PmbZ6pmWS7pP4KDOmY3V7tbWQRBiJ1A5lghpFNIEJMR3YR3z1Q2SJprMHU0G
         aTheFQ090lcVrkwNJOBeoyR7L5qzMsh/rown93Q3ptSSbkLFj1G6yzgKUR9KuRyzWB/E
         7CXF1lTEG9cJNjlk7qGOQwWWEHG3Wp3u6ITfAsid4pGZTk1novNGphPX03NHqzZuJasY
         OUjQ==
X-Gm-Message-State: AOJu0Yxyxbxt2snVK0yzLXY7YJQ+j3MkSgQ1wwnOJAcaIuM4TjNXkIOc
	liyMfYmPU7kUaB5xqDq0AoD47CBevhKhwylNIxiprhUMIlBDoAYJmIHCQjwW6w==
X-Gm-Gg: ASbGncvy3pnJg9R9k6cFIkJdSCUwGnim7y1H/h/TWrqD5j1wMqAls3VFbdeudr2ZKmU
	KnKK4xLdkiQPwfCaolCTif6fb6UB7GUwuJcp+1Yo2B5E+FU9ahlAoVAWRv7LKNo2/4OIx1KHMyO
	oAQ0/i0ZptqsY9PoBMHGWBDOH4KRqPwJwoxEB69bqhJTAd54lEJ2cEvK9vrL+nTOL+2AaD9xTP7
	t39aYcS+wYxtG05hTO7D/+kSLkBIg26eYkG7gz0N8xoFzBnataDJ75G+SyEHlOZEoleBoa56tH2
	yoVNGC6k46eG8UfxCy2kuSFL/Y/x+NbgfEC4fIL81yoc5toUz6IfERdFl+ooSUTHWumxomOHEWA
	=
X-Google-Smtp-Source: AGHT+IFwMzsCYgWMT+CFDgevF6YB6l29l/wNFrIVqtpMe/DF3xOkCJ0luh7tYQ0NXpZxazDWxZ/x2A==
X-Received: by 2002:a17:90a:dfc5:b0:311:b0d3:85d with SMTP id 98e67ed59e1d1-313a155c54dmr3919205a91.2.1749563163919;
        Tue, 10 Jun 2025 06:46:03 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:22 +0800
Subject: [PATCH v2 3/9] arm64: dts: apple: t7000: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-3-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLe1rL4B1JFrm9RkyAgKXRWPFtMJrW8tM7O
 MExXyABjfuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JHcaD/4gnlucLyaM5enMPneKiFJG69Dk2MBczinSUzhxA9dPstTau2WigFdNG3O9Pn+gmLBlWd6
 hy9JF8XSapJ0lPUPw/tr+0CCiYrDSgKCK/xOGnx0/Tr+1Ja78stzi3IiE6wfnEwhZloRsPzzv1U
 D0i1ALLQPfboCG5Ozs8shcOY7yakn9Yr+45FRBAUZOA+YNOfjJAqb+Cm+yd4Zajy3EIaZ4lvhZ/
 ckdtWVV1j3QCKPe5vCcdbY6pNjRYnQwimfz68Cxko0KQMRTJJsG7CtqnXGNc8LMXi3IwNYHkeaI
 feK6nYhYOrJEUhlvvGWpCYyvK+DG1TcHUcD13L9gB0hW9Lp+KvIGnTbMQevtA+PxKWNtniDryMq
 YtkmsSum2xzBTnw5fUG0vRW8HV/ANeXCQmmIPtFFZaEgwE5u2Ml2fNhoY71nT4FkSOt9s0z9HoH
 KhNo2reB3Lp89XvbCDN1jG6awjhWUTBd5UbMZ8RKwu2E0J3080MkxEKpamIPKm7T0sxe67wZmHR
 krWnhiLRVYgo29SE3N3cYcV915uEaqlFJsdiR85Wm6J0p1XyB0LuRLc/PVznIjs6GfVENGCsYhT
 lozHRfibRaFR1RWOluCdZ1PPvpwS1FqUW4JieYjC/3pDeb3Vz9CIWP7iI8GNfrfqY6OG/OqC1Rs
 C+O/+TfkQCufZLw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..0342455d344474d34f7924a089bf5f5915e68d55 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -144,6 +144,62 @@ serial6: serial@20a0d8000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a110000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 174 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@20a111000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a111000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 175 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@20a112000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a112000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 176 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@20a113000 {
+			compatible = "apple,t7000-i2c", "apple,i2c";
+			reg = <0x2 0x0a113000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 177 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pmgr: power-management@20e000000 {
 			compatible = "apple,t7000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -195,6 +251,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(97, 1)>,
+					 <APPLE_PINMUX(96, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(139, 1)>,
+					 <APPLE_PINMUX(138, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(65, 1)>,
+					 <APPLE_PINMUX(64, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(87, 1)>,
+					 <APPLE_PINMUX(86, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0

