Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968651A8F8A
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716764; cv=none; b=WikWh0y34MHegcPTWQr0qSiCja033YXp3X5qvglRmmcPOqkTjRzntr4BXFJ+USBHk4IVLHH6IyDTOdjEcpByuknKvix6o9D5rIgJYWWVhE9tO6BBviv/stjtfAJ3DW3ijV0L6WBSKTeE8Ry+etUjuHzvqeS2eMLxKXtKCe3ggcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716764; c=relaxed/simple;
	bh=BydltNMBU6F6QLU63AOuc0xk1HyAvUD4tBSVKN7rc/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKuIx1n812xL2kdACmwVmnoCzVB6aeoGI0xSMZZnvrbr7E2lNUz2kOxpZO4s12MFrt2Dzt2jFf78k+30QUHGBbA+haG2q+1RStG3OcRdkSZoQCaxfMA2Nt/lD4WQsOLn4A8YMYeH+lTHw5JaUx58tkfZi9UqS0UqJUtS8QiFuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaRI8Xlq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaRI8Xlq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22349bb8605so34270075ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740716762; x=1741321562; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=aaRI8XlqTqGzzPVKabY98fN+p9pf1ZIhbBJ+FrnwNbKnM0Pne04P8IvaRNfBp/5wLN
         TSSK+PM1UGcg/o6/2WHBh5glNXD5NLHtUtUF7w8+E0JjI6b2ExYdbydgaRrt8YSkCxxq
         gG/YJKtPqIUBix4hU911nIzbHsBalG514OxO7vguG346QJ6SbPxu3mx2TfOeMbSwZ/Ac
         I97H0m+Iu9+a2TxlTUHJ18bQXHz/XH+S4bfeSQ5BSfEdHMqdMQQXKj+7oYKVilYZ/g2j
         FT6Tehu7oAEm8s1mvFL1Sswtv3DSbYQLw4nF5TQxI1xVKRGhuAHSQoxdCbANPMAbJrB4
         5ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716762; x=1741321562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=FeWYowZ6N/q0cCX/H9iNFO7+bYC1b6XRho2qvqA4THY6wQqax82xEBAAxDlt6M+Mtd
         /D28DuHB3QbBX4+59lykpkU2VGhoKkmOksN+Jy8s8RsOZ+wDLxZ3IGlZ1oRcnXWSZ7+L
         Fb6QRW0kfkpRYmWVFw3YppXLB/3pH0IHEDWyxRSKkeyt4BzWdxHUdV1rG9+9G1xMQX9Y
         ftJL8g2ceI7Q57dKLtP8Qdj3RfTaQ1jsFaEhbKQDdGglHJWmIivTPlHA3p3Jnv92gp5f
         DWFRBtwZO5Pq2hQTWOvTgasBhlnJoxUb0Tt84OEufqJvw74N+F01HmRK/O09yo3D3dHO
         mnKQ==
X-Gm-Message-State: AOJu0YwMEYCyK1Vr/6H3Mws0EEa944h7RSTZN2GlJa0owmmd7K06az9V
	rUnjaVUt1ys0SGSdErz7rNvFh/AgH4mDvcQ8sOSqzorw3AiYg00e
X-Gm-Gg: ASbGncvP2vM8+YAC4E+4atRbnYTJU1fi4i2g6+9P3vKqXSWiZf1TTL+RSx0QPflXFby
	4X1+EAwpIu6Sjdn8KWDdgX7yx0oyXFZcoTDbDWHwEGUAdyrwAcsEEZDrtLulj54HmUyQsBpo/Uu
	5g3m4Eo8AP50W7cTI8AhMDxAVIXC45DOA8meNSBaxf51OTttYCbIQZdjcIxJUlvHr1bpGw0DQ1m
	YKx/igv8FeloS1StGi8cM/c1QtYt0VTTCesyM8IkaZeR33b+1JU0oKArAWP5jWMXh5bg2CRprfC
	p+tNCeWV5vCEVIrufih6G5h55g==
X-Google-Smtp-Source: AGHT+IFN9RDW8T0Nw42judDpKoBGP38GDULwt+Z5nlzyDmf4maft+vUwsQUJG+p5WveGNHv5ketPNg==
X-Received: by 2002:a05:6a21:99a2:b0:1ee:a410:4a99 with SMTP id adf61e73a8af0-1f2f4d1a4e2mr3348169637.24.1740716761890;
        Thu, 27 Feb 2025 20:26:01 -0800 (PST)
Received: from [127.0.1.1] ([49.130.82.63])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm2738318b3a.131.2025.02.27.20.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:26:01 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:25:32 +0800
Subject: [PATCH v2 1/5] arm64: dts: apple: s5l8960x: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-1-4243fe8647a4@gmail.com>
References: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BydltNMBU6F6QLU63AOuc0xk1HyAvUD4tBSVKN7rc/0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTrQCWUFfgSa2s3Vd3yBbA52m0/0+CdUSIB5M
 Jjdg/pZlIqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E60AAKCRABygi3psUI
 JAanD/4nH6K0dM5YgtmL+DcnKJqZ9WPb4GXPbawmq+XCH8MJdyqz9lLdZjdtMX2HfI43IfahKQw
 +VIXnOPWUXcvI7PtHoSnSxqFwjydRo9xOytIxAjK4kIuSv8VzIS3UZ+SkMBX6TWAFymwxMuzpKL
 JsG8ng3zvr5Php624nywp3jalOJUceyduFKsRQ/F/aO5NCVXqHGxroPhruqbwo6bcBmx4aoUgHN
 3atpNlRxAWP+fG2szqyHZ6H5u20oQPKRSl0D9SmMV5r0xDdo26utpO+c9rrM/6PSeAwbL4oqjsd
 3+QewRoJhaOpHEdh1mXPEFaMezhim6N8SWlul7BCVVHswE3hNVMw45xTOPOZqosVG56m6P+I6fU
 A/kXidChB0sKKsT5HZnKKCSX7JcK2dVTsmrU1AUPGD91AlJj/C0R5CVPYE+fVpTs/YFHTXJRo8Q
 7Us+v5i4wtIb0SJhLK2l62aN+dVMOgMerQk7vocPwOCmP0joDiP0FU5xtqG5KahareH7GyeDmhk
 Z1lzNOvtc6dTaKAUCoQMnPx0WzwJe+Y3DPh8lyjNpdDZ7cMFP//4D4GvBjjCSWkgmGI/UYgPL0I
 cjAHhSfShPy+EMSAWymtFVo5ePQUw2F54chcPUfIrvdyyiO8zTWL1cNNKs8V1aw7T62olWuppg5
 V+qnVKowqh/9kDA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A7 SoC, and enable it for
iPhone 5s.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index bfbd2629e206736822a157431ec959e1aa70f41b..8868df1538d68595cfe92c80b1fcecee42d348df 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -51,6 +51,10 @@ switch-mute {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0 &ps_mipi_dsi>;
 };
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..d820b0e430507f681a5f2aa13a498be98080e1db 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -100,6 +100,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1

