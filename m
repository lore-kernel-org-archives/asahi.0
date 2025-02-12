Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ADA25EF89
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381001; cv=none; b=sePy55M8SUkwPmvLQvTjw9JOitrGnp+GMYrHdLY3qMDaX/CKsqOv25d9Shix4yTSfgumqoa1jWvTIR6wSDZ1xlNOqyUJL5lX6rTmHoYJTIu6UGHcwqa2fBEZPDVvDX0JGnKLBSLE930P8kLS2+YyT3Eh9crAOMafxQrELyUpWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381001; c=relaxed/simple;
	bh=6N4R/5wlV6Q+zP94GRU2QOpJnSaI9H7wPa7gYBlAKCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl8Zk1T58Z8JwvbOxPIwITzNftLGYTaysYJYoqaWHLY1hh5XyNahaYroO4yisn844iK8pglirWX5IYP2bGbWAlE8dL7j94Cdmn9L8/GjmAkmzENJgp7+ndy8OF0ILMwGWlzDWxL0x/ba1IlmqoJIEhkVK3lIfl9gACDfqK7RSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaWDDGh/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaWDDGh/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f5268cf50so81367865ad.1
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380998; x=1739985798; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLaI3VGYtpeJuIp1j9/JvqZRf6Ca8yZ9tLlCksPlz30=;
        b=GaWDDGh/+XzXSgNHPwUHNWyYcKZp8lGDDlF+798AXzubxxQvh2eXSj/zRDwfWAvvcm
         ZMR75rngMqFgDJ22QENvXGxBefNZltYoe5awch5BFwY1k6nPE8SC68yxYUDfcUAVWJK4
         e99QjEOPw7E/OyJ4O9DRIEiX+nfTVWC3KYQRVUazuvPBl2hhd8ysdi2rhBdHckgb6uvx
         OsyZkS87V1qKkbclZpFbRbOBrdvpYm7G+EQosCMUmH2UGZBrPtUjPdQPpmCFzyj7cB+4
         w19kutRIM5Iur8JZp7lPhVhfNP0VlOrCvu/OVT/MfuSBtYumwcZMt92TsCz1X49CbZWn
         YIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380998; x=1739985798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLaI3VGYtpeJuIp1j9/JvqZRf6Ca8yZ9tLlCksPlz30=;
        b=klNhmJ8GrU3+SG9gVWyvkvEblY4H+IQkC0P/0VebKf65zt5qL4lRNDa0f6tJLWNMkU
         H/m2Ssbz3KmSK7c66lWCrrWDqLQvWTkbgFV66eAAZxixPIOmENAefniIYkLcpjDdrZLi
         KM1ge6bEoAddEayMhLGfDo1OxO/sDgXs7RAA0TayXQDZkxZ4hwJ2Y2mRGfCcDT/bY4F5
         UvQaRqR4XBZZ/mdqSlAn/n9H9JX7l2lniHWWGx6pPeUYbC+dVhKlNdZRYbDpq1ybSBn3
         FXMYVofvPd7O8+nCQIfmCYM0Rhs3j7VwWyYYGk8yFg5fYpU25fggNjKL83s1lJb5a4Ge
         aCGA==
X-Forwarded-Encrypted: i=1; AJvYcCXClt2k3WzjC5XauBOnrBaT44BI2ICdtO1XMY6CdOukzMLlUqZ1VZCYKXZvDV+Say6rXcvpZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv1ulFsTAN+tDJVuWt94TGRPIFEze76Ku3Mc9rJgHmvcEGDcN7
	sTrA2eN0ESHQV6RrA1hnm4uvky5C5Z4rR76igJX/ZWJLjjOjjG9K
X-Gm-Gg: ASbGnctHG4w3cpEShuVSlU030O29psghrEJrfve99MrbUNG04vLfqxvdjKb+6YwS1OO
	8la2Gw+TAsXjtts10LSt4mkBHChmClZgBwROROt5m3rSurg5U48D2q8cxFACBFM99Node3Z/NuW
	AF5EgOXEm3lO2a4ZjOPe15LRxyWnCTrXk4eghswmNEJCuMFz3So0rO9GQTEMVLi9RY13hCJfZyP
	g8R3dJnt7LPQLGr8C7t3KXhcNgK3fxYcP4dPPg2w2JHAtH7QEl/j1plhQ60vO70LxixLqoduYFs
	gHl0R77gfRvwBja5pA==
