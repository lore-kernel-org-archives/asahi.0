Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06B2FFDF0
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454276; cv=none; b=fB46l03sM4WjZSjofWwZlwI35x7Ck1LidgcqsfC8Ta0KmVd+pDeNwI+ceJuPvB6cptKY+/H9iDkEGOQlnSGXGX1vqOrahgE0szVs3XGKpi4FW0Jzm2yRV4Fi8RraWE0q7fufbGOs9Vr68Z9ReLV8Lp4w+5JyKHRiPhc0ErzMwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454276; c=relaxed/simple;
	bh=e978bWoFjBQgsdNlqdWrRQsmNCkoajFMktc9t6zXMkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sd+Qt//LAOlkww1kCvuHUGFKnBYqcegeQ0+S6RWCGqeTDxc0kdHgXU+ueICHcMadgzocEPQ/m+Ka4RfEbcBiqEwlDSGqfM0Fqem0/60Wcnbm1kxpE7wLRMyVDSiW5hY3tuZGbwpsnrKihICJnhvpnlYVpdlZuaMXustXgK9KKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJ4AY95K; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJ4AY95K"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so7018158a91.1
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454274; x=1761059074; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=;
        b=EJ4AY95KxEkbh3B7YK6tr5lfptqP5iYyOsZUDrshN32BTn7HZPz/XrmtEhY03Z09ol
         vgOf7/xulD60zPAogMExJzvqsmevCKjtb7ZOh2SWGBxd61NjJaLwpGiAip09HBtutRV5
         kiC8xB2ZKYOhajb9yDpR8hYGEQ+DxzqQWF8OK7SgO9ztplPNrK8dlauE5JlJLIEl76d4
         lHZHFKhID7lClJA1fLBCb7Dulc2pGHl1aAxaxuhYsXYFyHb3JEBNZulyEcEzTUwJ4YA8
         SRFNrGp2w18lRc43Ps2oIqQ/VdJvIf86kq+CEk+OhtQny6rn/GaedEI+2dUIU6eBjAsH
         ZFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454274; x=1761059074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSUQIaWycRWPeDhTmGOQryGYmMnqnnTORM1hSoq/o6g=;
        b=mAArET0hEr8oyTwGk6zvgRv1QICxn/zw+D/+vhwkYbEAHfnR1lXnLagTmFcRfaxAbr
         1Hg+G3PgxkA+PGbSAa9mGv/FSI57HWgjh4EpWE4fP3NMcBydodrEHwxG2ZpHwG41aYgC
         BWJ/jnRTFuf+p6Dfh5YaNWe7OZ4TxWPI59V9RYBA8VkBQX4ce98jFUPxmCoTvwpb5GQn
         r2/sOwi+FuQm0CcQkQecmIek1lHH6iwB5q1/90xpZrbqi9zcZ/8ZW8hwoSiasslonR/D
         ko8qsRal/PNdl7AcYzMTzaahbIZUp4AHSChCoK2dztr2/iMKzrfjNYy5iknMQB3Z7FN4
         OHKA==
X-Forwarded-Encrypted: i=1; AJvYcCX99PNB9+heufq0rRw19lbr9zv7i8HrSJVbQHIshfDrK6+KtWIs/lxVQCa3nAx/hx9zbQ6EzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzgD0Y/dThEu6M8AZbUvxwf3rkqVZElGfosoCuCAizdipigtvT
	zxG7vCkVNL2wF9kEJQ5beOa1ciwcYlB5xL0SKkFzDkSC4SvWB6IMO2btZwGamg==
X-Gm-Gg: ASbGnctq80YER5JDHrEM0TYWIsAjtL+w1JTz9hfOwcSmxV143MrRRScG8NhfwBxC1qe
	h2QePsTLDX5qhLBdP8p3L4attur86tZqR9IYh2oK5Lp6+STMfTUN1X56zo+a9lzoDGEuJQQJuwx
	ixSHyouU6OG7wISkj9FxejE8gwG7g+3mJUXuhs0CnY3FV/mT/WsFXlEOB3zVutM71C11Suo2BW0
	aOt1FsNmXfQBuwTKzrfs74uMP3IgA2kUpGazP3LPnPKtiKrxeSMR0Qmkt9Lvx3sGu80sDelWcC2
	nN4vdjvZYbrYHpPhdw9h1pFYz8fzFh4LsNEZxwNFeDichk8pU54h83DuE7JD5FgfovURMU6tx5x
	dF6geEzJU9mY/U+WCuwDzb2RL2BSzZinUsiRSm3xcqS+cJKrZ9+dPXw==
X-Google-Smtp-Source: AGHT+IEoF6lCOjN7CENp+OMe8HdUVTMA65Yq9hlYC7eCiNlOgtVtwVNNnLz/+2DFCjSowB7zKkXu2A==
X-Received: by 2002:a17:90b:1b04:b0:32b:cb05:849a with SMTP id 98e67ed59e1d1-33b513861cdmr32152572a91.29.1760454273320;
        Tue, 14 Oct 2025 08:04:33 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:32 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:37 +0800
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
Message-Id: <20251014-apple-cpmu-v8-4-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZsrkM+DTU4+ennTxw+fzNUfJ9SwPdeIDOW9
 KOaOTHEIsiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JOfSD/9lLAvN0+5kZ7WZhC2c29OhNbFQ3jzCr4QfopyMWk9PI9okEb+pDwYako8qTkrWMJTfa3J
 4M+hha4zgsIN5xtINN7QpT19s80g93wxOvjjg7TrvBs5iDeKKDmswgC9X0wvkHQzG5+RuWddbKf
 tl2HsjK0hbHCGyjKByFRSiNZQWBTpBHO/W/azKnC4oIkM/8fyMKLd/9N3wukPUP1UyJGThODncm
 GlnJ+rOoJd3Ab/U8ixWuefAZRHbFR0ob1eqJZ25xwaA9WdExRjOjzq62bX54UEy0BNwS/C5UfdY
 mu4fxj0ZO6X+8lqIpZk8z8mg9oa7iAlVxv3yT+rJqbEaSUX40V/WFI4kAnnrfYOsxhPytg/Efs2
 EKmsfPpiwOZi9u6aZ2btITnM9LIeIPoATmfx/lhkY+3QqGheoCwzAIXBfCamYVBuWjv2eqzXfct
 Tj+xsQhtbD2gwwXwqKbCgvS0UxxYNjS92LGFpjlo+fGZN27Xav1dDqCYXT9YheOi4RsdS6ysAAM
 5VKJg/3Wz1WA3FqddwIjrHtCfDsebbUwjts/VqdSXNpZ14zXHnlOSQsI12zusztPfp6tFt4wMNp
 DnqDyxDgCVl+/qScBN7bwnLC8EhrxFyJLot6uD2xR2cw4hb0kMFeRl1dzRV6DKz7v8okNB/G2Y+
 gD67Rf6jer2UBJQ==
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

