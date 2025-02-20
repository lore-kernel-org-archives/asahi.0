Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254611FECA3
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066708; cv=none; b=RzJLLUb4x/46wgqvV3LKF6lfzCkrod/mtcSFmCoOMErCBFLjWnEOUZH1SGGlJ9+nlE/cHDouDQdG+rpZZlRRaBC7+xjx4othUF8Y2e7MdXepfetc9m1gewE7tcnjr3eRrjMN6FFcRZMkCiLde8JXcihVQG2bICeyAyhwA1lJAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066708; c=relaxed/simple;
	bh=uDPmflVJvnxOB1rw8vcGbu46t3L1/i8a/zN5ANyYz3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pl3Y7pY99Sjh8xYBnZQ88NU0+UhpVgruqCw1ej+nHq86L/qyQjJJ8FcR6tdLWIz55Zp+l2PacW+SJyBaayEUelAmoXNq4I2/5TNdBIIGep8coMgudH5hkT6/wOKc2Gupiuwm3kcf7xmit6yo8rlKuc6POC7VTndoASDv+Lse0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHabp+/6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHabp+/6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220e6028214so24264995ad.0
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 07:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066706; x=1740671506; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1NlfLag6cXRAi1RREWAXx7+nFLb5S0lG/vhce/4QOE=;
        b=LHabp+/6Y+EaDlIWXqkD6YbKTnE4SeysW7yOpf/Ud4x4I4bd6t+Ym3EQASHvgMJa+G
         vTVp8CBfhIBF3fYA2OIX1N4cuwhRcW9Il1jroU8uAA/9jx+t2h9SV2k6XJOi3v2jEqiA
         VBsCpiArZRoqIV26JirXi80yGz2jLiN3tPyB7iFQb79sluj8aK214zxe8FLFxH0vNtO7
         zjglBOtNlTP9HVjNFqpey7HmZhfqaeui25ZO69vbkVCm3NeS7rcdi4gI/hBfxuJRfxj8
         vUkoxWmIiSJhP0amOPLlduAqnHtvuSx1a8x+4uv0GiSNJa+TDRksM6xlBwzqCUrXqThM
         Ocqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066706; x=1740671506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1NlfLag6cXRAi1RREWAXx7+nFLb5S0lG/vhce/4QOE=;
        b=VryD/gCe0T9kD9C+6IQnY9sLVHWs4Y2JWCdfwcVe3cgfDYEqbT7QvzduyomilKmh88
         RPJ47e6PE+oYLDaNbddtaeCVcMcSJR4HCMLGHFeYszopbwxHnfbM69+C0Dwdu0lqnZhq
         t26uEN7f+J0xiPR6mTogG9kHeWIK/rE3qf1meS+KybAlt+++h+2lm7xqe9SNgrrko00J
         NmiiOMj8KqJc3zgmU0yIOsOxaFByJwyVnCXmWpBscnJ0wpbP3O1QnZ1QfcY+F1QRKTsl
         tsgwXXVTBl2sxVi46dtkieGhJvw3+KOkl+6mXCTZqxIecVKJHUdaLf7HxML2J7tkcCeE
         MrxA==
X-Gm-Message-State: AOJu0Yxc9nQ9Sh5OwcbxktqTbrhWSPwinIhci+2QF1DSiccXaI4GZgO/
	79eKrrZaSRZ+m4CfF/h3V8LvSQwvtWELmuiCYsxsHk/2WW8LOBbd
X-Gm-Gg: ASbGncuZh78LQld+1X3eFp950maBB8vfmWGEVuwjHQ2Fc8WiJ2Wp5JtOz+epDJs22BL
	wU+izyncrfPub0fwX6iMHMfZO/wCRXGb91d9H+wI7tEqfGG+cYAZuUKqWKfNAvSGmMEIuyXEkCg
	xhmW9cDGFmYNNOtvPa3QbLtQFxGmNGDfwzYEASUWxS4G6dQz3othV5oj8G8/1m9Bmqrw64GjR83
	3RbpcVBC9hSmfDDuQtlQ9h5Ma+ZLVZJIlg0z7BZ2kmW7f3yPFQMkCcHYmFHABTs3GwlIADNMYMI
	iQmO+1aa+BmEJbhUIQ==
X-Google-Smtp-Source: AGHT+IF5nb3qL/RD7OyYRMOZ8L+tw+d0s1Z5Bw8xKRR7akur52BeX2LWZzmSm2zFJMw6MwCvDDyQjw==
X-Received: by 2002:a17:902:e5c6:b0:220:d256:d133 with SMTP id d9443c01a7336-221906111f4mr36757955ad.14.1740066706443;
        Thu, 20 Feb 2025 07:51:46 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:03 +0800
Subject: [PATCH 1/5] arm64: dts: apple: s5l8960x: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-1-d742431c7373@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=uDPmflVJvnxOB1rw8vcGbu46t3L1/i8a/zN5ANyYz3k=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MO0zMTpQPauB/DSJytq3Q1Jtgk5jzXbhik
 yG+F2AiJbiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JPYbD/4uMyhSLygzQKP3tRNOkXR68uKYdbWUne6RZKdORb8nRY6IDKTkSHm1msNt+3k6yCSnY18
 3WYKTs02Dj0qFtD1EWGQBjbrFFUg5HopoF+bYSITupj0EX/9XO3Ln0Z/nkc0pOWNj+HgXwF21xK
 +tvU1iH9nQklHoHgCRUA1RtQKxUjyRUg5+9zukwWwdz1Fq3CNswD49chIwhje5kci8Z54BrJLeR
 hRc5uUTHy35LPKBrXnUKfuQdboR6+0aRrP4FYphRKYB7zQp1HYR+Hvkg2b+a8XJVCoNpAWeQHWQ
 koMKbIaVBljKbT0XATmTdDnSeGjMAk+gFqUK+IGNJ1CrcUnhVomiasZ9R51uZod/AH227aM+Pnr
 2pajZ/GeiI3VEj5abSXGWSlumLfhVTi56aTRuBMPNZUOysKiHZkTjRFoaT129KEjk0TXp0MoJzS
 auCiQgY9E7vcnHx2tyNj90Jcwoy7ighwhD/kdKjYdqBHfNAztGL1tp/h2AJQ5iwV1Rr/6ZexdKF
 A8exgNFmdJTYT2aKbiNMx4NbnI8E7x9JFzPQbbznmFKtuateNcN0MSfGzKpiTekh3Vf5inajGwp
 uuVlutt0uOYqJftBxvwz+ZaBxIdxSTmRZ+Q9yA2qrRYBdKrFHePJZi1qw41jqItp9LoepT/3SfE
 7IpGjYTS/CDB4RQ==
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
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..b109a1e7fcdad4ee3caf0efd2c56d76c66706e9e 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -100,6 +100,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0xe200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1

