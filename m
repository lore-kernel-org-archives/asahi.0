Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991AC25A343
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380988; cv=none; b=LP2r2xXBE7OmICvvcvJ5AcMLvTvU1fpK3vrCM4DDtanygTbBi2ZfB/T75aH0KTvML/s2tJl0RBOp4EQjyz1sWrNkHi/vwKghoaQE0VXxfDBY9F7po35I9sg4WuFsYuGIjYl9AbYDwZWoU2stme0qw/kcws6aGRk1FNnGuiXOOBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380988; c=relaxed/simple;
	bh=b4/Mn/CXmCbLpAt2Gw4jqi0tjGVxwUxbkqr0KY2PlmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4eQ7EQDXWvpM+BneDxZ/i1PT51uYF9+oK6f8vHsViYT3QdaXtwt6Q5et/w7FrTlXads5UTpGG/l3gyoyyT/sy9OMOXnMkMTSUwSvLrRDV7EEjjpK7oinArs2E/yPr251Szfjyf0UmV5WpiMIpz4Yn4FBN/Bj8gJCxJzsky5Img=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6C9KrNw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6C9KrNw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220c8f38febso12610735ad.2
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380986; x=1739985786; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFekoXDldKygq/dqiamLEfKAIhum7ZAFgMUrKlaqmBY=;
        b=C6C9KrNwpvs8cgoJZlOCOE9FilkPbIlCP/jJaFenNyJR/fLHwHwdxvk5aWfZWD2B+G
         vP6jLWqeF0NGS5S7ETeqykRj6iALnHY7W+oU+klnMoEYU+Ek4p/n8d0YxgDEuQqX3xj4
         2qemUpCcZUCWAThN5RRNRuZC2YAvqTOPNntkitDFe8HIMwxefhbL4+5JdK3DF021LM1C
         xkc0nU/3aX+UfQjNXZS3hP0T613SwobgwljDsLIbZo7lSz8n2vrBLMn/XZlfGzj/hKZV
         LS2OkT04y4HkMO5/NG0MQC1i7vOuxgulW2x6RcJZtvIG57rvyJWLxMq4fMb+dXtp+6pQ
         2sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380986; x=1739985786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFekoXDldKygq/dqiamLEfKAIhum7ZAFgMUrKlaqmBY=;
        b=NmkMVwtNmHQGwZeTU6cK4m98Z9LB46SxZNWEbEnzxcILobpofFWBwAfczOdUjSVmy8
         HPGktc7BRVPBKUcr/RsgGqTtjdDD+1FNLt1ztX2FokFrRxGPeEzQDZFfI3ATWyP2M5gl
         gtf6sxXOc2h6edoq+eWsxeHrmGistUEyp5WrkWNrNEw//jRx5OgOi219aqUCHCh/NTrt
         PAEAAu0q53jEDe+wgXDv/TE9fmYc981YAWDgezRCWTYCa5JADWxMo3CNgkQobfmOJRzl
         WlFo3kTodfDpzy2J8faREfULbTMOBsBpfgYpCbESg1FtoiONbw4Yxm8ma6zCUxmLzhOS
         KPLg==
X-Forwarded-Encrypted: i=1; AJvYcCUr4gtQtxBk1zdRvGwJ8/f83lfVNOBNITyaH3Lu+6WaUY9W/LW08zheeA2Li5VzwAEn3Wpi2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfM11fbQzfFRVH/G+XPna1yd9AuJzRSvarlrcGX+46RSEJYBCB
	1qoiPkft9OlbNAiHpyjJ0jiAOiFuP4XKrGTJYXbF5ybfjvp0p2cq
X-Gm-Gg: ASbGnctYE4Fjs6Ysujhvk+iJe3yHMGqZe7YApcGIcMp7sX3AsREAAnJAZ4Fs/340AJk
	rpfwEMviGwfXadYue+T6owhsgJA7gtNkMaLldBGlYJAfQhIq2XTyQ57bag42xTGep/09x88xt2a
	Vlsr7fCAsA3t8ZG6IYMf96sYS0vT36KW2t2MxIXdEN/Af1WDCQELwrEzKImR2yzsFZY20zaJNNa
	jOeqGTpg0UNyfbIoQOFFypW9Es34M6+AjjBBVQhsBEwf90jhPcs/ssWguKWmEMX+IzVpIJRDTiO
	z3pvWTbEccLWfM4Ntw==
X-Google-Smtp-Source: AGHT+IG//YxahrclczP1AC225IHf0ohzcxjk/aV5E60f9V/aou3rm6VdA9YREiMvUx6GHuijzcCWYw==
X-Received: by 2002:a17:902:ef09:b0:215:a028:4ed with SMTP id d9443c01a7336-220bdf13ba4mr57434755ad.20.1739380985984;
        Wed, 12 Feb 2025 09:23:05 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:05 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:25 +0800
Subject: [PATCH v2 02/10] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-2-87b361932e88@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5800; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=b4/Mn/CXmCbLpAt2Gw4jqi0tjGVxwUxbkqr0KY2PlmQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvWd/NLST/mP1GA++mV92tW72Is0gaB7qJr
 d/nO+CCiDCJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JJ2jEACm/BvK77HH4KRIcztqe62ud7DEi/OMMgxLuSx7z3aXqwI/uI4PVAP1v09czqzFV1OZTB6
 KoXt+0/0xcixC74zlT1EHec6sU4DHBNR0XdPjWG0z+5Dh6xNqLOIRtxmBZKnci8D4bLXtFqXCNR
 XPaRWOg2QRvsRUcnLRa081j97g8JRCMoZo/GKu85NMY6428nGoPPJbe7Dfteal7kR6onOfk6+Zq
 wV1OpUjazSbwrbXup5u6sA0EUmXxH3rMqbTeWidncypgYC8jfR1mCmlrOWRV6jdZ/6GKRicKgp8
 kVjX4nscihV+ST1aHgOP1Avr74aa+h/C17gb3M0JyLrDSxfbfFEqW+hneGeOFrbcoGYCWrg91Du
 bfCjlCI8n61YKsKSeEWG4LPHjyJdk3lHiKG1ZWUQOUEAN6E25w2rDaR0v/vLZSDqr1EOgm64LJo
 MYuqCX6530jxXaqI6scy+3LZiSb/Et2mDWZlIpkFzKYaBd5GDX3GU6ztvhy26YTfJnmoazQBLc2
 m/aI9SVHfhU7/kO2/We7qiwXc4ctRecovKwWVFmeN1BK6+/+co5VUV5z2w6YpNx/o0GwSJJPFzd
 vEzuBt0GF6Fjuggh9TkxvB9ABsAKSRxzlB9wRdWhHjyVmJWGoU0xKGpziYHXJUTIwMhcI6kGZQ7
 oa0U90GkkDOfAGA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Use per-implementation event tables to allow supporting implementations
with a different list of events and event affinities.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 06fd317529fcbab0f1485228efe8470be565407c..9b26d5f35d91b715e9ccb7524a3ca7b87a4d5265 100644
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
+static int apple_pmu_init_common(struct arm_pmu *cpu_pmu)
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
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_firestorm_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m1_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_avalanche_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_blizzard_pmu";
-	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_63BIT);
+	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
+	cpu_pmu->map_event	  = m2_pmu_map_event;
+	return apple_pmu_init_common(cpu_pmu);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.48.1