X-Google-Smtp-Source: AGHT+IEGttjZzR0TUKwySNOQPMm37+7I49oIev0SakjRm81aNZvhsED7pG4H/sMq6NqNcbqv9PyTFw==
X-Received: by 2002:a05:6a20:d81b:b0:1ed:e7f0:3136 with SMTP id adf61e73a8af0-1ee5e5b9674mr6122637637.20.1739380998116;
        Wed, 12 Feb 2025 09:23:18 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:17 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:29 +0800
Subject: [PATCH v2 06/10] drivers/perf: apple_m1: Add Apple A7 support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-6-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10318;
 i=towinchenmi@gmail.com; h=from:subject:message-id;
 bh=6N4R/5wlV6Q+zP94GRU2QOpJnSaI9H7wPa7gYBlAKCQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjwew9/CNnF4IlqzMFXILSKPHm+MuPDHWTcB
 jAnsB40umuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY8AAKCRABygi3psUI
 JBKUD/94s7BttBhFlrdl5Q7yvRuOTNPoFK1hRiQRnIjNPLN4Ue0PV9vkYV3KzA/U5AP6I3H7lA/
 aIngR8l8xp6WyhH7J13FJSPxikgzN01TD2rLDSSDYWX1wQJzMLc/bpFaSGZTLD+F53wZMehZc+u
 i6yv0x7pG9yTcHozXAMLYfH5lIAc3fupWIAoya3EtG3Q13mYZx05wInbIEEyVNtCsjLhPhujeA/
 TB8rk4oDLO52+cRfpQ7HqXb5YpQksniLYWypqOwB3xOjI7vyVHwClPW9ogMKCVIZD+pdfAuyPlD
 4ydnrtP+PcbydXX/8hJZlstM5rwF5BIiOnylU/bRinX0RA514/Tykyxqc33Ha51krER6IeE4Cia
 dURBnT8jcmUbnkOPbaZamKeLvQLoTKNGG2pq0F7yN2MC3piEBix3O3ClwB8ViQ0lgK4kChU6cQk
 moBklTygifmyMZe84rmHuzQo9BBusC9XbzAqieFx+eNbtfcG3fGM/UZ8eRW6FG/kp3bw8JncK94
 kajPN/nmHPROKjVrwlXZJSWqsI4mL4vr5w823Ri5nKY9ncVepfN55m89V4Y15JKTCSoyiFwUdr9
 Cqz3RwPpDNbD4AfNybFKGKA/XKRvJ3W9TrXsoe/CK1rKBU/Cjm0DTo5LEyHzqmoO+pcnbDz8qCf
 WbzTDbubgoL/oSw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for the CPU PMU found in the Apple A7 SoC. The PMU has 8
counters and a very different event layout compared to the M1 PMU.
Interrupts are delivered as IRQs instead of FIQs like on the M1.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 178 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 12eba1075b36768afc29e211926331b9a426c54f..f852cd5633d7f180dc9dbdde11332ec825a3d558 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -18,6 +18,7 @@
 #include <asm/irq_regs.h>
 #include <asm/perf_event.h>
 
+#define A7_PMU_NR_COUNTERS		8
 #define M1_PMU_NR_COUNTERS		10
 #define APPLE_PMU_MAX_NR_COUNTERS	10
 
@@ -44,6 +45,143 @@
  * know next to nothing about the events themselves, and we already have
  * per cpu-type PMU abstractions.
  */
