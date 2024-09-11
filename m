Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6ED19E995
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044518; cv=none; b=mvvkYsdtXkdqG2I6TuxDv0dR6mKU5bCCjUHC5WwTZpRL4eNgMO3XPotVbmaHnMwTy3w8AoATlonkhlZBa1Zq/dWq5oYjquf+XroZeqHQt77LDxqxjBgTqAM97yQ83jBSaMVpnrNkk90DDo/1Km8eEQth5gpoLZEoNJpcnUsDIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044518; c=relaxed/simple;
	bh=IlwfpKeYG1A6lmRpl2J8Js+0dUrkM33rNMIVVPeLcso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iukc8IvS0Q/VEz+PMWfmY18yGk3wBhC92wlKjB3D7monpaqL1VK8Vh+/Hd8FmyB2IQ4epb4TAhMfsQJY2DCyDMiNBd3uFO0u4TKbY3TonOhMUJnr4E2fMzsaGWxCgcXEk3n/HK3Ua7GRRsZ0YzjUIguhX84nhpiGEbozt99i8Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMX4GETE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMX4GETE"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7191fb54147so161711b3a.2
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044516; x=1726649316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=kMX4GETEAbB/uVZH/FZQxlSyrJ6Bv9RYhZyLIpGTEWhpcrSSyb9TgvvLp6PJNJ5S9F
         T6oSEaNnouqajAWxl8zNzewCHcYcvto4LouIAKfI2iIKppiJriddT+40ZMcni+XlA25o
         jCWpnaaqlnnOTLlVFiy8PORlQY6nz+L5TRcjOZxa/uoqZ9admLX/0KTMYvXEln38gGrM
         k66qz1goKCIcFtfw2QVX7cUFWyD1yy1fMc4qTnPl25BFVlH0DyoRUS/C4u70yApbH6/B
         a5AQ4CadJcM5FJhdmV7BCa1jQITXXJVaUuBHiijJ+rhvRiY20NqZQLs5r2zkgwQbikQI
         9Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044516; x=1726649316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=p469btifxrseMdp/ZQla2h1iAyFYcDklyx79varAbPXiqyVntW9jbgtXSnfUnWaxYQ
         BjjVyRmQVRck41Ygb+40xb5ajKA3BksMDH/yvYgA2KeuDRA9h5cdriiAkf7m9xOC6F+p
         Vqg4hUcElz5ox5plK79gBvxz4jYfGetvS9qMW2te4rKe4YJi79yiIMF+xvwqsfAVn891
         JWu+jSzo8p47FuiMBfPsDiWa1mUd8pWELDwRXhUrwNNLxQjv/8kAYpdP6P8Ma2DVTEo2
         XD51TFe6y8aGnQfrbGty11K+J+lt9+KXibEuJiCfCO5SAibkuRopUP+kw/H71wZUqZKN
         jjPg==
X-Forwarded-Encrypted: i=1; AJvYcCXWiIwsi11355tXvlUw5Zp+JmGWd4RRdzpwqDTIjuemIove8L4EmZygGcjAwl0Gwc2MizNYqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSAdh4XIeN4naXD4B8V+/X5d8R4PVQgsHvdMiUJeP4aherr0On
	yG+2dMv5Wetz+C35WJrSebz6kx48A7ouMTaMkXhU9ETHGanSM92TXSUK1R9c/EM=
X-Google-Smtp-Source: AGHT+IEIz5d//17WPnMDgMVDUYvH7+sxfpmlvAoBsrI8xaC6pMBmCRrAzLDUicf2j5d88qL+NqMcTg==
X-Received: by 2002:a05:6a00:886:b0:70d:22b5:5420 with SMTP id d2e1a72fcca58-718d5e5476fmr26897235b3a.15.1726044516437;
        Wed, 11 Sep 2024 01:48:36 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:48:35 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 22/22] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Wed, 11 Sep 2024 16:41:12 +0800
Message-ID: <20240911084353.28888-24-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
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

