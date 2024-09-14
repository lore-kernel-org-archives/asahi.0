Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4CD1925BF
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291615; cv=none; b=CWHOHwmFMA579jVTTCU1iHh9rF7OFW/dzRYVs0e8Uuf205QMBUamWEHCfgwMce5LIjFZpbb7Obng2IZkzqrku6oB2kD+ZYY49xarVz3RrNfI8Mq/Zj7MVsXk4vd+kNrfcT0zn4L8jxpP0dQEDf3rBlUSPsu/+H5J6kY1Fp3dfnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291615; c=relaxed/simple;
	bh=IlwfpKeYG1A6lmRpl2J8Js+0dUrkM33rNMIVVPeLcso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBcUY/5w7sO44ZjcpBsHXI+Prl7lJGWLmTsOQBQ8qicKuZ5VlAmDSBB2BNo7kdZJDU2YfsIpE3pgy4E/BY1GRjfuHhn41OIHccHbO+pU7KFz/4AgEJl/AZnG0rj2tVtk/aYw/jKsw2uwXzxmkrVfKQfYwV5hoTYpJWxxgIdBE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzhYy9+J; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzhYy9+J"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso1310328a12.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291613; x=1726896413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=fzhYy9+JnbNR/ZBhp4ltcOtBMYireA6njugo2UvQgG+uSeVJIDm6PC30fymK8wajCm
         b8y78NQWbdVAoyLbAGEV3i6keceKj8YD6Ud+HQoFpR5mEl/TrRN2QZPTFYRfgzKIDVU1
         kaSEYOtEyfOXZ52TXlpR9a9gV3x+SeJJfAHHpDOy8gp9bHjyWFr/uOapenVDePTWvv7g
         4xZKhTyxs0QpCN8VldQOqvqvbED9MehPgDbd0JG5r8kKcCCzH5WvP5E29omeY+9t8HcJ
         cuz4XvZWZtfGH93rTe6o6F+R+SsngiNqFWq8YW7h9GVF1AfYOc559NC0gdZBCPdgkrdE
         KGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291613; x=1726896413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy0C2tn+S+ad9UGMaUozuLH5nIPIOY9VH2lYfYG3DPM=;
        b=mc2MNL8q7LNmV/eGQvaJIj+qB/9Oh1hpD1LdUVDZ3Ivxp+ojjkf3j7AFn+FDbR1DGI
         WnAuBFjeo2ZZlx62Qplyg9dMnJamA748nQE6gEDVehW3gy/Y7vAjA26a6cSUqWuhKQRH
         ZAqKKoiu/MbWqzKWcGzk4pZdSyYLRhGZ1O89eGMrezkxKnlbfxZ0boUD6JCde0+/HIWc
         gMMsRrZBkMtP8gGHc3Uir1lXrTw7lugWJAQjjPnnOeWys3BgQ7SkHo1y7fFL9SR1q5eN
         33QvPMeOHYONWQ1Xu2MNPuAq2xGWTbbYqU2o8wXXf3NqBmvbCgKC3Fe8wUjFOZ1j2cgB
         QoVA==
X-Forwarded-Encrypted: i=1; AJvYcCV5UPadVboO9LhaIKYIUjRxq1sYRlj3lI9rUFbfXdldB+VLMkHQpR6UllnAFK5yFZhmPpzpjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yycr8wl74GK3nPtlrA/oLl5Qzd5XfokD8xumhTwiCSejklWIOQT
	GAhJDk9uvfSJaQLwOpMIrCOfGhiHQVLhc00MHhe6/Ux0NwREPYGI
X-Google-Smtp-Source: AGHT+IFAx3i0hnBuicVE8YdLzp74NzUBOGZMK0WvmVsGZX4ALFKO/gW3JhnXQICFiSDi3OGKhSwvZQ==
X-Received: by 2002:a05:6a20:7b26:b0:1d1:17c6:7a38 with SMTP id adf61e73a8af0-1d117c67a9emr4578281637.9.1726291613169;
        Fri, 13 Sep 2024 22:26:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:52 -0700 (PDT)
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
Subject: [PATCH v2 22/22] arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
Date: Sat, 14 Sep 2024 13:17:31 +0800
Message-ID: <20240914052413.68177-26-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
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

