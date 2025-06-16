Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC441F8723
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037549; cv=none; b=m7xVVE2IT6wnbFrJ/UPuBqTLusGuzaauPXqxpEWi4WEf4lCbI2tfSzQZt/YJ99l1/sPDUIRrkLCnh3OSbh2icxEJb7Bo8zE01P1zUGvFjsCujcqLekL0Y14DhlIrMjotRoInPShGzmIChUXBKw630iUh8Z80ESnFuexsBe4pUaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037549; c=relaxed/simple;
	bh=92neIFKGScRdX0M24usDNCsl0ZJtczDZfCVErT5yl+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UUdAWavhwWMZX+g7deSw5TJGoEKh/a7+DcNhnwEuoxDOKf2eokFk3VHCLq2Aldgbk8SKDYzjOlNHHCwfqV7kS9mvcffTesqxduB9H+n0G8J5w6t50rfIxyzTjPwbPTL4J32xRXLEhSDrFXPee6PtSbezHjcvePXsbXnJcW5Ufb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2ZNMQEt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2ZNMQEt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234d366e5f2so49950525ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037547; x=1750642347; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=b2ZNMQEtn604E58wJvv6VMkns5BO082JBkciz1bIAA83X9LMsTNUARBcmiNp9KnvS5
         VJtSxqicRo2hYgqams+9DM4tRVwIMXCt/aSJ1PoIHW/gIgxalcq3PbfiFiJxeBxPPQvb
         Tbg5g4ELb7Pg/gKiqMObCnyNl2ch8EUqd4vinFAog87WLdcd0UjAPRj1+5LVes9PEqX9
         xlNHSp2Ner0A6XG5zaGBpJvT2qeoNbyWWylRfbNLHHraMeLExe1Vr0CFr21l5p/ezeG2
         mJhWHT3yVeoaJVuudTftmb7+Y0m8CW30GjU+mQbwk//7L3rq40vYcW/3F/+sqzx8ereQ
         22wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037547; x=1750642347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=O/6kM2cJtTb638BmcmvDaGe9TWm+YpM6wfvuC8x3AlXwT91HFvjMepnRNrkZ4liejd
         D82klq0EFVyDgvBAPDlKf4lq98tTQw7FzeEwhmXqdc1wa0yQVhFvvQFAEDrH5M9B6B+y
         JgXp+KrjumzC8RFumUKa8rBVI+WB7pJfdtvVoGdaP4fuzmekPIa6F2pDufgm+cDFZXC0
         aFP1NV9PaSD8HtmrtgdvqN4VUy1NfKU3g2C8Te6++G21zIi9rka0+mj2OmsdY+vV/Hv0
         yyD7oTmPK5zj2Z+8AeGAIMsiraf1kH1ckYIr94v3Ohmc/2hydpE4f2kInL8rAQrPTP7G
         eSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWacTZDAF6k0D2NSCK+8TQ1mU9ik+nrXyYzHo16gWzN+kS8SOV/1l7SPwFX9ynRmRqNqIwCSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjh6drfffdlCuyST64Yp/73ohgnLM3FH7vL+//73AMjIIAGyQl
	2TrpNJvN8k1Hq9zkplYMmrGggGuqCckaEZxRl5fX5rm9rXG/aNjpXgco
X-Gm-Gg: ASbGnctUFf3hS8hTfORtAbN7Z3jtV97dn5LllHWwLsqzgE7h3DvYAb8UrqpnNc6tKon
	YPXkjHq4r/tV9r684PDs/y+pXcakfrTjTT135WVl3fseXLcnrxe6f/RIwAmWYsJxm+TbqdVTiNc
	2KmPdbD+snFtZQKTWb3HRbbCaBgs89w8E2+cdfaOyJPZ+KFg75N2BBTk2EurE2dAD+i5jJLJZA7
	6Cmg08dqSQltpA1mSn50VNqiGv4SF9gijuu6qo7XzWaHKAGmDCe7vXeeOeRFOQHR4oCiOoxcuoK
	m2P2tq4FSI6PlHUiZ5AddjB6iUlX627nUJCMB625o0sTWfaJOYM4RrjBTTmojPZjglOiWb/qji9
	D5UI=
X-Google-Smtp-Source: AGHT+IG8CAmo6a0aZ0BwqY/s6U9ApO+quHd1pSXgFQijbkEbpTCB7lMLOO4u7q5HwbAUJS9Fu8A2OA==
X-Received: by 2002:a17:903:74f:b0:234:b422:7120 with SMTP id d9443c01a7336-2366b3137c0mr80246105ad.9.1750037547086;
        Sun, 15 Jun 2025 18:32:27 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:26 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:53 +0800
Subject: [PATCH RESEND v7 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-4-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=92neIFKGScRdX0M24usDNCsl0ZJtczDZfCVErT5yl+Y=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXkcb2egfyxEIUDDhCkP08355OURKO+riCz
 mGVquyf1LSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JIbvD/0fEGJvjk8QbPrwi7DbwIJob5LLJWbkt6axymTyd0d2U6aBs7QJbhrRLqdB+TSXLy0mUmR
 /cLxARZvk+HMZEWe9ErZdd1miHtKVwRyoewo+QvQhVkU8slwKf4t+jUxSZdpGTewCApvNIQFZgR
 qOZjvS2314iZJnJ7tL2RwgiK89XvVSRSaI5o75mVDaUEXn0CEdOlXPyXFFTWjhXCTmPfZyiZw/U
 VKUjD8bNgGYowCN85EK3HdGQ6jWj32rBbks99Wi4xyMFebfOKyFN5AyS0YgJ33Urg+TdbJc/LSP
 CWFwJZSlYzru9tipcBlOndo52Mc6K7Uo4S7EzmRKo9ta9+z0rTDBLedyvWGIjFTtHr3uo3sYcAm
 AJ5JAMMLijtOUBHiQ2kq/HrSkK6BkIlqZn1UVX9YzjWC/bMhTbsTmp/eFqnfzzlKLwC/3CtZ+z3
 v6tDX63k+wdbpDHBVlc6Oxp1/6dnbnuCACx4DJ1ol/DWkmqR/Pca51C4eWt34bJ8EoVmYqyPzkt
 Rf+L9d3vXFdTwa+eG6Wo9LVL4s30s2HmOQoDHSlK0y8W/RW5xJWCZys2+cgKGzOgaI/KxFxhIj1
 Iz5APgsI2KRHDO9Qs2EiNFLQ9nZKEV1091KTxrEoGnU4PpFXalhxq8E6ps1LM2BNtUY4XZQ0iiO
 kunnM3Dis2MDhkw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index c19a433ee6478876e4cf6667d7a85a193b6cb069..35a34eca403384c4908c2bba2f8186ea854d63bf 100644
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
 
@@ -507,7 +508,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -602,13 +603,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
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
@@ -617,6 +618,11 @@ static void m1_pmu_reset(void *info)
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
@@ -640,7 +646,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -650,7 +656,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -658,7 +663,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -670,7 +675,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -678,7 +684,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -686,7 +693,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -694,7 +702,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.49.0

