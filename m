Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3F1D63F0
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481113; cv=none; b=RdiHuzrtfh/sfaMRYyYwpHwWU+jBLfsN0WrwLYFVc5h0+N/LR5rlGTKGo0vDCewbdhTsbJYBuEXXWHERdT2n3tSfP1LVoAcWPRwolMFqhXsBzK3fElriD1PwnMlysKbj7DZ9vDIZRAt0dY/i7hGeQ8ONFKaHkhOS4vS7EXBR7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481113; c=relaxed/simple;
	bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyJl9bs7xSJp0gtlxIuVeSgnUOsMJ7uwV8v2Bnw4r9iXboyqaeAi69LLgOs0TfgRurH3XqvaWSV61vpYv3rodf40Tw2mmhuww7jPw8dCZvWfLEOKTObWjWPwAJhqYjPLZ8W2OO/Bye10oTtobMLM6xGjvBj6eLWAJ71DmjIMfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSm/lCm5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSm/lCm5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2345c60507bso30827225ad.0
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481111; x=1750085911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=jSm/lCm54xFweIE/i3ViQGinGl4hBy7vXD9/YDJyVBPOms31qip1lcmZlBZrxd23D3
         qhqQMBP8ksIhBI2txJx54U/ze15GrdCyY/jJ+3Egq6Kz6wIHqycX6SxA9soStCfIkW5l
         GsJchK/bY0Vzc3N7LRJChX0YQ4pTPvVz0BrMpo+WsDYy+3T1/Mrfag3OX5io5JHCcTcP
         Q05PqmIHXoUVRwgkHdx7vwp/tpcBGe114wmYKqwpeDtGBPfiLRjv+jVTUPoOcFumtV4W
         CfmelD/dghgezOHEn1j1r1KgpsCjB9/X14EPcSkLv8LA6ByBP4nxYE1my9QzRTcztK5x
         XJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481111; x=1750085911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K83jFZOoULSQRfkDWiXqS6t5Jzzm+WLFtNrH9VIQpoA=;
        b=LZ6TYgQPHZyo1uXyUlVT7765fqnQ8jSWRErv7Mx7LETtMY6wUlH5nSRvbZVUASurSn
         v4y7q4pW8J/X/zc50qIlc6gNRbA+F7sc78uOwltnFtI6E+W5Kne2PEe3Pmuz+dvhKiIF
         CONLo3nU59fDaCPQ4DOmCTQ/4RpKulTbOGLCwozX8pfM3w7j582+TPNYOoXOdhvoHOYJ
         /cnLAYbUuOWLaqjilPYh2qP2k/xwDjwMiosEVeNx7oB95LVdPN98lLDObEQcldi5cwmH
         rV9gIGxH+UHuQOWfht2zhaHl8bYDwc5A/iHaJRp5u2C4C1Y/hAYvTWfUZ0EiBrhk7ulb
         84Xw==
X-Gm-Message-State: AOJu0YyP0AIZoDPChkPk1b9a+AJPNHVGPZjQYFSTntn0KvOgpDCjvQ51
	31li8GLlDSDURLzBfgyNMDAxa9A1E9ytVF6rtzxD93eA9U7VqgHLt2ez
X-Gm-Gg: ASbGnctwsnD/IfK3OrunW5W5y+2+y+D3JubII+5g9yQkJaGHsuZIebCpFkg1IkNb9Uv
	1nge1u0OLM22WTbLed0OZrcyUX2oyrZCVJN7+S9VLFULf/qG+3HiWjoKcQaJAcLx14fO2oDr40h
	Mv7s7SFCpxVa94pwESWt9Dww9EGeso2YyaAuFlK9bXS117H95kKPBmTG4W6jMp0NOMxhAHQ2hkY
	hJzFMYE3zri+M0JDwdHu0b0syB7zdVfFJv981Pv+VFGiKpq0KcRGYb1CM28BfOLakMjwyNXaTy4
	rBCC1Pl9d0bqtka/uH4Yz04ihRomcZfk6qEZqmNbP2XwCVhECJZjsywm0NTK5V33
X-Google-Smtp-Source: AGHT+IHudanz/AzLe3suzWuVi9ir1ppPYX5nivs9d5/PLR8B0J0O/ktF/FMnClKF8ITjSwmoanaI4g==
X-Received: by 2002:a17:902:fc4b:b0:234:8c64:7875 with SMTP id d9443c01a7336-23601d96e8dmr218896905ad.38.1749481111240;
        Mon, 09 Jun 2025 07:58:31 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2f5ed593ebsm5414182a12.6.2025.06.09.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:58:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:56:19 +0800
Subject: [PATCH 2/8] arm64: dts: apple: t7000: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-i2c-no-t2-v1-2-789c4693106f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=SytD8kgCuxXBBFx++xxWqqIK35ejAFIEBKHMJoFT9+Q=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvaN2qKaij/1msQFpC8wl1rbodNpvJi4tqcsQ
 XcEw1C/niiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb2jQAKCRABygi3psUI
 JDRaEACkXyzwdAoycqbt0sX7Vkmt+pta8E5FIvMUQez4KGhtDcZkBCEMb2RPYMKDi8kiMho+OtX
 BST4Jmo0b4lGxRZWlcPAQKnMcV4XNPHkk850aIWUyk+1s33ez33PnhD26tBRDqdLAdj65k4QX19
 r+gBYjAwLXrQptR0q5XxCFqSrSezk9FrfexrAoZw3WLEOV4Mmj9JPXj6CGj7JiSwUb4tq/MYAAy
 Hpga6eGvU4o9P8m0qAqqUnb/3mk0qpAOOuzWtdrB0ZIqjSSGoIsq8a83lMAi7NoAHgHnlEWj9Pa
 DjmeB+Vcb9utiAC9mSR/MmgHQEToSs2rgUOc/Fx2pI0LGdyGrcyAv1T2VHoNqvEnmr5I2ialY1+
 cUPYEIwdE9wDpVWgpQPpgxb9brNotf6QNZusDiKAkw2N6fU6xV/vaD4Bw8Mnor0GtpZhLYwCj48
 E+ct4NWgjJrSxRRf5bFcWft3jNuGJcAZrSQ7sA81f6TFDS9N7zZYJnTQfWdunWEmH9rxsA3JSHC
 i3iyvkXbwyyJL5RZ3fWnGdh9Xj6KktKvYClAdYpWr0NKUnxsQRodARauQLzP8ivLNhkU67P71qk
 PY0cJ+U7ifJqL40d6VSszxB0w9YkCCLbpPLAnE+D6kzNk8iEIzi+zC7XdTO5jCA3t5KWbslRycY
 g/bw2gFRY64nRKw==
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

