Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC191FAC48
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546551; cv=none; b=U27HveQivlPG17ciQxEoa8LD8ljvhoWxqCEQAcXYqFa03TN/Oo0q3PDqVc6pPli4pcyjkASAZ69MrQ4oigl7ZDA5heggS60o/bAjFHfD98REyFSYrCb7jjPYDZvCCJFw0aavcWMq4k/H9lqQP7f/D7R+Jy7yZsxkTrjpRCFuYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546551; c=relaxed/simple;
	bh=RgXy7GQICkh4yaDvFbIaxUPIIfKur6XP15eVhbM+Yts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMCWyj8x5HvlawX+96bSL1SZQ/39tsRJJwvEOcOjyon82bkBQWmE/+67z+bxeusqI6MU7QnXakbXbkCBMnU2q0xD78O3Q+sA4bfUiBUMk27600O46Sf8FuRW3kjPClZVvdPqQdMi3jlZ1VuTMLvToHAneeDkHKL7fC83alifLrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0NQk+1y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0NQk+1y"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso47212025ad.2
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546549; x=1735151349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=Y0NQk+1y/703MEKhjFZPaeZm5lJIOsBD8fgl6+okzF+4dIEN06xBMrNSz5H0+lLz+9
         7ZBuU+NkmpEra+fmR6fFa7hxQgysfYii44kAXKDGf/fsmNkA0CzcOkhxK+ZjmCMtcqes
         FYitMkH/ZBVWrTtNEYDkRVJWbsAXh8N/zd8qBEfwppCx8agFzmPVWie4tSgQsUYa+01z
         V3LTDx++Dv8EfCBjVRAFolItsjb793D+BhWn1snWYmDdDx7KSf8E89J8hbHbosQywqzj
         cqBlbwHu12ZR/1cIrD+4yO4KO8GdA2dBr40+Y08OvpDNxaHyvKJTY9oS3FLZqWrT7XtD
         gLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546549; x=1735151349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=cy6ogKEUKTSsNkdXGCDiY9xb1l1ewnUv+MPKX7ZE/HZU6qYiCQx9tghYe3kCbBIToF
         1ZNXsjDSdOIk2s61sWeF30cNbMOtvDKih9XtzWls8683qbxlfuIrsMXU2JEFuFXtfJw1
         EEat6FKv0yYkShEQhcc2vupePTFYZaSv2QA9f46vARGQG29IImY9fvgGH4JiL5Kxqnhd
         A/+98ZRDRcOYtUXb6Cg76sJxEPDQEHS7jbIPbXvaSa225UmAKbfVkDiHfumJ7DyapAFG
         YHzi1E+JI23MeZ6s5VCChTIJdSbd6G1vhPWnvTCylTdPLkg6S+rX7yzqB4YzWpHbjxHg
         FaTw==
X-Forwarded-Encrypted: i=1; AJvYcCUGIJfy6wQKBlieEBwjRx85Ey8y2Bx2AruChIsGXsupQkkeTJZmf++1xsJXXkvCcSmiHqXkOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlNaomReBFeBSGhw3iXam0lvJTQl6c5zzz9qT7xc0ELPADpxDb
	UOTh6ZBmzIb/8gbf2OB5AQnA5pUWhEGy9+ZKU3mpI1siqkJ/kckQ
X-Gm-Gg: ASbGncuqdcnjJL51GbuHJe6Nny+8CYsSWQdX0ejn8SlLXy+zjgPsspLozj6PBbROBFx
	VHvIzEYE6fP+BHqFl/xtnbOPeg6JDJje9cMF34iUZbnlUyrxn16oOZzkgx74ZGaimgJJrYf2xrr
	pXUwGYs1Q1Yhdg+eqTMiWulP3gHGoPM0Y3dw9ShmzLg5bLMUtg1cKTcrMYeJWWLxCjC+S1nNd/P
	rvax5jb836W+/q7uG/j1/FFj69FJmWFJixlOIIfcI36OCyRiFuGKCbRlQ==
X-Google-Smtp-Source: AGHT+IG1dFfYMmtespCdHUdswr0tOQu/Hh+8bBbhGRfGdZaUlxpJm21y4ELjB1GOE2T3IEgQCtqhaw==
X-Received: by 2002:a17:902:ef08:b0:215:6489:cfb8 with SMTP id d9443c01a7336-219d961571bmr9961945ad.10.1734546549047;
        Wed, 18 Dec 2024 10:29:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:08 -0800 (PST)
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
Subject: [PATCH v3 3/7] cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
Date: Thu, 19 Dec 2024 02:25:05 +0800
Message-ID: <20241218182834.22334-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for SoC that has a different APPLE_DVFS_CMD_PS1 will be added soon,
so modify the driver first to allow it to be configured per-SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index ad6c7b8f290c..90e34105b50b 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -27,6 +27,7 @@
 #define APPLE_DVFS_CMD_SET		BIT(25)
 #define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
 #define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
+#define APPLE_DVFS_CMD_PS1_SHIFT	0
 
 /* Same timebase as CPU counter (24MHz) */
 #define APPLE_DVFS_LAST_CHG_TIME	0x38
@@ -59,6 +60,8 @@ struct apple_soc_cpufreq_info {
 	u64 max_pstate;
 	u64 cur_pstate_mask;
 	u64 cur_pstate_shift;
+	u64 ps1_mask;
+	u64 ps1_shift;
 };
 
 struct apple_cpu_priv {
@@ -74,6 +77,8 @@ static const struct apple_soc_cpufreq_info soc_t8103_info = {
 	.max_pstate = 15,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8103,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103,
+	.ps1_mask = APPLE_DVFS_CMD_PS1,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_SHIFT,
 };
 
 static const struct apple_soc_cpufreq_info soc_t8112_info = {
@@ -81,12 +86,16 @@ static const struct apple_soc_cpufreq_info soc_t8112_info = {
 	.max_pstate = 31,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8112,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8112,
+	.ps1_mask = APPLE_DVFS_CMD_PS1,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_SHIFT,
 };
 
 static const struct apple_soc_cpufreq_info soc_default_info = {
 	.has_ps2 = false,
 	.max_pstate = 15,
 	.cur_pstate_mask = 0, /* fallback */
+	.ps1_mask = APPLE_DVFS_CMD_PS1,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_SHIFT,
 };
 
 static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
@@ -152,8 +161,8 @@ static int apple_soc_cpufreq_set_target(struct cpufreq_policy *policy,
 		return -EIO;
 	}
 
-	reg &= ~APPLE_DVFS_CMD_PS1;
-	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS1, pstate);
+	reg &= ~priv->info->ps1_mask;
+	reg |= pstate << priv->info->ps1_shift;
 	if (priv->info->has_ps2) {
 		reg &= ~APPLE_DVFS_CMD_PS2;
 		reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
-- 
2.47.1

