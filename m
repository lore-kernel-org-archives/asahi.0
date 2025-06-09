Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A15215F56
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481131; cv=none; b=NAFYCxf3H77vdYqAk0SZ28OEw1YOj0v8J6DGJR8JO4yJaEgeSZjEUMjMPj8cKDuEU3S2iPvzubewHhPUNu+FIHzrqQ0o7a70rLUvyGwLXqsVhRS/2Vj1bIiBJ7KGP+ZrOIw8xXhJHYS7UzsYy11zR8tiqio9gEvlU5Y/mt6N/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481131; c=relaxed/simple;
	bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+oNDsrIOlB6hZ73buWCggs9OrDFr5oAAUzlrGf1HKIvfixxQrnHzc09xQrqyjZ4Fq9LWQJuF1eexIzxWlU0JqZqGFU6OxqBmyoAtLw6vwqMPil9Pw7aZz++KUWmQPQ2PE8qJgT/8ENsSTanlcV+AMN66NzVDLXJscJ2lejPPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iECUrGae; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iECUrGae"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3494815b3a.2
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481129; x=1750085929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=iECUrGaezJ7vekKgosrRg09qG7ScsY1qGM6s81dD2AnhXoSdJmC9rgEyowzZq4SH3C
         JlxEyKeHtVEdHcbqxNwzXr0IezR8VOMO3STLF+EVsj8+wrCMh2np/Z/dxzwJ4rc1j8n3
         BYJ95ZMMR0vryXr40ujihBcSIthoBd5n0Q5jotHQp9op9qlF7Flpxjm/9ewFmHiaM9+s
         6UMURIaYTqINPnFdV81HShfk+xXXmdHyHdPB4/i84aeh8tlf6LFROJ1pOEJ1IhTo70ip
         951lBQLF5tjxTJR3QQppnRFbe3uyZU7NXkcxthF8V9dzy//z4E6n1RI1zP5NGM4uU1iw
         Cwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481129; x=1750085929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=RGpOsotPhHR1NKVDvu5T7rMSmExwwwUlcRP1JHroxDf69RXTUKLPxsUrd/I8Y/N3QD
         CWYq9tP53YQHO5a9JdW0mjGn0c8i2L2ZHK6lEzomS11O80alF1CzlDn5Keni6z8T+g0c
         rbJ1L/J4vWg9s4iBRRNPg7uJPMDI3swA9vwsQ6UE+8aakVIvdpw7ssrxRBW9Sb/8/Jm6
         LZC63OtEBUtQmT2u5ODQiXyY99g9kaocYWj3iYqQtr5BSjNbPGMwiVruiJ3IV1JN6YEt
         MVkbUEpxMRqu6saW9TPmMPuxhgfIiR1GnyrClImQOgWvxQjiiZU7aFiDS/m+ZSBNZcVt
         mFUA==
X-Gm-Message-State: AOJu0YzfdVfkxkvi1i5ex37BxUB6mEUyXz3d3QOJPk3gTvEBKiY+BZL4
	x5Cht9EtLHZASN4dRjxuIhazTeqH3ApglTDf3xJKY4DYtqmVMh7NFXR4liCXdQ==
X-Gm-Gg: ASbGncuXpSpfUIlGHymBFYqGvyoooNy/LM6rSl1K/dtPMu1FQ0l/6ZamQFW5bjsaeMd
	ntcCcjAfsYuZrhEw1tnMY6RBbS95KR6M+UVF7r1Wq20oe/QZAw4wBl5tb4QfiDYq8fK2vIiJN5M
	Bu20Elv04QjPMyV+oA+pW4E2iwe61eyDMMwsWNuND36nLUGEvAJ9WYNZYghgw9SnfIgdiawFyea
	cXDXuq7nKV/5nooRPHf/BFlBHRuy6TbTupyBk28HReLxXLt6dxGc0rTb83YbgMv6A3P70Rvv59V
	679e+FakcGHL7QR60Vd234JnHmpxcfW3z7NeVw5EmfycGgI1LWZ4tptKpGgQ131/
