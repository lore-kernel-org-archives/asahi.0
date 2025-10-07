Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D52D6621
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835925; cv=none; b=BdwPVb3nSzBjFRr57gvKySMnJVQaIlb85eOT1loc57HjRzJEhW1vcC5AYyvpqc4S9j26mUAehZnZsez9F1+sb+AoxWS/ZoRVpeyVEqaZ5PmaGX6Q/scuXzofUGRya6T/2oggq6zAlDXJ64/7g7ZCyhe4enV+8A3BEy645IR9CjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835925; c=relaxed/simple;
	bh=l1N1qUSs7aNQur915ZEPIIc8ybGkzYfyM4nn88B18eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAoBP+IHWEovnE9kgFq/x8447g/79mHbuVbDG0uil4a1cf9NK/bs6scjmKdDbc3qSWcb/r7MXBYn1/uTgJ338ppN8sD+sOR/iePzk/kmg9U9+K3HS5MewEA6jWvLSHwv+K6UCsFNhHu4LZFK9Rm8N2lTcoPDNo/IdDXMUaZF8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B58AH3s9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B58AH3s9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-78af9ebe337so4036350b3a.1
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835922; x=1760440722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xSjj3Iwg14xHIfiMziIXjcapcCofRPyKMdiFHmwd9k=;
        b=B58AH3s9wVux3CpTxdu/wXLiI5JA85S2l8Iu1i/ZXKZ1cdIUMuhcrZay/e3Omlyzm8
         UC+wlP4C9xkevopgQbH+SAo5jcdITYFbcINq3Rqo1icEL/jSK/K34W2i4Sv7DbD8hsOj
         LlPtoriPEsVtEpenDVRtif3B3RMZgoTKNg0Q69tZ/BXA9PLZof1jqhbuTpFcVYME2dRx
         kobGbK+ZoN+4JTrauKFNoyJ0Zs7o7OC5TBm1JifqZGSXtmX9R5WOKS1dbANoTrB2P/eZ
         EIlBpDNJ6fjVS8Hjp4/uYFVLyMNMTs1ISej04vU9JRGc4LwxC+ouM8XR14T3cp8cpPOf
         e4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835922; x=1760440722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xSjj3Iwg14xHIfiMziIXjcapcCofRPyKMdiFHmwd9k=;
        b=UQoVLWsFe2Qn6bp/vxJI9dUwmkGmafIpztqqAtY3+JhPXCGMM0XHtGFxIG2SKBmbL6
         NyDGvdV1tVxPLiUj59Qzv7FjaINhpOw83LaGqOl6OjS6ZczOq/aFdT3rH+Ch6s7ev6jX
         k+ovfd4+6InWT5F+ITUnuYEa/1rk00dtAdFxdGnYCLpCbULomIYCpsbCWxxFazI8lnFn
         0HQVzVt/vYW3nkE+HXOtJfu87/skutMcbgCbzt9imJho+lUib9LuglOieC4QZyE+ASrr
         Htd274z+nFPpTJy9ZC9NG+KamdsRCBzgEMDOg5dqt57/BJDBvXaP2zLngo7S9PGRR0k9
         hKoA==
X-Gm-Message-State: AOJu0YzxPH4c1XfYuZgEwxNsM/XBI5RE9W/oGGhpKwbvaYfLxBrP0PSY
	iGFojGnGrZJPPUP2vHtBFLN1ug7D0dNv956kHbLXVxm0xKJQj4EKhrCy
X-Gm-Gg: ASbGncudQBd/h1Z4+e9hppCZY+ItLPyHU1KgJ+nc+SPvZr+BiixZKIXqKhRFiBqCLNi
	yMEfVCY0k0ACwuU1j5Dge+S3MPeEYzEJ4086a3lHbvpxG7jbuizS4Ni0AtwDAj4shgTxbCCTM7/
	u7KzfoFPPDDWPKS3h2cP9Sf+SuMQmZFxDJ5+ssmMb4eAAfxggR4lDkpaxG5MHJgwGKHeBr7crW3
	thxlG2jr3NQYFygpwwDjTItPmatUFEW8u5MpWR/+tR8mRwnLY9fJncbj8+0xjbNWmi9NdWKAQ4z
	592owdYOzugRrN2M5c8TdQF8wgAxfkqd0F4De7PC+OdWROm07mduol6xHpXolOCZ037ezy91GCy
	JW1E9YH08yhr0HtQ5tbLGgmnqsET6SVwjjcLGgnNy2Ko878q0dNA7aWdNtMD0WzRsvGhPMmWH5l
	1CmcXZvjUmr6C49RmroRWUzGKKG6PfRn9HxXBHWZVzKw==
X-Google-Smtp-Source: AGHT+IHQhWG4at6c4CSv92k3Kc2ZO7qLCe+WK+3iGElAPZoi7Z/HUsioUEndvALrS7T+2HHEi3fTMQ==
X-Received: by 2002:a17:903:2409:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-28e9a54423bmr206134295ad.14.1759835921894;
        Tue, 07 Oct 2025 04:18:41 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:52 +1000
Subject: [PATCH v3 11/13] arm64: dts: apple: t8103, t8112, t60xx: add hwmon
 SMC subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-11-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=l1N1qUSs7aNQur915ZEPIIc8ybGkzYfyM4nn88B18eA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1b4qq69Uht7n7+Jkm98m/LRPVem4gxb5O6ar954
 s7df7ZydpSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRqZ8Y/mmfN0l8cGTT+/aj
 HGrv5p1WYI5+xXPz5b3Eb+qv5wRNCpvLyNB8WqqikeUrk3D9m6SOk5mMvzVf6f3cW964bnHO3/P
 2XiwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple's System Management Controller integrates numerous sensors
that can be exposed via hwmon. Add the subdevice and compatible
in preparation for the sensors that need to be described
for each device.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 .../arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 4 ++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..e6647c1a9173 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -37,6 +37,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..680c103c1c0f 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -114,6 +114,10 @@ smc_gpio: gpio {
 			#gpio-cells = <2>;
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		smc_reboot: reboot {
 			compatible = "apple,smc-reboot";
 			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 59f2678639cf..78eb931d6fb7 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -909,6 +909,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 6bc3f58b06f7..5a8fa6daa00a 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -912,6 +912,10 @@ smc_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			smc_reboot: reboot {
 				compatible = "apple,smc-reboot";
 				nvmem-cells = <&shutdown_flag>, <&boot_stage>,

-- 
2.51.0