+
+enum a7_pmu_events {
+	A7_PMU_PERFCTR_INST_ALL					= 0x0,
+	A7_PMU_PERFCTR_UNKNOWN_1				= 0x1,
+	A7_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A7_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0x10,
+	A7_PMU_PERFCTR_L2_TLB_MISS_DATA				= 0x11,
+	A7_PMU_PERFCTR_BIU_UPSTREAM_CYCLE			= 0x19,
+	A7_PMU_PERFCTR_BIU_DOWNSTREAM_CYCLE			= 0x20,
+	A7_PMU_PERFCTR_L2C_AGENT_LD				= 0x22,
+	A7_PMU_PERFCTR_L2C_AGENT_LD_MISS			= 0x23,
+	A7_PMU_PERFCTR_L2C_AGENT_ST				= 0x24,
+	A7_PMU_PERFCTR_L2C_AGENT_ST_MISS			= 0x25,
+	A7_PMU_PERFCTR_SCHEDULE_UOP				= 0x58,
+	A7_PMU_PERFCTR_MAP_REWIND				= 0x61,
+	A7_PMU_PERFCTR_MAP_STALL				= 0x62,
+	A7_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x6e,
+	A7_PMU_PERFCTR_INST_A32					= 0x78,
+	A7_PMU_PERFCTR_INST_T32					= 0x79,
+	A7_PMU_PERFCTR_INST_A64					= 0x7a,
+	A7_PMU_PERFCTR_INST_BRANCH				= 0x7b,
+	A7_PMU_PERFCTR_INST_BRANCH_CALL				= 0x7c,
+	A7_PMU_PERFCTR_INST_BRANCH_RET				= 0x7d,
+	A7_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x7e,
+	A7_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x81,
+	A7_PMU_PERFCTR_INST_BRANCH_COND				= 0x82,
+	A7_PMU_PERFCTR_INST_INT_LD				= 0x83,
+	A7_PMU_PERFCTR_INST_INT_ST				= 0x84,
+	A7_PMU_PERFCTR_INST_INT_ALU				= 0x85,
+	A7_PMU_PERFCTR_INST_SIMD_LD				= 0x86,
+	A7_PMU_PERFCTR_INST_SIMD_ST				= 0x87,
+	A7_PMU_PERFCTR_INST_SIMD_ALU				= 0x88,
+	A7_PMU_PERFCTR_INST_LDST				= 0x89,
+	A7_PMU_PERFCTR_UNKNOWN_8d				= 0x8d,
+	A7_PMU_PERFCTR_UNKNOWN_8e				= 0x8e,
+	A7_PMU_PERFCTR_UNKNOWN_8f				= 0x8f,
+	A7_PMU_PERFCTR_UNKNOWN_90				= 0x90,
+	A7_PMU_PERFCTR_UNKNOWN_93				= 0x93,
+	A7_PMU_PERFCTR_UNKNOWN_94				= 0x94,
+	A7_PMU_PERFCTR_UNKNOWN_95				= 0x95,
+	A7_PMU_PERFCTR_L1D_TLB_ACCESS				= 0x96,
+	A7_PMU_PERFCTR_L1D_TLB_MISS				= 0x97,
+	A7_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0x98,
+	A7_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0x99,
+	A7_PMU_PERFCTR_UNKNOWN_9b				= 0x9b,
+	A7_PMU_PERFCTR_LD_UNIT_UOP				= 0x9c,
+	A7_PMU_PERFCTR_ST_UNIT_UOP				= 0x9d,
+	A7_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0x9e,
+	A7_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A7_PMU_PERFCTR_LDST_X64_UOP				= 0xa7,
+	A7_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xb4,
+	A7_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xb5,
+	A7_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xb6,
+	A7_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xb9,
+	A7_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xba,
+	A7_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xbb,
+	A7_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC		= 0xbd,
+	A7_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xbf,
+	A7_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xc0,
+	A7_PMU_PERFCTR_UNKNOWN_c1				= 0xc1,
+	A7_PMU_PERFCTR_UNKNOWN_c4				= 0xc4,
+	A7_PMU_PERFCTR_UNKNOWN_c5				= 0xc5,
+	A7_PMU_PERFCTR_UNKNOWN_c6				= 0xc6,
+	A7_PMU_PERFCTR_UNKNOWN_c8				= 0xc8,
+	A7_PMU_PERFCTR_UNKNOWN_ca				= 0xca,
+	A7_PMU_PERFCTR_UNKNOWN_cb				= 0xcb,
+	A7_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xce,
+	A7_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xcf,
+	A7_PMU_PERFCTR_UNKNOWN_f5				= 0xf5,
+	A7_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A7_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A7_PMU_PERFCTR_UNKNOWN_f8				= 0xf8,
+	A7_PMU_PERFCTR_UNKNOWN_fd				= 0xfd,
+	A7_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A7_PMU_CFG_COUNT_USER					= BIT(8),
+	A7_PMU_CFG_COUNT_KERNEL					= BIT(9),
+};
+
+static const u16 a7_pmu_event_affinity[A7_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A7_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A7_PMU_PERFCTR_INST_ALL]				= ANY_BUT_0_1 | BIT(1),
+	[A7_PMU_PERFCTR_UNKNOWN_1]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A7_PMU_PERFCTR_INST_A32]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_T32]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_A64]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_INT_ALU]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_SIMD_ALU]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_8d]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_8e]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_8f]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_90]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_93]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_94]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_95]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_L1D_CACHE_MISS_ST]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_L1D_CACHE_MISS_LD]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_9b]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_LD_UNIT_UOP]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_9f]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]			= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_c1]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_c4]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_c5]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_c6]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_c8]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_ca]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_cb]				= ONLY_5_6_7,
+	[A7_PMU_PERFCTR_UNKNOWN_f5]				= ONLY_2_4_6,
+	[A7_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_2_4_6,
+	[A7_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_2_4_6,
+	[A7_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -162,6 +300,14 @@ static const u16 m1_pmu_event_affinity[M1_PMU_PERFCTR_LAST + 1] = {
 	[M1_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
 };
 
+static const unsigned int a7_pmu_perf_map[PERF_COUNT_HW_MAX] = {
+	PERF_MAP_ALL_UNSUPPORTED,
+	[PERF_COUNT_HW_CPU_CYCLES]		= A7_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
+	[PERF_COUNT_HW_INSTRUCTIONS]		= A7_PMU_PERFCTR_INST_ALL,
+	[PERF_COUNT_HW_BRANCH_MISSES]		= A7_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= A7_PMU_PERFCTR_INST_BRANCH
+};
+
 static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
 	PERF_MAP_ALL_UNSUPPORTED,
 	[PERF_COUNT_HW_CPU_CYCLES]		= M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
@@ -491,6 +637,12 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
+static int a7_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a7_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -514,6 +666,11 @@ static void __m1_pmu_set_mode(u8 mode)
 	isb();
 }
 
+static void a7_pmu_start(struct arm_pmu *cpu_pmu)
+{
+	__m1_pmu_set_mode(PMCR0_IMODE_AIC);
+}
+
 static void m1_pmu_start(struct arm_pmu *cpu_pmu)
 {
 	__m1_pmu_set_mode(PMCR0_IMODE_FIQ);
@@ -548,6 +705,11 @@ static int apple_pmu_map_event_63(struct perf_event *event,
 	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
 }
 
+static int a7_pmu_map_event(struct perf_event *event)
+{
+	return apple_pmu_map_event_47(event, &a7_pmu_perf_map);
+}
+
 static int m1_pmu_map_event(struct perf_event *event)
 {
 	return apple_pmu_map_event_47(event, &m1_pmu_perf_map);
@@ -573,6 +735,11 @@ static void apple_pmu_reset_common(void *info, u32 counters)
 	isb();
 }
 
+static void a7_pmu_reset(void *info)
+{
+	apple_pmu_reset_common(info, A7_PMU_NR_COUNTERS);
+}
+
 static void m1_pmu_reset(void *info)
 {
 	apple_pmu_reset_common(info, M1_PMU_NR_COUNTERS);
@@ -615,6 +782,16 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 counters)
 }
 
 /* Device driver gunk */
+static int a7_pmu_cyclone_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_cyclone_pmu";
+	cpu_pmu->get_event_idx	  = a7_pmu_get_event_idx;
+	cpu_pmu->map_event	  = a7_pmu_map_event;
+	cpu_pmu->reset		  = a7_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	return apple_pmu_init_common(cpu_pmu, A7_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -660,6 +837,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, m1_pmu_of_device_ids);

-- 
2.48.1

