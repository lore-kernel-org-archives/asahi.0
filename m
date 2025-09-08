Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40971E572F
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325659; cv=none; b=P0BwAzkMHt6ebjwOefzz+4lHoub+ZBuimCJbXLstYaCZAk1y/+lGvoSQLcCs/etk/vN2VnDlRd6Xk1aIqt/GfhPEZ1PoUsq51/LqwbdRco8lQA+PgUgQZviXSSiKUd+Ryw4IbU+UNICjl7mOQ0vBmEXPlzrz88Q+94fkJ7Sen64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325659; c=relaxed/simple;
	bh=QXdFCVGEPqTyu8Bm7SIf1fxdHsV0PUqAo42n6ezyRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGWgxlV2Sl929Y+he+OAO7LtPt4wG2Svamd73H+QqE6jY1URCUSm1xRwJEjrO3sGN6iXVMqXWsy3RJ9ts9b0m/e87Kgu7WuVzmETQrIT7Ytv4LHh1tJf4Fv9nBA2Q5svym/A1Cy2s6fAZnh2iq+krnkGg+BWxGvJaPu4iNfxe5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+vyPae+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+vyPae+"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7728a8862ccso3641693b3a.0
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325657; x=1757930457; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=m+vyPae+WWnFXaFSXKeJlTGfPfuw314WN/LM3LjtpJK381BKs6TxpMvn/8Ci9MuPKH
         BCb6YLMBIYtB+7nfrMtxHQY6hNDl2bjKYQSgPDBZAqfe4i9oJKMjuBfnYI8OQWyjWLPp
         PvPCAek+adrrmZWNlDSFsdIU5uUuL1H+I5rVI3/fBcQAo5YOCel74y20hidCpMgt5mbl
         z+YAzO/QtUfg+o1UNJ8oNNVwnIcxy9MKC1RgOVxU+z8XaqAKH1xhe7ai5EHEHoqkaTRe
         o2lz5a+iDSFBT/QD2fwNQkZIcEJj+93Q32D8p4Oq1nRvPzOM8AaaxGR9IIRQ9hb1GYvm
         54Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325657; x=1757930457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=YoQo128xdfjoHZvmjfVL5eDPV1atO917qBCKo0hWKdAP4MSsgOKCphDofB67wErb8x
         fWzui6sOVGho1dpVwQtRoe6IMflx6OCi9p0+VNz9VeqWBJ0r+14VxoJXIOdqkhf1WvrD
         6oT+Jjqgy/4Fl0rGmAAsi0vkA/KK6uP74Qg/EApFA2mQ+Fg+imzpZy+wbHsCYOaRcWuS
         4v3/VMDzeGElrv5o4DiVqPva3RSPslYxGC5+sgbD4BkmF59JX4L3EvCfPhOOPPWKTewV
         ig9OUdV3Dd419RTwO+yUvyi8VAyPh8MCksCB4wUbwcGZ4XXX77azfVtCkjJ+XSVwWopa
         vJbg==
X-Forwarded-Encrypted: i=1; AJvYcCVvniyfM8Ue8Uaf64zJFPx5nJur39ToNkwUjcc0ckdoCkdmdBGwVMeS41CqY+BUJHIJjmKKyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx57tjroqScuCknrqyrNda1eGyzdrrHz84PmfT3JUt2OsgcqKy1
	F838wC6pswdN9CE8t3S3/mzTCwpXjVvP+rH7AXZFrh11mj9K4hCpmvWv
X-Gm-Gg: ASbGncscxXbf8ueiO4kavOzBESkZYkZDi/EYOq42c1h1y+Bf3NgBT5avShnFb+ItDLS
	lb8DC8K3jW5D2mNoOMMWoIAv11vc5rVAVn8w4Yj0yUIsYuhYpFT4mLXloho6sc7MwahjxbyzYp/
	+izh9OB9s1k6g+dWkDB6ffB38Pj01ixG0+B2QW0vvNKH5kiSNttseE4CVvd84n3CYJArqR/dAez
	aNxqFP80TXQGmzh0l2mzlyQuVxXEkQTY+6tgs4yUYD7y5BknGy2cJqXyBscp+PUCE7LcjDE0DSU
	K6ulr261eZTPL4xEwLux2JlCbkXy2oAEGQ7ft+khs6m5yQ8l9fyVi9QWyGkpzfdt/jCAzCrbcBl
	BsOGE+fS8V38JfLZUIZnPAhP5ubM=
X-Google-Smtp-Source: AGHT+IG8f7QWlYnkY3npMDxRjSVlZs6moYuSIY71etdNfcW+FyDv3+n517pdY5xG+zHBFK5Cwi4wKA==
X-Received: by 2002:a17:902:c402:b0:24c:ba8e:c5bc with SMTP id d9443c01a7336-24cedc83ab6mr163142315ad.8.1757325656753;
        Mon, 08 Sep 2025 03:00:56 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:27 +0800
Subject: [PATCH RESEND v8 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-3-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=QXdFCVGEPqTyu8Bm7SIf1fxdHsV0PUqAo42n6ezyRRw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlC0et+/+z/qtxr5xUy6bUrh15N0o6KHo8wQ
 30tLI0+/N2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQgAKCRABygi3psUI
 JPpzEACVxTd3EvWUAjSmnAg5qkeRXyzv2oSB43nFGnYBrSn3nbiIr/XzPOVAUPZtXQiYYNh73iC
 6bCtU17u5gIGtcU6pfvVoB4YWzwrDRG759MI5aU6+1P4kvsQO4zPQTpmvyRLdmHXFXgdNsqcpvv
 m0cHQF+Ts+RICEnKb1273DabKgNmGq7tfBatr48DfQnYXJJWGBph27/qZhJXpZ9i+Muzgaz+AtI
 SjZvxVXQIdvMF+wxsFm7MTJ6w74w0Ebuf/RsoxpmkVVAFqRrn01G4c8uu5aDHTVY+L2xuLp6JAm
 CMZT63tlvPWVy8DuxTPHpu+GuJuilhYO1+e77NEAT9Jl17hBcsNpIJtg7T6eHEe4JH1DIgQsxFH
 b7LMtJzxPYyl1T2tkrsZqjHOcE7NXx+VthTZ8wST5GT+cw7kfJaXRYbzeuSaGLscoGcRQc2sHQv
 KP3JM7beuodYfVPmjAX5Y5wKMH7IbcEnFo7AcPhUZrk3h+7s8b7/CU8V9ETFrKB4WldYugbVMke
 RXKFpUM0wrohJBO9Gcsuou8JqCZPkFt9OraZDrJqm/w8XfIaToSHRurHq8bhSfpcWfDjPMbOZJ3
 Se4oSUhlVT7S0z6x1hVyJ8XN8R7ozMtsSZ1UXXGxPyoiEL8V7/aqqXDj5PIuNseLFf8MfhJPTkP
 dBH32S9OHOPIZ1g==
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
2.51.0

