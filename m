Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588672459CD
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889901; cv=none; b=r6iFW0EzQg4IwogiYwyqIkbvUxPaUoxUzzsNdyIbPUP6kibWoTQ2B1mBeczKYkxhebPxaT5lPy18wRbIGEPlPmbg6BJf1E91UYup3NeYy4Bt1NUDHkeJL2qQt8RH3SxHRIr1LVX4esMTAhLlw6BbH/PW3QyKdN7I8qe9yrvqkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889901; c=relaxed/simple;
	bh=40iBkshuT7rxTV03RILkcUaTWGCgn/IFCgnsDvO8O/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GryQWnEjopWDcMqzW6LUSakKUcSlz97uhUszkWXGHZdGekiYCp67xiWq4k/UtOU0Lwo1chbhyLesd3/SJUqWQhlQdRF/anJhbVn78w2+wxIaWWXRtKQDvg4Jsw0bTeC4/lqmZdyblBXPWhRDKeVtkqYABjxlH9maXaEQVxcZMA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBaWBwrj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBaWBwrj"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a93d80a80so2525036a91.3
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889899; x=1747494699; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=UBaWBwrjnBlN1P82jPU7Q2koYgxAlHC051TePo4KMNq2N+n0P0OqVqva1Dqdwh2if3
         Mu5U0W8nkP9LJP2Y0HEV9H9hQbo6I3Jb55/EOs//DOmuD6q/1iuou7YPp0fldZpajdWI
         sUoq7rq4IHRFmJs3fjENGqDPWv8wrg6y0g8P38GdnoLetzSVprt2eYrEbJWDLXSVjei/
         Pc3CBz1o0eBNh5J5ePXQdvZQRjVa8oq2oqS5Zas6yEIWyCLBQzqvm8UOzyFXfZ9k7XA5
         a/seBbKSxJYXubbtBFGy5qxjzw6/6xzykHP4bpSxBaQtqUihuU1JOidK4m/1ez0sSCk1
         fbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889899; x=1747494699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=VTn5/VsktnC9tLm8nVGKbHi6vNf17DNL/IfOdRz8HE3Q0bECXLQINoF3Bxtav4aktH
         luCT8ieEzdStUzXhlF0IbJO9iE1nsxtpIiqX+YB4FQxL4x4pxZ36+09vEWSkZzeKjLn2
         Q7SYJpabYMejWjvMuGmyfID031HvnXFOIHQgF7sfggoe1Y5HDUoUDbJAw1KgduD3Sz4i
         J5wOM6Jw5LbbIcjFby1YUO9q6OtBk7Ik290t7mFGViSx32bP71Ctl9u/ZpRovcsHTmL3
         oojtGfTwqUWL2ZadeL1NzmrZr7/ETDX/ynoSqgfEA7XrcFT8fwYPkQiJ+8MZbTv2R8lx
         e/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM+yffn/D6GS+r6Rb0Au4mGtPEfOOupjR7zK/ug6WYjymYz1NdZSx+zczKd+Cyh6fCbMCLVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr9y3mpEAoGuoXbqFo6i82NCKFH+3Os1ZLmcfSIHFfu22xmhyu
	Cc/jUVYXAvf6/rPoELuXc11sai9FVGIi/J/rDgBZSSV8Dq5pzpgaoOfkrQ==
X-Gm-Gg: ASbGnct0uJQx/iodVXVwwEF8pPRU1iiD9VaCRDYT+IZ6expX4xPdzlvVF0fwvRVaDz0
	MfkcUXSHMPcdSjdPuKRd0DZ2U7s0kdvuKcoFRCbsB4amYn8U5t4LyCz4hGVKSCfBUTE+z7RrLw5
	WVjU9zU8k1P4I6Vi2peBK0QBU83x2VP+82VT4vGaHHW1vdTWvYzWjdIpaJdAhSDulG13V0z3F5B
	8VZvJHA56iSAqowBSmaQoYZOt6Ilu8GWbP7CwpVwHEfn67P8Fv9jfVqXIQun9Rt7L8bTVGounw8
	jzm3+YxEoLGbcoW5U4u6FhILLrGZj10sOdyuMNjoQViXsP52iEnrZw==
X-Google-Smtp-Source: AGHT+IFGAQvSkp5FuP8s6Ekd05DHEU91mrsGXhbEbbmC5koqmXT9CbW191uBwo7jB2JIqA6kyeBvLQ==
X-Received: by 2002:a17:90b:1644:b0:2ff:4e90:3c55 with SMTP id 98e67ed59e1d1-30c3d62db0emr11513587a91.27.1746889898831;
        Sat, 10 May 2025 08:11:38 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:38 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:44 +0800
Subject: [PATCH v7 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-3-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=40iBkshuT7rxTV03RILkcUaTWGCgn/IFCgnsDvO8O/4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yayhIz5PCA9CQkhAbNeCgQ9GQexfDTqXWO0
 ctPUr1ixGmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JCrnD/sEgdFU1NJujXIghWMxs8rHXtSyh92JAPQV7u0sEkfidYyYNdEBnU832xAgfr+6ZQsunR3
 rWcYGRX2GW+01RcwFsuLZL920aI4I/GYP7gxElY3gP0be6Q+yvzAdRxwkuvGwtCZPYS+tBEbyEK
 N7Yz0yOLPZ5PnzA0dalNlj5b7m5ANTN+7ET+RnIl2u/mQV2+PyBWTk4yiM3zYRSLHIxvML7WM8r
 Zpxn5CFnzYBtgme8YaJC3jn/ayayuoaCAC19ASVf3GLbRS0bUu3LrCd90VDKeD1VDU1Wkb5CVxd
 pBwFCDhk9fpg7XkQY3fBExa++uOWqfHkEsOfcqGY0zAEalO1U+GJoQkoPkBH5i+jyL1zlimpT8G
 1uQGwAKzgwZo4UIjme1mXlONbw5/5MeWQC9rumXb5KP/f9s7saX4geoAwtyZ1D+9Fy9zqMxGUym
 R1bewdXG8LVu3F80f+JOmgdkyo1vW9NjAkpPeMzhlH3GltCrZ5wphN2P1RSCRxFN4Ig9mMqjyfX
 tvyJmDwiPBicJycEOz83WDsZBxoYHnC0d+upLPcXviqnvGM2fKyhmy87/0yqSPTHmVyuVElIgNN
 xaLzn03uXyBlnp/Xdbo285lNd9cuI1T1pA/XUrxoDcc0qLud5cGBL9uvM0DehczF2dCQTqy0zMV
 fvPHQWZOd9njTVw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Use per-implementation event tables to allow supporting implementations
with a different list of events and event affinities.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b800da3f7f61ffa972fcab5f24b42127f2c55ac6..c19a433ee6478876e4cf6667d7a85a193b6cb069 100644
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
@@ -494,11 +491,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
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
@@ -517,6 +515,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
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
@@ -544,7 +548,8 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
 }
 
-static int m1_pmu_map_event(struct perf_event *event)
+static int apple_pmu_map_event_47(struct perf_event *event,
+				  const unsigned int (*perf_map)[])
 {
 	/*
 	 * Although the counters are 48bit wide, bit 47 is what
@@ -552,18 +557,29 @@ static int m1_pmu_map_event(struct perf_event *event)
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
@@ -624,25 +640,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
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
 
@@ -661,25 +668,33 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.49.0

