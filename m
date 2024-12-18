Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDC1FA82E
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546562; cv=none; b=AQTzUC8jvJDis/0lTGmiJoCZ2yUO3mxxvJi1Ff/EiYAmKzUdKzjOYIu235gUpsP+GybyHV7NIRgzxghOlUlWqJcwM9zBjSc3cajDnUg450SUVordjD+fiEI94CTEC64JmaM1VQwWtWztJdhIxGe0EGN3r/gBJ/HgvoZowoc4Wso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546562; c=relaxed/simple;
	bh=eWPZwdEV9Ln6IVIS/IoQBSNEfSr7WTy0vPRSPt8DjpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tuhu877l93wo2eKZSsVd1yCnWuOK+AY3S0qGaQ1fhr5kuIoTOSk4fE6JL2YzdU1Jsh5qQabxJ0Ci3zZgXO9i5vHJGlvZ1+C6tisFFZ6kSjWh1ms/3hlnLfEVdfTe5L6Ylj15XYuiK6k9dcCWY2r6d2wOs4fl8il2rW0sye+J5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBBlE66t; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBBlE66t"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-72909c459c4so2488b3a.1
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546561; x=1735151361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZBfNBSGDJ0HG4dwJs91dFczJyiFsgvS33RZvYaZjO0=;
        b=GBBlE66tHeJWNsPpMoPvRlfSgykI/ZilpsFKzOmMI6am5PO4ZsircCQcoPLuq9P9Uv
         NCbDz4qEKO3LEV19dTOSPaMfmxY3AZFHw6IynQuLRYjKY6PUVBQKMmWJeeMw9ssN0+fz
         7yQXhHdSPTMyZrGeUv/lg4t1wjrjDZeOExoxHvG6C5HzpWraNchyCSNTc/paL68oqT08
         4ZdK7hsOFZczY7fJPCbX8p4PPSQpCMsNR28fFKcoLX+QwEn1oqR2CFniUyGW9vDaDwbq
         Pg/lDcST5cG3SFUXZF2yWU5A+0E/Hen5d371NmQqB6YzCgk0X3zCAVJpuS9YYkdrGyDt
         Bh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546561; x=1735151361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZBfNBSGDJ0HG4dwJs91dFczJyiFsgvS33RZvYaZjO0=;
        b=jN9LOAWLUkikU7b7LGKmXqsOCC4TX+DzsKdp8loNNfoDl1fMz4DqEJvtJaiWf1SO1u
         r7DyCHRPk78CDczvoeztPguvE/pWzsUdj81QAr3AFK5cKUYrF7pzpiWg4z4OQkZH+v3N
         cZpU5Hy4YHsT3ex9n1wh3rMfvjWXU8KPSQ5wW2pA6/+ePrRKcXYyJ9dECFGvCTDBpPVY
         X3sUwSnaFMJLK43aMcz3TDnmHTb5SkouhYv+OLmhTTgEVt1eDr4UTIRMfwBVBXTzGUPQ
         OG/JQ9l5DBAelcNN0o1IzaYNOUBOqLyPb/oNYG3OmonJI0wwlAcUnGmiaF5r8qkCxC3h
         Ga3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX85f733pNpZ9yg4HHrIQi4TqUtxeICebynXYMbtns9R0Zr7kuOoojBDwxh7j1c9w9JyUDMvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxywzz9Ma2JbgU/boqgTDiuvaXZHUhV4vFNUTg0raV3Wo8k+LXI
	wy51E3mLbNUIk4Uh45WHgHH8RGU3L66ruPZiR+WqOR19YZVvxU+q
X-Gm-Gg: ASbGncvGVllmQ+zjh29iIhe80wZIFDb0qXpumOg5Os+8w1YOoddAn6Qsd+jcP0i/R25
	Yz9GlmecAV/ibne7krWzyhFSj2kQxIr9qbs8FEXRvLLAmAxzOQSat45f4UU5HUamaAYOzabuZdv
	+QJJig6OQFuxofKJIAD3g3l7ZbyNrV2CqmVeRDecldn26QORbi25dkWgC89cj8G/CLbqEBsF+jQ
	3LKI/8/n+kzCG+oTb90WQRxsTW93/3Zj2+ghWYhC/5h6VsaTKSLtJGlPQ==
