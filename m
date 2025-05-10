Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84524889B
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889904; cv=none; b=GtI0EyXk5MIo7xP/sA0vpQX7EmGtDbUavMMrl82/8pVvPbrPZG4hfhZwP1Bo0snRShg03qbrw6+k0+52NvEalnMHmPjkQzs9oXbhzn7xe90ywYeGnaUf9/jIYiA1WDzPizCSe+Jvwr/xD2SSna0lSAGvNJIokdHq0xFxddqNCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889904; c=relaxed/simple;
	bh=92neIFKGScRdX0M24usDNCsl0ZJtczDZfCVErT5yl+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V72LdViG6na4r/L2he0v2Gt279/wKAySzOJxiYtRX1zzEIjB5gX3bMxA5kyqFK/tsSckbh03L1MWClygD5TmQMfiBFwgj56edtC3tk8geSq/0cWKyjYVXzi7P7HbbaDVVHOsi2W0wcJUNAa3nPm5x0pYXlj9tu5a0lfMtEbiAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEIc2nNB; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEIc2nNB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso548699a12.2
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889902; x=1747494702; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=HEIc2nNBPPyTCk6l0VaHoqJqUq/9zfa0PKr+9qsLcnlXzzLS8nwFnfSjWkNJ39nfTj
         Fi40qZKq+6AadBrzIhpwQ1ltCHxBoSgLovMRgpuRgq/iuJxlwI+wChl0n7HssrmoNPWG
         XwabhgtQzbzr06NPn5qrmhP5rRLIySUxXVQJntjLao4jsyzKRNsc65xcPOtd6/4ja5r+
         4gFukQjzD4138nidU/YWhBVcUwgTIIg+2Njs8IxBBcLQDQfRq6oU39+Pe7bZt/JPhGW8
         FbIixkETvPc6qK+LUrMzwv0vX7gpQ0n4cVxFBuehC3ZM77NAXyTKlGEaGgN+1V/Z7LKg
         Zuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889902; x=1747494702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RspcmdC6N9FCe5+5MFitUG7n/lZdN0nBTHTU7ItA6Ws=;
        b=Hq/KhczI/SMkhZQWLn5yuRtsx+uCPewrJNb8Ju+y6P8ToZgKNOi4Lv+DI5WixHVATW
         T27TFqCa9jifOiYTld8uV0x9V8ao39dB8k316W9HQ6x9qz47eX+AdPC7MV04YzPD5OFf
         23Vqkfx3Eni9VKBLV6vwkKnF9/azlWdw5Xd23WEsBp2GNEJhAoUZvqCeeGg7ZmedmYer
         4QE3SX2DIfwACMQE0dBLAJ7JvBe4aMN4hy0GC9KLBwN0IrMe8lVzv7m8rKEA5utEGhVD
         Z3IiOGRAFFHREVFhMPsU1Rxk4iJAwxJ2VgZwXD794JDd/QcKCweysTnWtcZ+56fEEJGg
         6rxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGIZRSp5zg4eiWM33krZSds4BjS+d5uGyWGOxZhBk4Lr3kfW/RAdWN7/BMxTK6wr/HyDWosg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywulg5v8HvH7YU3qrZXBT/YdS0zKYFFm/Y5oF2trL85fgn4ftZy
	cjuE1+xPkPjphp6g2FJiXBdF7bQLjItNPGARG+3VSzMZlzj0ll4GhXT8tA==
X-Gm-Gg: ASbGncu/moaMTvWTk2PZkPyIqhrZ0b3klGBCABY03TrgQEoyiJki64ulJ6ao8nJ/9+L
	AnmzZqz80EQDlBpmwna/g2Zymo0nfCnXl+1Hl8El1eMzGOe81TaO2PJBFXiBHeI7ZGejV5E/I8g
	ASzTNbV+uFWBNbqRHausH71yZzpcYFdOAY37DwCf51z5lbqW+BfM7gND7PlVxFENLyOMTVx70vp
	2tqCGyc/x4FRsU1UWgTiVbZ8dBqiaGM0/ZrcjBjcG0LSVs+xGcptUMd50DUiiVo/VWD9+DyPhZK
	FshKYqV9D2KIpWcj6nkN/MCDwEw+u9SGR/8pJTY8WZ+tJgVVpWH7tw==
X-Google-Smtp-Source: AGHT+IH6LOQJxyz6csgZLr0PJhoHpZeb4CPb2lTMFD5ePFD1IshoBGWDGCQdrqqAtaHGRZzB1c7pDg==
X-Received: by 2002:a05:6a20:3d81:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-215abb54c9fmr12010580637.7.1746889902187;
        Sat, 10 May 2025 08:11:42 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:45 +0800
Subject: [PATCH v7 04/21] drivers/perf: apple_m1: Support a
 per-implementation number of counters
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-4-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=92neIFKGScRdX0M24usDNCsl0ZJtczDZfCVErT5yl+Y=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ya13gcTy6b8qRQIOa1Rt2jH8B3xfc10cesY
 +t9h/brlf2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JEwQD/4tGlSHmelrEbyAMqwr3JY9m9fL8G5QuPRBqxpH/HEK2SdBMAf4zpfWRhal2UOeIvwc1BF
 KtPrgrTQblsYBwirT7CF5qOxJarGpL4su/3RNQUaaTYaww+yjVIrz8dcZxC0lQpcA1L+s5hh5MX
 Kbwwe8kUeArHmk6lSioRZDQ8gk2N0CmdTvUl3P/6ANaekpxtRgKu1ZcnfzpI+dLV5Y4TI070H8j
 vk8KIYB1AMq8hGfyPJDhYDlQH8KXdCWRW99vWi6K4YNi6VwGT0bfTWoWMIObyvkn1d/XxUO/hnv
 blrqqCYLAvCjpMlnAFXT4hT/qYe64sMzNc7u8uPm76RcPAJkT69K5vE5Q3fnDCh2nLGAUo+S2lL
 7PAa2N3c0oOKm/PWuuyEgRX1V+E1ItNdjGpBBYkeYQvaT/3P5+/yb74JrMpVDuHg53j/hjV5KoL
 M7b79TeRhGibUqm3x0vbMtdFTBMJvtPl1wPQ2PuAjY2sr1sdI3yaX7atITysaDeRyrRl1pt+yTn
 h+lnmmYekfDGgSNkJ4ZlPpY64fU2frfiWCrxBhHXPjmNbyKc8U+ysUQC2TEDVyxDfGGbOduyQS/
 1KcMxZWZl4l3VidobhXR7vjn4WFSCrtFrw/nhlMkcw1kXPk8m7FSIR0Rxv2rvLLvg1Sv7shgupL
 Jt1xLBWw8vPDGRw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support a per-implementation number of counters to allow adding support
for implementations with less counters.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index c19a433ee6478876e4cf6667d7a85a193b6cb069..35a34eca403384c4908c2bba2f8186ea854d63bf 100644
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