X-Google-Smtp-Source: AGHT+IEwCZJue9fwcjQonzqN1xhP8vKvIQlVQWXej/FdfQzVhn5ZWjVS9YMp6WNHGbn4p1YNlDhZfA==
X-Received: by 2002:a05:6a20:a108:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-21ee25ed279mr16540950637.23.1749481129278;
        Mon, 09 Jun 2025 07:58:49 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:25 +0800
Subject: [PATCH 8/8] arm64: dts: apple: t8015: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-8-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaO8SGlIc2XSE9/A37sHSQIj212EpJz4zTMi
 VwBw/QSObSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jgAKCRABygi3psUI
 JHD6D/9dYZa9dMbZdgIf9ev4sHn254ePe0v0emWfbCY+2jG4gIQOekixwqsIptjddnqFB8nsOwb
 8i2Bk5DS+DV1n32sdO1+XyCbMTVj4JrLxuyl/kvIE+vE5C7mtREuojjDEIZnkF+TGuxXn3dOpxr
 0Pt8RozEg8JwhkE/p9ZOH9zkqf6U1LmXEUPclnHMBr4F0cGXcWp7DTEk2Mx+Ne8P7QHMZyMraun
 ch+itHCrFsKNIifBY563o+z+Bi300HbeeEp32plusfU1ITJYIqzTvQWHn1gpG3AJ/u0F3ZUUZPp
 6DwMjUDrE+DfN8H4Dih6VD6sPuUYj2XEbLvtjQdhIKz93+mFDl8V1yziDlSgY/z39kYyTq3NhQ9
 LfJQ/99OH0s8dHzNGURS9yLjiYx4u/6VKjCIs9ZNhkywekDRi53f6EOD5pBQ4eWyyN+tempF+Lk
 hrev0lB9UICGBbA6sDiLLEDiQe3Qp/X1r4wRk1VrXVAnZkn+6k1pmox4aoSvHR8M/yhdIIUViAt
 L1u2ZQf8D7x9DbXjM0uideOf5mpvS29ES2nrYHJZQ2FiDgbWHfGnkUzVqs789stBdhUZUhjhkUW
 KQMh5BTyf1SD3L5DCvuAu3T8eudi3GARzVKqfdk9xJtaDTpSgKwl7jWdwEXh9D/I9WtMEMyJPsp
 yZ3mXkRSBcRlxmQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add I2C nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..e002ecee339013194537910db2168c143ab3d00a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -265,6 +265,62 @@ cpufreq_p: performance-controller@208ea0000 {
 			#performance-domain-cells = <0>;
 		};
 
+		i2c0: i2c@22e200000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e200000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@22e204000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e204000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@22e208000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e208000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@22e20c000 {
+			compatible = "apple,t8015-i2c", "apple,i2c";
+			reg = <0x2 0x2e20c000 0x0 0x1000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_i2c3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@22e600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x2e600000 0x0 0x4000>;
@@ -321,6 +377,26 @@ pinctrl_ap: pinctrl@233100000 {
 				     <AIC_IRQ 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 55 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 56 IRQ_TYPE_LEVEL_HIGH>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(73, 1)>,
+					 <APPLE_PINMUX(72, 1)>;
+			};
+
+			i2c1_pins: i2c1-pins {
+				pinmux = <APPLE_PINMUX(182, 1)>,
+					 <APPLE_PINMUX(181, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(4, 1)>,
+					 <APPLE_PINMUX(3, 1)>;
+			};
+
+			i2c3_pins: i2c3-pins {
+				pinmux = <APPLE_PINMUX(184, 1)>,
+					 <APPLE_PINMUX(183, 1)>;
+			};
 		};
 
 		pinctrl_aop: pinctrl@2340f0000 {

-- 
2.49.0

