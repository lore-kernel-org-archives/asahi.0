Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530862222D4
	for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457391; cv=none; b=JiukfrGzU0FNP4ExpFwQdFygVVLluKq99qajT7tMnNZYSNAHXkAfELgrDUEEa/9rfFN36IxwK4jWRb+Jf3Y7PunO5kPS9muBsbt/YDbdG5+OMex/Wer2s5dQ/0sh2BV7MABXEwbcuT6kUkZp+bMGadR5088I+pm+mha7GWK8FHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457391; c=relaxed/simple;
	bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjRyI30tdcC9FbqiGxQGu/sCel60ckaeUhM2UkTOfeuEdke1e6gl5+yci1JPLPWgrG9bUnSG/Dk9BpcWdsAs3RoyITtNGqBBwpPW0J3bIgz4aUm0gmzSUwbxnQ/H1xSmOK4LcopLsTZdfoQPypsWNS/ucfoolgh+pQv+2nr2G8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAtf06ks; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAtf06ks"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so1845588a91.3
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457389; x=1740062189; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=nAtf06ksPOiGUbOEFVrLTknJXnrWEBpqgvH1ONo89sndkVwkDO4iAM1sz1VyEPwj3t
         a8Q2Nv2P6Rr4StvdhycjdQEysg36NTkrb86vrFrVaPT0nbmxhP07lWZHlvR+U9e1uKGE
         sOXXs6bYg8HIvYz+t+bPfN1HvAaYH/Tyk6Hw6S9XNxFfLk8H+7GGzWFTHhd6qgilg3xo
         Zqd255f/MI4TFPZWgSz2cjvGCDbCiK8nMiOsvOmflCBDSUi3cA3qIfSZAV2k+/1NWumq
         Mx+FDvfM0z4+X1SIvxpyH8Qm3D1/Vc0WH/vau9+T0LSVkRF8l1N6HS1uUhSpKcmOC3T0
         SK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457389; x=1740062189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=JU5gRDab0Tvh6axZTn2KlkJPDtSCIql5elMh63oLA3+5AaJZj1mTjNzFhk7/7mfeDK
         AuScy4H0dhAmu4GZU0+cQYE/El1uXLq1/XVBQ1VyX/4ITUJGJKXHXg9wnGtTLcitILD+
         JYRmdh+xJvMXPVoSifGvghY1eW94ZTC1pmk6AVf9RP01KGCD2PfzZm7Z1T2wSPvOd5sE
         472BnQ3KhOapaK7oukSfarDpKCg/Bad9RI8DzfTkl830RryUmYVet0dxh4kB3csBKyHw
         Be6mOz0rRzevL6tPxMMfIvO3IOKKeHbXMCZGieoqGXY7Lr1uUWPyc4+CaXOxpmTit7Wa
         //rg==
X-Forwarded-Encrypted: i=1; AJvYcCUg5M5iPg7ixU1datSB2YXOyVJSB3pigIHndd+o122gD1Uvi6yAtNhg9r4KzNF8COisUB4ziA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7gSvXmFOaNiVtCQrcXQBTAbaIZNcGqVrQQ8GMT2AiwJstGsBy
	7Vm50on9z/eJWt9sAOhVfkdqPwnNFj73eKR3iF3J0KbeozXi7J0l+V5z5A==
X-Gm-Gg: ASbGnctnaQZx2Xkf1bmLcpIekA7YYo1igyUUaUCZymng2EyGmW17um6TUMFP54wRvN9
	49G7dWXmhQxB5c52aNx1OkbbfLD5DzazngdgDaPQWrVgDbBFNeR5sa67ICCRUH1/dlm14IHkclV
	egGYWFuTPzf3kJY0tksezm6nX/rVU7TDAJgONFknhkWq6Sey5Oo7ZM9bl9xBaIyPjV6tpDyefIu
	CdB7ssFZQJT1esuuuD9APjLmZ4h9WFQ2ptM4Cfk2bBeS3ciFkXgCUQxulo2qL2jnV7Wqw4nuyrM
	VIQiIXbyTS8Kj5gR9g==
X-Google-Smtp-Source: AGHT+IGqqiPjx/xvESUvDV6JJP7KHZMh5lbCYmIQOaYARolGu9SAVW0ae8w3Wzy8lFkcnMAfkDpaLQ==
X-Received: by 2002:a17:90b:2dc8:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fbf5bb1d1bmr11556616a91.7.1739457389372;
        Thu, 13 Feb 2025 06:36:29 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:04 +0800
