Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804D2C375F
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563179; cv=none; b=czeTfhHuKb2/5HItvrBK6nllIqFSS/BwGue8n8phU1o1sfUtrXycDddA82ixWmwA1Yx/3/dY4wjc8aQut02CKGaeaweJx6Hwo4sQg8J4B25Kl2h8cyu3JC4U0tSCYv04TFIm89wytGuinlizpGi5Hzq7lU7fVMcunknQo+vjhr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563179; c=relaxed/simple;
	bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXdt6IbkCHDxHCLsPZcLSUKyZBe1QxTTGhXejjyifiMVH6oKrsL/kiaHF7GWNPA84+v5Wqm9wIDQIRTB3m9ssoadDmV2i/dj5zzuvf0NIwjcqWsCZSk/wBU6Tw2ibxXQ2SNXfQ3Z3KNQ+Vkm0j2AFQhmpAh3iWdhfVYWV69bFD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtxuUBiv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtxuUBiv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so4370774a91.1
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563176; x=1750167976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=BtxuUBivVT3tXN2GZNlj6ITtaoFEtGz3NMvpQncTCXgfKqDE+GxhFIYED5FsoRQQlE
         uaZGpYYk1FDUMxW5UygYpSA/ph9PavuCCCvH8gaLJyYarzkrFFDChMqXC9gZo+QXGtAf
         U3JchaYTNtBCCKOCNFOyKvjOAczI+Z/UkdT9qOFLbpHgsiVpzYhGqnCF6Ogz0G5ZtJdP
         IrXB0j24g6H/g85mRxXo0Ps8jEPJvrjKmsNYfGuN05XnOcQdrY90wV0kfqXWFny2VfPi
         O9up7TqtPyeAn9MkqR66e+Bn/xG0ScfEdg2P0VPz8EmYCk2tf4I5GWlUoDxBEwRKupVy
         20TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563176; x=1750167976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh1kbOu64C6WU5jzJ5D7MEiwpN2T3eAogGW0MXnKmS0=;
        b=b8AfYq0ZKqecZLhY124farB5fFZuq9Oo+D3/rWGENtj7hHfqYf8NzKOvQfHyiLUGbH
         DlVVOeRW37CziLpaubw407+0TN3ZN01LR255KGvGPYhBtocmXsKmbACXDRumpsmyLFxR
         llg2d9Z4PUBtEY/60T8rDU7bXLlABY90p8uDGob290WMLYaERrGT03H8xIFysEz/ruG0
         2pKWftTHphnCl4KbmTeq+xFdfr9P5TqWPHCFH6mlM227MmoPf5uCQlL4SWCwbc1jynU2
         2RZ58ePiWvqBGbYNRUzZO3WtikGNW1HGMLEj8GQrQiZIhJdS2t3bs5UmB40VhXX6/ycT
         /lVA==
X-Gm-Message-State: AOJu0YzSH8vbIfGXImvs2AJ4pPT48f7LQvaxZttykKal9Z87gpeloub7
	5C/rlhSXwglQxT1GHeDr/vlQxw3nlx79BQEN2HnY/sg1FbHm5y+RurBHxyf5Lg==
X-Gm-Gg: ASbGncvl/Uu4ncWL+jY4Ta6Jg+jC4OXIpmaG7rrrjlnFFoM9V1UCicu9ZIMvWPd+ymk
	7xf4N10i7h4GK4ncyTcRE0OMiiMvc2KwowsFz+RSSseyQbwAnm0gR2bLxCB4BynM+xpHMLwFkf6
	M3dEFOwJNYfi4M/qO2Bpp0Up2BaKANhui0YMiJ2LG2sT0SIinrNfhVsV+BjxhW2GPSkQL21fRSy
	zqQGs/M45HAuUXmWwKn5Bx7SrBSvze0uz17ptJ1NGMzRz6VO/48/K6ctxchVjIaxSFhZjO07lrj
	tKc82QZEKJCxX4NdmJUctNrBsnwONImagoOEYeBc/GxjD60rE0FWbdyQ2OOqWi2c
X-Google-Smtp-Source: AGHT+IGKpN090KCfuM4mnhhtjjx4+d+Tq5NKBbKuG74j3lXwde35ZZB9mrUEoykhE/YnRjDMBlrFhA==
X-Received: by 2002:a17:90b:3a8b:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-3134740f5d7mr23396206a91.20.1749563176255;
        Tue, 10 Jun 2025 06:46:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:46:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:26 +0800
Subject: [PATCH v2 7/9] arm64: dts: apple: t8010: Add I2C nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-7-a5a71080fba9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kHaRIkP/PArXXOw9EiKwVTXYiFfFFiSty0mPZ+ZDpAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcMxLD7nGI22hDjQFxRWZzZu4ED+wy+20gi7
 nJY6d2bfzOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3DAAKCRABygi3psUI
 JKKMD/9l+BcRDkJlprO7jUu2w1Fwj8eZphRCaqzV3wsKr/1yirY4hNGGGR+eeO/YxQzVFUnqflQ
 i+23tkqqCBpqHg1tNuzu0Vgo8i0XDERjD7kXajgAjL1VsqJ6w77wdeNfhdRN3wFswvBA2OMu/T8
 SRbxydQHragP2ndPYLt7xhSizJ1h1CTxbALWvr3lPZoAgXOs/oPL4UqwzgpUZI87O5eRwKpDCZc
 WutOcvVMWnThfRDW4DkbkEA4qw5aOHsDkGnSwDsXCr3LwR+WwnjfVU44xigY4lravtsJXOdSLm+
 M4gD7OZhgEa2QpRDz5E/Wtwlj8bMOSlQfcLmeyB+arHes9WDKyB+QcFuEIStT7WpDZJCSG8wP39
 T8fjv/K4NEz68N8OylVP3BB4oOWru6+t79WdaK/GYSPAkp5iWk7MxUhg2bJp14zqPEQpX63RHcQ
 4ex7hzDgy8m89C74seoPbKqUtKVtk7+3mBDzoWKmk8qkL3s3jQgHSo3MXZyC3LMthIj/LVcKY4a
 039WbOeaQ2RiNEZebCdLhOZ5UcDF6mbbG9I0lRl2ExHyzIm3N54+Q6Gl9DVLtBiulPPfrK9pQlC
 FFaNvYZ+AxZgPABzpUwDJ8jwqeLj+ElYK2k2dcBbbmSFffc4pk3KFP2piuLohlDHG8RdMDKcKzt
 vMNdfj5xoWXtPjA==
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

