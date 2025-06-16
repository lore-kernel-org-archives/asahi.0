Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DFA1EB5DA
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037546; cv=none; b=N3vSZJbTEg0ByPLKDt/g1JqLHg12DKUoad9IVbKXzMkvMS36tF0K13BxXZ2c+c8XSpZKYk31Be5PZhTXygXqwa3xOq+kc1L+0g4tu/7m/kbThz1/IwCpXdqOEidI/RBonzkarcHAQ++T6g28NnQzwaabz4lnofPYsLbDSQwUFE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037546; c=relaxed/simple;
	bh=40iBkshuT7rxTV03RILkcUaTWGCgn/IFCgnsDvO8O/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dc6ABIlW+KCJWpH6TrbNXBCC/4TBSixNEoVvV9npPk44Uf8ZEne3YfDMbBL+O7vdKXGaMx9BGxQ6KuFAF5MZaZuwH+7WDFsJNVvsFGWcICFgXrZMkKCEIGtQQZPMazFTNZETyZuNSZ912VfQDzchkrgjeO26x6qo2bZAAmwFzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNx1nDq2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNx1nDq2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e1d710d8so47747005ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037544; x=1750642344; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=dNx1nDq2fJxIkZnmxb93mu2RSjKUdbJWiSgXYVMW5ddJ9xhan9HzZoqG2le/IYaI6F
         EiFs9qxNwQx8J37Vmgu+D/k80l7ar3XvXkHl+O8Ja/FAv8kwxJn4o//UdjfcQ+SbakiI
         RQ884dgoTJKNgPQD/XR9vu0potDLxrzorAeLo4+64hacgXBbJpPnKzdICZZbrWVTym3I
         3uyBNIQ+b6cXFJQy3ix+V9iz3YTWMkRTNwdm8gf+4wPlnWcsMhomVuoh6tDa11pX7AKS
         inELWYTRdSkAUEMpqJIIvF72gedSg0oBDPvVGP0J2yCgGrrZICucV1k5aTpRBrDpw9vV
         HznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037544; x=1750642344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMIBDXt3IAT64Smd/QsEmSBW2Kr7RYH+ZBjKqzd3OdM=;
        b=Ob0VnhNBX98KnXKanSanBeHjwXTC6Xjz0QmiU99ewhKDP7jw9fUnHhhH9iQu+tEeVy
         oLrNHruRppNDyY7LGs1YhebbRzPDh0o2fz1QPpXO9uNdqIh6TNpUpz1+a0ZZ3bfJUomK
         6I+PLJUh2X9/ujK9xmGD5Kl9sZRJ8iyqAktYOVQb5PMujKg0e6bGRNfEFthgA/eFZKmw
         QF4zCUHAPSL+aOSO6N9SJbooQ5CnqWNXVgjLHK+2vV40UxAFsrDLMb1sTnxv8Vw03FmM
         dtNNFAa+I70RlUxWkYAvdZ8/i5XoKlgqYK3xPnGmLF0tGK9iigTzn8dNF3fXosIxe/mV
         NOSA==
X-Forwarded-Encrypted: i=1; AJvYcCUKbnV5Wsn7DmWR/FCbrov5b1SZkzwAWfgdOdJKjOLlJd0rO55aT+UQV8/kMrLHNkuyFR2aFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUwlzYJm1DoHtNabuSIAVW7VMjsc2SIni1Ai2D71cOUH/bo7WH
	5zoZuZjugr+WKJBdZHLRym0kkOgxYY6iFr62ulUGVjWUh4Z8tPIP6rmz
X-Gm-Gg: ASbGncsDWoXclKjlI/Ccna0ddbPBS5w7dN5qn2I8okTlBOZluZqfu93yiLEMPu7TyK2
	rFR74SWmaAmebkYo4hHAjWMD8w9m4sTWzxUBXmNXM2gqIHRoXMJiUx8b8Ur88Jq7AmvnxSdYXsc
	CmlGOnXfHmIDRAefecER7G6fGRoixHZDd02Cfkyw3W9QfHGGwRgtsq2f6SA/D69hZr/1oj/tod+
	V0+H1qeqGzzvKU8AMiUA4/C44EqEF4XGT3ZK95JAuE+BD7pvB93ViM1+T6zYayiOWq4V9mMq/tf
	E+7Y67qT6OrDbuXTwqeZSP4zK+AhEOjuMSlcLoZKJ21XrMdxGVN9V1zd3chep9Ao+faPhVb0dZE
	cWeg=
X-Google-Smtp-Source: AGHT+IFbFo5ifb6sLWiBD4ZiNFitfhzcj3WWFMwZHiL8I71ydk2Cc0g+Icv9oBMZE6Vvn1wp8SttmA==
X-Received: by 2002:a17:903:1c6:b0:234:a139:1208 with SMTP id d9443c01a7336-2366b35021amr117932765ad.16.1750037543782;
        Sun, 15 Jun 2025 18:32:23 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:52 +0800
Subject: [PATCH RESEND v7 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-3-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=40iBkshuT7rxTV03RILkcUaTWGCgn/IFCgnsDvO8O/4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXahV7k8F70XGC8o8Vn+M6DTHkgzxaEC38d
 y4qcQliEBaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JNO5EACIQXBLWxc0imgRlBPChuoQQfWnIM5VL5Ufyz0y4SiKP30ZAmXJdDNOWY/QUO67J7oSfyz
 JwUqWPx+W/Ms5iMRJdIPs4Aws2kNauZYofpLmodL7tF67e433vcP0zNGxLByA93inHyEvrEPc8A
 8owL0c+ZNPSTKSawT+g/55lBdo5KfSxxu84rwHR0EhRiAcf3OZTf8o4CVC47hFEuChiYEGkZy8z
 Kpd4cEpncwN1JJBdoJBaB5KgfhWjohN1h6uDpNxbK+KI35loLMV8hFT/m3p4ankqa1+8hXnopsi
 46Wd6PnIbOb9K57SntS1k/I/l5OgWvnu7ZXbH8IIGWeasGOxgaclXGloGUz8FW6E2L2u02ayWk/
 c8z6UchZ4dUpz8hpKnsqshsJPXYUYmNjdBOUR3hfnaOW2q8E3ZxhYtLP0fnZiRykjI+O8WeIZSR
 AuQdLPdFRZ0/0t++kMAfzZ6mK+ZhjJ25E8+JZtxvcH2tj4kpxVHD78D/NcAYwtFQh++uj7r5GkU
 c82evqiWwsJkEyNJjVE1w1huqTWTZoyhIACriNJ8nHU37wUofPkC5Vc4OmNAVuXhequ4vFx77E6
 PoEUhmCittodPDHqp1ssr10D7IbJtLf9ijvS7pnOzhcKsPhk/Je3Y62beFFOEulB/NhWQEGcXjx
 UZlF8ntNGkrUqcw==
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

