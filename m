Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED2218C908
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248940; cv=none; b=kM8NHje05wt+3vMrFD770PFAasHWeMPN1HzckTqXpNNGS7dfRTxD4NEAOGHy8taexjpnyUVwPDeE2B5dddettnAtx/V4m8//jwV6ddnqP77a1uYN0JLc28OyHqZuob4RJqIBR8C4cNRAAOyXxaEAHTi5CF9vORZxC3V3J6hKBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248940; c=relaxed/simple;
	bh=kG58CaMEoU4DdU7bolt1bzjzFH1kroT8bMnpYUKuuXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rO9f3LIsRhBKii5IRw1PHvEHv/3J3oxlEMH0J7eHSwbOzaw6qa2ZsZTBtHHNB55GhEn6tweihOzBB+YW4DNfWrAbRkA/mfWmA1KEBZE/Or+wDDz2JJSF5mFOb4Z+j9lSQhEhEK6s9kuqyu8NWWjeuFeVdd4owDOjGTvTMKBv3C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDLQ3/po; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDLQ3/po"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a043496fdeso20616615ab.3
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248938; x=1727853738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRLCqNetYnYWyPf9J2UWD3fLwnbXhpstWw/tgUw9xEY=;
        b=cDLQ3/pomvTgrdTyf5iolRlXp+bWfuzzGE81BbsGgO6EQnxIQZzS2rRprDCwAfoAZl
         n4DpivtN7oaDpx3NQ6zfRV8dS4YmPhM7oGBrLZQ21ugIepWGwLvsPQ96+QFanwCIdjko
         lNn6tpp57hGxLndpsPT++N0tdaxRVuaKSyt+L3P6D5whMbyzS6yR4cXJFoK92I/GAcVD
         i+2slM0L/HChcla3CEu2l/kxQV2i3ML+Y59n0XX8SLOxDD6es3kmNUypJBwZb6TSArJV
         fAXfBCtUQw6ZjHUSrB71vAzsi8ADYnShiQ1TINwrzFju8L7h+ZhxQHt7j6n4TaHf4UcX
         7geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248938; x=1727853738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRLCqNetYnYWyPf9J2UWD3fLwnbXhpstWw/tgUw9xEY=;
        b=wXuj37bUHtHkgpzvsrHLC24pMg5MrmaJeg8Q0cOETTKi6Gj07QaU/mAXGkkixGuSQj
         HKnn9zN8X19TbPXVPWQgNIm8ceTfndRO95td2OxtpzkDVmWuD7XyaUuuEHzA51d+pdyE
         UAvr4UU1sFtSuvBIo6mbnwcHh49I49xeyZBg1NZ15/Bo5YGPokSPDP0ULalQfwGOzrAW
         M4AsdAQtj7eaLEltxeY1C+VWAcXOoTIxcQ4B3bH2JOhicN2olIEbod/QudTxgUvkl390
         wuKgGLNawxrBlE1lWIPdTSTcClRZuCbZb6h4aoS1W1MnnihJH0nF7AP26NpI4ZD08sAh
         QI5A==
X-Forwarded-Encrypted: i=1; AJvYcCUBKhDzTG3+5rMad/i9S6DOqe/tREvFpryWsNqn8/tl4gb1HmWn2jixOU4ak0nmwkXjKGUPJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM7oTC9rEHm1mSp1fJeFU7WKvVVXT0Kymk85IfpSrfKxgv30jd
	tAnaZ1AAegsEQLJmUyhhSVWFR6ackI4jCGnyZ8KUFwIHatMXUdRN
X-Google-Smtp-Source: AGHT+IETX8CWefdc0Nvnm8SysF1BFeNutZGW8jfx8k39aP+OdRQ7xmONHsOel/oUKonVTdqxPqZEGA==
X-Received: by 2002:a92:c546:0:b0:3a0:ab86:928f with SMTP id e9e14a558f8ab-3a26d7f49b7mr18789925ab.26.1727248938543;
        Wed, 25 Sep 2024 00:22:18 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:22:18 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Wed, 25 Sep 2024 15:18:18 +0800
Message-ID: <20240925071939.6107-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple's A7-A11 SoC is now supported, so the original help text is no longer
accurate.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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

