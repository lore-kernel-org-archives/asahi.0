Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A0193061
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284999; cv=none; b=HrW1wvuO1N7BXJb+azAwwfmCJppfALRoyd04B30og9me+mFv94SkVJN1DC6mtvaF0w6NQAMMDKl2bBYg9BbRQg5R3dlh+QHbky8y/Yt+tJtV14abFgaPrm3RoGo8d5gzj5KxvhgysjefPL6CJqaDwMw2ADFyufAoeGN6q1Y6VJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284999; c=relaxed/simple;
	bh=gOIYZwKs5vSSMo8w/33L122ipvlInRPHjZ+qfpm97rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rl0jvcnueFKDh8OoU28I35cANOehfge68ll+Vvfnhw9pSD/cJ4QWjibQ4LSI+f0DovpsCUSBI/b6bibg1yWoOUdbESJTl+zDyttaSgJMT+tay6+yB0hSpZbukDQJGHzNNb3BfKzJeMSkFpkpjydC2eQ5slsYMdfGFrPblmACxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjVfNDtq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjVfNDtq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71df04d3cd1so1850656b3a.2
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284997; x=1728889797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sl+TVhC32f8EoGwSrPtlAtdvqsYDggID9PONiLSLJU=;
        b=JjVfNDtqwqx02ZYL231lFgPX2khbh5jQL7HZAntbUYY2TCq0DwhZnIt6rDY/Y0Oajr
         qsLWsFYA2IKaReGX+fapeu4vzdXoutD4IYiV4F+PSp5jlt6F+j1YwElFWG9oIDsKub2R
         7BTmQb3jpLedRVF/m/5qj0StUa3TDOwKYC69tV3tsTNTmMmAvDaSUvlslecquePn+2dH
         64usnGsaxBowr7+aFxUB6BA0Nd5eRk2b1hYnV48LqPqGlJzT/zG2UJA6qLAEHufBuPPE
         GM32nyC5OLyuYT6V5RC9QPmXVhAysvrAIxttI3pQcLN48mrlg7p6zPMpLIVvI98zMNiO
         e8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284997; x=1728889797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sl+TVhC32f8EoGwSrPtlAtdvqsYDggID9PONiLSLJU=;
        b=ixdtFwCVlMJeWD8hAARaOXvGDkWL8k9Z1iHXP401HRttulXZ7a+xkujFp1psWHqsq3
         HTlQgQ146zZECe1JtWuZxPrhY3As4Im80l+BzKiTqXR7dkWfMX7z2C6IRA1SCFyedxx7
         3hdol7TOtqmy10AlnedNQOpZbAwe5DwKOUhoMCyTtb4PDYQdDqwDjuoM/P8Dwo/iBjiz
         wcH7f7xkDKCmJU5Y/sNB3Pa4TNy87uIZXR6Yo5qIPs259Mz69o8EreikX972DeBg2ek9
         JLy65t0GUuG0BdFhTf69SGlGcpwI8hUHka232Wc8CF7gNuMVOlpT74XM275NhzmJ4S/c
         JQQg==
X-Forwarded-Encrypted: i=1; AJvYcCVyLevWPKmhj84WLxrDnK++2KyamSynN1+1SKGR8q3XvRoRmrvJ9qznwzDHuP6OXzuSXqve3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZfelqCCKIadveku/f5X2UokB1J92qPEfBAy3PjYNHO9BGc3cN
	7tVRC9XARb2eO/Ozpx9zETv684Xl7SbAUHnxt7xuIIj1NGkB4Spu
X-Google-Smtp-Source: AGHT+IHEB+F8aJWnrf7tJdvve5iKKeFFLsk0wfcezmGTmPflpzDSthe9TaZHGkrglHA/LCrpyu34gA==
X-Received: by 2002:a05:6a20:438e:b0:1cf:3461:2970 with SMTP id adf61e73a8af0-1d6dfade021mr18357432637.41.1728284996867;
        Mon, 07 Oct 2024 00:09:56 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:56 -0700 (PDT)
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
Subject: [PATCH v6 20/20] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Mon,  7 Oct 2024 15:05:45 +0800
Message-ID: <20241007070758.9961-21-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
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
2.46.2

