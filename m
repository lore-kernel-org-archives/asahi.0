Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA21AA7A6
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920575; cv=none; b=qMeKHSWTHopqmIedfspmYT4fwU4QKo4TNWLxzFJHtiqIs5lGvs1+CTyLom8ke7kz+Ngvv5zh9rhI9apYIvxywdCBJCbleU3h8Fp12dtqeADFoajtwHUGNj1ltQXJZc+HXdrWF01MJLfEhIoiaBp3zJqz0biW0AdFgdACiaDS2QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920575; c=relaxed/simple;
	bh=7EU0MUNMGUJfOI70oZadjXP+yGDc8z46FXbU6drpbPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/yMUgJsm7L/6/EAmJ/xsRvU7DNDBjJxZjDFn0O+WSFIJEL1O0y10z2YJzX2VDSYfkLXY6ZN1bnq7Jhi36NPlAYF0fgLRPwaVL5OWpUX3dhmjyr0va+iYjLDwqUSpkRB5CuHfQZvVOltc657JsG3Fl29bPRlZt7JnAvggh+vsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO9jrdFH; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO9jrdFH"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so3857630a91.3
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920573; x=1755525373; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVmCWlkgobUZZ+4p8RFK6YD8DjyfmVtbQFLgNKrZJlo=;
        b=dO9jrdFH/gNB1XJNK1yymdktHt0cn1PsGOq6Xu0qa33FoPSgzlHDICJljPqw8AwTgg
         LZTcNlNNp6ZWwVsKy637Tlvqua9KS3ZkXS+t8SCz/6L290f4sfkioc3OlM0U4rXIcxwP
         l14jGy+VpvtFLO+e72ztn8l/5NjD4XlIuc4Y8YRchZmCiPnHlHLAsh6GMPiFTIoWR0nr
         KK7/6ZWepWHg+kFU+r/3t2hTHpWqOXco4Pw077sPlq3jMFOuqJt48HkJv2OL2isRwyR1
         dP+WjXv5sB523rzCOz3bDb2znYGp/cqOnY5pOzjHa4kTLTpQNlhiC/J9CbJMvg4+U+i8
         /WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920573; x=1755525373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVmCWlkgobUZZ+4p8RFK6YD8DjyfmVtbQFLgNKrZJlo=;
        b=Qo951Z38uOQzRDIqNMMEVLDZDAzBl0P8/H8Hp5WzjRwIjfWrR+CFJh1B8VqLkQykq5
         Ur8PzqxsGCYWPjKHx8WpRz2neNbAASJmrxRaNpqnhnRnHqe02V6bXQ7LLZRZXlnY5vCy
         kGHmnSt/U/sY8+aG5IVUU1fVEeV/52hCuUTtebV6pr21zxtmmXwKIpC2ddK8d6wib5b0
         +89PnE+NRTvAXu4Jbkb0eBZwZtJihP7W42UBI0AhMrT98R0UbDcQrlh2xLg5e7LYsOEM
         imsPVn1SMOVqILJPblqW4HVA4EXvrzzjDAMcnd9iFYZTbY4WqJ3h807ZXfbRgd4HLtgm
         RTDg==
X-Forwarded-Encrypted: i=1; AJvYcCV+E7JHO70mbpmZ3FWAHxyCYe2sBGnuPvuHHweDr5dkaMgqsuWbwDTHbz/SomIcA9D6XLqA2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEKzwlo0m42GcvqXsHqB8xLaqviSLqRuZVIthAOfKQynHCehVL
	IGGDRFz5R8Xxzm5M9zZyryDLUou2H1U43nieNx/CewdJ00/Y+eAIA4nh
