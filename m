Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8D19DF99
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715932; cv=none; b=ScXo6u6mGjqsD3bCcwI1Z0ub94ILQdtnqEbnTGgSbam0se+3c+7hoou4TzhVkXWREFZnr6JFX9PwD/aFVWl/AWt6bHg6GamHQcUfgGoS/eyJoKulKFZcA/1j/PguL6r1eqH3Zac5SzEjw3E1VYBSUXUWUNReK3VS+/vkkF/49Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715932; c=relaxed/simple;
	bh=8lUtIdaUZ74bJi6U5U+SM7syFrwG6QLTTZ/s/7A0PwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agYkpa+Xk0xGdDFo2TQEIDhlz2H0ljJPVSFSTnFxb0EMA9lJ+Xbdgsepxq2ghbiOEytHZCA29uQ8mbMRWHV18otki+6g6dY4RA2X0z3dszk39WfaRDL4JPyrsug20IcWqZ/u+Kjs1u+/f45UpFMCJgywCnfHk502LX6I1rtB7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+ltxz+B; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+ltxz+B"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22356471820so24668085ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715929; x=1741320729; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=J+ltxz+BAKJjdW3TPKOdXW+kDSIe+WvkomyEbB9TF1RNgiTUv60dNXsv53l2ZW3w0v
         SEQEYJ2xelkZnkybagjCAIomlQE7J08KfF62sfW2+kx1tZx/a+/4TmkRvqPKgv1SnDPU
         WqZP0suS95b4I8v/XlYiqINiGic/pzQ1Vu28KqT0CMZNmWlU4yzwe9Fw2AfodBWtf9fa
         /tSzSMb3PwEO+t73JtYj7p/Yz2fFT0lOK3DCBDlZX22bXZtzrICz7UjsBLTTnt/Ekqz/
         lddUSFRGIY0vGmuIqHeLzTQg1iK5t1ivxLlShxqd42Ens8mq+NyqAmYRM84aViKxlhEH
         dFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715929; x=1741320729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l6OBjbdguvzVanhyg5QiPXwRgVYnvgdyH/pw82tHlU=;
        b=Y4+n1EnfuBkFPVznIG0rkP3PtYBBWZ8DDa2QWbyz6MelP/LeMkd9Ai2un0/qK+Mh3b
         DThveYgbpyHsMHeFVzDoMD6bZNNKlV92Gxx0ZaeuF7Ztj3iyLdHFhHAJwIj8/60FddEv
         B1zsnbdJWYrMlpFXPLiXJ2L1KP1/9LVC+loQKGHowOpIynK8sIQ1OUhUYOKvutt9aKQx
         3vQEGo1ImHSYcDAbSGgaLwaqiv/LuWMMQa48k+p/52WUSywfubBV8xKHGWiN0RObu6Ic
         9sJDNd+PH49+EKYOdRxO/aXiI8w5Cn+3Q0IIdyGq3DRqqcE1DF/PImwvNhPBhg29lVR0
         2ifw==
X-Forwarded-Encrypted: i=1; AJvYcCVeFXq7oaXCIEirNEeNbfzDQp2c7/4q0J2gqd0miKIIbFTbbrxDT5eXjkvnN3/l8Xh0dkU9oA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0auSeBEOVvaQDm6+J62psvTl/R8ylPXJB9u0kOf7fiaKGXUAg
	gEhqdE5NfF9f5iCeXLOA4hVDWYnU2PyLMTB9w551ktkh94LNEUbk
X-Gm-Gg: ASbGnctR4Gb8U9ynQ/L7l87T/wJ1lyYuG2eqTgwpHIjq3adn2GXDkx8uV3xgnGL2yq2
	OKsK6c/HU6KdHscEIeM94V9lNmlYjAJLyLqZPKXudEmz5u+HLsMpV0Xeilr5pEu6mjHiGPBnIOG
	Jr0GGoCveLPHAsKcCylEF1XNApBumiHPIJl9n9J39pz3pOD89yEEdX7OMYVHB2/kmqpSAWefp0V
	l/u8R2xQ9YwKKFOg2WxCWdncmyJj7Ibh2i8jXb8yS80XWzykWAGRo+zVWwg0gL8y7kDB9zUwZUb
	ESLbacCKOCDNeyBaweM2CLiLYg0=
X-Google-Smtp-Source: AGHT+IEYDQXIbIUl2hA4mQuIhbcCAjga8Xha/YZWkkdwnPtEP1alrz7wepIj1Qzk+976osnHuTy2ww==
X-Received: by 2002:a05:6a00:84f:b0:728:e906:e45a with SMTP id d2e1a72fcca58-734ac42cf9amr3499439b3a.24.1740715929284;
        Thu, 27 Feb 2025 20:12:09 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:08 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:42 +0800
Subject: [PATCH v5 02/11] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-2-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeIlNpHaNLlhhgZedgrNR6t68Y3sydP5gJ5+
 ljYARuhnNmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3iAAKCRABygi3psUI
 JPGzD/wKgqCzV5ZnQ85NmEg/pVw1MVnRCA+PrdZeO37Pd5acoqcah8YEn2aWYYSSIlzWbJDocPg
 XMMjleWGaV5iHrCuV6W4NeDn3tuU0lv/9ENekmf0NrAbQOiFO6rvA+4zabdUS0tBk28CZuEIepR
 9RRO6CAqB3j+C5iVNc2LgxSlUyQeuLjx63ObExJrn8uz48sl9B6YjTo8nsXZGUBNH4m0tz0NFWS
 yHNhHD2TjGg4kzVeHN7UjkEx5RtyQjmIrN9kSRVesUdWHH75XWSyW4M9WfPPSv2uoSniPSYzmf6
 b3s6BfRHQBY7r8qxFzWujHarI50eADEDttFO/bsfKNoNvl2944xJNpT+aoxyemVfL8+fwC2+b0f
 N/t8F4m/IxS+BWrcM6p19NaQLoOdTZ27EjLvPm8y2A196sFAPzguEkKZY+rQ+QdMjk+xAxqINFF
 AIeeKNUOP//ubWc0ijZN+uq4WJSDUmGxFWaHB1uaNLgh10zk1j7acC3s1uMSsKFRiKWpCw8HLaF
 mfH+sB6tav8ZkEpJHE6wW1hfK9QeI7iRNmti844sjYHMv+6coFXS9n2MLWFqoDeW/mB0KLt6Wz9
 fsOrtC+cGKNWTQwYYpqYNkpMurIcc28Tky/6eni1+eBSf7sOkn/vTDSqaniJs4CA5DlLv5pncPb
 mIKs5zLkFno5Plw==
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

