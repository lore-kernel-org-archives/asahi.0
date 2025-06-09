Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86C1DFDA1
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481116; cv=none; b=iNKJixsF7h+EzYoxQuoj3L8aa6eRs3LE8F5GIERq/4KibnEaLWEw8EPvrzC5mcFcIWpzfEbkvtkbxh9nwUvb3RX18j22+rd2OjAskRvci6ax1/6A3DYwb7zIQXyb8dRmXIswfn7Z5QAjpzSE0PYGVRW+v2x+y7OKEHnqhBieDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481116; c=relaxed/simple;
	bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clypSDLt6p+Hz7W8PdQn95rfyTF8YNEWrn8SSaudhCBQ+EGrZI/7d9r38GXgVmQ1oYT7MWzourR+gW6tAo+lHqx8Ek4duLoQj0deVNcBxXn0r3FklRzJ+05DhTVlSbm5vsEK3CI582mj6yllLP5Uc4g7tABqGvMDFiz+tGnZv4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVuz8Q+W; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVuz8Q+W"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74800b81f1bso3326270b3a.1
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481114; x=1750085914; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=XVuz8Q+Wlf7WvlPJDELYRwinbWf7gxEwvHQodgW+o76KkeVL0kw4pE+K2I7pHHZe9n
         6bm077UvCfXO2lFvP4SPDi0e7A0Oi2ptAe3EoioFM9L98m7BqlMMX3Wt62egM8B9dm0H
         5mGf76S3WsI7ndLvRRgJAhljidviSu4YSAJFHhK3FpFAUBhNwf2e2bbVdyNQVPsd3U40
         k7spLa0No4Uf+cX5JCmwZrUtQ0j7WJNI8WrM/5AiM22AmyjHank4dn1n85Kj8wmd8HwE
         fWVr4KMGVQOOonyIM08gd8f3Hvyg0wV5w2lLTqnvE5zyqTsDeSFwxAMKBzCVDKhSLveD
         VcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481114; x=1750085914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YITmx2LfNpYIIQRDNqfocFPIjztXd+JwPnZTlfVIKV4=;
        b=S6ChP4nhdTm3p7d223ZMjjFKITJlo4L3n7Y2apFs51i1rnSs1HCW1t0fuNIeWdtjej
         CaZ9CY8f+wQZ7vo1vJHARA5RsU/gs1sl9G4e1gD77nYM66TPx7UvY3cuRAV3hAwj5tcE
         2EY2zwa2YaSEhYNTm2gR3jv5jh2c5FkahtAEQH76TW6cf8lk2DrfrCjsAkXTrioQ9xp/
         6o3pXT8wNRdm99VqrMhFjyfedgQaytWDs8dMp8D6tiHNQzc8mzExwzIba3OL7CwmZsjy
         P1N39cQygvcS8pBsJzYdFCIBt95iuRae0dJ76beL0gz7JAPlsNRURXAgw+GJV3ziG+Bz
         T89g==
X-Gm-Message-State: AOJu0YxOANPgAZAqHqx4rXf4KKqh+1R9HDYoUK/RLxnLuh8r1WdXD7p3
	ukSr7UMSPE3t14KlJsASElrzSywwxOsSkBadJtL7INCMr3MYhHBKK2uA
X-Gm-Gg: ASbGnct+mqYLT8X6aURrKFi34a4/5MO3xr5PpD8U3LUASWxljUXfZIThxjFslC+w1v4
	GQ2VV7ivEOeVQ+UHpfSMzIMHiPtMrcPTykDj5Pg7tKX2yTkTgLhvLP/rKuwY+XhU8pK6deSL2+g
	I8sHe737y4llrZP4lpb1l/Z/rx2OoehSfs9lgkkMSu3s6ne1sIJq26Q9rFSP8cpadQRp2Eq/svd
	VU8IVfq1llRdjh2IWSe2MWlu1IDiON6suRN+suHekSuQUhPh8Uknk5mAYUdJgFAmHPcWKTcce9B
	MD23XfiojcGSZ5XRTlD0tyWssHDGew1OP7X4wN0H5Xo43gf29U0eEg==
X-Google-Smtp-Source: AGHT+IE/bBsxb7SPwbV3RX+Q5/pzcK/F12ikZ+jKXpsOAEfLLD6uUBuxfP/CDuynUXh9qOEUNBQY9w==
X-Received: by 2002:a05:6a21:5006:b0:21f:508b:1a19 with SMTP id adf61e73a8af0-21f508b265bmr6728364637.14.1749481114166;
        Mon, 09 Jun 2025 07:58:34 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:20 +0800
Subject: [PATCH 3/8] arm64: dts: apple: t7001: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-3-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eFHOE+VL0+vUkpIqYgHrxunJPZC08TQl4cAYlC5H0pg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNrcrqpm0qmk6SFSpUNKyMHMKjxtl25i/nU
 wtZy/y6iE6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JAqGD/0TpzVdEq1RtU0+WgCAT4uKrnvpB31OMBsrOfdJgcJWX6PsBelC0wCB2F/UROMYKoEvVmQ
 9lShNr3OG/MBbCl4DI+1i8vk8+I9I68IhXGVODrzc4joX3IXB4f9zexc5V3vOlz/dTAQdssjl+U
 QmQvoDe3tNK/uyA4KfL+FACYIHOziC+EtAimW9ERtA5Syj6KLjDhLk1FdZ9eZ9s+5YiRnZ/DzhE
 OZfw2OEBxYk0XkYy150VWFhS82cZ2wv9+PQg35Qx+8kd9jp97umQWd/0KvPFAuVq6DkWCn9YAuE
 lWQlQ0TNsGujXuaF32PchZaeh+VpJcwoNGcdvT92kgIZwFiEP2MCeliPU1GhW0Pz9WCf8bH/GIK
 iLi7xJFV/UpzLIBoDvz2Q0cfzpND002EvcerNr8VK8ZpezEMu/PN3eZ/ydnCJXnpHB4ICM0diBT
 Qu4pdp0+i6eTF4fU7ClzifxtZg1mN59psOjzwB4ptlIspjItRdZul73hcSheM/lmjamDLnxaAMw
 f4xtDGsb8655LmcGvT28g1aUy6kGGiGSb6IdF8OVqKqfU5S+/1SZx/aI83iyjwYmBP+29D7tNl/
 6aTr/ht11oAdo9NUGBQ/2XlU7VUYx1Px/Wm4iB/X2vq0QkY+rEp0Z5QW8dDZBXyPr5VCezjEcjl
 rCmDiwKcxfxTGWg==
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

