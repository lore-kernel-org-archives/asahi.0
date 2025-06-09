Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1957E20E70E
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481125; cv=none; b=bZNTVJRFlPFcOnIbd3HpWOPcrz7IC2QJy72SIIryYkrT2AhLV/T/gUkjsZgxByG8KZ5M43OnHPPPvp+4y8DlQ1Q/OVDGxli3tNqij3TBr0lDUC3IVII0MOTBVp5UBUE/VCnH005fnZXTIsyOYY/Mmk/Zhtxc/kMm6z7UpEXA9Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481125; c=relaxed/simple;
	bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGMDi4zNVstKRud0++7K4yi9RsvDO26nDJaPoys/PdrhiHCPBfJwmuBQFM2jHCNqo1DiVSsiPgwu6R/MOVBL+jYK1OPbbG8om3J89GdsoIKEZAZc4e6tQiHxh+AkzpEvGV3Dqm80zP0W5xatOcTv7qJ7DHsBybqFMnOVZv8ZfwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOCXUG4m; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOCXUG4m"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73972a54919so3667615b3a.3
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481123; x=1750085923; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=YOCXUG4mTQy8c04SMgL2CFJJ7a3Q+3oxzsxsLn7CB1rStWcB2aMTEMMOMC/OzStbgy
         lf/Dg0AvuZDd24dOS6cebpl5TRuIyDJI91M1dFZrCx06dGupJfnUsehQCPwZO/xbAVU/
         z2Ya48RcQpJu9Vqr7yHYhUqgBgkQDG8Gcsis9mqG4hNqw+AXHnQczmdSzCoVuTwpYy7l
         SrlgPXfzTNNSWD7lMMoKHxoNtnOCMkFOgDRgYcjDETmhrtCHdOLTsLztXcjn2XrX3kJn
         31GFfrLlyzamXA95ULXDOi5tEbHoTOhebjwanmU7768DdI5TEo8xxhiouaZximu0ZoYh
         pV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481123; x=1750085923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=CM2TC6/vMuk1+SDzA2p/2v2+Ih3VOA1j+yZ0IpPF2hQERIMwojbnpK5hO/k+aJ6urB
         Kq12xl7c6bzZ92xXfuBlaG8akEFGNvq/V7yGTlPG2yLmNs5aCIzmDdGiV1L3GV2dhSkP
         oFdxyyF6mNKTOTtdk9/6z/4q3BkU3GDhyimkE53BgUb0mqQNhvrhxH0f6dHeMvmeLR6N
         GJmIjorvh1tOhBAzBh9pwac5qGJIr3X3ubUq47WytAmXlUXXdDrjUsC8adn9KvyIt3/x
         gL40sKsgkrVbv7w+3RUpJclaHXedFSD62QRxIrBRqiF/Lv2Y4Ih4XB2i0/m9GXy96Z/H
         I91w==
X-Gm-Message-State: AOJu0Yz3HBrNNY/bR8pjX/vw4RaSgFUKZCKkIfVeLBpmI4+Ch6DgmGO3
	eeHyPpciVFXnmB5LJX0pq6V/FcU9BTflZa1ej8Ih32M7JZcJ0BDraAjK
X-Gm-Gg: ASbGncsNnMoK9uQ0APNUSI4rwgyD+DwKlds7qXIR/wmJLrIQSS0rnE5y0KREJm6a/sp
	zstjye4dYfbj8W2M+EB+4KVCQvBvzhVPb2qe4IQMrCyEemyMhpXeZ2h6jDIv58mlAKkumvzitAG
	aR10v3fMxARmIzPd3KLUF9WTbLa39kvvWnx88EhdYOktsoFloJO6EiJaWSeJ3ekgBDf+JT2sYNc
	z6JfPvMxt36fAeBxoAXEvvSO2WPIXPPNRTdWXl7qoowC1FNbXTlpjSu1jRa7gq34i8iFbvtb16Z
	5jV2RXEJ9r0yDsAXncEq1Onv16KNyCZNwoLQxoXnMOfu71F8k++Jzw==
X-Google-Smtp-Source: AGHT+IF9V5FoejTbOfgTUjSh5U20o43Ptpx1VS9a00C7Lf/+wYzzpDCkG5fAahS0c0GV/Yg0u8lHAg==
X-Received: by 2002:a05:6a21:101:b0:1f5:8220:7452 with SMTP id adf61e73a8af0-21ee2547255mr20009310637.24.1749481123353;
        Mon, 09 Jun 2025 07:58:43 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:42 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:23 +0800
Subject: [PATCH 6/8] arm64: dts: apple: t8010: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-6-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNS/y4iX29gS3aAIlLuS58cEiUPGQP/jsex
 Np4+5wNe8mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JPk5EACXhE3ns6xwOWxDALCCu/HydSPQI+SziopTrLwhkoVky5weah2oRrnhihfhVziC3xdrI+z
 IJa9shSE5S7AfojRmc9fe8s26gbaScIHHSl6ZqbhBr/kbVSv4fmJweUfCukJEka0iKqN04zTZYD
 iDcoeGgS4Ctjj7iNEmvQQGoMuPPCaUR87OsIthu+17z42Gl5pZZQqsvZWLrw7tNAbMuRHmsgb5D
 FxM56no1fDTBY2DIE7ht5pqtRbOUtDWUfgOWFRNZRATQciuh369b+CDmh7r5OeeC/77qtP4PzBD
 +SzeU4xpi4Qpxq7Gdx1CCETXYNImqBGvp0FZ1ljmPDTCdc/fxW0dPZIoz6ue8sgI3sWYd6TmbJz
 9hN88ksYTIOd+g9u8IkrPT3euuVJScc7Ewj0YYMy97dDt78TJDchZEb+vPok4pnGdjlRhDeSGaC
 Ad930c9tauNNaRoOgQZc8Zz5E5Myt8t7Eut7xJKXxzUx8M44nvl/LHScUyZ3mU+aNKqknYrtrRo
 b4nerPh+OnZbncrFhuPSaOdkqDtPCbIojtsyqWbPHkliRdfcWee/wWcP29+YdL2xmTgQbbZORt2
 spOZs9LzNyDnRqwjbXF8I8O8QdM6Fz9q3jG7gZtMVpi/39xN+ZqUmmDC7sauCcctLjqkHBt6ZFQ
 KvfxcS+KuzlpZAA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..522b3896aa87eb290dc831cbbf2cc8e593844097 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -164,6 +164,62 @@ serial0: serial@20a0c0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@20a110000 {
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
+			compatible = "apple,t8010-i2c", "apple,i2c";
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
 			compatible = "apple,t8010-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 			#address-cells = <1>;
@@ -207,6 +263,26 @@ pinctrl_ap: pinctrl@20f100000 {
 				     <AIC_IRQ 46 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 47 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 48 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(197, 1)>,
+					 <APPLE_PINMUX(196, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(40, 1)>,
+					 <APPLE_PINMUX(39, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(132, 1)>,
+					 <APPLE_PINMUX(133, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(41, 1)>,
+					 <APPLE_PINMUX(42, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2100f0000 {

-- 
2.49.0

