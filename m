Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AEC266F07
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543441; cv=none; b=Jhhy857v+IHvmKUp6h1D7qTfnmQxT0GvD25PYFTmlxcsGgyY47ahab49sT+JqjFHYvvJ5bWoiwc07rVK7f+6LEc4kTwC6BCiNU0/OMywMl3nLkg39ao4nFVaridkcnuHKVno80X/JOMXYmTfhPj36UPeHTSyp3aXFbNYYvkqEkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543441; c=relaxed/simple;
	bh=MG7H09oJBroEMR2rLRIA2iE+Zt5xTdbc861bsPYOz8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwXq9db6ThEZ8CSpi5nVa0sWZd4+94iAPL8ooSqEawZJZnyumXKMw3XbXgfr9fkddYHmT9n0AYGvLiupvaBrrchA79RDa4/ZaNDkTJlW0TaD6RQgMk0HmoVBd/uFGpvcUGo7QRgm2d6TM2LW+MAdkmSE+zTf5rQ5JrDmrZZ9jH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCRKYKSB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCRKYKSB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c2a87378so30536985ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543438; x=1740148238; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=OCRKYKSBHJGQRJO12aZmHSTHp1wGBC1k2Dy1UoWgWb2lO25Lv4JrmtLYvymrKUP28S
         x+AEuSUkbTjsf/uqBCCJbChGsxfcrjEK6F4uNCbJXC3vXTZBZ/gqB7gLC51oRnIN63qS
         xQAYC3oAVqrPwG2AAMqmqdxKnLFZFrWbKtqqKOv4SKH+X51TG7VzZvc/VVoNh0HY+QFh
         rJP18/ncIHbqfw0izvJ2I5Ccfe057yDj7r9XHnIq8XUBr1Y3rLvIGrZtWBF0jQIs9fTw
         FhXivuyABSGS4dPqOrAPkse70kQ+1mMuQdi9zHhfhNbX8dMAINF3PicSyBgxY47jWVss
         paTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543438; x=1740148238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfW03x8PctsFN6tD/weQNw1AxZpgTS9cl9FMFO0QxSU=;
        b=hzYYKOq5ShFVI3LVExHRaZQp9xvgY3aoPlKo06LMRjn9+G1vo6PYfz1514FTRdpq/e
         O3i+mdI+S592JmFa9Y3di8tgW8l/niJUW+G4bJeR0wWxNA5F0fNNJExk+Zy5CkqInRt+
         NcR7R2zRtqzDQDbNk2UO2cfOY0B5Noh+2QNoUUNyA9K0kMvxx/plkCWDY6J5enm7AkFZ
         rDhYAJ+4bqSAAVkIF//a1+Argza1/ANqTTJMXQnK+5iAllGE9pnu+J79uaJLy358e2SD
         NcUERDhN/4fkNkdJNuxZu0/VhA+PhKkgi/uaczpll3A1495qupij7qnUlWbkG1eRnZ1H
         DzRg==
X-Forwarded-Encrypted: i=1; AJvYcCXwHMm/TCAnYrwbq30Evgy/FUdAwFCIDXN/gqhI+wk0RjcORN7JubS5alQmFv66LfTaIOdXeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQmd/XotrbGFxk2eJEvGjQqw/vqf5cjqf/hsJp2KCeLWswyGUX
	SMVqG+XCMlKKPJa2VlT5popJVWN7O2Os5A/e57gT0K5nkvkv6AI2bAsjkQ==
X-Gm-Gg: ASbGncsqb7aZfsh+VQedxx7fvUGauRTfWqwf16rv5iScoMErExvjud2Yfm/ba/sqe/3
	yeWCFh5lXvbvboa6ssM0wdtwjpXRvMXyBDq/r36XbHMwCNYEBSVtbG56UWLfjBqqp2MDObzZHLa
	J7Gpax+r7CPbyNky3YEiDjkMCOEIBskicxyY5q9ZDG3YQDJAZ9/JpJjDeR5AF+OLnlrHL6hCOxA
	BpsVfCZM2ysVFBLdXApd9V5FfG45Rsc6C8ocM8G9n1znTGckLOaO8nlqmhD3RhSgEM/ta8hMKfc
	QObT1yfxMchitYru/A==
X-Google-Smtp-Source: AGHT+IGlV/clcQ7bA1VUVCHwnAC7Ksp+1PRaUPCafXfhp5XXwUagzP+nJKFR5X2c/1fpY3M5q5wCaw==
X-Received: by 2002:a17:902:f545:b0:216:393b:23d4 with SMTP id d9443c01a7336-220bbab0e0cmr199459515ad.11.1739543438299;
        Fri, 14 Feb 2025 06:30:38 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:37 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:29 +0800
Subject: [PATCH v4 03/11] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-3-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OA1ESIhZerrZ84FjKBXZFleAZUOZNbSrprv
 Mym56PWKYqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JDHbD/wKOIeNqAV2YNyWr/eU5L29ZU0+QQRvSVZBpqK2cU20vrZ6Z1LZNb+v267CjeeBhzFqwT8
 v0wrtmAQ7S45X0xPZpOg7HZXN1fa3PNT4YTF81fjLuYSj+zeb5qlpZIGgJbCsIX7vztqB4uc7JZ
 8VaKwJRHPLpw/0ZgEtVBafy+Ied345opGHA4rPZU/wyOHBL6T0F6Ym+y5+0Bbwg7nNH2XUonhfv
 b/Np36Ro0VebowdqZniRv5tU/M9igtPkX7gv/ctXesu9h5PM/GGXKuizGKb4iSrVf3/Rl8iSWrY
 B7VL6KQEajdCbjUHVySYmFS5sKEbI9POpZ8DAlxIhRbhDWmCs6xUBWXuAu+lL4fwRZTqS+fA5au
 00PAk9oD0j/xvBSDPwaeoU3crZ4sDkvCPDotGQTVYzvsbABs966qe61WJrQtHFEQ1ufdPH64NDL
 GsGIH592Y0F2/jNsH/UD8hqHLQyz9YkWUxqXCXbW/82fxwQhDlyBx9FJIfcFZVnA/CdVuHRdPWl
 X62NzTBNtyDxRBz4oaP5mRl5GvlJmmljIbyjr/7t8DUejNZU4Pucuy3G1ZpGQhc1GtsjudcgOIA
 8+iGYuXNVm8ZN++ev88u+LwYJp13Z3zqjJMFK8umo2BvMTjzhhfdLkNCij4ic8eOgKnWUqa3jed
 q/I7kG8paRK/Blg==
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

