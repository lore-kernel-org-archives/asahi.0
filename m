Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FC1FC0EE
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546548; cv=none; b=CSvYtwu/o5HBHR2hsKuFP5VCM70xyOLmhNYYnTw9y6nV5vgll7SDLWVs3qX5dLj5GkR7C1uFDRKVMgic+8GVV0wWMj7nvMyjfJiD59D8jvFFHlqAjquRDGP9vjETSO3+6KUAfyT43q7t8/HDYl09XX5i3oXTyU4jfmr76RGnbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546548; c=relaxed/simple;
	bh=BuOxgI2CbOrK9Hxnatsu8Mn/4pRiwpGqt9d6S48h8hA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJWbYTHdS7GKI1LWnW1s7dbXVEJis+8E8RDQugHHEfm/faYoC9Ef5BNaSx+jU0mCQ+j8Nfm+hBr0GL9q0kHUfHgdu4bRh7U253YwUW8v2mIIYmiFjObJ3Vch8QIlr5i6WZFePhzaZwkfhXr6QmNf37mtBl4B3NeP0aHd0ZzO7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipNwXhFY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipNwXhFY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21628b3fe7dso53778235ad.3
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546546; x=1735151346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=ipNwXhFYLak7/co/YMIUUnu/kIDfYjEn7YSxkrohmykKCKdvwlI344F2p8o96Nmv0y
         R5w0Ch6KPMC8daUszEFZU6DIyvizqUELEZgTa7rpfZUneCimNGx2KuyIhmzrlStXhg9R
         sYPPg8jGJDs+9HOVuWo09TwV01DN0dIIV5UuzK5Rwtp+xTZPKnePj7KwpcW4pz7vd5bI
         iLKguy/OOZbv4hIb0uq3gyfCuIqKA1CQ9/GUTtyTwrF7kBaBVzvXBL5LTqbshbBpqRZP
         /WvO81th7J2ajfP1DyqOIZgR+OH12f7C6Xg0TWgEmh7690SkzIjf8C8URFrCz6BXspPr
         gIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546546; x=1735151346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0xMWNhFbRFrvmQCRSO20OEZKspqHRsl+17s4y7Ifdg=;
        b=KfU4t6Gnu7BvwLoyepNSt4o/BISPZmbwWxt1lYAENLA87/T6/OvM1LhTsy+35fKPh1
         u27GhrxwMM2i6KrTWJJsb/2Uy9Dja/08vBhlBRcBvBlTBU1EPkWOhrkNJGcB+MTM/gCm
         075HgAnalBDOj0+bAslXVvywmmnVJf//OXIrDcN4m955RNrJYb0k4bVQLs3Au8++J5NR
         ODaM4XIlgh0/qpTfeifhi+POE/c/iPSjQmgNusD2iaoMoj3sDRJirMmCiotOUOUss0f9
         IbcJtp6nmuu5gfnMaNs58WLdGbvhPBhcAfE+NOvkFZ5SudVYNd0ibDN48AYxuoNGC2O3
         YxTw==
X-Forwarded-Encrypted: i=1; AJvYcCVpkyT33LSgq8l4AgqQ6PoTKkuzcXhjrCkYHcbBGhwdKcy2tzvdHeIRX+fHv26JUBk5iiKJAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0HPAAb4X7vXY9t7I5ro9cLqyUpAFFztOMm2NDhmaDiTY4rijk
	/1iCqKN4JrtGOADWwO0yPA8aQ3cv9qOdqrT789z2IeEPOFQwE3r7
X-Gm-Gg: ASbGncuQsS3LHteyP119zYjze+Zfv+l5SP34yZd7+bqzTo30wfowfxsU00wjEMYQ6ZM
	JFNJ1VHdGC0EloUxOssrYj6Z7gO5CAGnd9fSkVNL/cX1jmECxETaQLf8HMxgnpRO/AMCeLD/Pl7
	z6PsbDYHVF3kJgu75tNc1MBpLPzSvLS3IRf2sibz/GiFTo362SjsqYXHXztWKIU5RKgOanSCEtu
	ce0pHlUfbs8cO6x/l6/bz0gAO5Nl5Q3hMzGwpE9yLv2H0yLUgLtgE+4ng==
X-Google-Smtp-Source: AGHT+IE5H942ad1OAia3lBBhcksY1y+20uAlvIpOi6ha/V3bCOYFzx6F6Fufey/f4PXmeYsSviXIPg==
X-Received: by 2002:a17:902:da89:b0:215:e98c:c5c1 with SMTP id d9443c01a7336-218d722cf3amr59411945ad.30.1734546546134;
        Wed, 18 Dec 2024 10:29:06 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:05 -0800 (PST)
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
Subject: [PATCH v3 2/7] cpufreq: apple-soc: Drop setting the PS2 field on M2+
Date: Thu, 19 Dec 2024 02:25:04 +0800
Message-ID: <20241218182834.22334-3-towinchenmi@gmail.com>
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

