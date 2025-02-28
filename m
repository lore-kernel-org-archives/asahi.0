Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56B1ADC67
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715936; cv=none; b=ZfWKRo2OgMZNZUbnCLEgDc1WqZKV42Ps4a5hb7VJmDeF2Ik8pxf+iK4kZm3FjQ4fISRpAgVp9F6GNcoV56XAE3BzDyCx3WklyuwJEBlVtjxOiCtpyCHTGrhHHU1Rxr2Z61XQU02BWYymWl30gXQKikNOXjswc+hZz2ICUvVFCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715936; c=relaxed/simple;
	bh=MG7H09oJBroEMR2rLRIA2iE+Zt5xTdbc861bsPYOz8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtdjtgQw0ITojhTxRFj/b/TUZ3PkEEUNdOHI4R3zdjxQujOJv3w6g0QMxdA8SEmR5oh1RfoRb+KHqbmqyyEt9tDohVQ7fnLLctFQqPurEYBW2jNgTpDJX5Ugf8ynls6qaHcvtPtMpWHFt9VEnlFc2jK6zitx7Y6eKHn2Cw3X8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBIFVQi5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBIFVQi5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223480ea43aso42235285ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715934; x=1741320734; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=CBIFVQi5DRArpWleAuZpwyBmPnKruAHpeLiMleisp9M41vshEz/8hN9YVKvjbbUAm2
         1OD2pPuL0GYcJsRGJdURbeqona2OixGF+VPPRF31GhdUrN5R6QNtsWtQNPyB0tYfYEqP
         NuOYQ5GQlfqzq9y+Wb4/vdYTgZ6M67tdC8r1Gb7OyqrVvtcZVE45iB1Rzsc2m8cO91n5
         HEJ1JUtuORNvNv8tFz/Miy/KLqK/1QpNovnDJ2Q8+hnOML3YItm45lLIUaZVs9rRumPP
         ubDIKPAobX2FE+SlyTTzMiYvdBlvPJzBbi9mhnfIlrb0CQa9YzLX/UooF4zymS3FqpPr
         cZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715934; x=1741320734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=R63j8bLoQbBpfcdlP01cqorNUA9rT9+RC9mvLzctQqu9KLizwYfFclnvYOShdd1lZZ
         Mwkn3fnth6XGOZQg/00oPpAULkjKt/dA/ZNqmimV8ZstxOWw7kj4/rndtNi5MWHsOfdI
         XORsW91YXCptE50o9phNYejqNJ352tXZPKb9d2kgFAh+nhUIe0pOPlUGIw8yRD9uk02F
         8Rq4chk9cz+sW/iuDZ0AZgiTi/K5f21SxRNMSNYeEMTAeBt/EcVkI48PV9qJyKFKDfIy
         O9RXTqGMYt2/7MJAfxDCxjEGsG3eqxo+3cPt01Gznah5zGC8OdzN7yIvxaReS/N+LNi9
         ajtg==
X-Forwarded-Encrypted: i=1; AJvYcCXEGG6L3oqTEAwHWdlOjmIgAUWNzBM9KuRQ/qXp4TXE0tfqU+E1Fk0ftTBl+aYbKAMMvzngvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaG53odDcvtDNhaM7s86VKycuEMEnIizKWpqlfzbRB8Ntd8qbs
	CcK7Ibn8PFv+ZydLpCHy3xdo+m+vKAC7BafY7I2qKdf7PA4rBkhD
X-Gm-Gg: ASbGnctDlPYsICKSfuvXxU9/M1dfSK3/Bm8H4knzCrOBe3nb3hoLeH3SxfsB3CTfyFH
	ywC2vebZcbbzCWbYEWbG8eQyQ0/gl+jx6bMne/xqOJYlp2WJrNVKlhA/EQgpaNfDXnxupTXwWeJ
	mcrCFjKCVBPSZsT2+ObId4RyrKpnTafIBf+rGvTI4mkv9i+1K6bQWGqSlC1U2zane5COLFr8HQh
	eKDNr7Qz2bwvg/Pe96c4MszBdEsiqEpG9ws3OGtHO4bMgnXequoQJM1bqe2oBiPglHLmOtitslg
	yGZ+DrJkZbGH+anlqx0F+lR6K4E=
