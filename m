Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819A71B87F8
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715961; cv=none; b=lHw1aqzXRH92QKOJfIvdWlvbhZci7HqGTd9DxM+NVTniBZWkrXtoNmFXXyG4fRj917KNSr7GoH5UMXvGtgHmw3BzXsrdWX7bO+bEnCiF3KPamI4u6IJeXWoHl9YsS8q2kvWfgZDABPqj1RXN05qok2wpfOcDVowNNyFmQKuaeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715961; c=relaxed/simple;
	bh=IOLPmmdLpTyze4pMSwzOoHnsgDuo2hfTL3xYJ/hiFU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1eNNi/DvtMqKTJrIKfdneEah7fLwulzMEYcLcPr1P0HbEX+aEAjohcsShCwqfa0h2YfDPbkVisAKS0Vh4A+UvEkROyxqZdanByRsHN8O9PvlM1wbMH6qS8CUyds8eJjaOYYvL4BpGAGorq7OiwLoUPlrzuKtOkbBSQzhYajxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Czc5v6i5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Czc5v6i5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223480ea43aso42240215ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715959; x=1741320759; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2B4nOgCKpnlrw/lYJ2ogw5EzOWnWn32vvattNHW96K0=;
        b=Czc5v6i53WHBD4kGAhXZxdwVVwLjNrxVWPtSVD1czChetta7z4tXJkYTLs3miKCg68
         f/Fk91A/IueJmPiLGOE1W7l5Ox2F2j2KAxsGtL1FT+b1LmwWXuoJ3ohci34CcfMNOUGp
         Rq8tdQoMkyoYes5MiVJJe+TYUhrVlgIDXgZeggNoy8WXLbi3N6lDOAcxNJsFyxNahJYK
         5gFC5UYMCQLk7y/z5LNzFscezP0YrMbg0b9pn3p1Xdo2xsqkhHenTJhgANbwdi8gHQE4
         gd5u0ZLOTJAF4AWpg/UIQTyx2dKlY0j7Ec2mIQzzdpTQDgmf7XM2+ubHd18fWz7lHHub
         scYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715959; x=1741320759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B4nOgCKpnlrw/lYJ2ogw5EzOWnWn32vvattNHW96K0=;
        b=svlh1IglWxugYS5AbKyKxuQcQ4y63E10gmd5+dKb+zGhcppnXZ2sdhXfatQuTcyxom
         KUjR+X01souEvMwyOzBwaWDVf8WFtbspyQZNEeirDztMDCnSxm93Dsujzyz0bpZR5jk4
         tIk4+mRLCDeJ02iP1ZpzzCdV/pXInmPpjJ+8vHHN0oCUR+SmYH1Evi4haqLLiwwPqPev
         tFP44hd8RatPysQIRx5hi/9pqCnR9b2YkU609pwnve1cpvFMHeKPukkJ3/yWtR3eI+pB
         gvTQKPVD4SsZm5lRVhWl6xYJjTj4opr37PhXsW6hhL8XOrbFZdoBXUgFD5YeN7PqxHCj
         AR0A==
X-Forwarded-Encrypted: i=1; AJvYcCX7X/q6DguPVfgnv+et7VDiAv+JyZluf2u/7rqC9rVtNe6PqC/SiJQa864KjDoDykZWcpFV4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw15CtAQ+tsrku5SJaqm3an00UpfK5j3z0Dg+XuFA75wIyEWefn
	HKnGVYh426CeESupgj9RTM9uP3k4BjJFpGJtdk0CE/45DMfeCSEn
X-Gm-Gg: ASbGncvvG2Ri1ig/eBFCigSm76EhDo12fWvcJ1tcqCmU2HERforsJAejIqWbNP2L2R5
	7vwbGPqJoiscqM5pHzLUBMJkOtMHxCv/2DzvNNYwetm0hI5xiQ+afDkXGJ68Of+mv1akfSH4v8X
	CEjmF1bykwvp8tRGeoRodZsKoNlt8ZFv8wxJ5DRD7PnNWe+G6g6jJWcclCf1/nM6+g/SsSGb4ZG
	wA1L/vlL6Es0Y5ex/SrFFRj0I1ZmeptVpcPVqKe7yvZp/2WxrkO/8UDOw1wkkqRt130us1y5Hvd
	Sk1TSwJtHVwJEGcBUAt/HhoEHc/k817iFJGNO/68cUg2/g==
X-Google-Smtp-Source: AGHT+IFobHbLUPe1qWSjg0vS/NuuuHrWrjrnIOcZk9KrFUr4l0ugzmYqN/YRWQ+55U0uc1x1jaANhg==
X-Received: by 2002:a17:902:d48f:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2236924786cmr32591785ad.32.1740715958751;
        Thu, 27 Feb 2025 20:12:38 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:49 +0800
