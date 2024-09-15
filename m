Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B78155322
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387787; cv=none; b=g1ENW1FXgjgRtNu2ypYQDwd+Q5EuSi/AhlV2mJd6KjSR3OqtS4XAs/iqlm2W6d7NrZG+O7lYtkTUSOFVhEA4C+iS8aWe2VaTgDqJU3fuJdezP20Rr7T9KoICs/7Bx+Mo8gea2PTSddfCQJ2WYkms1pI2aWwofiRlbL+KxBPmlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387787; c=relaxed/simple;
	bh=IlwfpKeYG1A6lmRpl2J8Js+0dUrkM33rNMIVVPeLcso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcbpANDJoIV9IK1Yeqd00X8U9AJZ3odsDQMPtK6XOaDV0Nm4VaXC0sm0dvmzyKnVv46BhE4fZaHBacXGE11PADZka3zYuQC9uKKWSWn199PdVeGVqnLmXdauSH1zQbj2IcPGGiyQavdEaQ+S0t3gkLfTA0GY33pY+TVE9dUgiNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=figMd01p; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="figMd01p"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20543fdb7acso15531835ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387785; x=1726992585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=figMd01pFyVCyDHLnLT/et7erqnRQw/xs2URZNCYIs7SnyB7ok75lCl6EJXJiiu1rv
         +/VP58tGr8NjLlhhlAgr5hN+E1sqo4bJIVJjPRzCLjZKa/aQ/da/9/7cQvHUh6c5NPAR
         0tLyPvbGiTcOxOui5V+ISBTv0JwYsyDZoxbfM1x34qTqfl40IatpVRfI/SprOdt0KiWT
         uvca/t7K6gHq85cnCcs0UfVOWip5xjejuOeIjrDd64VkwnXk8I7dGQFDui4PxP0N7nvn
         gPWBeaXt5E2+Uu0lEr3wUcE6w37q0XRrza3WuD2GNwc0+gfvH5tdDx9UCv//QVjAZ9TA
         M57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387785; x=1726992585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=TCg2/KIQ5dYRT0YUzPGzTxq3rrGX7HFx42Ff1IVkqI2gC5V/AX0oB9/cE+sATccHPH
         FUPe9ho/wDuDGQrFKxOqoey935bkFWy8xDStEpWfp5NHnqPwjmGjj8QCwJq3FUUEefPV
         B0VeT9mMFDXCl7/Nh1VNHNzFjgK5B4FtyqJYOaWCKEDAxulxwVSSidtEIJ2vTVJDGURS
         qkADsxUFYnVXq7VqEldsU1XV4o6SOndqUhaHCs8BqX0JPG3XJvtNtz1TQ3i0JSPXgk0H
         QGALbP+KGDisEP7cIy5sx1mfyr26QtS36b7MBbS8dCuKhrbud+9UM/DmxaKsxNm/+hhh
         2xZg==
X-Forwarded-Encrypted: i=1; AJvYcCWvzCSE6P2N3sPFF6fWk25U0sZ1M/Ub8ZhZ+DtrSrnRkVQXfwA4ZdVRGy1Yru6OKHHgBydQLA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2CzNLec6EoO1ewo0K06GhPW8bh470owevCgr43XSFdSQ8Py8h
	houaM9C0127sA6bJgvB5EHQtOva9DeZKuzuI4FLpc5bkKHVdy06z
X-Google-Smtp-Source: AGHT+IEhRWXW9tetbRUykWlZtl50TVcdbuFF9ykKbMI555PV2RLTxvSDad+vXmu1916oXJ3kbB/w4A==
X-Received: by 2002:a17:902:e88a:b0:206:ba7c:9f2e with SMTP id d9443c01a7336-207822414b5mr118708455ad.25.1726387785317;
        Sun, 15 Sep 2024 01:09:45 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:09:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Sun, 15 Sep 2024 15:59:05 +0800
Message-ID: <20240915080733.3565-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915080733.3565-1-towinchenmi@gmail.com>
References: <20240915080733.3565-1-towinchenmi@gmail.com>
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

