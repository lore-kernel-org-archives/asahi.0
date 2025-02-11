Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F03257AE1
	for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290113; cv=none; b=AXZhLTXlx1O3WkoRDMHzaLQjbw7Ky2t4RKS50NbXmmBQk8CnojnBXhpvcKJbg+BfAwxh7h9J3I+rCTkMjhhlIA9IJ/0fpzurW1LPSmmEQJrYbivbNNJJ36K8UiEr5hujt5IAtmNVcixaWAXwbLmmWv1aKwIkpaEK0wSyKZVrxNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290113; c=relaxed/simple;
	bh=FKoxFceE3ZzHF8kIrLmEjk0eExaHdGdlMF986JmIDvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk3ULdgSQN1mV5UbBK3XXJPL4/OzCTREeDukoacc26F4gUPbK0crczYqUV1umrVsfYcTkutSfHy55fUoLbBmXr04opOiegj6RRkD6vyoLz+NABwNrQnBUZQ5r+uBDSRKKlSDVwm/HBnbHeQqHtPDQv4LmLlOfQmlj/o8M2neL9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpKpPIJf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpKpPIJf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa2c456816so6357405a91.1
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739290110; x=1739894910; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KGE9UU8LWLAuGZMOil2Ew8KWbJ7U0vW14KkPC/rMug=;
        b=mpKpPIJfkjt8ocWEBZgMUomU+lEfVOxpJSQ9EN9VqHBLGDwzFq5/WAEjYMsJpEinBZ
         D00pbQNOsKXBfyHWtqwEhBpvuPBRmLGETWfqXpn3BhC+MJT5A2PcWzAefUJ1gSqyHqpM
         CqDMQCbdmoqlu5jdhgoHguDYOiNaxy4xet5RqGxarNjhhkZ1U115WXWrmYPv8ymLDQN8
         uJbMCxRVBLGgrqNWBKt6ZFdzS+TBrB/WVHwAFwn/xqOp8UM8amb/AFp1Dhc4yhAJNcOV
         Wu9TMrU/Z/ToYe7xyj4tOW/plI0q1SDxffpsdvqam9JFNPRp0yLA2cFriIULP5mmkKPu
         3icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290110; x=1739894910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KGE9UU8LWLAuGZMOil2Ew8KWbJ7U0vW14KkPC/rMug=;
        b=ord3eg/sE5xiUh1P2TyFpFHLIrpvxoEiMb8QYcYJJUuvmwz4MbgUbuZ/lJ+1Hz2dOv
         Mvn2GNtY1W3hfzVixRgiLJ+ndl61UpI6rJ+jwoDjfLYzw658mFBpBhhFwpsmceORKTsr
         sbQ7cKeUIZI3XfuRlOZw0f/iFFXpNhdmrKzjTMAehRNeAtPcUJkMBosgM2aEKWc66YGS
         360gWUOojUzc66o8MxUY/0ipUV1E9nl24g/qRc50HdyUpsv9Ei7taob4ODxMCSnmAKrF
         qAML4lis3npf/84Z2V5zlyNn5AmQv7Wy48WAsV1fhb7KyvUnR12Ow/jOcrEMjFNz0jGE
         ZV/g==
X-Forwarded-Encrypted: i=1; AJvYcCVJqd9tkLboXvezndcwhZ1nnFdFDfmBq+aI+Xdcns3J7MTW8vClqa4lb9WrhJzc7IinoZ/B7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaxqlNpl7Yz7+52CIHRW5k3SaQ6CB7tIbBSc3BwOXKVplGOlkO
	ynFz8lM6hcRANq68/arYXdD65b1qyoOVbH5F5dA33RrzWuxmZYH3
X-Gm-Gg: ASbGnctvkWHumt+MP1cjWOQo9sJ6jAV91XYkrHe98gM8H+2TmNXgcWkctrLtFN/fXl0
	6mw8kiTRlDSYwyVwLQn2405lKnucfTGgyaRMa3i/KEsFxK23pwH5x9xgW6g/9Ec2oQb4D5nZMJD
	zY8/yomZpc4bzVHQgU3/+Kq052qhBIhDkSHneh5xaWh10r8EVyU22eSTxJd/UXKmKybeKWJrHxC
	0dOVlo392rhSrGqt1pU6rCz0RP/9XNT8IqXOoZzlf3BYlORB8ct7LB+yNAQMFxEYuGREJYP2CXI
	yGVOQjh8HvksZ6Z02g==