X-Google-Smtp-Source: AGHT+IHKE8BBaNkfFDIiYK2d/X+ou/ScQY3k5kP8jILytQsn9xsdpJIG3SmkQVJ4kyDLKQIjDOdCPA==
X-Received: by 2002:a17:902:ec81:b0:216:5568:38c9 with SMTP id d9443c01a7336-218d72349edmr57596245ad.31.1734546560737;
        Wed, 18 Dec 2024 10:29:20 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:20 -0800 (PST)
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
Subject: [PATCH v3 7/7] cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support
Date: Thu, 19 Dec 2024 02:25:09 +0800
Message-ID: <20241218182834.22334-8-towinchenmi@gmail.com>
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

These SoCs only use 3 bits for p-states, and have a different
APPLE_DVFS_CMD_PS1 mask value.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 30 +++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 879ddec9e557..269b18c62d04 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -22,12 +22,14 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 
-#define APPLE_DVFS_CMD			0x20
-#define APPLE_DVFS_CMD_BUSY		BIT(31)
-#define APPLE_DVFS_CMD_SET		BIT(25)
-#define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
-#define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
-#define APPLE_DVFS_CMD_PS1_SHIFT	0
+#define APPLE_DVFS_CMD				0x20
+#define APPLE_DVFS_CMD_BUSY			BIT(31)
+#define APPLE_DVFS_CMD_SET			BIT(25)
+#define APPLE_DVFS_CMD_PS1_S5L8960X		GENMASK(24, 22)
+#define APPLE_DVFS_CMD_PS1_S5L8960X_SHIFT	22
+#define APPLE_DVFS_CMD_PS2			GENMASK(15, 12)
+#define APPLE_DVFS_CMD_PS1			GENMASK(4, 0)
+#define APPLE_DVFS_CMD_PS1_SHIFT		0
 
 /* Same timebase as CPU counter (24MHz) */
 #define APPLE_DVFS_LAST_CHG_TIME	0x38
@@ -36,6 +38,9 @@
  * Apple ran out of bits and had to shift this in T8112...
  */
 #define APPLE_DVFS_STATUS			0x50
+#define APPLE_DVFS_STATUS_CUR_PS_S5L8960X	GENMASK(5, 3)
+#define APPLE_DVFS_STATUS_CUR_PS_SHIFT_S5L8960X	3
+#define APPLE_DVFS_STATUS_TGT_PS_S5L8960X	GENMASK(2, 0)
 #define APPLE_DVFS_STATUS_CUR_PS_T8103		GENMASK(7, 4)
 #define APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103	4
 #define APPLE_DVFS_STATUS_TGT_PS_T8103		GENMASK(3, 0)
@@ -72,6 +77,15 @@ struct apple_cpu_priv {
 
 static struct cpufreq_driver apple_soc_cpufreq_driver;
 
+static const struct apple_soc_cpufreq_info soc_s5l8960x_info = {
+	.has_ps2 = false,
+	.max_pstate = 7,
+	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_S5L8960X,
+	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_S5L8960X,
+	.ps1_mask = APPLE_DVFS_CMD_PS1_S5L8960X,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_S5L8960X_SHIFT,
+};
+
 static const struct apple_soc_cpufreq_info soc_t8103_info = {
 	.has_ps2 = true,
 	.max_pstate = 15,
@@ -99,6 +113,10 @@ static const struct apple_soc_cpufreq_info soc_default_info = {
 };
 
 static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
+	{
+		.compatible = "apple,s5l8960x-cluster-cpufreq",
+		.data = &soc_s5l8960x_info,
+	},
 	{
 		.compatible = "apple,t8103-cluster-cpufreq",
 		.data = &soc_t8103_info,
-- 
2.47.1

