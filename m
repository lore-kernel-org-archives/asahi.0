Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF922D191F
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563181; cv=none; b=jL2NF+aEox++aUrlcgBtJaz5z+6jj08HwVBJetJ5g85uv0Z+TAb51nrdTbZlXYorNk08DSONXF6YXJQV9OcH9af0vRwSqlmnwr7S21e1k+MqZMyJuXaWh5M+xJzffNToFkQLv9a3iEEUGZDovRpPDX79cFCtd1EZCV5ECBKXT0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563181; c=relaxed/simple;
	bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siDX5jdWmTXgomuB8sPEf+TNNQFFl9TRgxYHye8obd8p0u7xrFxwyZ1YvZ3jsQf7UIqMewCvPlWxjngEBHYvcuvb0U6KwKg+FZdA2kC6Z24GZ+tyYwgjXgsQgoyod2CPxb2PLWjqIaqq8TKsZ6yeM0HSAhlCXM0VQVl81mNPHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjylEWa0; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjylEWa0"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2e8f7ca7ca3so1876182fac.2
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563177; x=1750167977; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=HjylEWa0skCdwr++JPj5v4d9PmTS4pI2aiq/1EDwxlBZiTLoe/O/3dbdOiDfh/1NsP
         D5Z2bJvKOD2/Gq1tSSO4bdwJODYI0YNjlG1v9eFX87YYuCSpBcCc3yIXuwv2WCgYmBOz
         dqJwprlIgSSsOf3q4gBFJjKn+NKhZEWRK7cH80G2Q4MUN8ajBhbwfGAo1nnlzxRMMCl6
         f+xM6njFF+bNLR4JaibWI4w1BsaUhLAvGlAYR0GlBQv0qasikfzIbm3UxkbelVu+y1NM
         xmLBsYIk3t+ydEOBSzeg/Waqwvzj6BYkGTRR5VlMTHdwUnPQzImSA2xU2LprZn/oc6LC
         ZGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563177; x=1750167977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=uwlOXdeMEMEyk8Hap6niWcan3GukYmwPnXSSg07metckbBWD3PAL1KETINkGeLzn4a
         eACIqJd11NcALdxANtwaYlUCGoLU/+xV64wbaiRMQcX4HXP5cAg3/En/zCcIcnjEbK/s
         y1dX6xqyKUcTCWIMdfvci7XUIg6R4yD+fguuIoDBe8J91NnjqhSW5mntZfzg8gpjYqN7
         0rCKiijzFyjZZr7J2WYKGdwOpplpiK4c4e/AQ4nZxviamnpGB2iYsu3EjRHqByeiuHHR
         qw5KrShA020Jz3pwNVYA+u+98S3uGvi7W7EsPK9I1FvDrish0hpBEe5WdLaQSpeDACZb
         jLhQ==
X-Gm-Message-State: AOJu0YzJdctXrCwLbQb+McBf/dS0qbm1JfSKBYHpzS8fz3AC2Jvv9hft
	9n2tQl39z8/tDczqMJ1JcLx3S4Q0u5LTLdsN3QVQVncF5qpJF9CSr1Jwuk59mA==
X-Gm-Gg: ASbGncsD3KDMK2q17RM4qO0Kp7HzaTDddmJc0VUwcMQfnN6FCjkZZWKGcymAKfCuDZ9
	jB4PuenvgC2A3PuGY0tFWQg+lUGdE3ftbJ5S7Cad3cSzcsFNOSHPw723bvKcdj1UPkKaVy0rKHj
	Z0v1KBcdRtOD79xkuZSNEqAkCG+TArKtI8Cz0W64c5VTUC21Znt6uAsCNmrmY/DEgkgqFPavYR3
	gkV4mAo4M+DVlH8LUhRz9dD5O11ThR5FAlp2diFpCLHtzKzkNq4tcpsmJr79PuJVWkfEebFTs4Y
	1zu8suykzAPajeViiwbgOdhZa3b0nzFtfJmDYSgaLno4DqVB+S4rJlYOMEQ0q1huigHNVexthUY
	=
X-Google-Smtp-Source: AGHT+IEfTFb8zgj5xUPi51FTzMoYyKfdVF7T9yXKQ/Lb4kplJ4b51oTC893O7qoQI8dAZAqlSerVrg==
X-Received: by 2002:a17:902:e890:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23601cf6b9amr266199995ad.4.1749563167284;
        Tue, 10 Jun 2025 06:46:07 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:23 +0800
Subject: [PATCH v2 4/9] arm64: dts: apple: t7001: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-4-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLt4kle8AckLpFOCx/plMyGBuRFTCnZMMKh
 Yc8QVDJIRGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JNSOD/9j5hbFls9qcicL2VPhhzVe3osxN/UrGFIGMw7IHCf4HaJD0w1gRhXh4HQjyKvvX6ZOwC+
 qkUuhmvEtEZpC4xVYcGOtF849vuzTOW08lbX5Y4bDsqGUqP9fsUDDfMowyP28ife2pSrZZ9AEn9
 JNT63c4k+mIUqZb6C68vu0qhleMZwjYwXZNr3KNIg8HtBEs8TRr2subs7zMShRs5/K9YaM7e/Dy
 76WV9y31DN1Kq3M1W+E/F8BldoP/cCfKuKbIgo3o6j0Jirn2gIS6zUBecbm2pN9SbWM7wDRPo4K
 MbBN8aujAiXcmUdYT9oiCv77pJ5C0N9LU2cV/x+v67Bnyw5JMsrIiLvVTlrUrtGi32wMiEpKbkL
 64GjbuSpaBB+GFvtcrEZ4z4P62IsFLURKMJkwBNi/hEh2o6xxlT89pWPjyi4gXmYZPGj1sSiuAI
 6P9q3tKijX4z2JVx6mZUiSL+Ps3VzxxrPTHKoJfE9SfoEJ9KN0RhDeMiLD55RW2nPjsRssfHMob
 dNe7qR4qZd/RwcFpm/ra059PmWxbJeBzSY/Auhs8Dw0MuJr6Hf6lRUf5w6tvK8qTI/JdcwZjnFN
 ZmfSeSZaZa4clQ1vxK4wZm6uhJFg9y+Oyv6UnZAXzMQQhRDtuR3SD2iEqMnuhwt7/36vK5v++LX
 uycLH/+4NU5eh3A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..e1afb05423698223ebc15f2ae347e73fb46c7c24 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -144,6 +144,62 @@ serial0: serial@20a0c0000 {
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
@@ -188,6 +244,26 @@ pinctrl: pinctrl@20e300000 {
 				     <AIC_IRQ 66 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 68 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(38, 1)>,
+					 <APPLE_PINMUX(37, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(66, 1)>,
+					 <APPLE_PINMUX(65, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(133, 1)>,
+					 <APPLE_PINMUX(132, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(135, 1)>,
+					 <APPLE_PINMUX(134, 1)>;
+			};
 		};
 	};
 

-- 
2.49.0

