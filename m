Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62F266570
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543438; cv=none; b=ktxxLpsdJw9Z8LpV8o3msOK4feeW2pWEnM3/UjmfeIic5k6GZJAP9BgM4mUCdW/SNY6S2iZUHP6e6uDc/UwTZGKMMBHeUD8jiEEhj8UzFTqVcHQqJd6627HYgE3fztTWBGUvlQDBO364bjCn48AVaUXdUXgDTs7w0lkyOPzfFGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543438; c=relaxed/simple;
	bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9b0NLL8F3PzMBbsfizRoP1dPUVDhJgcMT/akKMgwHNK9CgDDrypAtYtwYQacypUZrT1l0RM8BdH40X7eqhy3ufJBhEyws3hZAvc4yQIwoyI5Gr/Ct7KaowvRobefhSlj83lY0RyWitrXeFOqHg4eJjo9ArqbZfDbmwBXuqSwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5EerRDd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5EerRDd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220d132f16dso31957225ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543435; x=1740148235; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=g5EerRDdwp2cPGwAcht+IfXsx9/uZ9ecAhcCzj0akk+wQmDJ3i9kUDuJ4Cx8bQZKmA
         PTGQVRLXYmAQn3Cm8514CEDd4er4bIlEcLTujlv1p3XVvHa0fPJLa2Ffufot2JVSJgPJ
         BmymvKySjgaXuuPcwc8Wd95mzb8Mox7SnsrSpo6/XJQ2CIm7exkal2vS1ntL3CaTDzxY
         6n0v36WttSL88cv0LGPs9gSylUhwZf/zc/uH1iAwSMS4vkTmMv411ArW+WplTDxFhaXU
         EcMiA6rSuN8Qq0VBQM42SwKq1wa99q9b89Zysj8YYi31f78J5FdC9My6U1RHeQOzGgDZ
         4K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543435; x=1740148235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=ZSC1zCFgCx55fGAdc8KcKPmODvQ+pNz/L1wsKSb45lBAG8DiQlVvNp2QzmoH8ylFnl
         POl3MtJuPA1eejHtDPxJNlE/zT49VNHdO/k/+uBet448ZDIDvhaRznB5x55TgQU/S/iG
         Fedi51iJp4fcVAMNFKOj55ZCxIUg2kimNBsqrOf32TCLsTBjJBjQxwndMESLgFRRzla1
         yJh8wzj4VLAs4yQpoaR3uo1xCrZ2srXTbarqxKcMGRRxPL9/2GCGeUFOQwsM9M1yqutJ
         Mb9uvGBSi2ePgpcCXzhkdKmYtTKg16s27ggS37T5aLq98hDGsYBxjL+YGXuMUtzN0xep
         mMwg==
X-Forwarded-Encrypted: i=1; AJvYcCV96UQbMvHXVvTxlOj+fTbjnOCVcL56FCjRv3WXkE/GQeD/gNLciw3XUWygDFMksktOmNBDhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKUViLl/J9JvRybnXtZjp9/zm70JZLoLDGZ/XOwd/56bwBuEK8
	cOIq9F+LhkNdH6F54Gz83xhJdCX9oaBfBtHPB3UdW+5uN3UXOz0a+QftLw==
X-Gm-Gg: ASbGnctjlIWHi+MvAZIm8fzzfYuaM7nu36C1dXoEwIYUIVBbtWyB6CwDWzXoy747O5w
	A4fsNLuYNxgs7Vd0vshXEDR8HI2XNTO+ofQasbUmvswXSgWPakO6QsgxpBvLHGfcz6gbFMr3M8F
	NfyZ1a47Yy54tgZXfrFBv2p/WOGclfSQRLLanz2iE3V/U8pmyFDUIjwvqgZsX732WTbvfQM4I6D
	uinsLBcCV6OdaO8SYEQZca6Dr84G9DFjObISf3i/WDLTeYkRklyb+ro3f1XSM1ZpgenOc0ry4+v
	sfEDx0QrbrrwC02K+g==
X-Google-Smtp-Source: AGHT+IG/bVbomX6ZL8o6cgIyCYELKgNnLgDTIIQLfhKHH2P1Nm6zYVwBqR15+gUOMU5DTLQtOl4QHg==
X-Received: by 2002:a17:903:2f8f:b0:220:e991:480a with SMTP id d9443c01a7336-220e991e31amr71970365ad.15.1739543434789;
        Fri, 14 Feb 2025 06:30:34 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:28 +0800
Subject: [PATCH v4 02/11] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-2-ffca0e45147e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5765; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1N/KjjlLGW1G/Qu5tuyuGcZie4elLqLg+YmX
 2T8QHqcdfaJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TfwAKCRABygi3psUI
 JFKREACwe+jV0g2vw8XAkjbC6c+oIJnGIRBrYdcOt3TfoV+rtn9faFUL5TEIdB444IFB4zWiERR
 DSzCT9Hdu/4mjo251rfhx55Blzze1QKW/3riaQUKfjg9/lY/1M64n4xfVQzLagAH71oiYNO8K1q
 l/V42F8xJIlIxG7n10pGc8ekOw/1zI8yyRrxpkQug4+/0bq5LAVQzTevxJC/EARux7v1yyS0APz
 gcFrnABtcqKiIJ5FR+5+/0N16UGGJTmBKbDnp4y689Vf9I8k6/XpTMh8mMxTEtuW+koR+YwI4vH
 CrYLkuZ23M65EJJ7GZyt0AtHMxFxRCtYTOnkLRKgjGYnRnXUzE83T9HQsom4vdfb3fnyDz0DhbB
 lC1N3Z5GmL0TCAWhnvXtTrUwHAa0v+DBnbOBx4gpordKhpk8CWoTKq4p2zoIyACYGPC8q2j+hhI
 JMOPIogrS4dM+99g8S2I9nxgrwkFoXIpLLdCUR8Q/dYo6ZUyVfKV8xxbO09/88t0zc9FRewoMJH
 cYNhpTbZ8/NgqoVrhyEOZ8NX3ZQZvDG1ie04xcZn8uQvxiaqYVwBifBSJD9FcNxXicfZ1f5AR7w
 UBafRRr751U+c+yMRgQNIqcCa32/+GCzYIt/+7oa1TZTzPpxKNcHeAusCKpSZ8Kx6JKqv0ImO3v
 cbqBxbcEMah8Ljg==
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

