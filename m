Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091A921170D
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481128; cv=none; b=Qoxl0LtGJLMWVjMYkkpukZa8ynMpE0WsYW70niJW6ingVHMQnJeLTuCqHT39g9jEwW7ikN7XbNsj+lNVzHTQURfXUt58d0UdwDlkl9MybjGs5fm+oFXVKb87OJzLe+3Tc3RVUhat6KvCuGCfIqiCMKw5vo20mQuMB7kAgTj3oxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481128; c=relaxed/simple;
	bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uq377qBXrLGGTdZ0GUaYgas8ypynsi93J4JYdhWUO3rhU+es5RJTihNcXmRFHV/iu5e1obFyUzAaJcDJ5T81Svez+4TiWUpwcb41kUBobLFumhyY7FnJP6+6N/MU07m85+xexBbNBqU/WAIi3OVQIGq6sQHsRcgG2IOiOdkyF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkMUimXq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkMUimXq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b1fde81de05so2250149a12.1
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481126; x=1750085926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=kkMUimXqDk0VmpRPDfU3FleFCIyCcOOuBndcVVaJWPtb90hAm/Ph/Y0vFwQHOFjPT+
         fDR/oA97B104dIvvJA/SmPXdjDb1CejNwtySPM/I1C9ltrvntx0WTNUNxsTFpLCw4/ga
         wqfW7cR1qbu2Oz3RGAa4I5vOqRke0Hel7Rei0LqwS7AJC5/YzWSkImBS+Ky+IcQemZ56
         5xUvT1yGzd+zCvb7bRdkUg09pVUQCB7IuTh/0yFoKKUiKGFE5N2TN1dC2wbavlOnXtyi
         KxHf9Q8MHtWqB106D3LfACBYrjyKqLqjhhl8wqG9LBKOtpB0kPgVr5+43kIgjI/U3fMd
         Rc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481126; x=1750085926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sMFXHUz8KDvmIU3TuGc+vP482++/FCK0k2Er/8oQMU=;
        b=CRruvjfuEflBSoB+q0ub2I2F15W+J88urvnYFJuHVN5e8SkMt4kxgLlRHsphHuhD2p
         4yPMCVWlhPrHWeYfE/hBFQ3edTD8YuwAOLiyrmGrl0mGnIvrPTEek2yOiZGYIh0hRgKV
         u+5gsw+1rFx5MrtxdNFBDAFascWChfXivI45Fi/7NylecyOmivUPhqqjjbWrEtXCB0FI
         iL03r20PUXvu5r2ngR8wVemAmig8aqTuKnfdRJvyjEaIVoTisIlRXxG/nCocprlYtae1
         1ryYfOyU0H4Es+06g5Eo+teaDV9+Qh3mVR1kppUrzb+pmdZnkdEU5HLkO/0RjvJJXaWv
         E4jQ==
X-Gm-Message-State: AOJu0YwUgUvalEdffrOH16/RtSxkbrDBKO4gXy43TdFmfkXpXKgwmxDV
	6OimxSP0hxeCN373emBfZPAWENuHZUQUuvf+fnK1C+NYLUoWh/RgPCB/
X-Gm-Gg: ASbGncta7Yg1BXk6YKkbXHDkN33Qc+1mmootfo1Xtl3mnPSrvxvb0Va8kOzSNQR2kld
	y79lIarkDrlFfy1Us6k0PCir8mMDNuVCguf5bi2Eqi97Xo1mLH3JMtlAoV1EAtf7cyIf0Rfb8YL
	7h97iIbI3W6XnSGS/t6W4nhpWZznM4s83DMbzbF7ispx3+oJ8KLpCqKAp4HVCye59m5IOvpUvBi
	WRcJ1lFkUUWWVa9/CRIT4YhpAbTugtln4sI68RHdJ7OSIXnr10OBdvhkF+kqjAMCH+SZ2CMsb3x
	4V9MNwBe8rUbECUptitiYIiMwNvGy7HuVK3MhgIsi2Xh/U4A90fWZw==
X-Google-Smtp-Source: AGHT+IGBZzq1ANHKFw3JS3Ua5Fpq+25+H6RoUvZn8edzoteQNG34BeH1Bc5nGHzvWdQwdG05P8wYyA==
X-Received: by 2002:a05:6a20:430c:b0:216:5fa9:55ad with SMTP id adf61e73a8af0-21ee68a46e0mr17972971637.39.1749481126387;
        Mon, 09 Jun 2025 07:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:45 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:24 +0800
Subject: [PATCH 7/8] arm64: dts: apple: t8011: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-7-789c4693106f@gmail.com>
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
 h=from:subject:message-id; bh=v7W7ZvqXSh/jiGyI0EQo6XvMCTg7kLe+e7s4TGkVXGY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaNnSFY/hJQsThDJa8Jmnv1srxL12FNpeWqx
 si5CL1YaxmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JPjED/9Ka+qnK4cK9jYUA+rQbtCh02n7I3z0wriS28SZn962M2wJ1QE1N5EVeHJxmae2hQHvYXO
 EAjnBJtgSUbYOG52OfOl0VA1hWKga/D3+FetxW2Hbio8oamzt3x2S/fy8oSbqR4C23yyAoRR/wK
 /vQAIfXD82M3w/6FR6r3uRsvD4Q3LlsWNPOI9d5s7nQnb7J6eUIEeZ5F0nj17pXuW5Rxf0zM5Xj
 ZacebmCSHC6DWTamr/qgy2XsxKRsVYqZxAiLtLcAZaGqrZHKRCDzOxNWVpJD+/eihAU2xgZsMh7
 Uuq6oxwA9BRgNfi+xiC4BJG5TOhr31BSy4KmH5Ur/wbRTimWgx1KMn2+BKoTbykU8QyCZ4LnOBC
 hx+Phbu0vvOJeSYiiK62y+mFlYTrblwl+ixnwAweiU0JNsml2LGujlqp4s9VB3SSSOvytEkL9xo
 oaeWBKfFHRS4D74gMpkNHI0F+Ui6BkPmSdtr9Vwxgb+jWfbNhzAzMl2aBU8Q0gBqAptUqaUGfua
 9poqIUvIC3p13+UFoDpI2+oN2obLuxNDMQj8WRfr6mTu1fKbOe1ePUN9WploUVettQV5oICoMrF
 gBKDZaI0flfy7b73N+sKOFbOfFOwYbjcTUeXVF7V7LGYXFuDLruBtb13XF513aYSqXIsn7WYhvY
 V3aaG9IzYXbGUOQ==
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

