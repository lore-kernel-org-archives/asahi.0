Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F802F90DB
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325667; cv=none; b=UpjOtY105plBJ2zSFh1DqCD8x8MVVdJTrqixXsTiBhnWQd0dOY8VMckx2s6/NwsLtsHQwYKMhb3pi40Rq8967mM3P4rUa0NKaMkQTCf2hyJY3UWwsidOeCrAJR2lfBReeo9xUN8IReMzIKxv/Tx0K4cbn3rX2XLmmUl5Kk1BUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325667; c=relaxed/simple;
	bh=e978bWoFjBQgsdNlqdWrRQsmNCkoajFMktc9t6zXMkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJVAhhTCU4zkjBqbde5ivOfU3i0foMHGoDe1ppO1Bh2sE1bv87e0T9pM++jxwSKPStBUiCMLydvgtwbGnIPUHVE2v38uS41YgT0yXOH85Aso7ziSblDWzKLRoOKFRMjnjGfk2vQaS3xbBI/mPuT5olT3w+OPLWyAMmRAA8bOi5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK6Lir9i; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK6Lir9i"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445826fd9dso50048235ad.3
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325661; x=1757930461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=;
        b=aK6Lir9i1EXVpKitS5PlosXNsNRjLemrCt17jcNxHnP/z71okUZ4ugUPkYuMnkv5dm
         1k9xoraLuGYfC1KLgJLLd16Pnav6JP26aDR9AGD+rv/t3TbPQmHz3UA9qg41Ro/rBLxo
         pQjBsLDgFuese7cqqutaRQbLKieu2rjs1GsTvIeRnwq+77x14pKyzb2Dz6zxrkTREXuO
         kNW/p6mp01jRovUg6a3yZMiHcpj9JGF6Sle+7qcpJQqbYuNFVpehY5mXPc6rLCe/c/MI
         1eR/Ls336BA+6tAeWcoJut/DSUBQHNibPDdifi4TPmwsmxJwzWFDhxzaSthQGDQrC3ww
         5NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325661; x=1757930461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=;
        b=WlRj28xCnhlowb30NHrtRc7Nssd9DcPeI4ovy28fjqda8kO+sgPkRzrgsMl4LG0uzO
         c3oJmfDRXse1AcXlSMSYbq85N2v1iE/mQNCWeP0snq3tRykz+ADYKS+7FoHnyR+q2kpY
         cYTkY20m1mCIuRo2np610c9MlWZhjefJtnKYHLeo5PAbKI5NblK7qYDCJOAtnqXxrxwH
         GHRtvup4PlFlzE5Qww/8bpBmMJOjy/oSdjQnkFo1LPelMEdHZXyAE8ecYS46Z/WUddTN
         SvfuV7EONGrUkGdQZJ/09dgI0fs3/+ZOCHWacJQvBY3ZSM+zS/ohBCZ3ewlfxDYVdEzV
         DC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKXCPIyVwB0pNe/Q+UnjsBGCdpdUvkcrD1Tb+cpbFRviQ1EnUdt8Gq23UzcK8LaWgiLKL4dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUS71zhRnqDXdFBne9XoDGIXKgT+8ijKT7j8zhbkpuqCg68rux
	0ffmFv5nqj2yDdQKr389X532D05inSNgjxZSnvlGIDMRXmM72Bg78YlnE9YiE3Q2q0A=
X-Gm-Gg: ASbGncv/LzTIpT8gpMehMmkTiS3cxVQaxlbXJrTt6hEH/NzPxAxWPXdRgPoc1h2Ci5Z
	lRE3zypgDsGfPxNHVSrJQ5fSxpo3yrNb2CzuTBDRoPFqG4iSy999Hf5ggS/OBIyzjeEkrB4BZZA
	YG0llBTjiAH4Rv/vV4VTgUqzp1X5+61YnVyOd9eipFl9ivhxBdFFoqxW8C2nUxvZA0pncK/5h6h
	DK6EbXjWtpVFY49mql3rPmZgl3uzfoRgpSmsD2riE+HZHwt4N1USPKoj9UNfpvCa9Tcn49xGN9c
	tuhacnJ9gjuLCC9ln6JPUxXNkA28OIf5doDK3LIIooT16Fo0eSvApWSWts9Geydnhr97Ek1zT5E
	bThgqmfQXj4LH66VuqScBWn/kYfh/M1jV3ldjLQ==
