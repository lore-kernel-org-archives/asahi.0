Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A4327C11
	for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791545; cv=none; b=c8yLlBrnuGkCJLYV5JXotOeZ4Slj+YBs2cDGKXJJcb8XEqlcFPbq0tt5w5JJkuM+p4yFD3pEGWTgR7nMIFPz+rrolbztGXZGUBUY0VDHOAVK7+Zy2ULlt3p/hZDvk/I7nhM+mvlcMSmtVkCKwFJy0CW4Rq7iysYHjq5G2sPvaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791545; c=relaxed/simple;
	bh=WBSnoWKU3AENu5sDkwxg1gyjDJ4F54vrwnNIGBo3bkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgr16LQsIWog6CSt6dLLUjKgeZvczELAY6Dp9f/Y1qdzzr/0TYtg7+ScCPtHT+c9ibE82Y25OtH6Rhbj4g0aFDNAjqmpofXtkkovmL/AuUnxT2YAPKrvvCwPgs96ZW9f/c6fGQKwMpqD2f6qgtWCEp5UnT/CiHqwxytQOmQWcO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGVYs8nd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGVYs8nd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d52768ccso11601335ad.1
        for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791543; x=1766396343; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=YGVYs8ndddKERhqTsXuIvqB4ZHyzP8RDPmukaCaAyCxMDvH0HUxom27zCSaZnoHuxE
         IkT5TJSdi85bxO5wmJN2NVHL4lsLkcjf3LqEJSpl63YYe3HhGMf0pw/Sv6niMl+wUf6P
         2ct9YOTDpT8LULzBKdBwkYtdGDg25TsJDX8nPvJC6qQBb9quYeCjQDHM+OyEfOdGAXQc
         aMzsA+ZqJZOyLqbHlgYg+IX7IujtBywEJ9lEPiWh1os+tn/U+eO1Hj1MvzXZsx/X+jOA
         nZHFE/raldtUmj9p4Aj4kRzqXQoUSWoYIdpadsVRbnuKQld/PoPpLQIlK7MUVPuu9qh1
         HIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791543; x=1766396343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bGUzMeLW/JozQ7jHBnhOnIeY8glII+n/t0VKsxF74I=;
        b=J+KcNdjnSqvwF3pfCjHZiPyYfGxTT0Q57S6jxvNkEP9S12YezimsLSc2DsZEaLVWq9
         cknaC/nBJrXXnKEyRKEmXNQ7ZUiC1d9YqfEBNn+0AxFw8/XPZ57J9coTzxvP6TWZWPmQ
         S4Xoy0cueLTXKIELAwKmhkmD95fhtaxaZNy5aaGz74CJ8P9ded0Sw+BF5L+iazU9saIG
         vrAJ7ccTNF9Uk7/PHcn7MD9h6tQyy3ZUKX4wCjrpA/3WnLpi+0fM096AiqIU7dx4ZF5o
         cVHlGS0cH3ADtZ4+u4Jwu/urGYKUzsgiDved7laobieQ0KG2LsJP8f39hWQPPQZ5X+6z
         XtHg==
X-Gm-Message-State: AOJu0YyeLBHzZXFKW2473iBvwq4fbCXjijrQDKzH81Ag3Zj64jlONdaU
	3u0P1t63CpwJW0GxJKObkv9sT0vgzfU2peCwUo14vJUXP6MZXaB8X+UB
X-Gm-Gg: AY/fxX5OUcJCSt2xZ5mSaUeOMJlQHrPg5BvJm/b0YLIdD2O+FK+jlOVHJ3kyEww1MOW
	JC255K3wtqvshQ/lQneT5rYH9kfy5b/+jL98OZIL4aG/KBW8GVY6GguA/VuEQ7+SLOjuwbaMDSg
	vwK+pRW5/doL/pKapOT8LwAOdm8Rz/v0nGKwMyw2eCh1/uu4EQ0tn8eIrnNDhxvo9P83tmDbWQD
	qnP2bvdDIROVg3MzsZx8YTsX2jvFqkhmrTQ1+T1AfsomKjLsPj1QxQd6i2ZSUSpqlAjAnz5pIo1
	W+txYG51ZOU7DNBEEWQ7818ebAJJ1t7gCqoUED7FStuBdwNnxDhp5d59sfrDv3e6ETv/aXW6qgN
	EWabvvAh+sOHRCuZACo/gxTDKpS7jtkaFZ72xoI2hPULcZJJGn8GLUswcLCUsOnv6i6VqFYcBSz
	PGkhWnk9ArZ/iIeLE2yrajh0LCH0zgtPmb2VquRQp+6xfHa6ESzTWIvB23WrCWUGFsVxT4l2SWG
	x15dyg+j8Bi+5Dq4VtHNDS1q5MEmDGJpOw2gbWk1AqFgdXHhIk3c+8gXP0/oHi8vG1k7ugk+r4f
	Ag6rm9Tzp7RHo+6e1YHHp89n6zHmRtnceKts8+9ulheW3SPtjd8=
X-Google-Smtp-Source: AGHT+IE1ONDmMPxkmeJv8Jcwz9fHIvPtzkrv+UtHURTUiSutUD39OJoEqG9ODwNwY90PRcf4H0q9VQ==
X-Received: by 2002:a17:902:d4c5:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a0b02b21fbmr55998955ad.41.1765791543118;
        Mon, 15 Dec 2025 01:39:03 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:39:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:50 +1000
Subject: [PATCH v6 6/7] arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-6-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=XqyBBwDw5d8mhE2yQoV9/8OYd4bvzgC4hPOX4wfMNZ0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn211msN8f2hHad0eiKb84X+hTfnyV7VXJHXeN/+YV9g
 su/PGLrmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATHVTHyPD+0CvUyukrZ1/yro1RbnqzLLbn6LQaFjJef3+56CtzwMcGRlmr667zhi
 x8ti05R2ebR0CvAtj48yMnqznmsrQW6/0t4ARAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

The System Manager Controller of all M1/M2 SoCs supports the RTC
sub-device.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 6 ++++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 6 ++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2ab..f715b19efd16 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -44,6 +44,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	smc_mbox: mbox@290408000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 2e7d2bf08ddc..8622ddea7b44 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -121,6 +121,12 @@ smc_reboot: reboot {
 			nvmem-cell-names = "shutdown_flag", "boot_stage",
 				"boot_error_count", "panic_count";
 		};
+
+		rtc {
+			compatible = "apple,smc-rtc";
+			nvmem-cells = <&rtc_offset>;
+			nvmem-cell-names = "rtc_offset";
+		};
 	};
 
 	pinctrl_smc: pinctrl@2a2820000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968..59f2678639cf 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -916,6 +916,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 3f79878b25af..6bc3f58b06f7 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -919,6 +919,12 @@ smc_reboot: reboot {
 				nvmem-cell-names = "shutdown_flag", "boot_stage",
 					"boot_error_count", "panic_count";
 			};
+
+			rtc {
+				compatible = "apple,smc-rtc";
+				nvmem-cells = <&rtc_offset>;
+				nvmem-cell-names = "rtc_offset";
+			};
 		};
 
 		smc_mbox: mbox@23e408000 {

-- 
2.52.0