X-Gm-Gg: ASbGncuUBKsup+wLWRilQ+jBRLcWmSvt5J8Yaj9gwzXH7Z23pH/vYm7rheZxNbF7h/m
	ivlvFk0v1/sIUS1TvRO4lphHgbJDg52+u5bIBgFTr45hnCOdle7X8/CHfY8Civ4y3Wwm/XVlouw
	mcsoWg4nJrxFRJZrgKQDuPgDjyGnsDzrYZOL/P7oSTPVUiQH1Pfg2qn8jWh7Xk5bNYyvzlfzhLG
	3U3JbCBDUCz76oyYfjaCKnxwqdf2/WjXf9/nxPpwT7O7G0bogx4KQc/O7J7YefBD6W7HK/1/PaH
	GXCWCQ7qtZkOAWj52/vJ1RvnsRDyBYM2CzDifrfHX72Pys7AZsJArIRJVrEewQdWIMpfA9YT7Pp
	IAdkHNtclMti18ZZgDa/8cr5s3uJcFdq6Kg23MPTuIIlMaJhqrcu4BCq2dQ==
X-Google-Smtp-Source: AGHT+IEwDR7DYgmhF20OrzaI8BDm6yuqBm4XkIe3maFpfahyqe+cCpYGiG1qGBKBvbi3+MuE/THFUA==
X-Received: by 2002:a17:90b:5624:b0:31e:3d06:739c with SMTP id 98e67ed59e1d1-32183e55a14mr13830525a91.31.1754920572726;
        Mon, 11 Aug 2025 06:56:12 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:43 +0800
Subject: [PATCH v8 11/21] drivers/perf: apple_m1: Add Apple A10/A10X/T2
 Support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-11-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7534; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=7EU0MUNMGUJfOI70oZadjXP+yGDc8z46FXbU6drpbPk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZC6wZUizMlp44vG9N8fgHrmYBEokbYHmv5/
 m1ohHgn6jaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QgAKCRABygi3psUI
 JCcXD/9u9KrmKwCUE/ua79BFz01euFukCva1OyKZuybT6Wws58o6HyQLmJdlRZA9sLvTtaE4Xoq
 RRlxAdVipa8N8U1YeVx/wNYXA9pOtvFCwDMefDrwu4L+eZueXvFae3v8+W18H3VIX8bQ5osiU6s
 t1mDW3P776kF3FX3T3v0x5C/0m8Kgm0a6K+P6vBViqwOPl1RkdYND/tMpmbkEtVH7y+n7jWfPAZ
 IC3yYdxkgjhExQV8PsOmS4oPI45etcW/3BHI7RFqHxt8YWeE9Z64YB2sdf5SkglNvIL2QVIWn9t
 evt+DwCeotfxjbPlNPzJ4zzR/xyz8gB+s8W63DZSQQLCxTJN+prpQ1C+u5K83XZE0Tk3wGIsE7t
 0rrjWYQ9F0DMFxJe86HmeG5HXz7hKcHeJK4gNZNoE/dKgjh542OzLRdAO+PszBkakQI6inl8ttZ
 wOA6wMhBA5MnmFWdnC8wH3pwbz6+yV+3lGS9MjHp9e8ZJhEjKgVxdlmj52470lXlmwifL86tHuH
 JSZfflgDwiUFtK5fHHWzJ1unx25CzM/z6linXblUMBund/8mo6dNvNoeQb6719d34Ese2Lb7n2q
 HhLM40pwVCYVjazeEcKmc8ojFNipQWkOnNItzcBEHtxGlncYmc6aupFxV9paUpoRTmXiOXqqrP7
 NbXTe702qNhwSgw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for the CPU PMU found in the Apple A10, A10X, T2 SoCs.