X-Google-Smtp-Source: AGHT+IG11e5yGQ6mc6A+u6URsOan+E/sP/pcqh8w5VNsDhDKar9RrdRNruPHJgRVAnjqfyCyjH1Reg==
X-Received: by 2002:a17:902:e5c6:b0:250:bd52:4cdb with SMTP id d9443c01a7336-251736df0e2mr88144745ad.32.1757325661328;
        Mon, 08 Sep 2025 03:01:01 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:28 +0800
Subject: [PATCH RESEND v8 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-4-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=e978bWoFjBQgsdNlqdWrRQsmNCkoajFMktc9t6zXMkE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlDf+O1g150hHA5Hs0I/aUaLmgR27sqVHJQs
 3djsJTRQ5eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQwAKCRABygi3psUI
 JGxAD/9Q9nmhaDwo8/y7zqJCPr0t6UcR8TjZGcnNwQiqAW4DjwMh5R8o6Pra744BBIYH8GfubUD
 YDF7aXmWtHvBnVXTS4Hl9YpSV+4QpTuVPt141vLZ24paPzXJyVWg0tc/lzg7xn0T1ny+VKmrbDB
 Xy/EF/rZMNSSIzMEJ+bzdfbNlC1wlj/AnHv6Gj0vgqdJ4qPCOhym4ASBaptHHKfDfQ3Ogo56HVu
 na9AHhu6/ltmS1AtmFz1LKPAJUn+F3E6QRdnaWsyZdlD7FbCVzXogQ85wfdNs6bifQ3ha2P2TWa
 4d9RAc7Q4s8B3EQw8YbOU4JdFAwGCDhEKXXAee4zrjYDVrbt5hSqm1ShFeBQ5b4qwGxH0sZNjzz
 b+BZ8ww0RZGTakwCYBoM6lW7BgT/ZqBcfE8sA6DYjkDJM/U8012SmwUoX8T8MxBfRtA1OK5dCzT
 Mlvq/mlVGUYejU0ageOkLD+Oibs8W2qma+seYazE5dX6G3MOhZY4Dvk34PeR+2C4jTGvR8lYaW3
 Fi9O6ZcTXtd+zezlkAy46nu9sLthHQibo3ZuUZokE8k/BxZ712AiNkglf0BxfyBPoGhSfKFXcqi
 N6iG1guaDHzZt3K9I3UNzrfNLbdttqJARxjy+JHvG213JQx+KrL9K/gHKa1GlzmOsGgu6HZNsCB
 pmmMxHOH3bj2/mQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b4ab6a3e5df965b7ef450d7e533995f3cc8633fd..b5fe04ef186f04b4af32524fe433afb79979b791 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -20,6 +20,7 @@
 #include <asm/perf_event.h>
 
 #define M1_PMU_NR_COUNTERS		10
+#define APPLE_PMU_MAX_NR_COUNTERS	10
 
 #define M1_PMU_CFG_EVENT		GENMASK(7, 0)
 
@@ -459,7 +460,7 @@ static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
 
 	regs = get_irq_regs();
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, APPLE_PMU_MAX_NR_COUNTERS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct perf_sample_data data;
 
@@ -506,7 +507,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -601,13 +602,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
 	}
 }
 
-static void m1_pmu_reset(void *info)
+static void apple_pmu_reset(void *info, u32 counters)
 {
 	int i;
 
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 
-	for (i = 0; i < M1_PMU_NR_COUNTERS; i++) {
+	for (i = 0; i < counters; i++) {
 		m1_pmu_disable_counter(i);
 		m1_pmu_disable_counter_interrupt(i);
 		m1_pmu_write_hw_counter(0, i);
@@ -616,6 +617,11 @@ static void m1_pmu_reset(void *info)
 	isb();
 }
 
+static void m1_pmu_reset(void *info)
+{
+	apple_pmu_reset(info, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 				   struct perf_event_attr *attr)
 {
@@ -639,7 +645,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -649,7 +655,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -657,7 +662,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -669,7 +674,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -677,7 +683,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -685,7 +692,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -693,7 +701,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.51.0