Subject: [PATCH v3 02/10] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-2-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5765; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNiHtHdtlJEqZY86tRJY/Yt+POi1Wor9jrCS
 Ce3MhA2w0mJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JDubD/95vTRUzOF24IYySpgZ7RqMbgtInCO1tudyRQnMCGsmMQWWDDbZQqz97KbYY4joEXqa4Vq
 wxc5qTnq/0qSLtz/yxXf6iYRiQjCCsWODtIYs4lqxzBlqXy9PEIEG9AUQ5Ot/2Qbu9/nmM6XTdG
 UHIZZB3mxKl8vAnPPfUDtrUQ+ioKSUpObr4oot2VlgJG61K8tYgC7JYzIXdbeUBPX9olMsfmrpC
 1FkvsO13EhsUCsR+XpHuu9bjXx35OGyU16+4EgPZKUzTO+lxkNPtU01NkJRQkEpFoPBAi+L32+1
 mvy587EdAR0YCsKz1zsXdtPUL0iD1kJzNuIQII9Uctcxu6Ltqu0rfK13WqMSSJ64Z710HOnwV66
 4XVF7ZTdkkdJGCqTf32d9EOVYydymLmg8XVj4ZV/+eKOztKBf4R2KFzpukiDiCCF0MeCdwvBAG+
 9bce2ya2cg6Jf+Zj1/MUz8EetJpXAYfzhuEszjmA0N0XgLUULzhR9oOdkcvLZxU3oY2UkxH+be4
 oRUDw9tx83cy6FjB2TELZ/bxSGZNwB0CmGvDMGWN3EgJEa+hCMKktV/kYALvJbbU5toN+E9aBR9
 nbDz+p2+YP0GvJrN2UJJB4TAPOCkgGKO0E37TiXaNxUuseYfZdLkdawIvqA9uvr/NzUPl1aDYZ3
 380mztBSV6Dszzw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Use per-implementation event tables to allow supporting implementations
with a different list of events and event affinities.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 06fd317529fcbab0f1485228efe8470be565407c..dfd5d72ce9f3c5bebd990b5df6a6823fb7785cce 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -42,9 +42,6 @@
  * moment, we don't really need to distinguish between the two because we
  * know next to nothing about the events themselves, and we already have
  * per cpu-type PMU abstractions.
- *
- * If we eventually find out that the events are different across
- * implementations, we'll have to introduce per cpu-type tables.
  */
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
@@ -466,11 +463,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 	isb();
 }
 
-static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
-				struct perf_event *event)
+static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event,
+				const u16 event_affinities[M1_PMU_CFG_EVENT])
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = m1_pmu_event_affinity[evtype];
+	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -489,6 +487,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	return -EAGAIN;
 }
 
+static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event)
+{
+	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
+}
+
 static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
 				   struct perf_event *event)
 {
@@ -516,7 +520,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -524,18 +529,29 @@ static int m1_pmu_map_event(struct perf_event *event)
 	 * being 47bit wide to mimick the behaviour of the ARM PMU.
 	 */
 	event->hw.flags |= ARMPMU_EVT_47BIT;
-	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
+	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
 }
 
-static int m2_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_63(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
-	 * Same deal as the above, except that M2 has 64bit counters.
+	 * Same deal as the above, except with 64bit counters.
 	 * Which, as far as we're concerned, actually means 63 bits.
 	 * Yes, this is getting awkward.
 	 */
 	event->hw.flags |= ARMPMU_EVT_63BIT;
-	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
+	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
+}
+
+static int m1_pmu_map_event(struct perf_event *event)
+{
+	return apple_pmu_map_event_47(event, &m1_pmu_perf_map);
+}
+
+static int m2_pmu_map_event(struct perf_event *event)
+{
+	return apple_pmu_map_event_63(event, &m1_pmu_perf_map);
 }
 
 static void m1_pmu_reset(void *info)
@@ -572,25 +588,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->disable	  = m1_pmu_disable_event;
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-
-	if (flags & ARMPMU_EVT_47BIT)
-		cpu_pmu->map_event = m1_pmu_map_event;
-	else if (flags & ARMPMU_EVT_63BIT)
-		cpu_pmu->map_event = m2_pmu_map_event;
-	else
-		return WARN_ON(-EINVAL);
-
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -604,25 +611,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_firestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_avalanche_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_blizzard_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init(cpu_pmu);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1