Tested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 127 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index bfaf926fd47b02a7d77ac31cbb97779b5ebedec4..37ca7e99aaad97526c468d3c98ec7ce4fe115763 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -392,6 +392,115 @@ static const u16 a9_pmu_event_affinity[A9_PMU_PERFCTR_LAST + 1] = {
 	[A9_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_3_5_7,
 };
 
+enum a10_pmu_events {
+	A10_PMU_PERFCTR_RETIRE_UOP				= 0x1,
+	A10_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	A10_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	A10_PMU_PERFCTR_L2_TLB_MISS_DATA			= 0xb,
+	A10_PMU_PERFCTR_L2C_AGENT_LD				= 0x1a,
+	A10_PMU_PERFCTR_L2C_AGENT_LD_MISS			= 0x1b,
+	A10_PMU_PERFCTR_L2C_AGENT_ST				= 0x1c,
+	A10_PMU_PERFCTR_L2C_AGENT_ST_MISS			= 0x1d,
+	A10_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	A10_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	A10_PMU_PERFCTR_MAP_STALL				= 0x76,
+	A10_PMU_PERFCTR_MAP_INT_UOP				= 0x7c,
+	A10_PMU_PERFCTR_MAP_LDST_UOP				= 0x7d,
+	A10_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7e,
+	A10_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	A10_PMU_PERFCTR_INST_ALL				= 0x8c,
+	A10_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	A10_PMU_PERFCTR_INST_BRANCH_CALL			= 0x8e,
+	A10_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	A10_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	A10_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	A10_PMU_PERFCTR_INST_BRANCH_COND			= 0x94,
+	A10_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	A10_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	A10_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	A10_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	A10_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	A10_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	A10_PMU_PERFCTR_INST_LDST				= 0x9b,
+	A10_PMU_PERFCTR_INST_BARRIER				= 0x9c,
+	A10_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	A10_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	A10_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	A10_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	A10_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	A10_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	A10_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	A10_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_SUCC		= 0xb3,
+	A10_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_FAIL		= 0xb4,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	A10_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	A10_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	A10_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	A10_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	A10_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	A10_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC	= 0xc8,
+	A10_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	A10_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	A10_PMU_PERFCTR_FED_IC_MISS_DEMAND			= 0xd3,
+	A10_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	A10_PMU_PERFCTR_MAP_DISPATCH_BUBBLE			= 0xd6,
+	A10_PMU_PERFCTR_L1I_CACHE_MISS_DEMAND			= 0xdb,
+	A10_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	A10_PMU_PERFCTR_ST_NT_UOP				= 0xe5,
+	A10_PMU_PERFCTR_LD_NT_UOP				= 0xe6,
+	A10_PMU_PERFCTR_UNKNOWN_f5				= 0xf5,
+	A10_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	A10_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	A10_PMU_PERFCTR_UNKNOWN_f8				= 0xf8,
+	A10_PMU_PERFCTR_UNKNOWN_fd				= 0xfd,
+	A10_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
+
+	/*
+	 * From this point onwards, these are not actual HW events,
+	 * but attributes that get stored in hw->config_base.
+	 */
+	A10_PMU_CFG_COUNT_USER					= BIT(8),
+	A10_PMU_CFG_COUNT_KERNEL				= BIT(9),
+};
+
+static const u16 a10_pmu_event_affinity[A10_PMU_PERFCTR_LAST + 1] = {
+	[0 ... A10_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[A10_PMU_PERFCTR_RETIRE_UOP]				= BIT(7),
+	[A10_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[A10_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[A10_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_INT_ST]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_INT_ALU]				= BIT(7),
+	[A10_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
+	[A10_PMU_PERFCTR_INST_LDST]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[A10_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[A10_PMU_PERFCTR_UNKNOWN_f5]				= ONLY_2_4_6,
+	[A10_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_2_4_6,
+	[A10_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_2_4_6,
+	[A10_PMU_PERFCTR_UNKNOWN_f8]				= ONLY_2_TO_7,
+	[A10_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
+};
+
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
 	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
@@ -905,6 +1014,12 @@ static int a9_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return apple_pmu_get_event_idx(cpuc, event, a9_pmu_event_affinity);
 }
 
+static int a10_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				 struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, a10_pmu_event_affinity);
+}
+
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
@@ -1105,6 +1220,17 @@ static int a9_pmu_twister_init(struct arm_pmu *cpu_pmu)
 	return apple_pmu_init(cpu_pmu, A7_PMU_NR_COUNTERS);
 }
 
+static int a10_pmu_fusion_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_fusion_pmu";
+	cpu_pmu->get_event_idx	  = a10_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
@@ -1154,6 +1280,7 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
 	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
 	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,fusion-pmu",	.data = a10_pmu_fusion_init, },
 	{ .compatible = "apple,twister-pmu",	.data = a9_pmu_twister_init, },
 	{ .compatible = "apple,typhoon-pmu",	.data = a8_pmu_typhoon_init, },
 	{ .compatible = "apple,cyclone-pmu",	.data = a7_pmu_cyclone_init, },

-- 
2.50.1

