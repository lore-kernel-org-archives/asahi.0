Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3821CAA6C
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258172; cv=none; b=T3HOChxb2esqYADL84mhHjPD5tfNwVNXL+FQ2dWLzZybIyssoEBUomyNR8XKxt/RbNlF/aysYpFMLx9rZTtpQCdkZFOgdN2CvMV0Ps98ssSmt6bTGMx1xXHBbXYPBuhVV6WPwN1KbniSyWkrb+f3kSwoErN8lezKqJyPVgnvlL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258172; c=relaxed/simple;
	bh=vnsmCGSw7Ox/D+cYElRWl33lnlkyIEYomCaHfMV1wgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A98E8TOgkSga/1NnZzt101J536AvDW2FZY4hyOwcAtPPAPvfRiMNT+bdtSwnR2Q9Iceo9ceMeDgu2K1TDW9UIfHPyHw6z57OsqrJ99sLISZHYB/aTGo6dl7JIT+DWgh/8gojxuLNjtBOu+l+Vf+7aW4T+VrdUwERySYYOIW7IJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKelH5oO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKelH5oO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so8778925b3a.1
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258170; x=1767862970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzvjVfHrZzra3wF9+A+Do+FwcxmxMk+rXbtL9/jEreg=;
        b=VKelH5oOKBLDVtODD6r666VpYy1fgdb8HTMik03zCCY8or2OYfYn+grx13ElihsqEo
         PtRzUL2oYIzPBrUM3q67wjXxpF3j9A7cpKmCJ5ovuOhNiIAY5frIQbeRuoPf9yCd2UOP
         wSJQpun1wjeIVmVnapZiv2PeVk7hE+68H8PSarOPauzmXOCAbG3mdR91Ekc38yXkgaDQ
         jPySehOZbOsWjwpmzEMFQ1w9ex1vlo6vhhkCvActwNpaIAhSS00WqFTyZ8ZE/txcEjcn
         TRePzQ2Zy/wp54MBHTyWz768D0Wew881llE3jqw/TryDXyio0IE1tqxUxuDEZhgafYtS
         CAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258170; x=1767862970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mzvjVfHrZzra3wF9+A+Do+FwcxmxMk+rXbtL9/jEreg=;
        b=G4Or5OvJycUg7SSqLau06ntR+uQuC/iF/+h905S1Pa/cR09DYS0dvd6AejIR6HJl6a
         6XZOR1O+EFW4EHF7PcWi8BtJvtGN9d5aiNKqDmbcFnhLNEq4YGIS4R5bDJro4ns/AX14
         uWaN5WjTX2Ai+gw4kEAspeuJdBPodMcp0JmS9hVIOYdw6JbJgDYpieYWOUHDf95S/nEh
         xArDhGVOk01PmDGUQMbV6PBonp9k7B+LXgeY8nrI13872WRh/qDdQi5EdxbdVEPyxQpV
         fUJ4bpbz8fcfaZ031P2QpnuoGrkupOEK7FH/MpqEKgQznb8Qwb7OowOx4PkvnrrUcGSv
         SCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQik0x2jph3S7qs+Q4O0q4PuWFvRPfURFoNErzb88KxpxFdnNHekkxT9VCKGrOrTUa7H2cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqOBt9dGM8UJ0gqx1m+2D9h+WyXTUlSc24Kk+Qr5uX4uytVm2h
	qnYgdH9o7kxROQF4TjXy28hUrXhEfUa6waiDplibsoOqjgya6ToJqueJ
