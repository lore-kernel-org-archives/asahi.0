Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8327465C
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898234; cv=none; b=APyF/JDI3PTtsdM9G6rvcWpCfkiCicutZAt8l5XUWk8P1IKhanSXlmZW7oRt40YCj6UzzQiYvMFohK+9rGvOxc/Hxf6UREQHLaaoAmnUHChcBsLeX20johiYQKvQ4Kh2BuXiuL9j/8l0zTtt6Tkf+21mWfaY21krUpOESjYvKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898234; c=relaxed/simple;
	bh=BTD9OzZ4+bVdpzPnyX6mWog1RpRVl3h0ilCKcAXUUSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RY2KTDnjSrrbgd34DtQyqri+amnfyIIozeB3G5lSAuS6ILPA7kqVrORNgcaen/p7EUEK/HyJIFdl25zYLv6v16NyBhLRQBBoTJQbf3J70fh7tflZoW2Wzvfhxuutt562qCJQm6XOZwkSBW43pI0DHXoOTGUvbXxK2bi10y7tvUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ermSEN+I; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ermSEN+I"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af523f4511fso5464433a12.0
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898232; x=1746503032; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=ermSEN+Iz62r17LlCr5DPVmF19nH9qPbktolwmoMZcsXvXTZphv4VRT6VFU6rkRmG/
         ytRQMhwMWQCj78qhx0D/eLiUng7vIVFXwmU1jApKlnD+QfDFhvba8RhaSGgbLHuHUv/q
         PFSSwf4UindXFM3ERMXc7je5uUzI376FqsHJiHKw7oMDsYn4DTxvCwi5Myh5yf99CVQT
         Gg8o+L+85/jlTiPllKreB9H0TP8iv/pKNsdA9jrJGPGorcEnpwKanINpbkv1yF4EMlZc
         kdzSpgDqMoZ6r1ZESlkFhtLxxdtoeI1QwftniPIjgSsXJLeYOwgohx/6trWwi6KLD6aI
         zd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898232; x=1746503032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=ggFxM9hvL/+9+HmZQfkpuK3Gu/6WxIFJz5OqB09bTnU2IXZMH/4Q7oZgpE3XRqRKSE
         f5TtRE7KBGLlcX1hjeRoVcp57v/8MuCuz5MtZNSquu6Dxj8pOZRPp3RKIwqBdvR3f+px
         mi7eoNzARhVDXtZoI2xFHScgtqpC/ajEHKiuDlYbP9CrtJQ9A7Kz7ps2GeO4DMZ101lI
         JSshJlAui0Lq0iMSFuDGXa6LFa6HeWfSqMTE0LoH5xYy7S9+D4UXWMl+FN+5DQL6yyQC
         tht6LhpyQnDd+Ns2R6p91jWoCxAho2vuhxWzkNOWBDjWVC3XHO7/DS27NWF/WXVWoSdE
         EI3A==
X-Forwarded-Encrypted: i=1; AJvYcCVdm3Wt3omLt4K8FXn7Fwb3mZ2AOVw4dxW5XCgZHMiqajS2Brw6FF7D4F/NmrOngjjgfCyHlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLBg/EK6bU3dhCjGJfpHSpkWD6RWwFONDdd4TWvWq1L67v9H+M
	ejLuFtCYct+/l10CeE3TwVjvOa7W959h8jnC0Ayi27EXcVUmNGoB
X-Gm-Gg: ASbGncvnfpmlgb4kvb2pj1aB8BiTTiHcNF31N0nqZBGuiqbT9EKKfWY/kP2oWUcX3aT
	qBBYkzW97GqpPVwoNs/P5dE78pbYoe5nZzGaxlLjLylm9H2QParJibrqVMpbyoRFMasvO8l/6bz
	Mt1BtRKNzRaoam0VjKhf06c8YJjboJSJxSxOrPpOf68VQkpGmxjgaqc/B3oY0Is9lI8gdIpPJha
	XUEKaFZESo7iH9ivCzSjaR7bMAFn2yy1n+xyCMvb6gdsq60RSe3OCFYhgPx6L2+EZYkNBngpItX
	I8VB2M9H1fK5dKDEM0ji9d/hr/AdYzy654l7DS2bfM7r0hZPRFbDqdjSgg==
X-Google-Smtp-Source: AGHT+IHyuoAiU84K1xnInJKCOMn+x9v6JwkShn/xb25YntATfLxZj2N6UMln0Qoki1xE6k+DWcx6wQ==
X-Received: by 2002:a17:90a:c105:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-30a215a1c05mr2568356a91.34.1745898231632;
        Mon, 28 Apr 2025 20:43:51 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:28 +0800
Subject: [PATCH RESEND v6 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-4-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BTD9OzZ4+bVdpzPnyX6mWog1RpRVl3h0ilCKcAXUUSU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjGxMUZXaCzNA+hDn0NL7rxEmDrzluCX9Ao
 OjQpnaIA+eJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JKyfD/9QQMeNunFe+b3VOtj8xNDZd/QUQNnQSmNK3PYh94BR8kVUufLOaLtzMFbLeFAttpRWVRR
 mU9QI7EY9OIlac+LBWOUXqC34qW0Xorq0TtpeC61jGxyrdQWkMLdiWPN23tDWH0DJqm/TNZG+x/
 9wdOCg+zMn27lEMPEzMHs2N6AD3E4wbYgQpW3o6IiBvuJsDdLZMJ2CrXHuLcm2/r+1/h02QJoLj
 GoxTF2Ywb36NWSB4Oplg5gXGSHousJhC9VJvoKc4UQhOpjnLI3UbDfF1aDSyXiAkGtctY+oluVj
 Ei6cvbpSLoxb99ffFGq0OCQYJZLgEBEAFyhWx9QblsEQRoxiF0v+A2L4Jtk+JldMLFoypT6uiUo
 FoaGW8fM4SgAM/i08JjSCgaHCq+0y+fOiwgMNwG9QNxn3a93Wr9QF95WatZzV9PpnInhzCo0t02
 Y0Wh6c+Ijob/QeWfr9xr4DLMzqxzSaNQsJRXbUGU1atSf8Q1vxkaR3wBaELeGNyCzm/I48saA0Z
 XidvWgpD5h/Yz8C6x3TbMlvVg7vxKSStg9CdRwSu3eBSl2ZubCs/WA+jTfSjNq1UzSlgcS5k5Po
 x5qo7EP0VkAy+cwbrCf0q1CJ9UZMLzA/HD1xAgv0hYA8yrhNQJTknJ1eLntmoNrupme7P5Bg5/h
 FqSx4bCjIhKmxkw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index d1bc850809993de044df8fd5d4dfc61341482ee7..c03eb7acbb66790e17967d570c71746f72e40867 100644
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

