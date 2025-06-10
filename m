Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1382D29C8
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563185; cv=none; b=XrCtybqGPj3jsCmXNNJRRHu79tvHnGpfj4hfx2Ij13pvHuwZ6Uqlb9xxv6kIqE8YacKMQt3+Kn/lL7usTOcC1KMXxJf/g7Yhf8C7mm/+mp0IRqpR+WdmHuxEADGK1hiFTYy7o853NIhlp2fJ595JBBofva1wKAuSNj+Ihx+Ns7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563185; c=relaxed/simple;
	bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/G++60dOsW4xcnf/wrXjuVUcoDDXxIZ91TrdNR/oKQhfqBjUX+cDnPj3dWb3lMuDigphkTyIjeaehQ9adA24GmDCW1T3/5NEd9f2mGCGZan7HNfGr7d3emUGqirPq6TyD+sFFSffFav+fFHnkUpDK/SJekO337fPzMMyIUhyoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etGZrmYv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etGZrmYv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c49373c15so3784506a12.3
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563182; x=1750167982; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=etGZrmYvl3MNXlUSTW7hg5IVrDj27gbWK+t3LEe7Cpk7Ig7VTI5fPDVdl8kmbKVlfk
         1dT+SB+fSQuAEQn+UGUByJBsfTwQC6Rb1Hx/VYmPhj4egcqnO0E/DUuEQerIbWxF3/sy
         GfzMPgNEzKiuy44rMt2GbA+ghPLxSUTP2Ivirs9IIDNeNlRFQI/rJemrEN7g1OBNyzo5
         FKYxUSBMj6SK1ItkrhSkC+4SY+zNkJguivqWpzdmFl7ZFGNSTBLwAkpIBmPtbRcAx6xZ
         c5YvYWqUZ23PDVzMrb+1Yn3QnH0Lb3SeLZdPhPX2+me+Uitf8J9Mmzk7dRd0jV1tPCC+
         hhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563182; x=1750167982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRQckTsTT83xbLwigtiX4m5LksrcbOPbtVMh/FhriaY=;
        b=iKTNmojpLO5SQ3Vsv5aDsI8VBSlZw4NSsvqJSpP9JbLbPJnR35rmBMTAGz4DN7ML1y
         KBfgWYayrtBrUOOg8MjWbc4Yr1Kbq8vtOtt4QS5+GSMXMm2gCqO86XVocn9PyFpuJDDm
         jPK73iRhUC1zdPJLxeutU5+59AqGo++HBossTBGKOQTP0iKZagtMVkp4ZNtMX9k0klhu
         WTL+CJSCGTLhLCVEUgB0CiYhjldNO93Pwng/FO+X4dTUbxhebVfuokgu4JESZE06h3Sr
         DbN4S+r5pA3JKxSU+R1rEiadSzUN4V9hVZUZv/j/XHlCHYGbJAmjvNM1e9VJmZGHbI5Q
         rVWQ==
X-Gm-Message-State: AOJu0YxvbtmNRaNBhBApe86fBfJpFX44uCseR/c3MXtNWWGTUuNVsm60
	hoi0hkceYP0BXVbyKcLgMQKA5dNYZTTifkHZEkSVQMusVEjz6CQaUUUvTLOGXg==
X-Gm-Gg: ASbGncsu5jOo0BZWBrjUaBe5QAUNLorNvp41iBLyuKp2Hh3y/kOLJ8GzGPhjEDh0jya
	kEAvj/pPU/MY7scWrE0CFWQQWOf0mbm9oW/jYX1uSvYIr/ixx1bTPC8IluXXYVB3NfuPj/87Gjz
	Mz0sVCcIZkvSozNBh+EizVCvtFdA2aOCAKtDyZOLh9vVAh2Wnn4PTnJnz0bOvjvJPWoWNuwikWV
	2QepgPIh48vqwzmhn0YlYdUYw6ZfLbNJIjsh0w07BRykOYKIdG/FGwXUa6sDnMJRgfUP+15MuWe
	5nSoVZCrCKD1hw7XcJIklWjCZM772U48f/1s+G/4Hsj7LiXvFFAGhgZAvVLEQqrj
X-Google-Smtp-Source: AGHT+IFnBfu22zv3Ouu8/mJ9OqridU9aBWmKTkj+xaTICPJRqJSyMf3R+DvVjf3tmKBM0nKTvRSwLQ==
X-Received: by 2002:a17:90b:3c84:b0:312:e744:5b76 with SMTP id 98e67ed59e1d1-31347695306mr25071825a91.33.1749563182238;
        Tue, 10 Jun 2025 06:46:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:28 +0800
Subject: [PATCH v2 9/9] arm64: dts: apple: t8015: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-9-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=onusbAGTeKZDibm8BvV42Zc7VsUIDMtHO+9C2/7TIY4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMfQB3E9FUiFPW5MawR4g4G1LbR7F8Nl1PM
 MDN9xnbL2SJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JKJ6D/4rPbodonMfukKOY2SD9RCuDnOe3XuP5GF8nzTJHzCP92+5tU6SCrGWa5TcqVVJv9mRFoh
 +Ycv00c9BGxiIA+SgwwnvQye5fPMd6X13C8yrvms11oZlXjtx017SagHToOn0PDDa5Xh2l+30zq
 EP0npSyXzbfTfznBR8JBgrOreDdHhYKUMzDmdhkAeBvSx/4iUOrM2R5u1HRB7lXwurw7hXLVIsp
 7xUbfRN4KC9BOK+iuj1QVWKAUp0Zim52gdpLW+D0F4paR41WZ6fnEG5nmbIMV9V0dHZEfud9o0b
 o0u+4F9hb/Uc/nO7oXP5spiFP/0s+MvNhp/nInshMGqN5ntO2zJ0ug/TIGIJgIA1Vie4jHM70bF
 MUYTbV/WTXvwEFZqwqHdaCDyB8HScYxYZFYfy19G7S5HqkjNtGZZO5mJDSLteuhZ82cywO0RDby
 qgP/MjAr9vo9ZJCzD182C6qK2IA2e8lgfqhCZxEiWccYyMqRT3qcMRJmh3+Loy9Ab2aHRWyvpps
 qxCQszZIMSA1V3kBQbK1VVpJA03oi+kXo+B8ZZTrbKAXX3C68bHqlxkpKm8+CUPRS7r6a6u4p4x
 kPB59aDz6oSUFjE/Ws5z87RkYQulDA90++2JjacdJYB4fD6TeA2XHvOAJt6fyV4qBIxsI6oBR6Y
 14RtP6csmMrWLpQ==
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

