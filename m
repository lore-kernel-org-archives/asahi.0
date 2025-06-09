Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097031A3148
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481122; cv=none; b=tLvnGQ5P+LbS0h5M+hshPDwcAGelxWxEd9NyxCjrbMRML96GfxGOgbmF2RysEeNxrIbmTc6BqDu5niKqDQHRj6WuLkFYSAB4hkew/TkSLAnFIfnNPU1yqNaDc13ws40sjqnLW0F3TyCa+X6xr3cI06rm356GrCoW37GsdbE9yoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481122; c=relaxed/simple;
	bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeFYSzvELCiOpW9h9v+6KzYfp6HG6oQfiBPt2l+ugCdEkLEdBBaSB6QNJ0rVTNAgmlbC1PH+IkuGj34dBikcpT6fUAUsnw9ZL3OY/dnR+xzMSRv0FAI8plr6AXpCHYaEMnK8Q5RXCDaOVMtDImaq+nYz/POB3pwgfCJ5T2eoLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw6UI7hk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw6UI7hk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3858707b3a.2
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481120; x=1750085920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=Nw6UI7hkZhhS7Pj3W4RYirZ/yVaRVCdtJMJcso7YfzWKmKwdsWE+zKKpHAG7w4VEbs
         DoY7D4jIEVP+5rnI86mnCzKMhpRl/VNDzVBFtsadD+vxzFbQcRttVNjz5QBQm/yQ/Osq
         QGAisMSHqed3b//WgKJMhBpDmZELL2cLwUcgRn3Qot50iEPTci+rfxT1tYedu/4voepR
         PsZqXJNyUSqh78SZWeIqxr+vWijDOxKOoYA/C7caDxB2zXKCLoz75f1Ad/tZNwKnf/RC
         oQD8vs0S+zhQAVvNaRpB7NUrcNU3eVAIEn89+9b7/Zj49BMC9qXLfhF8dmtos6lH5qYR
         cmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481120; x=1750085920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrR2QAmfRh3lFTirpBx1xNHf2MpWAAAtCEb1yKcL70c=;
        b=NflQKLNhpIyjVOqiVykdl33eegImMB8sgzy0X7BJ/Xxd1mTP6xOABask9ZLhZQXRRd
         D5y36XLrz5R95QWb8+kjmS/2sZCjxuaxD8uC5MEW+yEn9mixfLoZion7clwkEKblgvJs
         lob9y4bJM0bwiaHkish0ODDwo7pfDDhvuJ1GGqoSSLxwaNSJsDqGrazIKAkRXuKhPXVg
         SFm4fteAPca1IV9IrZjdsoeczbxHwuLq6NDKjGlmx8NSaXm614YWvLWVI3/aGOUt9Vtx
         Epl77lHEgjVDN4/lTOPE0XA3XaCA1djZZjrzxMu02XrEQqptYW4W+Pn+ATZ+KXTu0yJ2
         G80Q==
X-Gm-Message-State: AOJu0YyyzT6s90dMnlYgI3Ajyj7HcTZDgV93OvgvBclaO+u5NB1B0eST
	rSApxrkMxphuI4DhG7Dup7irTD5qU/VixJgEQW9/FaTppbVgwr2dUt4P
X-Gm-Gg: ASbGnctIf8bE45OzfgGhPcZcxcblhQBxfDa9kugTqyrEFHM6OVg0FWM4ZdP4lmO/7kg
	gcZOw6kggguidWV+MGRhuuK9FCMx2+hJ32sqxOb8yqaHsqfQGIUMLV7TJY9m9qFJM1/UuCS1BwY
	G7UCnDPlmipfeIqoaCoKERqJUOsXNQwfCkzaAaM8iw4HUA9UUHimRM4L0BBQ0dLapmlc2VwcoP7
	y9u9lYyQrVa0Q/ZB9ogVG7ekqfZRk0py5hTkhraLFVSgjtVcfVbdHNrAQNoAeMdVi3FlxT5cxX0
	WSrGOV+FsUV3d4m+U1xwvKGIzDUjaxswwCsMT6JnsstvJ3giFgIv2qYel5adMdr3elb6+WaluIc
	=
X-Google-Smtp-Source: AGHT+IFw8IvMKNIWd5gWkVBoQRrM5vUVEUtBsHNh2RGRc9tiIamDx3Fd6bbvQwFp4qtR7pf7qpf45g==
X-Received: by 2002:a05:6a20:2586:b0:1ee:a914:1d67 with SMTP id adf61e73a8af0-21ee24cbe0emr22088573637.2.1749481120337;
        Mon, 09 Jun 2025 07:58:40 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:39 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:22 +0800
Subject: [PATCH 5/8] arm64: dts: apple: s8001: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-5-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9566gmKhrX9N7D4Gci4+NELLJwjkHJyrdvGevl4Fe5k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNxfcAbW3TYkOeYhxAMfsIgBzRWfGSZbef7
 23Ix15IJ4CJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JEAcD/9ErpqdBthzHsKIUK+k175hpDjDyj+anU1uwYkwJjtMAL9LwY43R05KWoiTW/n8S6oPVE2
 lzfDtL6xXQhdryBbbWF1sLB/OwB55cdFCE5at1rFudqKmns1IVdHjMVm3Vb+mtFbOUb9aEAXVRS
 x1NItqPe00vqoGsJBd7mzon+SFIH+8DquEzjt7Qp8RLJkdW+2EI6QzXVqldnVGrcCNsmlS5VAF/
 J9t7/YVXPAs5/y/+6U7lp/Q4/2DAOOu+oWCLLKFCdRA175DeKn/s/BxPRScookg+SY6u7gB8riF
 46pDcoPJtOXP38FCHM44uR5nospwFG3OU6GJp6pZ6UcYv6pxHhJdSU0rpPIsxvSd6Q9PJbuVJYC
 5huGMTnsw66AhStMhDDgQH1EazsbVAaggLG9h2yDfPX8P1bfLiMyHSGBgnqOxGNQ1tLuOzDB4Fq
 i9M/p2tNaeMGXJM3sZfMHvh5XHJm6Hu2ITsF18tgf7x6JZBzM9QcHs0zUW8KTRoaT1g66Gc+9gu
 5A76TnGMK1eZMbEhLOlB9zqfdluhiPsnR6pogyYBMJS6kgiGhBsGeHBktOOGM8GbCkw/Dvu1lgY
 LNr/vdwnNG6iPnrE1gep30gil7258s+kMQuM7W2CQ0cibx8oVUNpdKCJWQcgce67/1jPxZ0LJG8
 20q2BXSQ5Iwm3tw==
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