X-Gm-Gg: AY/fxX5THbNp1CTjmHWcvyR/PwxKhx7aUJyK6rxMLcyU/KmDNnhCe5R6bYK1SdEOlo2
	8NEyfhy0ZhPPolRp9eaQ9DijDrnW3jby09vL8qrcvtz5P0cTx6wZHhqeD6CdeyB98k2Kq9OyJED
	QaLTcAZ2n5O+6NVQsNGT6zw/sdNAb6C9jXkhulwv1YS40VvqQLTt7ZCIRvpPFgX4A3ZjF8tYKBo
	QVrUxvydsUeGdfMcB1YQQfgJN8PzTa6m/AppzsCg1RaO2s8oCjJZlSZsMz1pTbLP3g+8PjES4Yo
	wSYfydZLG5uo/mYamCV0P4UsXAlNInfesNOvQKSf8NNRTPjZWxOEfmbzrTKZMNPQkpnaIxjRC8W
	cwqp4PlNG/LZLK3nKys0279vybX1MD+SrTJ/w5NkJqlGlvsV1EFg106L24tJ6v82B3CyrKisbSJ
	U+5+XGCLwAPgPJ
X-Google-Smtp-Source: AGHT+IEX1s5ks4GSf9vW+xRL0kaPOFIGucJSrgtfX5TcAhrNEbjWInD/uhlAFVi+IvqgSG5t8zgPJw==
X-Received: by 2002:a05:6a00:801b:b0:7e8:4587:e8cf with SMTP id d2e1a72fcca58-7ff66a6ea42mr36292504b3a.66.1767258169687;
        Thu, 01 Jan 2026 01:02:49 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:49 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:40 +0800
Subject: [PATCH v10 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-4-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=vnsmCGSw7Ox/D+cYElRWl33lnlkyIEYomCaHfMV1wgk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmHJtVqtjeoiJKKIhDQt9qIWdQDOC/zGFyo
 QkRwkr9DvmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JARoD/9Zh0Vhm/bNiMMe2pBZbvJMqnJf2oHnxk2JKgdwWa9kfkiQlZbdzArn7sqWM8wmDXbjmco
 mfsYi8LvlBm9vrklaUZwi9yKoavfyZNHTu9YF4sP77fFG40ipagDZxmzKPdcgQTHRveTwbEczcz
 mA3FjuTxhDkud544e8b130aLcMJIPa/YL68X9VZKFFoLze5bgIJzfDLvORZHyJ4MOaXDMWI05Cf
 XkYofevpChBhCV942gZQQ2CZPpD2DTaHWrXhVxOdCu8SHxpWMW1gb4lgCNMgud4UW7tubdreqw7
 JTPbeLeyPpTbJeiHxg3jvHSWO1qLDT6sJthyWyZxNyD8QxctRZ/zY2qFJxH1YmCDXRmuI0BEBEv
 Fxo2qKPAn7pqD++V6b4lmI1qd1ZaEoJe29aJtC6oR9foGsOtB9vGHuBiTMBY93Hsp36hQej1oBu
 IM5FxvDfDO+UFyZ7gr26B7Es3Lub6sBjENMN46CvAX4PlqxzSkIaEPyz1JEOr2npVSzioUKYTzV
 lm+/84J31ToC7iwpAqnWE28ADkpGJh1nQU4oEfKe5MPTzdRILSGPHdH4zBPFlQE8EVy0HmwYodc
 EaDb9rDSljSH+f2l31Ogp2i3GjaDgWBsq+Q4RMthooPQtrfZHCDI+L1layneq2efUroKVN22MWD
 3qxb75Yp5k6w5yQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b4ab6a3e5df965b7ef450d7e533995f3cc8633fd..0b0ee2b9ad4b555f66b9b478055a420b7eec8f3c 100644
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
 
@@ -492,7 +493,8 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 
 static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event,
-				const u16 event_affinities[])
+				const u16 event_affinities[],
+				u8 nr_counters)
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
 	unsigned long affinity = event_affinities[evtype];
@@ -506,7 +508,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, nr_counters) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -517,7 +519,8 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
-	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
+	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity,
+				       M1_PMU_NR_COUNTERS);
 }
 
 static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
@@ -601,13 +604,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
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
@@ -616,6 +619,11 @@ static void m1_pmu_reset(void *info)
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
@@ -639,7 +647,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 nr_counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -649,7 +657,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -657,7 +664,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, nr_counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -669,7 +676,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -677,7 +685,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -685,7 +694,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -693,7 +703,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.52.0

