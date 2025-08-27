Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6827334F48D
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293834; cv=none; b=SOJRUiTd4nfQjq/4/lC5ANCNdZJLSZryQ1KLFV27T+w2z67uwlW7M+KfCyWMbrMBO6trN8Tfywoz+unsBsyQLJzSApSd01rJyRxpXrRHX2Cm4y1AOl1DOJf9sudXCvwxqRRmSC5WtkQhEUWrviMWYI8SALEK/4LJFZHtrMh2uJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293834; c=relaxed/simple;
	bh=AMId3i8H8OBZdoaStosH/aFpEZPyxqzEbX2+87IwfLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otJbEIvU6uMgAU7qnVhlx7B796ay2skVHFTpL8s7MUjOsf0vbHW8Rdgo/Ik3QWbRlO2bpZoGX2wZIa0LScmYxFnqwRYXjBYyV/fHs6A3JUcMBFhAajsWe6WmB1ZB3sv1I7y0/MF/qptIF0vnrKkyzyJ1xHX6Dql0KyzA/lAqxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Che9nP3g; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Che9nP3g"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7720f23123dso166998b3a.2
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293833; x=1756898633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=;
        b=Che9nP3gJLMvWL+kOhU0vsTu5s4MWgwcc3c77gVihD7arFuxH2rNNPMo73mQg8f5/m
         KBiCEDoUUSiWaYEUzk2v18+w6S79cRPRULqX6ES5oUmNu6p7YeRJiuvUct3OpFxtWGNk
         REgdvE+Qn1PaLIZxghbdveQYHJG77olTXy0swxgRmE9Ozkp6Dz/AMxKxeMV16c38WyQS
         NTkbm/KgpIbVZYXZV0RbkMdxst7PPNWOxCcI2Vh3X9aPxmy4QtP2Aga59KHzzYBMMhGe
         La/kC7ufNGEBrw7h6r5gnxMitMmNOK8z4x8RLTUdhh6lwn+L7uGeeitgXMPICtJHv8nr
         zLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293833; x=1756898633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLR320uivWEsvQHsql0GANw87zZYqq4o9nWMA6bfLUg=;
        b=D4rmyk080gjxv4nGJGy6TyhuWOIVgVEWiTSlS2XRohqEW8I1WElNl2JPGCHJ+mMwsF
         +c+uW4JZ9kNZT+psVf2oQ9ZhCvDdO3DfY6FIrlCxdQjvS1Mq1g+rDPE0CPY+W2HB6mKu
         d/Cf0qX7cfQJYtoW93c+3GmRsd5p5u1yjeDKjnU3QPcLhJAKW6SRYtD0RhEGr4w1z6yS
         G0aS+nef0s3hR5R3x4nSM0MiI+qGFbumPA7iaFxQX3PopAUKToLBCyaxFEZNJ90rlZbX
         GGmsnVPmGDJKu9vQ40++dwkUdzsQgrqcmusu9xgHe6eF1mNjMkppkhhVkhoqQay5SEvh
         O30Q==
X-Gm-Message-State: AOJu0Yy4899fh34pIPR6MJ+iEMtPkFLmAvXIV8s9adeMUR9y3YRv5gMd
	ltDX2jz9zORigC+n0CJUbe/7dEeHQ6X5Y2rA8oxM7leoXM9m8sx9SH0nQsh8UM3I
X-Gm-Gg: ASbGncugrrXN/fUyFDNcGc+sl+xEJb9Bd+vv667uCrxcLnPcrBHEt6QgW8BdtFB5NaE
	xva2cJGqx5dh0ReanJOVxkREhRWIrzlXZ04HJBpkBRh3u2wNNvI9loEvvJMO8mdni49DaZX+e+Q
	6Y09P8GU2vdV3t/3meZ1FWTOXePig7UH2V9H0U8MxiILbcI2j3STm1Dn/8hsZq9RjOuI87cM2IE
	Kd3aR8wOYXvfZ9WomQvFJDD8eCodsRG+oax21GLSDX3iSUcp0UFmagH230k0kxoWXZfXMAekJMO
	ObjpUcnZFbiG7oyXBMcCuAUZSbcbuGxWHQscBGcCCwEJ0RJWrN3sL82+4HSXGVr2jGq5oGkE/XN
	A3e2TAaS8jKP0gTTb8uLYwb/mZINoGWFyZx9RFChUvMCbzxNkpCGxfedI15VJXxpBWEaPubMyrw
	nH7TnWhiTTB1+8qVwR
X-Google-Smtp-Source: AGHT+IHfA23MVka1pim5iO9MIi/hUTPNfKxTfEhzgcBOMzsCRxhk5FUuT41RoiPAGs19Y4m9Q2CLXw==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:c4c6:f406 with SMTP id adf61e73a8af0-24340e06848mr28004504637.43.1756293832695;
        Wed, 27 Aug 2025 04:23:52 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:43 +1000
Subject: [PATCH v2 09/11] arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC
 node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-9-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EiTtOkgByvBW2d6W0dQC39cvCK54i0Vicx+v7DF1xC0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUfqK9yNp7KPavVUfxa7HWRk22b5T/YBDZPkz4gs
 WH+q0WdHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzEM4Lhf2nCvY7aB58Uv4v6
 T3+7ce3SvVZX7+sWrFhSG/9s4Z76PbYMfzjfembO15MyPnt89Y6Q3f37jqjL8hRx+joxb9V9lPh
 sMzcA
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
 arch/arm64/boot/dts/apple/t8103.dtsi     | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 3603b276a2abcfa6a730f58d5c6b9914f22f00b0..f715b19efd1679e5cd384a967d6e2a7c261ee679 100644
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
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 8b7b27887968741b745651e5133dffa7d8d20f6d..59f2678639cf47f469dc699c0ecb5b9e50a45ab1 100644
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
index 3f79878b25af1f7760088aa552589494d67347fb..6bc3f58b06f703ed79578e89a030929a18d57796 100644
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
2.51.0

