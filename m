Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B34283C93
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258169; cv=none; b=hNjMg6n2wo5zdxeUT3giLAQ3JWd5UKIJ1vG8FLAVPF+IRMDiMSB72w6A5MZlrZCRLGcZEqU98xJ1zwr/JO4im9P/O0LoySgvrD48E8jjAbQHSRHZm5cQrX3Hc8RvIV+BYXX8/LwvyqL3z3PcNG1jIsh8YV2GKZRZe0bdQHDGzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258169; c=relaxed/simple;
	bh=GEbwxw7PfrqcXKYl5oW/iB71cJY49weGjklHwoM3hyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKYy8FIpsAP9tOe2yy5Gx+KkbU04MI/QoXmdCvF76kNCxNxz4d/77/y/DXW1XV+QdMXrJQWT3nPWfITeFpF41ybW2L1uFrIqPNSks4roR5anLjCrIRlQRzWUuxEbSVc6GzATmji+6idm463FkoYoDsMh30zqm5z/B7xzXQH4O18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANmldGMj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANmldGMj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso11690619b3a.3
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258166; x=1767862966; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=ANmldGMjo6PtdhqoqVj1b79Mw5Xvvbup62lvALrBjGbXioZWQYV2S82l1hUuS5bOdX
         s/0rHEO31POzDFmg9qCuqKHUSg55K9COwYb+M67wFp9iYhKDx4zH0pe9SFrUxzfqfpkt
         nAtLXgv0fIIJ9KWhz425yxCSuzgRggh/a0pEzQnbK7s0w3V6IXCL16J8cJUXjMHPe2b5
         d0EFYOM0gYQij2r3wePWZ3h+KRrNuTKPahC3RHhza6+zCLa7Avpdl5zhaExK7Sf4+ZJT
         R3gDveenDCy4be7HGVe5L7SNtgh8BS4PgOPMR6H+GXLfqHObRHO02ZlRWLmXczLgaUrM
         hdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258166; x=1767862966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=Z1POTyGvXrMKKkuHfI5K3rKMSYAgRZUJFgL9qcUIBQj5ynJ4sgS68RGbSZnhp7GrcC
         it/37OH8krTRGfXvOGZt6sVsSGYtB4uQTX9VUwh49it0a+c6BArFAiNFaActrYspDSQS
         gytVsPgA4nsqMWLdff2SKajQkewpZ0cuC38eSs7UtIf65cZgck1MmUvHWLDJI9x2+m2H
         u2NES/DzBH7+5LJ9TVGvR4OT0pzrVzxUZa7jd50V9fXOJ9p/qzjnmjgRUKVaRH+0gc3o
         hHgO3bmYHzxMG08O4/87hWqnfnHfeCFDf6rGmNu5LqEFBtRErewKzHXwgQdNfPB60n25
         huIA==
X-Forwarded-Encrypted: i=1; AJvYcCUILe8Lx+VR6fXd12GH2d6sbjYPBV0RdeMP5i+HOrYIB4V2WlNHddE9lsbMnEcPOl/GIY49UQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2eUZsmPwzLoJeAxIcqxCI3G4YzcwbyYcxChp4aqI/v96s9Jzr
	ZKEPOK5/xRuQ6LpoA2y45WGS/jH7SJQZZe/6gdyb3q1jPpeqNmyWIoNn
X-Gm-Gg: AY/fxX6+Dr47Nn/Pn78HxXuORbF3bza4YLsinlR427ZA3rL7B06DAZVMNFOJGQGOAHg
	48V9sPSzU3ozkbFeoYttYesOnuYnL42lo76FPJd4hdRS1MWC29uKCQk2F54fN5qJFaSQppSEcHS
	9LIcINJSEKbYY5XUCbxxZW36okklOIIQtcBHmVCvjMryPdBugZ0ZBd6KdFcEOyIbjAB4bzLCTLQ
	HzAUP5BF6E/QuZXi1uiOIQgSh2wwwNsB3a52T/mEvBj+IFJpxpNXZXwqa6tlRe+DFyo/8hHB8HI
	2b1nMh0RvcZCbTgdqMz/BuBse8dTRA+jdljn2aaQ4EY4yOaoEj5UVBWwtaru3oGmGpwi3hc2nci
	h/v2Nj/NTb7TUweKY5S4IWTside5vDpdOFoDk46EL5pZTbVDvrHQCb130quYQr0jtiDrD22Vk8m
	k8WXc+6J/uDoWS
X-Google-Smtp-Source: AGHT+IFwZ772YgX24ZCsCjr+hNHZNgr0GI3d19+sgft/Ou0eQbAfXufEa//uY0SOVefkVsaor2Gprg==
X-Received: by 2002:a05:6a00:e12:b0:7e8:450c:61b1 with SMTP id d2e1a72fcca58-7ff6607e32emr33228421b3a.33.1767258166521;
        Thu, 01 Jan 2026 01:02:46 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:39 +0800
Subject: [PATCH v10 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-3-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=GEbwxw7PfrqcXKYl5oW/iB71cJY49weGjklHwoM3hyk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmVXJdJ9wiGFSfn+XJXbtAUzBTOK1PCJtPb
 uHglwMaztyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JCkDD/9HjpLV3d9Ea4W5AzKeFkIbEJT3mGFLnT/U0nlvbcqsPI86Mw/OearuqCYgbtNxU1vSZcn
 2NSS7OMmEOPuzBkfHF+NevT82KYdymLbVeYeJ3Oxkucwsmo56qGSum9GqiNixXuABeOZgS4JRGs
 kAN+iWwYY4bOb0IWRlZXubM0DnoCyK4aN0R8U4mKTdONj7ZlPf4mflqQainGasQM5ve9ITww3nB
 CbzRRZGG377Ty4ahbbzeQY8GhUGT0R/KV6s2eaK7BLcXCIaKA1+PCSwpcmfy3u76TWx9lSH6twq
 P2mPaDJmDjP9PEzjwQAU5vlN/Krklhl9+P/b6li2FTTS3EubYgUYd8DK/nTE/oDmnUu5F7ze4XO
 oKOM6HX++UVLX84At0BfUPOUhnkn9HjWjI6XqXtlNQOl1iZg1bamAR6Rgh4zubrk1GVfsIW0JwE
 ceF8e+/C5+K7pVgCY9SRTiM+QBK+dgsXrFfrZvS+G8opt4+Ug9ctadGRAI8zI/a06KH/ikncbVS
 G5QjNq5f5iXPH+ErVq6bOI7HOxOcRApU4R6923Xkyvm1BrJfR3Olw56GOHdR4RPBoM2HZJl5yS3
 8LoQi9a2BuO5xn4GUp41u1RvmAiJJ6ODaP2oDgez3hgDkEAFocFgw/FbAuSpqAS1bxsbfZjPU4u
 jmVBzmlKX/n0dQQ==
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
2.52.0

