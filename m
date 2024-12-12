Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6DB20550E
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987089; cv=none; b=oybnQdzxCTgDid2/oh6uLsbctqv8yF57BcMO2XW7+Pg4qCLL5McOpEGIW10Hvx5FOY1UAjOXtaG17jBUz4PSaeGJMT8r29XRTdhPKkXp6daNRUGEiTgY7b3zt9iRO58nKvudyp2uZKbxR5z5kLVMVktbn68O3ruksZK8TD81E8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987089; c=relaxed/simple;
	bh=BuOxgI2CbOrK9Hxnatsu8Mn/4pRiwpGqt9d6S48h8hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFsoKh959l86ElTBlnGrNDOTLEqvmJF2qw0/bpYfqh8xLPwkaYkq+7Q4rOxO3RGVeykWidSl/3Lfl8sti+w6wCQMkMA21V78yxiDYlwohA+tkTZlWLXFxwcZIhBAEVT7SL/rNHgPeuLbokX3XvkNgAQLfB+LMmVbyF/mkEd1dMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPOTJaH8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPOTJaH8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-728e1799d95so327186b3a.2
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987087; x=1734591887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=KPOTJaH8LRbB19YsAaXGsoJ5Mrrz6e0/AjQ2wzdLHwg9sCJA/p2WcmKlaEMbzwYszn
         5gTWafU6ZKc6qRRijClzBNF1kFa9frPegrDSthJ8SCaKGSqIjnXY2iqfH25RdZGxF53e
         BhbexwfHxZJTrY1t3lRdtDeui2Lr9MlMJHLQMJJhjf7Z/KZqvmL2YPyTACd+QdMlWXkb
         r440VBSkGzZZefFR62f+WrfUIFFRwkFIHHzi6faX6ELhu+HqcW7t9Zh/7Ip8DX22TLqq
         WbvzAUaUZVUPNob2/J+r8wTJZh9Q71V70oi//zNfLkhd6jXzCx063faK0+ztkW047h1v
         Olzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987087; x=1734591887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=pkg1JQ7l5COZ+dfUrWAWA61PKX7NpH4R44HIMOWr9MkKHSYd9pgWI+KHt/HTSm7vC9
         TetCxLt1YoYfnilgORRKNwi0JaOHxPJ5Brevl7AVS0jLBe2EzrGRfhscJmXjl+8V2PEU
         qIT2VBdPdiQ9UgMkTNKNoeLP8FLCvMWZoWh5SIiVu4Yd7x5apx7+ZsM8RKaEIc9t8K5P
         R41INqOcmo5JC5rxAvQjqjCMuQfDmfkDNO9kzTM78eWGjgo+02TjDk2UGHlTxzje6xMC
         VEinuwbebyUOvZObOykQGiVKZG05LAPzNHzw08tz7kgLt5iHNnLsxQHEV6iTHl2ECaeV
         Mr4w==
X-Forwarded-Encrypted: i=1; AJvYcCUzwuGIKt8f7rl73eyGXkhyRjAPRhjMR7p85r6Xoco/NQPuyB9Ouv8LpUWSRhaYeFfLox7OJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaKiubZO2mwr9yNttriy1gUloNcsiMYvSv1uUfRGCNeDykIY2C
	B/tg9wio+E8v0KblLfDnlJQUomsL2cbm6PGvcfLMZxmTe8Pp99/O
X-Gm-Gg: ASbGnctml2ItK2DCvspQj3zV0WXKG9Ivu2EdmlM2j+jVtuCgMuaKrTxLNbyejVT+gO2
	KtGIyydfb8zrG9zRg6thSvwZAk2tNgnafCQ98tA9eBxAOIwfPpBG1JXsLkbi8dh2emGBUa9oYvX
	D1uUkrEHdfw9EqExOOACJKId7n919NSWzBHceZ4LZuh5SkfrJogOce4GIJAMIE44S2DyS3GYcAi
	auYSoLmGkZW6xFtJ2GG4FombX8zm8704YldBkEqMtEgX3fMT00ouILcj30CxwnCtkqcj1VG
X-Google-Smtp-Source: AGHT+IGvBAQXtMRTleyDW6x3HzSYF2eqnBC5Rmkc6964KlaHxGxL1kuAEnMzaZToFmlebupGFAzwyQ==
X-Received: by 2002:a05:6a00:999:b0:727:3cd0:112b with SMTP id d2e1a72fcca58-728fa9e5e39mr3210909b3a.9.1733987087085;
        Wed, 11 Dec 2024 23:04:47 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:46 -0800 (PST)
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
Subject: [PATCH v2 2/7] cpufreq: apple-soc: Drop setting the PS2 field on M2+
Date: Thu, 12 Dec 2024 15:03:01 +0800
Message-ID: <20241212070344.3858-3-towinchenmi@gmail.com>
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

From: Hector Martin <marcan@marcan.st>

Newer device do not use this. It is not known what this field does,
but change the behavior to be same as macOS to be safe.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4dcacab9b4bf..ad6c7b8f290c 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -25,7 +25,7 @@
 #define APPLE_DVFS_CMD			0x20
 #define APPLE_DVFS_CMD_BUSY		BIT(31)
 #define APPLE_DVFS_CMD_SET		BIT(25)
-#define APPLE_DVFS_CMD_PS2		GENMASK(16, 12)
+#define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
 #define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
 
 /* Same timebase as CPU counter (24MHz) */
@@ -55,6 +55,7 @@
 #define APPLE_DVFS_TRANSITION_TIMEOUT 100
 
 struct apple_soc_cpufreq_info {
+	bool has_ps2;
 	u64 max_pstate;
 	u64 cur_pstate_mask;
 	u64 cur_pstate_shift;
@@ -69,18 +70,21 @@ struct apple_cpu_priv {
 static struct cpufreq_driver apple_soc_cpufreq_driver;
 
 static const struct apple_soc_cpufreq_info soc_t8103_info = {
+	.has_ps2 = true,
 	.max_pstate = 15,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8103,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103,
 };
 
 static const struct apple_soc_cpufreq_info soc_t8112_info = {
+	.has_ps2 = false,
 	.max_pstate = 31,
 	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_T8112,
 	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8112,
 };
 
 static const struct apple_soc_cpufreq_info soc_default_info = {
+	.has_ps2 = false,
 	.max_pstate = 15,
 	.cur_pstate_mask = 0, /* fallback */
 };
@@ -148,9 +152,12 @@ static int apple_soc_cpufreq_set_target(struct cpufreq_policy *policy,
 		return -EIO;
 	}
 
-	reg &= ~(APPLE_DVFS_CMD_PS1 | APPLE_DVFS_CMD_PS2);
+	reg &= ~APPLE_DVFS_CMD_PS1;
 	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS1, pstate);
-	reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
+	if (priv->info->has_ps2) {
+		reg &= ~APPLE_DVFS_CMD_PS2;
+		reg |= FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
+	}
 	reg |= APPLE_DVFS_CMD_SET;
 
 	writeq_relaxed(reg, priv->reg_base + APPLE_DVFS_CMD);
-- 
2.47.1

