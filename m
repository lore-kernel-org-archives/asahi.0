Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA6B221F30
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001180; cv=none; b=ucVEkAAaL7Uch3NSOphEJe9miLtTHRqLBYjrXb72+Nl5pVkf6I+c3DbCfgOcZ6b5+2yuM1g56jdh/91IMcqQW6+N9vzJ5rC1UOUqu7wF8AnTD0Xa80DkfKBidNhl4v4hIMno9uH1hEAZktazyCt9wctcH7SlnUAseJP8Q2q3QtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001180; c=relaxed/simple;
	bh=BTD9OzZ4+bVdpzPnyX6mWog1RpRVl3h0ilCKcAXUUSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9cKO8CkZ0JS9TYu/kzxjBvLiPRE5NxqYWfvK++E8iAVz7EexTjKof53hsAnSmNw7pfuFuuZMZPi7c9QWZ4z3eeFxAbRgIIAvO1My6mCfoupABS/KUqmWcEUJ3PjmN+ZCFZ2BCOmXSs8kk5tuiWfZn9ioTbWqIgZL9TF0rv8e4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHa/O8/V; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHa/O8/V"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4403665a91.3
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001178; x=1744605978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=AHa/O8/VIeWVFYu7h9I7g1GT+i83f5ONcoaVL9Gr0uUec5Mz6YErnCnNy0+2/RZwm7
         qXb3uACo1uueaShgoYYxGczK864VLM1g4bYjO3WmOg+QiWXyhFJowY+4IY9H80cC0VDp
         vYQwnvhXdChZ3EdWC+vLcMMG3YI3BA3ok2zh1cl4WdODJR/1p1y9kjsXLDPyyXNWxMoC
         Pzd6XksnOJNrxawYXsz3WfYHT8pGZhISjcg/cRRvI4GqkUfFgvJiSDBg1F21GHa19/Q4
         sDcLrM3hCLcYWmgcEwfwH/ozPH++ci50plWTBoOXiCKFrXAvJfJHg3WEWwb8wm4LUp1B
         Q34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001178; x=1744605978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gry3bzp7sxRtt2sNra4Mhddxnl7ZGz7/lk3ev5LDghw=;
        b=ZJl330xg1hdgIXO5SlOUQ63rfu8QwhwJhKqiMTiRBqX2ZnekiflPsqjV6eS+IkIS/u
         zeiRmVX2gML6RBCPgzzjSxXMrRVVMGFcsYHXaw8O33V+WgasX6XtU4TEUGj7QR00OTLG
         SIEcwVMJ9SxBmYNB8udDPelIQAIZts7aAoh9tbbK1XrBGCTRNXQ2F4sZu+jPYLzbCj0/
         gixJSbECdaFsFxdNSD8p+1Vfo9X0h+ZZmMRgvCFguipSC7ApHNiB78A1uTXT+ElUswJQ
         vU2BVcC3NH7RE9ELN3qNRw2eT1f7BfKJKArANcbJfua6/eTSpICotncHWfIqbzKErMWq
         kMrA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/rUH5qQ2OQwJg/YcA4zoQ/6qJ2n3VTPpFSrMcx+yqyNtxYAlPRTymtlMaHJKWhb7REkPWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtHGG8Qkg7A3+QVS6SuWgqGwk9L+m3AhBP9FOUabK7kK0EXsd2
	zHymmZkyckX8fu/mJInoE75oyCXDi4F2+UgDK7Cjf04EWh5iFZMErAekZg==
X-Gm-Gg: ASbGnct98IRvJ+6kLsIKQpM1LTJhw9XXJ4EeilaJXN+4AamfKNtovLgZtGxHv9URQpm
	3jrLY+aQoIYiDCV1PAf2m0I2Kn9Nrz4w6gcOoUFAyO9CEAUIwWUE3EHN/oTnZrU+vTOOt9W4A82
	rmzxnd8kU61mGN9xbCUnBBpfFDBkZ+Ti5bjLX3eJ92nL6Q/rDxX1XPfUW8FICUtBvz1UdAhBtEu
	GzaUR8Fa8yTmJesxHi/ObSFp+rB6lB5mnYKfMrNo7FopMkxLa8WjkQbVAg2+YNRa2zQDsSBbVbO
	I2qX2bBoxtQbTzcS+NbipMLoclwRzEh/t12C0VfQq1dReVUebpLpWh3Hcw==
