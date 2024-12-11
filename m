Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA40233689
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916192; cv=none; b=ghpufuVHybYJhVHRT6QSQ80vQC6UWewoHP73fEAvY4kORGovwV3Vi2uDObJvHqPOXv2X0PRqSmF2xCyZiJ/pFWSCTWXG7k1cxtKlyYzikgzq0pCWS24fHT3zeN2oJQTDpjGeG3kZgVhPA7l5fu96oIO8n5HD8KAAkMvxZQF9R30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916192; c=relaxed/simple;
	bh=BuOxgI2CbOrK9Hxnatsu8Mn/4pRiwpGqt9d6S48h8hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2MyisgunC2FgF9Q/xzm0smYAKCYuvXorPd7z1SrtVwoywpGjLs2GBVR0sSPZxgYOHnAtpfVOA4xf8p3PTKG3wK51JFIpEIfdm3ZLQq1xLMjiOoiKxf06BAzFHapCNl5WGJ+bKk+mHjuGHufxYuMaMXKE93t7PIpeDAqxQhB7/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5sGhovp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5sGhovp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166360285dso27148375ad.1
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916190; x=1734520990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=Z5sGhovpZtf58o97kKKRTr+XIof4wiqwOLtl+cRoVcoRG2dnuSFxra9gQZXcC+01QE
         3Y/Jnf1TNx/G1GYSZreREvJexw9ld3E4e0/qhmM9xwUXzfBygqL07D+PNMF8ExGtbzZY
         mZmj5QNeBxGYKJ3eJ9vB7ESPK9Z7k2d2ejgpESevdQLQGtwV+USq0CEL8yry0MhKaq/T
         qQ52mdbWd9ksQT8YKxAHxo5Y8djaOk2DL2d7BcZNRo0q442y8SvcTPMOjFcM53uvT7pD
         APSVGWmIzyGvP2CqlaXyJa3NofF8mNSGdRdFdNKN+/3LITSbWzS9EyGKDipGagYkqrRH
         VviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916190; x=1734520990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=BkNNdGO/apGMxeCy72sZdD0kvyj0xQvBlHkrFuuWIN4PCZpxoHUTFN43KdnLriTVXS
         MrGv0rvIE3r8HRN8cwef+31NDgxkcz9XqaTYLACTlkeYts00suUeWT0Cma1F9TgQpE/q
         6OFATlnzSc07KReNPjn1vZI0pkYOOhNW7/MgJ2fSs078PXB/IXKHAyY8iM+Z0D/Gl/Tv
         5h9K9A9oEtRvsKtkG59VBAZ9cU7sHWvmq0QUIIgBEI/JBwRF3VS8iF2pTDTwdEpf0+yl
         7aM5T3uDUwqRoWM+uNTye3dBXNjUpySegeNXwUy2LbVt4zw7XODIeAQ13FOmyDC4cQMQ
         idGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg8NHOfHKI84+CY2cTk1RVApyjYiITNZ8VNj2Km2PHMxHqitGpvkQX76uDoyuuye5ofN67QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG9IBrYD7FypBqvzc9P41wszhVrMC3UsWvkVk10opIeq5uEsEr
	6r5Cm7aSyZy+lJAgOuTeoh7BKpKVsEAfUWgL9APiLWPGmq4fIrXicX8m7/bQ
X-Gm-Gg: ASbGnctBv0ecnGieRGCMnY7KB4lm9EdXkEJkgiX/toJxk7jGOsj4xJQMdH+Sj5UjGNh
	RdyibHUwXeDgO5o5HJoLWC+MpRpVPT3kdJQzk5ww3nl++Q4v8APafnrrMeSgIknqmvG5EneUPYI
	7T+CKbo2aLdILeTdH+r7tItzp22eJkXstOjF4uZokfnT70dZQSvpq5li2X2qB2PKNSvMmin25YV
	7+VKJr81vxTWSmMNJiHOmhvu/lth3V/qvEFhwh+m/pjhzXWvhGU+EYXAafbPeb/JYB4xw==
X-Google-Smtp-Source: AGHT+IGg44vKKbajgZGuP1n8MacnuXqDCWExV+Yd5IMtS3xY4Kb7j1HNlaUyN1+xFgSOQQMzckgSjA==
X-Received: by 2002:a17:902:ea07:b0:216:70b6:8723 with SMTP id d9443c01a7336-21778581e83mr41968685ad.44.1733916189869;
        Wed, 11 Dec 2024 03:23:09 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:09 -0800 (PST)
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
Subject: [PATCH 2/7] cpufreq: apple-soc: Drop setting the PS2 field on M2+
Date: Wed, 11 Dec 2024 19:19:29 +0800
Message-ID: <20241211112244.18393-3-towinchenmi@gmail.com>
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

