Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2366E18D652
	for <asahi@lists.linux.dev>; Wed,  7 Aug 2024 02:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722998542; cv=none; b=R4PguOruMw86EhWttWJT42qZvSjsHspYS0eNBZrNrbvvYVDNnW9J1iM6qPmW5L1ZVKOtoI/NqeLZoikZrELGRHv8MIjVioU/8ivrKDSGw3GpOvoT3Xw4X/mjONoQx8Uwy0tTBytq81YCniGYS2OFjdxDM8ozRySi4WvsICeORRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722998542; c=relaxed/simple;
	bh=0YCEjcMVUZWsi0z7+qlOOSc9pMUI308GZ7SFnjgH+6Y=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=PWyIPH1ayHSWg+92lzOBBjOEeWhYgZG+sz/H3KyfOi2+oMzrIclprBGgxyrgdSDlWArrHe+fsJe1Igzdhh5BOmafDtzewTLuQugTzTbHU9uLEvgp05RGrCfpSLCjoAfk8MKiuiTVYz4L25mkJqniPR80ON43WamJyG+zOXMRkjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=none smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mQOHDQA9; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mQOHDQA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1722998528; bh=VaNKum1iO6vuse7eMN1btLnbUy9t52KkTKSQdwz4KC4=;
	h=From:To:Cc:Subject:Date;
	b=mQOHDQA9pZkLURYJmg9ihTr8saifGvufILrKTEfIzcH05Jcv2/vGW62lAYENOL2PX
	 v8BxxZHuzflAae37rxkz76Nr6HJ/TNEad1tsnBQYhZ9Q1orwHNpc1mwfrLUmTpwPN7
	 lKcqD416h0DpTfbOCr90lcau4hqaqmTgGnIkaiws=
Received: from localhost.localdomain ([2400:2200:521:6592:9069:778f:a099:e1e2])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 8ED06478; Wed, 07 Aug 2024 10:35:45 +0800
X-QQ-mid: xmsmtpt1722998145t4dekkusj
Message-ID: <tencent_C5DA658E64B8D13125210C8D707CD8823F08@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8qQ0NxQ1Ujsi3LnjVNpC3gtIC6JdGoph5FRIKV30YyqGcWhQET5
	 g/XIL/uwRejOTFzK/8fQwPVRS29YzoSNWRNvF+Phld2z0sDfywStL1yD9WuRZTMzy4YfGxSptXF5
	 LbGEp99kizBevR93Rptf0hGW0g96o0d3pBa66/VoXMmWfa7sBHEUZNrzfYi4E7F+w0cffodrv/dY
	 ul4daBKiMPAFj9ggO7fy0RvTfXqZoHQux8/OsS3m1rket+eWlF7YKqG52bCeOnRe1GARbfZ5LAvG
	 7OKQxWwe1wb7aun/Wi+KOrmEZr6xLCeZVB0b46ihbHeKCQZfqqEwvGPmcxumIWMV7XsYShCsHEye
	 hUy5/jmUP4hZgNZzy8PUGIQHLOn9ihwVZ24bWaUZ8jcIwjd7c1M3/cD9WnAy6LINFdkCt5YkBH4G
	 X1OnSm/7tI66S7QqTWfQfD4DuOVNMkcfS8IVTIGSvlWoGdPPmPO9gp0qAsqyNIp5wCfhZfr16SGY
	 jZ2GrhtieVzLjEKqSblFhL3K/sigUcK0uZ7V0vI+zkQ1bIGq0wkwVtMTyfqjp8EOENqpFdaFqOo8
	 Z+MTK6kRvQ6yDjp5Hurc5p2xxdsjlzq7hEqksv7bB4gZ/ZlVNKhppMtrgfCLLEaosmRyFK15nG5a
	 Czkcg9ri3nt4VQLm4U4muzRPMG81rjtRDVtZHfoKvyfOI7Z95HK4HW5EingkZkUJKcByb8HwrfWF
	 uwk1ztyxT62bS/gSLOtBP3jtqqmT5kVU3d4qqlkdtPFmP8Y+xDs1FuafyGIlyFhD9+MwMdY2mjOp
	 wfG7017GETj3tF6BzCL9bwkKVPaN0tUf+btbMYmIKBGAeZSKZ4qwZ+z/vMRrY12ix9B9z9h2oSQ4
	 qHx3sq0bn5kEbhsB+us2+0CPVo4TlAsU3sJvVF10SyoYCvgXORzJogBkCFog7vHn6afrhCNZbOII
	 kNsj4rXMi0N0/dNvH4LyMShQJujCZ2i7BqZb3Tru7O5a3kH6FwqA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Asahi Lina <lina@asahilina.net>,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2] drivers/perf: apple_m1: add known PMU events
