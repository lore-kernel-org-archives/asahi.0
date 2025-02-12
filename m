Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74325A353
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380991; cv=none; b=X7NBvhf7u9j20s4gC5X3iETKytdxgxtyg67hEOvkyS1JwAqMUn2Gdv8BNqGT4lMwozzO2rOuNT58LtSZ2JL2p7GXy+JqJcD0Zzw7ZaumyENcrYqA8amxy+UiyroL0pyKPuqzWz85a9tgrlXPcf9Qhc76boANXVs4ZfbztsXQVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380991; c=relaxed/simple;
	bh=L+Tl6yOf4IhDKUIycb3hLlpdWXpiiAGyKeFO2ADZTD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AlsxJj1w5O+us+aqaoV8IwMN9Wm/CoHkroU212WvER9yJcvx2XpdIri8r6Ko0f0nLtKt2nFg/3wWsjSHnMxjx4kMSRzVsR+aRTT+aHCO6JODFBl99nj4s0X/mhRtqQOkqOZ+azd+KVgPUkIZEjzxbf6jeiEBT6s/5j4rDdEuwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNR4AoTK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNR4AoTK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f7f03d7c0so83781065ad.3
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380989; x=1739985789; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22Z1P7ZTqlUD6cQOv/Yl+YD77nH6S4zD9+2pfCgYfuk=;
        b=ZNR4AoTKaNhcUcyNmNgQTeOQh0jlUgNwWWoHNLzsOO1H6BcjEAuREd/iAB9MYKF2Oe
         b3NQNuJ6QqlHubA9Dv6Rp4HJL9LU9vR6dsgAf5/5q1yNGkA/tnvqik0Np8vK90Trekzc
         N4/rfBkM59dzLSdw04Ta1WJkRprkXQHAC8TDPjSDyBK0Nr7vy9hvW6Qq2IHTccJ5uUfR
         5AR/uxAsF5G4ZHYV10Lcj3EXFMfAaW4HfbvqLNwmZRZNsYdr37G/ARKxBP9liP1H8KMx
         w9JtSq8pHfyOIKlaKWnmvhvynM5VIREbmsh7R57t/WQl3IBgpH7RdtO1EHO877pRpIb+
         PRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380989; x=1739985789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22Z1P7ZTqlUD6cQOv/Yl+YD77nH6S4zD9+2pfCgYfuk=;
        b=F+SFnoC1xQ9lLRq+yB0rzpACPwjyAOlo749ElsokKDnzrW4bapZ3XH7OPRiSyAKYBa
         c6ByLFIu7Nc85ACtsUAd2KjNddIVAQ5nU8hOzpCDthxV22eofm3ZWY5EYXf9oTS+qTPk
         8HZvuDVYgog8X5w2P18A614WdQ3TRaQRNpac7+P50H8sr64sMYUEFDdMlSiGUpicnuVW
         sgb4h9SOVVJgKkICBa+Li/m5Pqiid9IjcIDFKnmt3Yj4Eec9PVfyUFT8IELMsKt4Js3q
         cA4GtkXoRnaiu+79zMSgES1yl7sqhyJWmkd7kq0T4WLs7JsZKy7p2yrNNaNUJ8QT+hO7
         QIHA==
X-Forwarded-Encrypted: i=1; AJvYcCUpkIBrashMoxoq84OSrtYdUY6aV4LlLbUCrzarYqGsz+q3Bzu49EKIdEe9L+rZtTFE9NVzoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoUrXseHG1mN5u4rPHTzvwT12Ez/WMbGsxpCvCDWpqMYjXPOV/
	8geOrwQfaIUmY6IG3qWCIGAdBvV/1EFyAZFa6gsmHN89lV8ptS+f
X-Gm-Gg: ASbGncvvbT3CBrgkZgPIUK15pPubzFoqzDoaYs9qj0t1E/FPS5MxrA7UlOr679hPKaM
	A8KyWj/hNdV5HMw3LwWm58u7Tv/yiTT898gM4E4u3ENYmA5KLabz1AxFn8n3dL2xmMPbOUPc5c5
	KFLAx8f9CveQ2+6kz9Mh0bJzYHoq84eyBCr3SprsluvnJSfpK1qom44CFNj3+oz8r1YH2t0Nzax
	808o7JZR+OTCUcct6mYnUc4MgpQ4cxelLfmJ6zaziG2MXEgbdTXc3IsEv+f5eKU3ti33RBcpYpQ
	Tb3VLuLUYLyTEeb0kQ==
X-Google-Smtp-Source: AGHT+IGobLhMetJMQ0kqhmZbc2dvKpQgQcpToUx45wdgkBO1Lyl74VfMgW1vCxAWuj4T/AwvpbtnWA==
X-Received: by 2002:a05:6a00:3d46:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-7322c39d1dbmr6513556b3a.11.1739380989023;
        Wed, 12 Feb 2025 09:23:09 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:08 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:26 +0800
Subject: [PATCH v2 03/10] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-3-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4846; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=L+Tl6yOf4IhDKUIycb3hLlpdWXpiiAGyKeFO2ADZTD8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvQb2YIK3BJQeW3xopIS5Ew3zALFGpnvRYn
 IQkSGbyED6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JIjOD/9OCiE4HbMvImN9OaimhBddGmIgt3gG6W5YIr7qX3llWPpFg56YqftGDOhyj4ZtJmoLURj
 b7NVQztkcZkt/J1ev4P8PKOuIHvcxHCt3R9c0vzXSpwMlWU39lesxyT+DsoLmpz/qYPcaDNebsL
 qJK9yRjwfu1LTJZEJ9W5cfA9KoUusuqsJe8nduPipcGHiZpnFH/y1DkWqU79Mahy/nwvrmCBnbR
 tTWcC7/PyLCOF6UVmj5jE2yZIQS7uuExmkDKmaommXqiwydlysU1nBlCZAVAYJtQN9mrB87zkaJ
 shcKo7ym3R4Pr1ZFXXVx31H7q1w3RT7LFoUy082kH92JU40IG3wmu3ItTJfgLEKSC96L0jK/mBX
 35wdR72XMSn4uwB3sWMT1k/FIgJVubl6fbKSalgEUaLjGUtg5rFLweyoIdUnO5hacljubqBEo83
 NPD22hBOMzgWcUasj1VLd/G7RcogTFGHAw3oQo0SVdpiB6Zjub/2F2Em1HZ7gz4fCl8z9W5bxMQ
 9yJRT4JY27EMXei7B84Qu9I0wVb0f0OflupWc+ZX6QNOxftNyjWP9dssQvT/ysp5Szkm460pFWR
 1DkJ8GU96igRo3FrxC7/iuqkR6cANP9hmAWBgahmhVAKgNeOue+ASjXpbde2SwvpeS1pCDYKhTr
 mlfhgkc52ZK5/7g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 9b26d5f35d91b715e9ccb7524a3ca7b87a4d5265..14e6fd0c2653912a6bbbcc31e6f4c54ee2d062a1 100644
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
+static void apple_pmu_reset_common(void *info, u32 counters)
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
+	apple_pmu_reset_common(info, M1_PMU_NR_COUNTERS);
+}
+
 static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 				   struct perf_event_attr *attr)
 {
@@ -588,7 +594,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init_common(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -598,10 +604,9 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu)
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
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -621,7 +627,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -629,7 +636,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -637,7 +645,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init_common(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1