X-Google-Smtp-Source: AGHT+IGrn96k8IFooljFjwgzgf5cA5zXbc26sJl4BoYnJK07cZUWI2sv800GQNYeOpWRf4WuwWHOvg==
X-Received: by 2002:a17:90b:574c:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-306af747edfmr9119148a91.21.1744001177647;
        Sun, 06 Apr 2025 21:46:17 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:17 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:13 +0800
Subject: [PATCH v6 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-4-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BTD9OzZ4+bVdpzPnyX6mWog1RpRVl3h0ilCKcAXUUSU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGqhUUZt9nky98KDY3T1B1WYbpyDK+8m3Yx
 gUwHxgLQmiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JDKXD/4lIldbnqE1hTQRJKq40e4filHHMJC+4IZgtoHQV9zQvpGEB5y0InQPawHu8Tf2z8ghGrW
 rBHV/OrTcERXXaisZxR+bXTVybcA6IrSWR2xtyBbTlLv0e6p75USp3XfJ0oKhDY3ibrVizo6Hys
 w9Hmd5qCKxDTa0XtXAkg9/BNpxPDpvIwabca0KvcrKjtwX9s9R4/5GVu4qnSKpOprT1fphO1UyZ
 wld4wNY2RM/Zt4usnUnFKQkTSYgjKU6br3r84+0UPJWVzkR/6mNBZkFVJaKVvOjbhC/L8cPn5D8
 Zdy5vn4MDTE9QVufxf/38RkCD66qMLaPrCylqsz5pVPWIBrJXfHK4JYgEFwjnGxnzDl+xCPUHhw
 oPXbMpK9+bc+QbF9fDRPWlK6hiQwBue6RdGmpByoRLuqBT9ZENx4htJz0EzIB2rxcWyTS+I01M1
 z5mpVLKKeXDaGC58kG48Day4fJ3w6ielBMs3hnLwz/K9FHX7eG9N6KJHttopx90aIj1e7bbxrwF
 soGeVQeFJzQlZXuvncRaWzfuo6aGqiKbqvcMGtXi8kkp4c/Rjr1hxTRYIqzbNZgWVXfycklDUqh
 zsrgUbWygnAwU/kVcmZLGcEId7YrlqabgJaLzs9kaFcHJXzSXN2+FaapQKmEkSf1GaJWS1ZDrsw
 CTg+TUuCT8qrznw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index d1bc850809993de044df8fd5d4dfc61341482ee7..c03eb7acbb66790e17967d570c71746f72e40867 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -20,6 +20,7 @@
 #include <asm/perf_event.h>
 
 #define M1_PMU_NR_COUNTERS		10
+#define APPLE_PMU_MAX_NR_COUNTERS	10
 
 #define M1_PMU_CFG_EVENT		GENMASK(7, 0)
 
@@ -459,7 +460,7 @@ static irqreturn_t m1_pmu_handle_irq(struct arm_pmu *cpu_pmu)
 
 	regs = get_irq_regs();
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, APPLE_PMU_MAX_NR_COUNTERS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct perf_sample_data data;
 
@@ -507,7 +508,7 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * counting on the PMU at any given time, and by placing the
 	 * most constraining events first.
 	 */
-	for_each_set_bit(idx, &affinity, M1_PMU_NR_COUNTERS) {
+	for_each_set_bit(idx, &affinity, APPLE_PMU_MAX_NR_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -602,13 +603,13 @@ static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
 	}
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
@@ -617,6 +618,11 @@ static void m1_pmu_reset(void *info)
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
@@ -640,7 +646,7 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
-static int apple_pmu_init(struct arm_pmu *cpu_pmu)
+static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
 	cpu_pmu->enable		  = m1_pmu_enable_event;
@@ -650,7 +656,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
-	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	if (is_hyp_mode_available()) {
@@ -658,7 +663,7 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 		m1_pmu_init_pmceid(cpu_pmu);
 	}
 
-	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
+	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
@@ -670,7 +675,8 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_icestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
@@ -678,7 +684,8 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_firestorm_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
@@ -686,7 +693,8 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_avalanche_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
@@ -694,7 +702,8 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->name = "apple_blizzard_pmu";
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
-	return apple_pmu_init(cpu_pmu);
+	cpu_pmu->reset		  = m1_pmu_reset;
+	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {

-- 
2.49.0