Date: Wed,  7 Aug 2024 11:35:18 +0900
X-OQ-MSGID: <20240807023518.63183-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds known PMU events that can be found on /usr/share/kpep in
macOS. The m1_pmu_events and m1_pmu_event_affinity are generated from
the script [1], which consumes the plist file from Apple. And then added
these events to m1_pmu_perf_map and m1_pmu_event_attrs with Apple's
documentation [2].

Link: https://github.com/cyyself/m1-pmu-gen [1]
Link: https://developer.apple.com/download/apple-silicon-cpu-optimization-guide/ [2]
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Hector Martin <marcan@marcan.st>
---
Changes in v2:
- Remove additional m1_pmu_event_attrs and m1_pmu_perf_map. These will be
  added to the userspace perf tools in the future patch.

v1: https://lore.kernel.org/lkml/tencent_D6474BDCDD18AA90A0C656BE704136ED2807@qq.com/
---
 drivers/perf/apple_m1_cpu_pmu.c | 178 +++++++++++++++++++-------------
 1 file changed, 105 insertions(+), 73 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index f322e5ca1114..3961e2b6cd9b 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -47,46 +47,79 @@
  * implementations, we'll have to introduce per cpu-type tables.
  */
 enum m1_pmu_events {
-	M1_PMU_PERFCTR_UNKNOWN_01	= 0x01,
-	M1_PMU_PERFCTR_CPU_CYCLES	= 0x02,
-	M1_PMU_PERFCTR_INSTRUCTIONS	= 0x8c,
-	M1_PMU_PERFCTR_UNKNOWN_8d	= 0x8d,
-	M1_PMU_PERFCTR_UNKNOWN_8e	= 0x8e,
-	M1_PMU_PERFCTR_UNKNOWN_8f	= 0x8f,
-	M1_PMU_PERFCTR_UNKNOWN_90	= 0x90,
-	M1_PMU_PERFCTR_UNKNOWN_93	= 0x93,
-	M1_PMU_PERFCTR_UNKNOWN_94	= 0x94,
-	M1_PMU_PERFCTR_UNKNOWN_95	= 0x95,
-	M1_PMU_PERFCTR_UNKNOWN_96	= 0x96,
-	M1_PMU_PERFCTR_UNKNOWN_97	= 0x97,
-	M1_PMU_PERFCTR_UNKNOWN_98	= 0x98,
-	M1_PMU_PERFCTR_UNKNOWN_99	= 0x99,
-	M1_PMU_PERFCTR_UNKNOWN_9a	= 0x9a,
-	M1_PMU_PERFCTR_UNKNOWN_9b	= 0x9b,
-	M1_PMU_PERFCTR_UNKNOWN_9c	= 0x9c,
-	M1_PMU_PERFCTR_UNKNOWN_9f	= 0x9f,
-	M1_PMU_PERFCTR_UNKNOWN_bf	= 0xbf,
-	M1_PMU_PERFCTR_UNKNOWN_c0	= 0xc0,
-	M1_PMU_PERFCTR_UNKNOWN_c1	= 0xc1,
-	M1_PMU_PERFCTR_UNKNOWN_c4	= 0xc4,
-	M1_PMU_PERFCTR_UNKNOWN_c5	= 0xc5,
-	M1_PMU_PERFCTR_UNKNOWN_c6	= 0xc6,
-	M1_PMU_PERFCTR_UNKNOWN_c8	= 0xc8,
-	M1_PMU_PERFCTR_UNKNOWN_ca	= 0xca,
-	M1_PMU_PERFCTR_UNKNOWN_cb	= 0xcb,
-	M1_PMU_PERFCTR_UNKNOWN_f5	= 0xf5,
-	M1_PMU_PERFCTR_UNKNOWN_f6	= 0xf6,
-	M1_PMU_PERFCTR_UNKNOWN_f7	= 0xf7,
-	M1_PMU_PERFCTR_UNKNOWN_f8	= 0xf8,
-	M1_PMU_PERFCTR_UNKNOWN_fd	= 0xfd,
-	M1_PMU_PERFCTR_LAST		= M1_PMU_CFG_EVENT,
+	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
+	M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE			= 0x2,
+	M1_PMU_PERFCTR_L1I_TLB_FILL				= 0x4,
+	M1_PMU_PERFCTR_L1D_TLB_FILL				= 0x5,
+	M1_PMU_PERFCTR_MMU_TABLE_WALK_INSTRUCTION		= 0x7,
+	M1_PMU_PERFCTR_MMU_TABLE_WALK_DATA			= 0x8,
+	M1_PMU_PERFCTR_L2_TLB_MISS_INSTRUCTION			= 0xa,
+	M1_PMU_PERFCTR_L2_TLB_MISS_DATA				= 0xb,
+	M1_PMU_PERFCTR_MMU_VIRTUAL_MEMORY_FAULT_NONSPEC		= 0xd,
+	M1_PMU_PERFCTR_SCHEDULE_UOP				= 0x52,
+	M1_PMU_PERFCTR_INTERRUPT_PENDING			= 0x6c,
+	M1_PMU_PERFCTR_MAP_STALL_DISPATCH			= 0x70,
+	M1_PMU_PERFCTR_MAP_REWIND				= 0x75,
+	M1_PMU_PERFCTR_MAP_STALL				= 0x76,
+	M1_PMU_PERFCTR_MAP_INT_UOP				= 0x7c,
+	M1_PMU_PERFCTR_MAP_LDST_UOP				= 0x7d,
+	M1_PMU_PERFCTR_MAP_SIMD_UOP				= 0x7e,
+	M1_PMU_PERFCTR_FLUSH_RESTART_OTHER_NONSPEC		= 0x84,
+	M1_PMU_PERFCTR_INST_ALL					= 0x8c,
+	M1_PMU_PERFCTR_INST_BRANCH				= 0x8d,
+	M1_PMU_PERFCTR_INST_BRANCH_CALL				= 0x8e,
+	M1_PMU_PERFCTR_INST_BRANCH_RET				= 0x8f,
+	M1_PMU_PERFCTR_INST_BRANCH_TAKEN			= 0x90,
+	M1_PMU_PERFCTR_INST_BRANCH_INDIR			= 0x93,
+	M1_PMU_PERFCTR_INST_BRANCH_COND				= 0x94,
+	M1_PMU_PERFCTR_INST_INT_LD				= 0x95,
+	M1_PMU_PERFCTR_INST_INT_ST				= 0x96,
+	M1_PMU_PERFCTR_INST_INT_ALU				= 0x97,
+	M1_PMU_PERFCTR_INST_SIMD_LD				= 0x98,
+	M1_PMU_PERFCTR_INST_SIMD_ST				= 0x99,
+	M1_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
+	M1_PMU_PERFCTR_INST_LDST				= 0x9b,
+	M1_PMU_PERFCTR_INST_BARRIER				= 0x9c,
+	M1_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	M1_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
+	M1_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
+	M1_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
+	M1_PMU_PERFCTR_L1D_CACHE_MISS_LD			= 0xa3,
+	M1_PMU_PERFCTR_LD_UNIT_UOP				= 0xa6,
+	M1_PMU_PERFCTR_ST_UNIT_UOP				= 0xa7,
+	M1_PMU_PERFCTR_L1D_CACHE_WRITEBACK			= 0xa8,
+	M1_PMU_PERFCTR_LDST_X64_UOP				= 0xb1,
+	M1_PMU_PERFCTR_LDST_XPG_UOP				= 0xb2,
+	M1_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_SUCC			= 0xb3,
+	M1_PMU_PERFCTR_ATOMIC_OR_EXCLUSIVE_FAIL			= 0xb4,
+	M1_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC		= 0xbf,
+	M1_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC		= 0xc0,
+	M1_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC			= 0xc1,
+	M1_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC	= 0xc4,
+	M1_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC		= 0xc5,
+	M1_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC		= 0xc6,
+	M1_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC		= 0xc8,
+	M1_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC	= 0xca,
+	M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC			= 0xcb,
+	M1_PMU_PERFCTR_L1I_TLB_MISS_DEMAND			= 0xd4,
+	M1_PMU_PERFCTR_MAP_DISPATCH_BUBBLE			= 0xd6,
+	M1_PMU_PERFCTR_L1I_CACHE_MISS_DEMAND			= 0xdb,
+	M1_PMU_PERFCTR_FETCH_RESTART				= 0xde,
+	M1_PMU_PERFCTR_ST_NT_UOP				= 0xe5,
+	M1_PMU_PERFCTR_LD_NT_UOP				= 0xe6,
+	M1_PMU_PERFCTR_UNKNOWN_f5				= 0xf5,
+	M1_PMU_PERFCTR_UNKNOWN_f6				= 0xf6,
+	M1_PMU_PERFCTR_UNKNOWN_f7				= 0xf7,
+	M1_PMU_PERFCTR_UNKNOWN_f8				= 0xf8,
+	M1_PMU_PERFCTR_UNKNOWN_fd				= 0xfd,
+	M1_PMU_PERFCTR_LAST					= M1_PMU_CFG_EVENT,
 
 	/*
 	 * From this point onwards, these are not actual HW events,
 	 * but attributes that get stored in hw->config_base.
 	 */
-	M1_PMU_CFG_COUNT_USER		= BIT(8),
-	M1_PMU_CFG_COUNT_KERNEL		= BIT(9),
+	M1_PMU_CFG_COUNT_USER					= BIT(8),
+	M1_PMU_CFG_COUNT_KERNEL					= BIT(9),
 };
 
 /*
@@ -96,46 +129,45 @@ enum m1_pmu_events {
  * counters had strange affinities.
  */
 static const u16 m1_pmu_event_affinity[M1_PMU_PERFCTR_LAST + 1] = {
-	[0 ... M1_PMU_PERFCTR_LAST]	= ANY_BUT_0_1,
-	[M1_PMU_PERFCTR_UNKNOWN_01]	= BIT(7),
-	[M1_PMU_PERFCTR_CPU_CYCLES]	= ANY_BUT_0_1 | BIT(0),
-	[M1_PMU_PERFCTR_INSTRUCTIONS]	= BIT(7) | BIT(1),
-	[M1_PMU_PERFCTR_UNKNOWN_8d]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_8e]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_8f]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_90]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_93]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_94]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_95]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_96]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_97]	= BIT(7),
-	[M1_PMU_PERFCTR_UNKNOWN_98]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_99]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_9a]	= BIT(7),
-	[M1_PMU_PERFCTR_UNKNOWN_9b]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_9c]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_9f]	= BIT(7),
-	[M1_PMU_PERFCTR_UNKNOWN_bf]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_c0]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_c1]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_c4]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_c5]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_c6]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_c8]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_ca]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_cb]	= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_f5]	= ONLY_2_4_6,
-	[M1_PMU_PERFCTR_UNKNOWN_f6]	= ONLY_2_4_6,
-	[M1_PMU_PERFCTR_UNKNOWN_f7]	= ONLY_2_4_6,
-	[M1_PMU_PERFCTR_UNKNOWN_f8]	= ONLY_2_TO_7,
-	[M1_PMU_PERFCTR_UNKNOWN_fd]	= ONLY_2_4_6,
+	[0 ... M1_PMU_PERFCTR_LAST]				= ANY_BUT_0_1,
+	[M1_PMU_PERFCTR_RETIRE_UOP]				= BIT(7),
+	[M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE]			= ANY_BUT_0_1 | BIT(0),
+	[M1_PMU_PERFCTR_INST_ALL]				= BIT(7) | BIT(1),
+	[M1_PMU_PERFCTR_INST_BRANCH]				= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_BRANCH_CALL]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_BRANCH_RET]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_BRANCH_TAKEN]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_BRANCH_INDIR]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_BRANCH_COND]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_INT_LD]				= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_INT_ST]				= BIT(7),
+	[M1_PMU_PERFCTR_INST_INT_ALU]				= BIT(7),
+	[M1_PMU_PERFCTR_INST_SIMD_LD]				= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_SIMD_ST]				= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
+	[M1_PMU_PERFCTR_INST_LDST]				= BIT(7),
+	[M1_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[M1_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_ST_MEMORY_ORDER_VIOLATION_NONSPEC]	= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_BRANCH_COND_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_BRANCH_INDIR_MISPRED_NONSPEC]		= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_BRANCH_RET_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_BRANCH_CALL_INDIR_MISPRED_NONSPEC]	= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC]			= ONLY_5_6_7,
+	[M1_PMU_PERFCTR_UNKNOWN_f5]				= ONLY_2_4_6,
+	[M1_PMU_PERFCTR_UNKNOWN_f6]				= ONLY_2_4_6,
+	[M1_PMU_PERFCTR_UNKNOWN_f7]				= ONLY_2_4_6,
+	[M1_PMU_PERFCTR_UNKNOWN_f8]				= ONLY_2_TO_7,
+	[M1_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
 };
 
 static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
 	PERF_MAP_ALL_UNSUPPORTED,
