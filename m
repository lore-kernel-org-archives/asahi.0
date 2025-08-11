Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5F21A457
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920537; cv=none; b=T+SFTyLzIvD3B0nln+QplOyu45B/GKVFszXQpCRlZEXZWwm0Brs77osMd6t+rXS/y3zR43PIGbWM6F+oQm9DygmYWg1mYnC/AuxK4d1Awt1Oqlls6uPgUD6HeuNJDdB04a/8mbrl2kAQADfiHqoPfMDl24Gv0OAuKl3AT7JT47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920537; c=relaxed/simple;
	bh=L2YMsQakHXAovXEtkfkDoO7BcCisDs2noWQ8gSGB4P4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rM+IpWTRTd3objqFJJMkYUH6PSl0lPwbmXrSWvBFOzAVvBf7fCaw4iQvqkrXAi2y4eqfN+6algHoBeaIL5dVGvLl6uMF4KuhlMI6T+/1PoADFgDS2y0+21lKA/si/aJj53H4f0R2B18AbmM/ULVHSYf8LBw/uhNIkbBQXtKXPBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9w+HUKR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9w+HUKR"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31f255eb191so4495514a91.0
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920535; x=1755525335; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bii5U19mzG3NLCbpWEGJVE2xyiZpHRsFsKgumtymqHE=;
        b=e9w+HUKREfLX+rsXXaJw1VvWHkS4e1FQ3deAM9Ou1NBe+Wsj5B48Qlsu8yfr7WSvF+
         Tvh2+PLf3M0GYTYw9weynonO8pDFjqx8QyZ1tD4BuAe0uGIzkN1DqR+FQNLYJXOfXlmI
         BbJaahpQepwdpkcjMtKlRJOj4OgDeipJD0zOHtqd7A21XM+BPFTyioWenWONmkVCj0ae
         dwKOPeocHi4fPgvnX3kvK93mIJxCcDud4tvltqNSj9XIEjr4G1QFP7HZrAS1ashoEjeN
         DiZ04q+188atHBX+8dWeRDZqMe4lqAHZtBFTGg6DnX7iIYZU9ChS4r6Jth6Tafsg4zmQ
         nGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920535; x=1755525335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bii5U19mzG3NLCbpWEGJVE2xyiZpHRsFsKgumtymqHE=;
        b=tdQa5b7vRCzwkIOFAA6nUckFN7kLFZjT7+tF7sfhppGSNR42oWDoMM1QJcE0WgCHeq
         FyiBcYe9U7BlX181TK97IEBz/aRHKuSaDitBmcrIfU/OzA3whFR/HuBrOH+C7KzfSHvY
         fSc0GzG6Idv3Qpvf8UM2FbYlEmL5MiRzwgAqqblhbGWn3/v0Lw/QWi/lRvFVmljGlVQe
         um58XaQWD58Zr1A6t0yp4V34iSX9wGoFvLJrgui3cdh9hXxt0iZAU0tC+XauJVTW4zJc
         QCKeiW6ItmEJA85J65AKfsooiReivs4R/BpKz7KhIOf2x1hxZVZnEFrcH/0sty72F7o5
         cOsA==
X-Forwarded-Encrypted: i=1; AJvYcCUM0INtxm6MiX4sBEJM+91M3vPOATHPzX17h3Ske2luAqdfz0vUDaS3WcO9pLqjfsjoYcU6Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0RYpoA0P675dFXLDP6aoMZ0HGqyytIah6MKzxZBRrORTH6ePq
	yJ5Yj/oNY3b1hHTR675gMejv2GK5Vh28Kotz9QOpHTkins+R3DuXCld2
