Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255212FD7D2
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454273; cv=none; b=ka/n7jfw3n+oHj/bgmfwuiSsxLBKnjkzOvX2p1Q14BFY/PORI0KpYP3uv8sCt0qZp6vzLKMB1qT2rriftXRzPZ/3N+GRl9gqWBLvp+UMVxfYsEagOWheUwvgK06AMJ9rxuMnX5krBfFHh9g6gCuqPRh53A5Sa6gqVPmR6hAhZ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454273; c=relaxed/simple;
	bh=QXdFCVGEPqTyu8Bm7SIf1fxdHsV0PUqAo42n6ezyRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+lkLqZW3W0+4v4KlbiF3ix+bgTLfn4UF0aMee2q3D1OjFmH8ff0WlfjW+UyUDMwyuidAVrYScoxSvpAHdKjV4GWSL4YxPvELGd0+ny5n+QidKZJzLfQXpTU8srOUKoPB8ozfYc3Iy/guE3rwwqZieZEDQzUbd9Vg/NjR9ZDWVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwizZWkX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwizZWkX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f67ba775aso7642196b3a.3
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454270; x=1761059070; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=MwizZWkXBkT+jtdDpCKLL1K5tPOjN7ekMkRdp0gAlm+J1GDkrMI1tBHQsiTyVReBuv
         eR5vQ3oBwB6nxD1LKo2NhR0zEWFAwChRYji+3vyF5wWrs4aWhUt2yPkdSBzMX5po4rUp
         AelDQjZcSAxuXZtJUmqUOMf4ItL7Ii/GmujoFvXJztRQVbV9KbE32h+LnaOHYAZVrvES
         J/ij8ho1Adb8d0uDZGXnUOK7MuCUKi5VTaA4Y6dIWQ8s1MfjuUdeS9WtzrbuIElEZAPG
         VyYvXQ1oPg++ddEiV7quCwhhcYgv5srbD8yybeQPbmM+O0K2OPEaGMRleVhF4mFgVByF
         FjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454270; x=1761059070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKGU1abQVfuJ6I1lGgEqdrdZCTshmOZZLCi+h9rWnIw=;
        b=vsmTznNlztC0jkX3Dl8ewczebRJBJjCOVQBJSdRHE/arGkH6JsnbAc4YqD8KMGhjiW
         AU0jrCX+bjhSSJ6acurnWx+T1x81G+Sg1G/0H4fO99q/K4Tnsbj0dAE+ppaChgJVXYYW
         H8/5KYCwPk2qGHxTBqcBMJYdO6YkXVZQyKlb4xQkcRZo0k+Zq+DqzcaZSxmRccxtnua0
         idLaniYPWdrgtB1AwlKllU7FO3hfDajlJ+ztJQAamHXI0HjUt2Q7pRE595pPFZd+Ldtb
         MxkNbpz2qn7ThMWtwX34F09QNTZMoVuR1gnhAtPH+tF59diqBQfoQytB4aFP/ksZ2d5o
         Wguw==
X-Forwarded-Encrypted: i=1; AJvYcCVKOQNqnRRBYCcqaUOMaH5V2lbB1da8aHln8mbfMzgz74cU4Aux4gBgf7SeDyuFloIMsgvvdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxsRpf30ezNPK2rFVIzXC4KbOljorpF8FKM18JTywhmFqU7ROH
	evqV8Pv+1I6Tv4ey9WFElhPCLtm3wuAysfGhs8/ODUKMv5596XD9CJJX
X-Gm-Gg: ASbGncsZXWSr7Co7vcWN0jsghx/6/o1/ADu/Pa723bPZzluJEzUWtJSsYEjGtRBkA41
	XKpUULkvJqJg1U1owODh85c1cB74M0FvUlLbgXgHrEXd+DPR7B3ltTgQtRXVsGAz/ssAhyiVOmx
	PWPg/NSKkHiNko0GTBfineaRl4rpYv4xYEZsEEiFoJYlKtnM81RLcA81JS8R5mN5zFrhaqmR4oj
	Ij9mvjTSqzJcx6ZRYQBiwEm/g9GIPsmwCrEGGrjCcxBj4SPTVQic0eqfiM5CzhhBZ0wG4ySnQj8
	Co/imSkjyCfgp12zg8TOgFz35QnhQ17kxEtu52JkMa5MqOoqZuMbsegdrUh3ROiGdztI2aQ/2WY
	rL8EMg60KO5CoVwmbrO6/0N10qo2F+wkQCvWYG4OZSQlNIY/x8hmamw==
X-Google-Smtp-Source: AGHT+IGn9ofuLs8eQ7ej34Sc9yoDNYgiACYcK+p77Fp4lhiP+L+rchOzwCG5t7CeGEM6RreDtUL8hQ==
X-Received: by 2002:a05:6a20:3d1c:b0:2e8:1c23:5c2d with SMTP id adf61e73a8af0-32da845fde6mr32193612637.50.1760454269685;
        Tue, 14 Oct 2025 08:04:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:29 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:36 +0800
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
Message-Id: <20251014-apple-cpmu-v8-3-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZsqjEa3GuOXC7NCs37f+fSqA+5CTGWWNrSX
 z2iBaCWscWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JIo7D/wI0HMXMQvqn2Xs8Mnq7NhEWbDiLFr8ZI8RN+NuDGplRl4uIoCIEILIrGbRTbugUXwoQ2e
 UPONH6zO24lJdeyOXd2RRLB3m7M3TQz+jVPNIqvvLg2WIty8RjMSm0jr6QH5HkNRjfxXXeJ4z2H
 eLVp/AATczKlH8pi4NILo/icFgq9CPU9HEzy3m6DtEdet2OBid9UEQo3wxwwQhmuj/SPRl++5C6
 32Bhqmr23qmX0StN1NN3O6Ha7u5hDw85DZIBQYtM2SH++wgEt+2aQZQAgjIQ2GjRNTalEEpnOUg
 Ue/TiQnkVyP7JCG9Q+lX9wj3du5xJcKq1dd5vStkM+fI4Ee6c+aBYKPh356ZNs7MHoeq+Hah2Jf
 mUZqgBrit10FISRiuzm79aHP5vnjX/j+M0pA2Z8xrqUoS+fkZ7Vw5LpCkvglYYP1oWl4oN65uGv
 V8BjUhr6hH1+R/dD/jqa336zxaLV+8T265xVLc/RuEAIMXQ3FjdgcjKTllcrhgVQjuwFOMAk5yT
 4OvXjc/qKsd8kCQv8y03d4n9gr3QT7kSsTgAtUD++NPvDUcjrA9s61AIGPDjsbIFIEdEAVPBNO+
 VMLcmSANzUOuOgmW966IemyGrPgYgGGlhBMa4wwoYr9/X71/kcxTIJvH0cM9TvXYgFaelztY1zN
 KWUdev4lRtP0h0Q==
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

