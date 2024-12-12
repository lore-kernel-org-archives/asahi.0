Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2B5204F88
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987092; cv=none; b=SejMy7CBFe0sMHrPPJdFD5TNF8voW1Ez4UlG9RqyF6nDnHMduEItmO87QLVIwB45TeuGRdg38Nyw2F9P0X7YTODnR8/qPuiSV5tC/OuyTKryCbn4NCeSIBb23AOCuQ8+whHTCXxMLqeROF5s3torHvpUa6vxcxYCTE1cJRmEvW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987092; c=relaxed/simple;
	bh=RgXy7GQICkh4yaDvFbIaxUPIIfKur6XP15eVhbM+Yts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmASvf0mHUlPevKa2exVM/jsuX04m4Rj8kvlVbiFwJOdk8yIVCqMs1X0LWR0pgkyUvejxY7uuUrrouVV/y50iR90Zbz5j29WMYNI72Gq6iPg05TUWcwOpXRrYQ9ll1WqsSqaTVybyebBSC3zfyVlbZ8Vlb1mJQa2SWYV7Hf04Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J47uGtH0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J47uGtH0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725dc290c00so1225786b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987090; x=1734591890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=J47uGtH0NLODteagVJDIg8G9qlbqmY4A4x3gqcuAH934R2HHYHU/r+n7VwAXTI5AyO
         J1zDo9L6X9UufxmUJAKtd9/Iygadz6Xxrk4OL4cB9kOMLIM4qBb5R2J4DdNXiw/kZGHY
         dDQAVCG+cPrGTG8XZ0DWz8K2C3hfPM3pHAweIfwu64vD61vuvcbvxw5XEn56ZCYqGluw
         f3EOVfu+0cXv4GneBsYo65Q5ZXD8QL23TjksvZoIbYPdgYoVMn2yEU7MUaMpOXOOHauI
         H3M3kgPSAEedGMI+0JT5bbflq/VrPSFdjel+c3rTkylFR18wMBNL5bQI9cPWvRPDDcBt
         73bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987090; x=1734591890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XYVqROmegnfGFhPLcLWSN8f1mP3yklImJht3PHB8s=;
        b=R6xZgDXSZP3vb8DOO4YgSX3i4wAFVZF/g44lUrUX2Fvh7jEVrheyCdvpCPBJsIgjzN
         HM9py7eEtiLC+3aLNZr96sU437AmZrK881+ikeuVuYaJxavbOWCs4PUNaa9G8gJKYzwi
         FTVeqUalHhbWPxcZSekmdSG03+ilBhrQWyQd6+QxS5Ypm7YZ2sKEIIO8o1R84KBol81L
         BkZDTQNjBVbQyipH+eJCTggp9j7WlamQxrBOy8O8vx4ao9Bpjml/cR5ryx5EPMNMeiry
         xF9s9NK6wgVcdR3M0kuCtkATgL4r4batLUS+7Eyu5Td2yLJeimYbTEqyGRRPwmQeeoLQ
         pRVw==
X-Forwarded-Encrypted: i=1; AJvYcCXXPEIb9G4YIU/HsAePuvuviPaIiJojcFly04ULO3aqUe8q3jUgfUh3VnayOlEytUXgx6lqcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Cffdqgoz9mkPj/SLJgNKbv6W1y9zaWNqdSjxHidfI+ei+0Om
	9k6QTLw5VLq6CjLfATpr9s5h4b9PhcLnE8uyduPk2DCkeIBPK11Z
X-Gm-Gg: ASbGncs79ys5kLcrCuH+73Q8sAu9A1YZJt1/xG+GvU1dannhY66NhHCDLuYw5Zqf5G0
	b4Hw8lg8w6KoHl91XLqV6XvzoWPHOQnJ+hku3T0EGVOUrNSnXUYckVG1Id5HlhK1yG4qHG+Dckr
	f3S6a6oRf156YOiBPo1GF1mKxxyPIs5/HZiIFfq6FaX81hNODV7p3JMFLSetr5jYv1/gTb7Akdi
	LveEp4q4MLy/Q6nzIrqA+Dp0NC06nHWAdaZyF1INK4S+U3w3LBo7CKjyy5XYy0K3QCt0MnX
X-Google-Smtp-Source: AGHT+IGD5L0XY10ir8ZWn31kZESh8+9pkRmRaTucZ22hPfqRxTf/NOnmFpSI0fmwVeu1XXmMvpKLow==
X-Received: by 2002:a05:6a20:d98:b0:1e1:b0e8:11dc with SMTP id adf61e73a8af0-1e1cefbb8b9mr3506448637.21.1733987090125;
        Wed, 11 Dec 2024 23:04:50 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:49 -0800 (PST)
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
Subject: [PATCH v2 3/7] cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
Date: Thu, 12 Dec 2024 15:03:02 +0800
Message-ID: <20241212070344.3858-4-towinchenmi@gmail.com>
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

