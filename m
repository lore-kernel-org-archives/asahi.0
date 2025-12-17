Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F5234B435
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988691; cv=none; b=A+xaQ9ieSG+scBkc9lBZ99tXbtlxjyjauLgjxgFBvtWBlOXd0KFJz/dhKgSyH4OPCOaD7DSI8lg5+Ro2UVhUmLH7PhiD7Al6RGvqzDOv0eYTjk77DLLb91u1XsztvSd3pbE4fLwklJhaqOoAv+G5kXfmxFDzR1pFr9RHgkn3HmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988691; c=relaxed/simple;
	bh=GEbwxw7PfrqcXKYl5oW/iB71cJY49weGjklHwoM3hyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uj4m8nknF40tOrcU+2sDui2/23KgfXYxCHoHyUAI+0sRHq+yTPMe+gRCPsaxiK8ebVGdqUQSigD2kw3viHeeba58a0aFxVZLgdMLIit/J9HCkHdQyXfjnibiQ5SrKnZ7CfrDMFk5F21Zgvq0MbeoFTrieL64XGA3L8wCMPZ5vzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iw58fXnB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iw58fXnB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0fe77d141so40049245ad.1
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988688; x=1766593488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=Iw58fXnBbmNIBbByJAifjFTuSxVyhZLgcEfhMZJorqbgCV+JFMfYSDv/gpXa0y79D1
         Ivix48lsrszQzTaOQkOMGy9xhKDqDm0RUey0n0ObZM8ALuYy+SYBsX325mYCykPVOa97
         D7dMmhYGXkW798FFFZWXR7ZTW5t6xezb5xQfpJ/N3Eo+nFn1vnhskwm8DLFY1nanZw29
         4440AG6YrYhsiA++DyFIz6w27u3fw3Mx6VaV+N+gP/OLt9tTt1wuadc2RFCrUpWGJvfV
         qcglCLeFfbyhKZkG5+NnIuSDz6YmBnummeHI0ox/lBb0N9p6+1ZNBQTBhaBlqtPYYWU+
         1E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988688; x=1766593488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=baePLKadh5VeuMN7NIEHaBw4znqNJn9lrkTnuuN/n4Y=;
        b=g4ShynYyohqgQcZy+mFvhYhiqXlDV5OT99Vfu4xzXLXiUA2jQIWrEIKDUXzE0PbCyS
         62Gx9zvCG464ieSC6V9rFLrC3DK4//p8ZrG3GAVMZAMcEUgK8D1tQUY1H4bD8dZn8Qc+
         4JTSkJodljjlAfGDkVrxYkcHQJnxH3XRv1MzXZH0hVyzOedThCd40PPVUK9HdZadN2vJ
         lEXiuG/DgsPsgSQeJiHvTTi+iVxu5+z0jD1/Jwu9+g+8lmXbK1kqrCCCq5Jhfm4mS6KQ
         7bSJNO4LD87L+/uFx5Rh0Zrq/pRUUKo+rYz5dzm5LiI1p7ONEIP2+EKAaM5azTJcZXV1
         I/AA==
X-Forwarded-Encrypted: i=1; AJvYcCVQXqKAk5vasTfuvJC8ylvgZCepfe5IGxx2A4sPyxUmjzGhsuCudQoRUTuVI32Ttw3d8Iq2Gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjsvumS3XXsagEsrgeZGjdYkPlaFFt8sl0PJMF2EbgZv27zC94
	eZhGnN7iK1eOyo8+l866dJ4n+a/3lyinIyekn9v0MG/WtF2WbGw/kEMwf/TgMBU+
X-Gm-Gg: AY/fxX5kT4kAHJqcoV+UfPgg1fj6+TJCwSWVdtY6v+hopE5M+BDUO+C+NF2SyQpRSaS
	L07jTjqaqocKjh+yNFl76PBZ6050szWjOQbYPz8tnbfJIg4BLwXN0OHfeTAxf6+iTLFzbdvbOYD
	9wm/gon1WbVz8HVExfQAXYolI+Gnp+S1utKxAYiwE1cXE7Tqu4kf61VQ0KFSGV4q2KXKz6adIU9
	tDiQJe7s4zN482mLm7U0H+9U48sxT7whgGC5KWChZDcZnZQBQpDNfcfqUMbGMIZZzzePC1fGprc
	j0LSFPGucvGFqiCOe5oX326+IKwX6LJ27MLPuIUzb+UEeult0J1jtH1gqA7nIKwwV1iLKbWmGnj
	kIpy4o8P3+GcBIzxvku4M2QLnajcnyxR274WYf3NFY50PDdly8wmy/voSBvieM31oDh2BXpZDt4
	HaUw3TOQIRcIgx
X-Google-Smtp-Source: AGHT+IFnI76IAZxZQYfdU0cvowu4POt/fXHKU7/xVVfniBzosjklThD5++ABZlM8rP8ORaLE2hP2Rw==
X-Received: by 2002:a17:902:d4c4:b0:2a0:b06d:1575 with SMTP id d9443c01a7336-2a0b06d1731mr114240415ad.51.1765988688494;
        Wed, 17 Dec 2025 08:24:48 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:48 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:16 +0800
Subject: [PATCH v9 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-3-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlA+kasIgm1d08qjNIxyta1PI/a/3sOaDdH7
 YA5jw2xb7mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JDdwEACPnOcKvw3tvd0H4PzxLqD37zGgX4/vymjIZG3u0NXrwb5zOPTzw8WJKqkHmNqGfnO11Ib
 scXDgtoGbyWB9s8gBMerBXP4ThOrNXZbv5hR+KklI55lXDp6wD7Fm9uMbC2stuM2AyLDDT4FJQ6
 Kg1KdCqLc3pMjU3NY6G+AEI8FCxvU3/um9aRSUHW99YriLwj0JXjzu2LaNSTPdt1DB4JYb1ybe1
 5Ge2W4iv61OD7NhK2l+AyvyVMQ9hir4y9EQi4TpmgVIt6HnCAbscER8Ynu3mVSwONZQTC9bjrTo
 Xgiv2JyYMU6AqjdLKSgY9S2FumujMQuSXrelx8Au4uTtydMNq6/s9kkdq9TdPM6mMORZw88ZmSC
 Zrm1mXk15raFVffuG/Q+y1wvyH5CzVqqGDo7EiBMkoVIMv6ry1wDSd8ZOIEFf5XckNjkbT9SMLp
 A1Iu+CESQcJVexLbhZS5fj1trysT5xUjBEeMaPFVj9FZ/HFK8A+JdP/Umq/eDOTdwvqqklqY3Sk
 8SbZxkxPnaP3ojeFJCNDjxJfHkxSm8LaOYrFXAwVcFQrM85heU5PqBVGpqGw5I4ukbyJjDKrdWi
 bVvyyv6jU9dT2ShKSykzKE2E6lUZJPQ03n28lcgq4Ub8g5NP+CBjMOzqLET7BQLVGfjm6ACLC33
 YzBMTzWFhphvd4Q==
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

