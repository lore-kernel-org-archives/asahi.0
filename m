Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E662336AB
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916195; cv=none; b=R1R08T1gNqHA8qGPCYpNkYJth/X37AGDYvpn6qEE27UMy9RM8+Pe3RRjV94Y+1V/ryIsso5SJiI2OKSqbVzeATpvydli9BLnvi2QfF3p5tdnM1N/ri+z8AaVMCyCIJ+ba14YBo/oCsoqyCfW4hSVqpV2gzszrvbm5pUe86aYav4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916195; c=relaxed/simple;
	bh=RgXy7GQICkh4yaDvFbIaxUPIIfKur6XP15eVhbM+Yts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l21fyjAFuMLItfw75QDl4DWGmAF1cJdwrVRVLlXx6HkH0vudCOAJAKz5t76KwqkrTq5N631kPVKXHHnKJpX9ILGtY6IKPAT1rowZ3YZ7zvNHYv0IXj+3rE3lmj4OEm8p3robGxSv/l0qGRXTVp0V6woBepIi8HQMPRNHbzbHTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHjH42cV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHjH42cV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21619108a6bso39065565ad.3
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916193; x=1734520993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=hHjH42cVERAIygwqlGZeQpZFtFLiS6qKuDGwy80cczS0usgG4AQ0c9rAEBU2ACAH1L
         xDioB7oQp1qtoUbytMQ7cDPHFX+IGz+jY8USUxqoSxjwhkwu8gkOwuemR0Fw9hjOC1mq
         i0kGF04oy69sqLBGoVZnPUcGxMQ9ohUBbjEg+fF0nNY/os5TgeTsehw6z3EoVfCBmVB1
         JSJBAnkoebhf1mU49h3Amb5Nto38CmckclKws3IaA85UjyLFGusbIbPhfhlax9lgGwiU
         rcjrEVktybEfT5Dy1bpEtv4exawkumY/pJNc6r7XTF9Midzxy7eMjUDyV1gRGbjhCRCf
         Isnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916193; x=1734520993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=i0f05afMbbzi0InqjJYGls6zDgkFoKwVkqyKmR7mz0zxLxlK6qaa2YV5QSHnVK+5qb
         7nYIim/2uKga2DiiwZ3PW6pjWXAUpkTQlOf7RHtPqvJ4Qtfmq9Tbmt26RsiFL/3s42Gt
         CrZEulrhafzwgx7VJFbbUJDgk+1MOEZVr1d/E8Gq8h/IP1GTgfSjK8qjkkrRNFfxA9Hj
         ZELx7ON6vOz8dajOwDQxmbXSrRZlM83Yz0iZjaL67j0PlxPi9g0cmn7taCAFNVqrRymg
         W9E+wj5WdJSs2o52bFNKxNBqWipMqP5PwLPbGMowMjdzqhE1mITB1M887ClZJiUkT8M9
         gZWA==
X-Forwarded-Encrypted: i=1; AJvYcCW7hZ+UfsGzCXAP4Ng0M94j7vv66EukxNbIXfUbZOfttgCo6FjwRbheQ68einMooHag96nGdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaLRIXAuxh6bWa/w2qaadEX5uYjcXt3PY66JP8pc033wAp24lh
	NUsxVtkYdtKBjioNJdnUeVEIyiyd8NIWxS/kQBnOZ//Z5MUIIOCC
X-Gm-Gg: ASbGncv3yEsMqkRAfXib90UnbJsPBmxpa4ijc6ou30ncPXm4x3Cmow5magyzIXY017q
	xzL/I5gDr4YvZkTXdU7f3sbsqm/jpLU+BFk3lhRrbwLQu9Nn5goz0/5O7Kah/5e1WyjLUhlReBx
	9EHMu6uDToGprWqPP3qzs4aCUDdIwNMa05tLmdJTSqLy2p5SQ+1gFfUWkRjLafjfRQvx+RHADJo
	Naujr3bHmFu5LAZeyinLUikoodcPoXaNrKN1lHdy4NGMNsjbT4IXumWoEglWoBEZErJhw==
X-Google-Smtp-Source: AGHT+IH3ONBmas7xlrBFZwEBLUlf/D/cSYjNZZPpeQFWgFHm/3eyRH4IxETbO7fyTNvbq/gjEuALFg==
X-Received: by 2002:a17:902:ebc4:b0:216:2a36:5b2e with SMTP id d9443c01a7336-21778536b37mr48738815ad.32.1733916193070;
        Wed, 11 Dec 2024 03:23:13 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:12 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 3/7] cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
Date: Wed, 11 Dec 2024 19:19:30 +0800
Message-ID: <20241211112244.18393-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
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