-	[PERF_COUNT_HW_CPU_CYCLES]	= M1_PMU_PERFCTR_CPU_CYCLES,
-	[PERF_COUNT_HW_INSTRUCTIONS]	= M1_PMU_PERFCTR_INSTRUCTIONS,
-	/* No idea about the rest yet */
+	[PERF_COUNT_HW_CPU_CYCLES]		= M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
+	[PERF_COUNT_HW_INSTRUCTIONS]		= M1_PMU_PERFCTR_INST_ALL,
 };
 
 /* sysfs definitions */
@@ -154,8 +186,8 @@ static ssize_t m1_pmu_events_sysfs_show(struct device *dev,
 	PMU_EVENT_ATTR_ID(name, m1_pmu_events_sysfs_show, config)
 
 static struct attribute *m1_pmu_event_attrs[] = {
-	M1_PMU_EVENT_ATTR(cycles, M1_PMU_PERFCTR_CPU_CYCLES),
-	M1_PMU_EVENT_ATTR(instructions, M1_PMU_PERFCTR_INSTRUCTIONS),
+	M1_PMU_EVENT_ATTR(cycles, M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE),
+	M1_PMU_EVENT_ATTR(instructions, M1_PMU_PERFCTR_INST_ALL),
 	NULL,
 };
 
-- 
2.45.2