X-Google-Smtp-Source: AGHT+IEwr4kr04bIVs7yxEwPvsivOao14b1Ljx0gKtW/fUtZRRHL8X5NReKqX7YpC1WASfZQ3srxiw==
X-Received: by 2002:a05:6a21:7109:b0:1ee:d8c8:4b7f with SMTP id adf61e73a8af0-1f2f4d22894mr3081917637.25.1740715934384;
        Thu, 27 Feb 2025 20:12:14 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:43 +0800
Subject: [PATCH v5 03/11] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-3-9e124cd28ed4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4755; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=MG7H09oJBroEMR2rLRIA2iE+Zt5xTdbc861bsPYOz8o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIOasDWrMTBSApTELuoEHQZSDxKS+Bp3qyw
 +E8oAk6D4CJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JGf8D/9fu+FvT8c12d1HIjAx1p51DiBewXXuhvcmKT27E2Tvzx+XXFnCgVM++gG+uv9XqZBnX+U
 Yk9Hr3faLWv3ih7S4x42iw5SOa3grz96N3tE1mVdyIqa9mWcULt0X9vacp/ChIks4TBPbnTq85J
 XbZ1nRKD/zwDXTtBMjDnLaHYUHrOekDJeqwzNJY2PpAeiuEIPTpZOhl0ci8gjk9ZDlxtBjqpTYs
 GlhjRQIrhCMwlq1KPvPaaSLDkfAdO5kR4BB9+ccHienMvxIMv1bukPc075Gn79xK6iwrb0067mP
 6s6ALGGRlOb4sUErDu86xF8wyYzZugDv76G1gpyJ2nwKehQlxCn1SXEoVTghqveLb9/p5x3Btf2
 x6IqKyPlfA8H6NDPiscONQrXch0hJjT18YEPFBgZJVacqV56+s3sHj6IQnWzNJkgYHLY0c1lcQG
 q7rLBYSbp7AmwSkzQimlJgO/LyJShIw+aunLa83nNcNZUagWZaAXTdvv0FTMK46Hpn4d9C49HNe
 UaGabHlNGbIKddEyK8A+mjOcmG64hfIMX/c9EVVzSAnHdUxwItXciNABSYeJj+Fn5nMX3mPS2i/
 4RhWX0rcfxGanOuy4BGibH34eR8rer96v8XbYNfpHfqhTLKRrBDzp2UsWJ6Mlvg9fwW2eilQ/Aq
 JVNuIxu7gy7pGXA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index dfd5d72ce9f3c5bebd990b5df6a6823fb7785cce..bf397fd81230007dcf52888f148e3158dc02e29d 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -19,6 +19,7 @@
 #include <asm/perf_event.h>
 
 #define M1_PMU_NR_COUNTERS		10
+#define APPLE_PMU_MAX_NR_COUNTERS	10
 
 #define M1_PMU_CFG_EVENT		GENMASK(7, 0)
 
@@ -431,7 +432,7 @@ static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
 
 	regs = get_irq_regs();
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, APPLE_PMU_MAX_NR_COUNTERS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct perf_sample_data data;
 
@@ -479,7 +480,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -554,13 +555,13 @@ static int m2_pmu_map_event(struct perf_event *event)
 	return apple_pmu_map_event_63(event, &m1_pmu_perf_map);
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
@@ -569,6 +570,11 @@ static void m1_pmu_reset(void *info)
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
@@ -588,7 +594,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -598,10 +604,9 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -613,7 +618,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -621,7 +627,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -629,7 +636,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -637,7 +645,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1

