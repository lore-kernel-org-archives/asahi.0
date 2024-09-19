Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54B1AB524
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762627; cv=none; b=hru0C6SLkSDISiKH5gnvX11kKudT2cfRpMSnmSSsPFxVgzWAdrl4qoOdt5XO4h1Gv2e1HduFJm/zgCj98iaB1Xv1DhGyXPNTYor+9JQ7xdd+B7A9RYD/nNbKCUMsi+J6WD0lvYlRkVCpg2UfrsaTTr4B307Ls7VF2V018WWVtfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762627; c=relaxed/simple;
	bh=IlwfpKeYG1A6lmRpl2J8Js+0dUrkM33rNMIVVPeLcso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3eEQ2cTnYrppNxOrx6xvG6WEdmuz5s6X3btBDalO9mH7p9S3X/l1s5QoI4wqLqXCgPBbWEB1Kd2WmNbmCBFZ1ZrcoOhCGLBo4NPTRoIEYpqR8pa9e/L2R5olRtusdyJidf1lv1uU9clfEU3U54YKUEjK8Qa2dU/SHaSOg5/OQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlOuHyu2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlOuHyu2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7d50e7a3652so610281a12.3
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762625; x=1727367425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=IlOuHyu22jRsTrcDBVVu4swjY0mZ46dyXWoYndRpixjtZe7UaeM0oMd8g4bUm4osKj
         qMIrh++o6WBeAoFNkXGV06RTfi5tI3ArNALTjbbH6tR9IuSSjMO31zkGQeroikXZyLdt
         WsayU1moQxq3mkbNP3eoP/Z1Bn/Gn4RbhfsqvMCgrcKNMvpZJM4Ejh3YJgZESO7RQ4mx
         HjSaplyqpMOWDS5oOOjScpzBVFN3s/xQAReSsV9//iCxvSQnSass/fc16ZwyNkAjs6+h
         0c+qt+ChX4aAPBdS1xEVCbvbO1jr83ByKWRYHQfYvgdNgpuipYlen6Q2bazJDCkdMlNs
         K+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762625; x=1727367425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=bRv1aRPigZbImLloIibEKIlAEXykAAszJZOOtfnpa5NT9pp58sJOkP4siLPUlm6IC4
         r0b3eb2l2o0x9ppfM5rUSYBbAXcsHvvm7GFtgHpCrmolfHVFkRc3gdexceYZyEnSfpJL
         wSXdHwKer5iIGn0c4fykOOwC1mn1n7CNDQOdUMpdcJDeuZxJhEKEZ8zpjKgTMbO4SzKn
         3U64dRfCHwZaafu9InJX+uN9ebWPImS4b+bw/rl3/hsOinIYzPPuDoEoNmwW8478G37y
         JBUXL6dev2Zg5WoaxkWWWA9oV2R2Q2gfVyT6tiGadtx7zYVw+GBGYbHMA+GMXg7ukiAA
         WmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKPY1fZJc67ebW0gYcIfans5BaeKrARZnAkYhpCaNoPFc+2xgto0Cp/2KnSCO6tkO92L/N3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPHoQrwd9DuihdNvA5nLSSzCsaT5yuvKN8DPayR/kh1gcSxJD1
	IzBWZ4ZiDdf3yxP8JPl5HRbvIoASeY9UqEFbvigJ2F9roB5KdB7P
X-Google-Smtp-Source: AGHT+IGRF92p4WUX3sebubNh4Ll+ZX5ut0xjvjFQrZyc8PPhy8mSH/poADCmKduZBnqxmWGKnJBn+A==
X-Received: by 2002:a17:90a:68c5:b0:2c9:6cd2:1732 with SMTP id 98e67ed59e1d1-2db9fec89a1mr30095674a91.0.1726762625354;
        Thu, 19 Sep 2024 09:17:05 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:17:05 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Fri, 20 Sep 2024 00:06:09 +0800
Message-ID: <20240919161443.10340-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple's A7-A11 SoC is now supported, so the original help text is no longer
accurate.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42..370a9d2b6919 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,8 +37,8 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	help
-	  This enables support for Apple's in-house ARM SoC family, starting
-	  with the Apple M1.
+	  This enables support for Apple's in-house ARM SoC family, such
+	  as the Apple M1.
 
 menuconfig ARCH_BCM
 	bool "Broadcom SoC Support"
-- 
2.46.0