Subject: [PATCH v5 09/11] drivers/perf: apple_m1: Add A9/A9X support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-9-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6995; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IOLPmmdLpTyze4pMSwzOoHnsgDuo2hfTL3xYJ/hiFU0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeJPggy9fUdSdcvZO7WkBi9koaQGYSq8sxPB
 Q7UNsg4LCSJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iQAKCRABygi3psUI
 JPPkD/43tzm4+7arSK7tj4uFu6r42VXKIby47hwB4vFW52Tp+wt9Hli4NQL9TEUvxJCqPV0k+7u
 sWofZ0z+skCyC0+dixWfxqdrkXr3cel4kojdR26tI4HGwbkIwRNZUml/RzWwIE93Y9gxyHmnoRf
 cYGOtFAOdht36UOphAUKWlXbRaS7Rg6KtAUG6rMWfB0ylN+uimXwQBvjnHAkWYwa+c/Lbs44fnd
 PwdXQUon+lS2Dl7wjoANFmVZFoii068j21LEWLAWJnZ66KB+qUsNC8o5yk4yX2eDdKtJU7KBMYt
 TTSImchSa83hrU4i9EylX46KHFF4G9g+6TyRO6LXtMm2bfAaJYNQ5qjztp7QEUIvBEC5G99xijr
 fszsCTEs/C4IlvUd+GNS5k4PY1QO8biAMHvp5Ryk5QxayJIYP5tjOnJStZJxfPgfSNFoUPwb1Og
 sEhtiO36gWa9KKtfTiQnFsP7y8qkzH29mEGdCPRoRfoF/cCEmAbFBywd+3UHgnc8kwcRouGGbQY
 xs5cJbApfLhl6QX99POSlx5ICdrCzUtVNGvyiX3M83lrv/3qqn10g+XZpcaGuSYM47CgGm8GNaO
 IGQvsIiY1r/iGM8tomA6oYpNRVKC+VYobRwU8fpD407BEbH420DVxRaednO2m0ErqSs+D65wdmd
 xu2Vr2+cIJR4PBQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for CPU PMU found in the Apple A9 and A9X SoCs.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 121 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 04825a1991ab1c670563e3ce91b43fa5d8c85920..f7ae5cd56980b75d8f2073368479d0af77ab351c 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -288,6 +288,109 @@ static const u16 a8_pmu_event_affinity[A8_PMU_PERFCTR_LAST + 1] = {
 	[A8_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
 };
 
+
+enum a9_pmu_events {
+	A9_PMU_PERFCTR_UNKNOWN_1				= 0x1,
+	A9_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A9_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	A9_PMU_PERFCTR_L2_TLB_MISS_DATA				= 0xb,
+	A9_PMU_PERFCTR_L2C_AGENT_LD				= 0x1a,
+	A9_PMU_PERFCTR_L2C_AGENT_LD_MISS			= 0x1b,
+	A9_PMU_PERFCTR_L2C_AGENT_ST				= 0x1c,
+	A9_PMU_PERFCTR_L2C_AGENT_ST_MISS			= 0x1d,
+	A9_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	A9_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	A9_PMU_PERFCTR_MAP_STALL				= 0x76,
+	A9_PMU_PERFCTR_MAP_INT_UOP				= 0x7c,
+	A9_PMU_PERFCTR_MAP_LDST_UOP				= 0x7d,
+	A9_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7e,
+	A9_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	A9_PMU_PERFCTR_INST_ALL					= 0x8c,
+	A9_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	A9_PMU_PERFCTR_INST_BRANCH_CALL				= 0x8e,
+	A9_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	A9_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	A9_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	A9_PMU_PERFCTR_INST_BRANCH_COND				= 0x94,
+	A9_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	A9_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	A9_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	A9_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	A9_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	A9_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	A9_PMU_PERFCTR_INST_LDST				= 0x9b,
+	A9_PMU_PERFCTR_INST_BARRIER				= 0x9c,
+	A9_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A9_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	A9_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	A9_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	A9_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	A9_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	A9_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	A9_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_SUCC			= 0xb3,
+	A9_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_FAIL			= 0xb4,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	A9_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	A9_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	A9_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	A9_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	A9_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	A9_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC		= 0xc8,
+	A9_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	A9_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	A9_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xd3,
+	A9_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	A9_PMU_PERFCTR_MAP_DISPATCH_BUBBLE			= 0xd6,
+	A9_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	A9_PMU_PERFCTR_ST_NT_UOP				= 0xe5,
+	A9_PMU_PERFCTR_LD_NT_UOP				= 0xe6,
+	A9_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A9_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A9_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A9_PMU_CFG_COUNT_USER					= BIT(8),
+	A9_PMU_CFG_COUNT_KERNEL					= BIT(9),
+};
+
+static const u16 a9_pmu_event_affinity[A9_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A9_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A9_PMU_PERFCTR_UNKNOWN_1]				= BIT(7),
+	[A9_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A9_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[A9_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_INT_ALU]				= BIT(7),
+	[A9_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
+	[A9_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[A9_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]			= ONLY_5_6_7,
+	[A9_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_3_5_7,
+	[A9_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -769,6 +872,12 @@ static int a8_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return apple_pmu_get_event_idx(cpuc, event, a8_pmu_event_affinity);
 }
 
+static int a9_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a9_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -929,6 +1038,17 @@ static int a8_pmu_typhoon_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init(cpu_pmu, A7_PMU_NR_COUNTERS);
 }
 
+static int a9_pmu_twister_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_twister_pmu";
+	cpu_pmu->get_event_idx	  = a9_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = a7_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	return apple_pmu_init(cpu_pmu, A7_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -978,6 +1098,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },
 	{ },

-- 
2.48.1

