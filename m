Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B434DB4D
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988704; cv=none; b=ga1M5sRHiGTzlzBP+sWAd+sFfGIb1Wfyhs8iCD7w1ZKEXrBjCttBE4TegekcdE76Q2hCcvuBjEu955iBC30DPiqIqC5hq6ZNjwl9KaHSqyNd4BakKNRdyhdXhLuoTfHioCyA7Qm8/yuj3LWU3ftkRvVqXjDgwYISDnPZ97bRB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988704; c=relaxed/simple;
	bh=ZZrFSnM4qaLIjy+z2U/97ZkDz6A45/CxzWdqdPeWGg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqjhCqCKLov8/KLQS9aB4pgJQSqvzYK0u2JIz+3EpteWR+jhOJ+eKG0vJV1WWm02QPfzPAS3svrjb5SD1YDuFMxAhJNdcNduABljkOQGsRkeVXUR16orQwk32zELalgfEcPbPdO+EHGnEP1Wsz6748++ru4wXGBgAXAXyrOoLvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ccz3jWcF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ccz3jWcF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0a95200e8so38776805ad.0
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988701; x=1766593501; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJBqWPH2nkiaa34J/fXU+ba5HlDmsksob32XTdaDMY4=;
        b=Ccz3jWcFObVmLLasmScnZ5JPOqaFzDs8A+RVWgMdaZSeVq76fYbo3c++ONR0+gktmS
         Ffp4oEyzrTNXcwtigpjVNIovo47DN0lM2hy/MLhzzlc+TKOhBeW3itRPQGYss/cSQQu5
         gTZBbB+Ew/7vUg8N6cOlbHF+AhfGgAYFOMFBalDWqCdsBSUZxZ48DwnaQAgAvNuL2qtG
         oEGfbe1MpT4P07nLBlkM4c/pTL+/Nt3sgH61Gy9IQ1YNKn5rL6bMGqyZIR+hlgJncpr9
         S/4snf5R79s7aMBEwmigVl/siSht2yn8yvDOyvi3Af6oXl170Phg1ekFWoMVVhuCTs66
         Vphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988701; x=1766593501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJBqWPH2nkiaa34J/fXU+ba5HlDmsksob32XTdaDMY4=;
        b=Tdq5Nm46UbvmKrMnEub83ANsChS7hQDk5XeYf71FUeAo3B8fu45WAR5iOpVvFROi2X
         wDU5wfqOO4GFxWXp4N0pqHwH/5eRAbvaVP+3DXKRya2mxlBMoqLpksJGK50agNm8azND
         cALjQaRB8C8Q2cnk2X1W1INFWhXBW6WKlV4Ix76k9R1IPx9sTRVwis09nmjyz2XDmDsb
         R8ekSuH+lq4bOG+eR7TYHuF1Rmubev/rL2MesNbhPLqE/Gy9sb254GXtG9RC308gVOt0
         7dzaNi0QclJUQb6obtsnOI4/FIfSBDFuEKG2Xd/JFCSLmKFFjbXn3yFVyEYgr9AzMPZc
         XiLg==
X-Forwarded-Encrypted: i=1; AJvYcCUfnDvXW8JQcDoMkH6QExvJ8ht8BGjHiK0/W7SsEt+XsJjEeQB2V8KLrp69G/rWsfEkpi0RfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3iDnCh1P7G7kw1QfIkxcte4uETT1c+Xbkq+8xwGXvJMs41wAs
	hpQA54FxvaT0zUnXiVpnQbDJBgeH/ACysMm5idAqWheqtzwyVeeSHhWzkAaBl/GF
X-Gm-Gg: AY/fxX6p4QHqEaZ/OQLk7ajZ2U4/R3uBKLymwmuSEl0F1PednbdfBooPLFMS5aeeHJi
	D+fovEtGylS5HbPx8jSChxtPV79ZNE0xyXxSuBRfv+73jPHibsLbCiNpuqz8N5sRwUxvDACXV0I
	G2NNORqyQXVY4fcxotNHuTRw8E2UIVsWXQOvcAKuEOIM0KJGaCDFxpfCYiMTt/ei1aeBDwB4ye4
	hxQDq9CYrMLIY9wDDqC2o+uy+dwllriO617a5G0zlI/5QtxX5ym5jvJ4vsufMJxEzXbITB8a4U7
	hGu/G7WIlICJ55Pwmc3qESI2fva+U22FBdI+Equ82K9lxYkJrq9woiumofZnGeo36VknGAZ/NIK
	ZcmAqz1qvydUaZEseQkAFj/8n1Q4pLfrCjnO5GyQjpR6NrTYoi9T+aBrGFD6b7IRl5P2dCG7lLt
	tRRT4ap9nvJC4MBbxUXIKW+do=
X-Google-Smtp-Source: AGHT+IG0BRya6JcBr0mTcVAqL7t0D9n0v53qOEX5qkYR98IGq7dQZ1TKMwIAOg2C6RQdGKX63TpT6w==
X-Received: by 2002:a17:903:2442:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a0b62ee12bmr124556125ad.32.1765988701484;
        Wed, 17 Dec 2025 08:25:01 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:01 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:20 +0800
Subject: [PATCH v9 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-7-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZZrFSnM4qaLIjy+z2U/97ZkDz6A45/CxzWdqdPeWGg4=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlAGMO0GGZLpi1zAtxvLgpEJr3Y9rGS2lnzl
 VwsXzVKlU2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JG0wD/4xjOyi4wclJt98NB5Fro8UHmkJvVz91tpavZ8ogxOXqWdgOt1/EA3rU8KXW+O2rZ5IYHt
 rGFXDuwHqThtPxSUPe4d30LDij17Eqk09D9s65+BCUfRByroZKPgkuThHAbjGoFncAExxsEAk97
 ARE5Obg1xmTvdcNN+MF9YML5wxXzgiWsgZoQwueb5bv+uJDx6mn2Wa82iZL/R3d+2ZXyF3mSXNm
 nSjF3TvGGee2bmB5yM+aiNq2lhhQIgRjWyyoshfEgccWmWg74iMwXRrqFuyJ7yPvJr5zDateZzw
 t8AhG+FtAU1ZFQe5I0vNDugjZ7MSbGWF3nycpmLPI6gjrMSJvSXm+x9SN/XuiD9z2qb5LTfBs8S
 0zq4bwDU3RLO9d0hlOhqrv7C2bght3tCo0InrHn+7QXPa6kvrqO1KHmWrHY3xPeeX0eAT3F8oRm
 gBJCDa0cMxCD6SuvnsTGMDaTRZtxodGFwyUTOdrVEiUF4W2dN+66pJZW5p0uWcKSJJdNi4++OmH
 tY+8H0KaeclNhGqwJvNk3XGtae2UUbHsnbQr58GCGO9fUGOhW+6gEc/nUKhmxdlYKfygk3K6+9A
 9EYIinsD867fdYWbjzShMO5ggO3TBzTqmeqdSq9Mv6Qy1VXLyXZxxRKbWlufGEK26lQkutjh8zF
 SagzGtDXKJl3dXg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 303c0e62432281e899a33fc197365c70078d6ac1..d0362a1813788776f4210523efe33a3018cfef2a 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -668,7 +668,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -701,6 +702,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -711,6 +713,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.52.0