X-Google-Smtp-Source: AGHT+IGSeMLr4j5Q5It5SPPlJYnO7UKpX+ZxPMED2e1hExc6Ai2Yp/buYksXrdtRPVj4/gwGNWKUIw==
X-Received: by 2002:a17:90b:3596:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2fa243eaa37mr24647103a91.30.1739290110174;
        Tue, 11 Feb 2025 08:08:30 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fa618e5e18sm6040478a91.41.2025.02.11.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:08:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Wed, 12 Feb 2025 00:07:27 +0800
Subject: [PATCH 06/10] drivers/perf: apple_m1: Add Apple A7 support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-apple-cpmu-v1-6-f8c7f2ac1743@gmail.com>
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10345;
 i=towinchenmi@gmail.com; h=from:subject:message-id;
 bh=FKoxFceE3ZzHF8kIrLmEjk0eExaHdGdlMF986JmIDvE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnq3XnKTu5tQNXWH/N0WtZ8U+XKDsnNDKVTIU1Y
 Z9M/WPTG8KJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6t15wAKCRABygi3psUI
 JH+GD/9jIDY62YdrZmUxXIluB8bDw6BOJhDnV0hO5jwZ6/S/Rsoksn1KXKwZHoMhtChlLSCcu1B
 5e7ZJCWo0pYbWYWMgAFDE71pZYLjJTY00z+FIoLcB9UAm7+qH+E26s2Q0dpoeh2D+8/4Zt0tTle
 9XrcxZHe60msHZdRRKl2Pv7SfV8C0PjarmqhU9RIdH47zEMmEBEjyMUy8ogqW84l0w+7L4IGghD
 qTwJbzkEP5cJ/+2ma62THurkJ0hCquJTNHK/VlvnxVJPWlNeb6PtbiBw32jNRmVjGOvbqH8b3YU
 FUzDrmzMpykjlZA/x+fC0Eo+7NDdLnNWVyGDRMdejKFDNHZ2wN9F3OQnTJKI2DD5JZaDhu5qv9S
 +fpwVPOYTFmhCz2dHoTpJOgBNq8QGpfcnBlwSCftVUd8PhMi9Arwdq+Fc9QE7Ms+OJsZtWuYuOf
 zBgv4cuuZm6BJm/PDsRwM+8iPZJAvA8c90cN+zkFA8Z+fXXAH5j4kfaB7IHImZkIvZ37bDJs2+c
 tNCvU2nttaD8zT67zwR9QcNhgYxpQ1rTB0HFeq4eJ8tD8ghCEP7dcmtWpC0bEgN1TVI8ib2OGAu
 hnHdrOoqI8AD9p5MTIEfViu+GeGXtNEj04kE4us1lWO8AHUG+uSwDNh5uGWPawiHOWQVWlf66Ck
 ZcDgRUfVK7e/Ibw==
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
index 39fcdcdb9e5dd6d4edad0a182dbc2eef62780d8c..a4f04e4647e5f554984dc219473afb837b81e6cd 100644
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
@@ -615,6 +782,16 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags, u32 counter
 }
 
 /* Device driver gunk */
+static int a7_pmu_cyclone_init(struct arm_pmu *cpu_pmu)
+{
+	cpu_pmu->name = "apple_cyclone_pmu";
+	cpu_pmu->get_event_idx	  = a7_pmu_get_event_idx;
+	cpu_pmu->map_event	  = a7_pmu_map_event;
+	cpu_pmu->reset		  = a7_pmu_reset;
+	cpu_pmu->start		  = a7_pmu_start;
+	return apple_pmu_init_common(cpu_pmu, ARMPMU_EVT_47BIT, A7_PMU_NR_COUNTERS);
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

