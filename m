Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902F205E1B
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987098; cv=none; b=nGobPPsXlg3MjSyrXHUGq3VqNZkqrFGNl/qPlN7TMSdx8nGlUPiYvYqZqFglmtNhX9MWR07c2FthsbpwvtRAOCuBczgRT2VfJoMvPYWu2ldCKTg5trcG2uQkon7NeOdm5vyMh79rsq9Aw+CMhsLj+3G1I5JNRFPLByWsokoQiF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987098; c=relaxed/simple;
	bh=lSmc5lpStkRdh6T2UaHkJlaMrEahYyD8GNIRGOk35wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Johk3d1fYYmuZ5blQS+wLdmS7lfIyenzIGKeF8alUpYZlnpwWfdyVAJuPOqlnpV/gOpT58314gxgAoFFtmtSJrkprR1uzGhwxw01VQfybYDbcyA33qMJBiFqTvNb5ER2mZhfSoO5EcWKg8eQW1Yuscdpc5KweV4nX2qOXaQ0iBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoTHXU/3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoTHXU/3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728eedfca37so290315b3a.2
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987096; x=1734591896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=HoTHXU/3lseaj2lX/NWllU32/kB5KsXj8mre4AULXhPwA4z00yY7TkpdyVRcEHIrtb
         g9/4pW2O71GW7VAw2CAoLdE8/+1RYTfpHR/I+CU/ydG3f4uyflW34pFIQ84+3lUx5XaK
         AZuZGBU5reXmGYIR86rMb0nTfeiVqN3YG4iIXq6WDykqTv2x0qnGUani6ELoGkjvCK6n
         QZPSdsPuyQpMnPTWhZlUDO7GeG18xrmukUUyl4JmITpt46RNiWygWoy2MB2jjKf6ZRVq
         44lKL4w3xc+3EM+3fF++di8vk9HgzNtqMdF40bfxkMjkm8DMSJ7L+uQLpRrGMEHPtneK
         ibHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987096; x=1734591896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=eIwOL6djtRlonH1Ffd88FR/HgZEHACaj+khwXp/n8qVwJKJ8Yr6TZv+y444ycrwreB
         0QbWZumhhVoYhC4b5qb+enBuWMtxnNbsz/4DAMhaQo3dRMRKjLTtbA5Xc6vCb+oG7RsY
         EZF76ClDG0zs2B+VxKuUYLjcG7BiMLKUSWze/C32k4/HQlN6LSsiVcTMV9fcBWwQxj4Y
         OyU8a7qCqywfQbNyxCzfx3n7zJSU1Yyf5Pc/4u7vleVUw7le6UMV5erVaNZtdCITAnzy
         /X+sVp80DPJlFr6bYz1AwjLpw4f+QOQEF566qxld4kqU7TpFP1d1w9HCf/6tl3TxHXx1
         Z1cw==
X-Forwarded-Encrypted: i=1; AJvYcCX5bqi9XUdCmh0EOgRKStWG1jCTK4S65SLkxmZHX1VNkQgc4hnBXj9MG+70cLKFWB+gz0dxZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDWSmC0W8KakRn79lWr4U4ylXii34/exkulEztGqZhZKvkJOHC
	oGJm6SIQpE6eBGOP1ZJdnx8YhrpBuSlzAEJjhbxkwwxnOCUOOHrZ
X-Gm-Gg: ASbGncsPOTHybo3LuCYqmoIAT87qVomzVUD/uygmakWRaP8Y6Vhsp3+0r+miCB/Bm/B
	BbUw52WzY7U/GSQLtqR5KTE5tqGlG5o4xikVVMPao8aNUjlXsTDvKOs/BkP0H5vZ2Rp2cd/c/5R
	nCLEz1YroDDwmB16GEYwSLpjQM4Ls54QGCEHB1kpJK+IH792Y+6Tdqg3rMoDlDS4Ms7K2X9M80x
	ZtX5SFV8CEfDfESo5wKPLCBS3vJYFK/UEt18OETw0sWpwrQRXhzLzhaeW7ejAy4cijBeVKR
X-Google-Smtp-Source: AGHT+IHKPAp1Y9VHLYOP5k5Lmr6P41gM42/smjErSsBmXsfXGl8fcB/4q3SDqlWrJH5E2MTneTUBEw==
X-Received: by 2002:a05:6a00:230a:b0:725:eacf:cfdb with SMTP id d2e1a72fcca58-728faad3a55mr3591696b3a.24.1733987096031;
        Wed, 11 Dec 2024 23:04:56 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:55 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 5/7] cpufreq: apple-soc: Increase cluster switch timeout to 400us
Date: Thu, 12 Dec 2024 15:03:04 +0800
Message-ID: <20241212070344.3858-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple A11 SoC takes a long time to switch. Maximum switch time
observed is 345us, so increase the cluster switch timeout to 400us
to be safe.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index b27d261fe5a6..94e57f055a5f 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -53,7 +53,7 @@
 #define APPLE_DVFS_PLL_FACTOR_MULT	GENMASK(31, 16)
 #define APPLE_DVFS_PLL_FACTOR_DIV	GENMASK(15, 0)
 
-#define APPLE_DVFS_TRANSITION_TIMEOUT 100
+#define APPLE_DVFS_TRANSITION_TIMEOUT 400
 
 struct apple_soc_cpufreq_info {
 	bool has_ps2;
-- 
2.47.1

