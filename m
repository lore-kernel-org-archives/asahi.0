Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA121494DE
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658786; cv=none; b=a0NXXcmufmqMd0+9kMPNgmQeHkkKd9wtt+CrgQ/X+EVIBwfxTl1ZywUAUDGe/W1NHSSfx68NJ577uSDICWn09zLRkXLDi0CEWbeGm1pdkKBEFWr+2VEbifaoEZoglbldtWNFZMuXDYcH6c7cbmYclNNhcecJ86unH79eGmyhZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658786; c=relaxed/simple;
	bh=ct2YcdcBOxSZ1GCGb1LeP2FaYCRJZl05xZd1vf0mRTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC+zQ/gJWZEO5D3wiGcAkAsWiEM2EBoL1LMn/2Xp3s7jV+npfmH15XzPesmNKT9iCDseKBTRmwJD2OOlOSM8ahIPqjWrHNpMLQdbUYCpH42W3Cxf6q6GWQRGKdb3diHcSev5NVraeq/p+hma7o6pMu/EFSXOnPPbGU2CGLyf3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvtdcLLI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvtdcLLI"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cb47387ceso57367395ad.1
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658784; x=1730263584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLcv3ofcVGTwufnm7xv48GbGD0iBXCtvjDAqDevq6/g=;
        b=JvtdcLLI8uOaV8xstnRxQ2Z8G+NQp6aTMcdWmtbVcWDOsHj71GolwBMp5hVo7Jricl
         tS7NIniOSjqXP9eC5qi+ghbVXLhGcpd2ZGRud4ZuV9tM0zuHmyuXtVLTrfAjNL88deMv
         RrQLptoJNLf/z3nO7qEqMu23f0y1jKzFDTNJ1j+mZWRHHkAX1GNWQpdXCYzITtcZk2rv
         W6/XxjlZSczScnuCzeRHxElY/4QE/7+NpMwWIWIjVVY/5cY1azn+KDChhb8SKlLFQY4M
         9AdniR7YaWZ7FIF5etGisZWdZ0WsWSBubAW6ZNK4hE9wHWFwqJff3kXaYpxiaijqlQ+B
         4K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658784; x=1730263584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLcv3ofcVGTwufnm7xv48GbGD0iBXCtvjDAqDevq6/g=;
        b=QCkSo2nn5RdWBeSUX8vXKOXy/6My6r2F09p/68KoR9qiLHxvBD6nUCJZSfIvX5+pOl
         9uzTtQBp7jQk5xdrxlLZGPsj6d3h0g/K04hhC0DocwV0m0VFgWbiLv+3ceG3aI4WIrRH
         xZFDNHy61Y2mXupYI2TXf261iwUCiS58RR2n7y3KbIaO7hXr9jNcCZ1I1bCgSToSizQD
         PGjMKd7wa2eGhp/2DqXjuM2Ci1Xt34jzxMuSa0uhp4VgtOSlwlHUzN4GpJpfciWfn5bb
         1ItVtnLOMq9SiL67rPX4Pz3UFEFD9Fio4vSAj12TVHJi12HWxOt02KJh1xrxIiE/TouZ
         Lh9A==
X-Forwarded-Encrypted: i=1; AJvYcCWFyUTgPDEWHs7sSnf5ReGFELYAS8dVHQwPG67jGI9bSlMpt/wKPTQ5SHvq2ZL3KPbWoQhFOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR8y6TI0sECSFRrPe4FDNRtRGuAY2wsRO4oTQL+i+8VSA3qbkK
	DI4Qam5gkOwmh4nVw4JRVGhYfEza1oQxCQlYv9Q1EACAHs3aIUyh
X-Google-Smtp-Source: AGHT+IGJc9K6+XAyG7TzhnIXUf/vOUd+gEXzWdOW3q7WEzSqw/gm879hGuoGPWC3vS6E2GXg4chNXQ==
X-Received: by 2002:a17:902:ea06:b0:20b:cae5:dec4 with SMTP id d9443c01a7336-20fa9e4b216mr17874595ad.24.1729658784493;
        Tue, 22 Oct 2024 21:46:24 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:46:24 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Wed, 23 Oct 2024 12:40:55 +0800
Message-ID: <20241023044423.18294-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
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
2.47.0