X-Gm-Gg: ASbGncu9tVnk1fzGN+vdhusyIzm2g1nLJWpRWYKTCrl+GuRMq+rRjcQ/lkvsIvmSjTz
	Wf24r96AjmcWn0Wvxvpa+WP4KWLBNNqHkQLuP/L+1CloDqFUSz/1pTac9OnMyzLEjr5mKSjmfez
	e8O9nGko/dHq4GAfLvcBezStozNNi1u3YOCWY8BHIqZGu/iPW7u1BPOWkaCa/AZdEh8hqFlsVvA
	JfHBL0bj3cKb8VglNpU1WR4Ujr2Ip8zEa0t5zPbxVQf8H3EEhVi/jHFKTIqJbUObxjvwsHOyMYi
	lfN0k/odxH8xRxt+L7woCMOMDoiVYF7A981rXXMs3NyW/SL0JRqym6wXzoJuvl1/mG6Cws+FMg9
	DiPGjVUc6Om56TjyPjQbO4gvmg1Q6jj34EaOmW47b0Zli62U=
X-Google-Smtp-Source: AGHT+IHc9I6hIyljcY7HJbTACaSv3ftbDSpYv2swxF233857uapz1SqkCZUNyhI2JqbdRS8fhwZLuQ==
X-Received: by 2002:a17:90b:558e:b0:311:ed2:b758 with SMTP id 98e67ed59e1d1-321839d9dfbmr18574178a91.3.1754920535058;
        Mon, 11 Aug 2025 06:55:35 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:35 +0800
Subject: [PATCH v8 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-3-c560ebd9ca46@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=L2YMsQakHXAovXEtkfkDoO7BcCisDs2noWQ8gSGB4P4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZBqHdal0BAjjTgQbH52DWluytNz3S2xTEzC
 s+6fQn6qcWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JCgbD/kB5IrVKa5WSvD4j+qzCZ7IawmO0u+5y8zwKQrp3Qyl20OdNTRrtAbErhIf8BBRuDBafU5
 abcoH+dUwb5fmQDxo13ZdulVpVqNPxXKXYGhuvaeWyDieZgtp3SHYV/3mEcSHSZZSYwftYJ9Dxo
 vTtlKLK2JDHXr7R15AKZKeuB4I6c34p1Lpz+1mS5iXpFNFDha1R2/kuMjpLS6BeoTggUEfmJ8cs
 AHJviwFNEproj3Gff+DIx/AgroktT5t39QtvFBH9F/viiQbob26YBLvpX6UIvtl2ehZSHSG6r4Z
 BduXTZkZUldXe/lgJGVm21+46O1ma9s0kjJMwfODiFF9cQn0oNWIRk7f1nLGs1zNKkiObNH+2Bx
 OUD0etGDV7JNe/I+m6yUB7EM5Tj+EftkLtS5JIGpjDeYMnmV4LlgJJbe4jl+DGqsb1el9RrkC9r
 t+0Gfj7KJAGLqZmm9fxcf2O9bE1FJakg4C0GbWSh+hvI5OKHYhjUrGOp4qMkXABdXDtAr2pDKWx
 evpuRFx0ooXSvcvY9iocDHa7RFg/sd1nzCJsh562luG3BTWGl4CQwQwz+PJ0FlvZOlnahz1g7Jt
 7Q4WC5e0/IH8Se+4i/wqx5X6ozCiJ/2ElxFraD3muszE90l7Lc808eMPD5E9WJ0c/SinlQty6PI
 l1LUXwR9E9qJPEQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Use per-implementation event tables to allow supporting implementations
with a different list of events and event affinities.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index f3948528e28e0189efd0f17fde0d808930d936af..b4ab6a3e5df965b7ef450d7e533995f3cc8633fd 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -43,9 +43,6 @@
  * moment, we don't really need to distinguish between the two because we
  * know next to nothing about the events themselves, and we already have
  * per cpu-type PMU abstractions.
- *
- * If we eventually find out that the events are different across
- * implementations, we'll have to introduce per cpu-type tables.
  */
 enum m1_pmu_events {
 	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
@@ -493,11 +490,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 	isb();
 }
 
-static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
-				struct perf_event *event)
+static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
+				struct perf_event *event,
+				const u16 event_affinities[])
 {
 	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = m1_pmu_event_affinity[evtype];
+	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -516,6 +514,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -543,7 +547,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -551,18 +556,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
 
 static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
@@ -623,25 +639,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -660,25 +667,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.50.1

