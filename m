Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF8B22D7A1
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920542; cv=none; b=JxMiQKcPU9WSUnZ6v+Cv8z3KaUHnRqS6h7Jl1slR3Mv0QtwbA+A4KNmDXrZHJqaIztZVc67OkzZNk8cP5zSwqTr7VVDLYJ9WFHDkn5JDoUqBVi0B9Gmqh4MHWs/3P8nV3mctrp3QjShmGDdlwCZLxb01uOE60mLAQBlRMzpf47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920542; c=relaxed/simple;
	bh=QyfayPXBF0G8wGc13eGHybo/0TGaFMU6vqkkCqnR2wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipmj+mfJzdRfnz9zYI2/pe0W8qEeRCjCeQ95DPyBI/P9nTKySHEnVFgzapgyfgzNnWgOZlZsDuNMuen+4IJY9/SbzsgTCiY9bIP+78Myq9bMF455/8LPftWIOP08L0B0fFIe8cV6NQqGU6MisDxZt8NIoOWAzFzU5Imc5U+wj6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUACqoAY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUACqoAY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32128c5fc44so3455692a91.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920540; x=1755525340; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HfG0x4eKTu65ucAx3SNv7y6476H+fkKTI8A1VI3a9Q=;
        b=bUACqoAYu69VBo0d1l4N+3ZPCT5cw9ZtF89VIP/AfuMn2d50WvfhigmY6eYtv2oURK
         HfLkXKBtNkF95f2VQOgKloKXqxSp+go6GBM0/frhJXQt6Og/wgMGjF+NpVheaSmzc8cL
         51bUde77oNKXq+FoKNTWHqEsu84yGy5tj4XVrgmtzhUPp/6rO6io8BUjlOttDVOOxMl5
         uv6vf8q/cvKPsoG96FBt9prt2+D47TFYSUp4vFAthcs9JmY1ynRxTsxaI7dCWKliu/Bq
         m3Y2iUNTkmzTMsoF/03SmW8torhSY7hI+rLSEJByHmSJo1nQUUg6xa8Q4T4Fnbys6nui
         WKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920540; x=1755525340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HfG0x4eKTu65ucAx3SNv7y6476H+fkKTI8A1VI3a9Q=;
        b=aYSJtzPM7fMZNEcE5CbUDCG0WU53SZZopqLSc6fJv8un4oa6hrovSvRulHEQo+lPrv
         MSMpYfucOteRXEGDkamzT54buroDhuPuh7Si2iigrKKiax0c+6EIHFb/ozVgBtQyqpIL
         AIlpNcT5TyI8Uu3f2v0pharqCqW9mv5Eg0ipMR9yUgzZA2GB1SQuLHfQlTcZk73i8e4N
         IGeGudIrf0W/MCp7oMeXzgCrI8Y4DkODHiSxOehPxdXuJ27Qvn6bxuck48M5BAgHselv
         cGLfVLlYi2eunDDyZcxjpi6T7f+ZO/CGGFgnwG57SAYShcomogAykLWWOQcBX2C/wLv3
         EO7g==
X-Forwarded-Encrypted: i=1; AJvYcCUonmRWFbwx8oscFIB71YtgrlkxjiNmu2TtT5Zr3Scz46X2BgOgeC8DWZkbMLqhEw1xu2UmKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfthijm9EQjazrDC6X+vcMK4lXBh4nv2bhd6ehLVhzhuiA7JHR
	ZyMvUXGwZbD7pEc3eE4caHdG0h4dlfFPeSeGpJbrLuTasjMPs2HvFCbK
X-Gm-Gg: ASbGncu5kr/nSvY2P+O90SJHLt4lIjI0sMOvJ4YgQN4QCkyJETP4VT1mPp6k8oQ9Ep5
	lDytnfBs+EFZE5X/9MM22CVpQJhTYorBLEjLwsnA4nhNZu5ClCYoBTZeiPSPxUiN2zNcSwGfkAq
	SrdxhShFqH/r9+8z5ZYxuAq+yo5V0+gE2sz7UtvFsqiOGz+k2hjvLKTTxZNurrKcaSrzqyUGwLA
	vVisPgb76Iq7yNkgmyziWiuhQE1bymK12h5EOTVPkGpuUV09iZhz7EIE/UnIbcKX/b0fcpnfleB
	Xb7EPPxG/XmAYWCoBUKb43QVitZ78YtZm/3KuLnsTKWrM7ayFtaYADkBG/upzwsc8ovIBFKtPUZ
	lzkVBm3p41PK+YXRb03OK9Mz1B9ZeZxuCxsWoLezpsjhLfIk=
X-Google-Smtp-Source: AGHT+IFnVl8UL17RZBUa0BT0F/Rcmkalku9A4g8RHGTBDR8nQ5SSWKMfWiQxEunTch+bh2Al4PgqhQ==
X-Received: by 2002:a17:90b:2784:b0:315:9624:37db with SMTP id 98e67ed59e1d1-321843734ecmr16913945a91.3.1754920539694;
        Mon, 11 Aug 2025 06:55:39 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:39 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:36 +0800
Subject: [PATCH v8 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-4-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=QyfayPXBF0G8wGc13eGHybo/0TGaFMU6vqkkCqnR2wU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZB/jzaufq4SFk1QWLQjOeskxIK4AYQnfCzk
 syEmMG9sFKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JJqLD/9LU2/IiF1sAyfa6B9PDwRmjRl8FIefRE3GDyob6PaDFikplWtJ3A5g+joTUCuAsjL9xof
 iS90qkQF1Vetl5TOX+qbG9OYuJi38KSoPvdOUTzxomPHTTrUSX70iMLozVc1EvUaqMDZL5ZtS8d
 gFKSNVewf/mvOQt68oix3jouYjll151v0TtvJ5ItPiGAPS1/a5Y9qgHNG/Ek/NlXJHnU+edFO5f
 XV2k2OZA5HIthSzBS617HUe2INnhXknobpRuSMFrVgb0wdsJlgse9kGdS6fQshmuPR1hEn0pXRA
 YuVfVwctdBf9xNPNaaPU7Jf0Gzn9qlaotZOS/UaJmUnyDz7GQOBz6WDdh3jVRZD9JBRCNL51Iz4
 10rkLdkxNKSxLSD6mnOKg3oFiYeTazkko9vVXOcsqRQ1z/5OW0Szf4Lyc7gGQypsQEZfc+RnQyC
 WB4TnQ3ArKQ1MZDwVUDYxe+ZWV9BF7rT1qKaUd+t6rxGh+EqwbqhCKvhhHtvTSMU667VsJhOyK5
 aA7qeI39ABiqwWJjQpOCsJVqyFSdl+IKdfdGRpoObyRSi9VAIHygITf8+lEWy3QXvK7C3wQtVok
 mNZcInVB4Ay2DOsRZ0+TXEIX6FmFDinhIeOYIXH7WRr/JZew+D0yu4zm6XXetwxntuHearUV/gL
 xyCJc3Lm39ti5qg==
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
2.50.1

