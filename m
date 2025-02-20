Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CCD1FFC78
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066711; cv=none; b=jlxeOr62NwWobt7nesTt7LsZkjYQW0VZLRvvLLOEB/qBUmlcRTvBYJQIgfhjUyxUdcCy472nrMF5usi/Mf1NalFRtR0trJB6a+RD676AuaBNHSr0e3oJvaYMK5IbeI34V6L4vgLyghsnBYuT0zulV0bBIRfZ9hmQ9JnJeBGudhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066711; c=relaxed/simple;
	bh=luAsDSB6foc9kXkHd+Wi1yTbVUxTP0P63sH7ctTXbEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCIMnKAS9yRCuToNc2Q0b9hOZPjyabhw9z0oqYHWY36RupYdpy1bCfwAFMoRPsTt+YM9apIee5BSJRDSJn2bfI7xzsUDvJI+cXJbfa4z5mAxum4Ap+joISLPvGiDlC1AMKG5DJr3ppJqY4H/1ESyKppD4atfXbjAckWMP+TzswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9N7tKjm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9N7tKjm"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f2339dcfdso20489085ad.1
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066709; x=1740671509; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4aQgk3OaAz+HW++uMuDv22SLEQxIAOkffPV23e8MfM=;
        b=L9N7tKjmG1yuppYStqJu5dRPvPpny36rixDNBO9K8uO48o9DDNDbX6TftvFayEUOL2
         AUCel+FmV10HHk6PPalyYsKDIMCSnZ+5p/+L9dWH8fNAMbUZLs5hG7rPv9B2HNQvvwiR
         355u1l+qfES5aZK2Fysjke7xZzpeyT2bTNNJCv4NeP/cof2KuH8UvxWh1bQTnXRYAf84
         kVJpZJp56GW/p/1dbINoPDx7I1EVDo3QRynuNgi6H782rTGLuZV4ytpY63rrlj3YAlvD
         gjH2OtRRD1H040a4ImfuOcnXyzqSiYxHrRqTxCGPXFWtPJy6V/aNd72sSTFJmYPEPKKW
         9PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066709; x=1740671509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4aQgk3OaAz+HW++uMuDv22SLEQxIAOkffPV23e8MfM=;
        b=Plg83srcuPTufS4bvh3LQTkmN7R+rrNbUEFJCrRJWiP4xr3HgtIzDHDKESOSubc3Aj
         gXl+2hFmA30XtXnHTSyHI2nb/Fp77+lE1Lj9FFf8BaTDFImtJGSY3min21Kyxtk4oKSR
         IYBI8TMLrttOcckNhv2IJ7Cfa3HcrMqzZfGdEjTZQ8XB0M4iQ0Ts51nvJVla/CA1G2rP
         bFvBU0gz94uERz3t1fO4AgjzHW6ma47xjQAhDT8tSL/BQSCqYIhU4Rv5IMwgDaJW7ytj
         jr0kHlu/FGV9aTYY0pPMGFmSlgUCWsrXgZyMlSUF5RKSbb/HcuZISsAmiaXoS/IYiYb6
         qlQg==
X-Gm-Message-State: AOJu0YyQxkrlVxA6dZGdecDL/SWis0pddyEcDAUKTg/85QPkXhSvBusb
	pQZhIDJWHMc6Suq1SQKd9sMd+yuOBM1o5ukxAfPaGop8C6xePgSl
X-Gm-Gg: ASbGncuNjUTN/IjSCSh1jLpSrpgQRu3F5E+3hjmKN5T4/rKPTs40pPstxhmRH21Z1lY
	tl6OTxnBbKkV2tzA8CQjFTQo8ANrg77KYl1XRoEgGYSKHSAKxl1B2XudEPfr8cAi72jWjaJ+I3L
	cEQz5KLxbRsUMostSUj4C8jNGjDWmzShLKtSeN6XwOHUmflSZyezScz1xolgXAgmTQsPfDzO/py
	Hu2/19z01EeIxKjv28nT100tZ3W6lTCTMyRp7poTYk8hvrFtMEfU2pDDS7EZZ/zPXa4lj3zF80t
	8zsOoj++S4oFh9kBsg==
X-Google-Smtp-Source: AGHT+IG8+tySuiPwp6e1P8g9EupJn2/5mZidEyqnFWhQeW8NtqM+gsjp8A0ihVyYanOl68AklBppTA==
X-Received: by 2002:a17:903:32c5:b0:220:fe36:650c with SMTP id d9443c01a7336-2218c541d8dmr65265325ad.23.1740066709139;
        Thu, 20 Feb 2025 07:51:49 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:48 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:04 +0800
Subject: [PATCH 2/5] arm64: dts: apple: t7000: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-2-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=luAsDSB6foc9kXkHd+Wi1yTbVUxTP0P63sH7ctTXbEU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MtrP+HahF4Ws+El6cSLJedb12Xm/j/cLRD
 c8h5+KlHauJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JD80D/9KdUg76YCKbS0mSsA3J7LKv1mLTD6o4hPFbRG9wm4HfANcy+GEfQ7inaMUAtml5SCsk52
 dtyoiPt+It9mjEzAHpL4Xu8BZpw3IJpHsDmrYUsRrtg7M41drnQSd+5M9DwUV4htDnOw4/0yFde
 Lai5NyA1NBuBJiO12jeTfLI0EfDhjFxuNSjYC+zRWdxPcbJt3mC9LJI4y0rzm6/nts79yiM89oP
 8cJMkPS3ocfFdpwFrThvSYVH8dvG/EmMYutIdgQ9EgvdvcmI/k8/RpLsK/WYy/c8xTTWqah+YDV
 WhZ1fSSVAagxQZpiyFPWQOnhRuZodpKWPK5GjOfOEXCNqqAjV7S/pl4qToTJZiSBZ9YI8tUMSIa
 rhurXE00I91EtQhPyvOsej8etIiDLfF+7NORGfHY9+ydNtuaHtXT+FkdAMgqnN5F84S2YYADaOa
 SCr3GMHHGR4oynxaMqqLgESA4W3AQj78txtNCbOnd+izrdjhUVWC0G310q8ul4yGkWRYc5rSbYw
 WDmsoZD2KU5UvT4Mt1GLGgGQ5HcebnpTZCUm4XZnS7ecuNK90doy1+lw8EC6u1Dc2eyJ1wTgYE9
 vFUTz+79CGowyTiTlWjuvj3i/xdqup9TglEBwoxS9TwpulHQFoJqT934Q2o1zBoPKjW6NhyC1Ba
 qJ+a5JHbK0RvOYQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A8 SoC, and enable it for:

- iPhone 6
- iPhone 6 Plus
- iPad mini 4
- iPod touch 6

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
index 8984c9ec6cc8e3c86281a3da719edb56c5bb7f5a..7b58aa648b53dadafb3a01d9ae1e01afa6cd5869 100644
--- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
@@ -22,6 +22,10 @@ framebuffer0: framebuffer@0 {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..98e510b81e26154c258e3359f37a7964484f034f 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -155,6 +155,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,t7000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0xe200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1

