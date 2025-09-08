Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087F2FC863
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325679; cv=none; b=fO/5OuoOniYRJmEd0sQ3b3lwrEn/gE5GYrxmcqPtXx/hTDw9b/qvMVWpcgpgUmpB62SkRrPQuugju9kgI2+661cMnhhhtMk7pmmYXiKyYZon9/NCl24wPqJbTUOqrx3L/nIzny0oT/pAlUbATO/kplY3wteEM6bVkwhNfQLm9UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325679; c=relaxed/simple;
	bh=HNTQqQJemqX0WI0eYRGH+l+1PjBhJi/4JkQ/C04BuCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxenje73KczmHGNsx3ZxRH3kHRYF148bvHECFCGap74JAbUBDnvMcdV/mx6Lp3Q28Yxqmwbj+8JIPNVHID5iOILoaJeLTdgCJRffpgzFjZ686rJm5sSCoWvCS2GBvFPsuyaeJr0izWcuCgMd/K+gnYrhpn0wDT5FZrpkCqHwzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8pKHiNW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8pKHiNW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24c8ef94e5dso34326395ad.1
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325675; x=1757930475; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=N8pKHiNWakR48wojx6PMqaR7xDdKIG16X9jdGNhR+Xd0uReWQ8HtULmNDOtbGH6TUU
         YfcCs6QbofCyDi3k+8bTLtn28c4x1Rpri+6QHd1nI8eTfaSVe3Ul6vD3xzLqffWTtTEs
         lE+3uWSBVazit3BHNcS6jKuDUzTbqusnT1+r8CIqVjT0ntWR0wqhdU4UtllxelE8wQcB
         pnpakcN0/U/r3IoEAq0t/yZhK99Ie/SOAgCfL+TZP5+BXEyAmNqJziMtHIUjL36IzVmH
         l5qLG/1zkTpXLsjiCFNDkrkZxC4xwm7QuRrfejBdQZBd862pBz2pSBDX7lzcBhHqeKw7
         zPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325675; x=1757930475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=kyxP81RFAN7Uh7Uqe1IKD1PGYyYay3H0cEvSbR26oSiLbRdOIIAeTvRIalolQ/CF8C
         gRO8b6PSFtZTnh6cayojGhO3IxftwrSdOCVuq5Y/3YmAZjh4vdR9XEqy/1KpLkJN+ozl
         ZTLTsrIPQmupVL2jxlpfltALeLN4Vz832r7Pjvk9CWjAl1ExLVnpxw1vHBuGfTQwgRbV
         JJgvyxJn/wEk8F5lHTZZa+4f2EuMCOKSsjTieVp/WrUj+CEYu4qsTbowRdOod1udPCbg
         czHLx9m7+plh0skY1+FtSY0IiiI2gqzsHqyE+YB/ifQ+OD1mVEz5FBsDq1PO0mh9NSUs
         kbSg==
X-Forwarded-Encrypted: i=1; AJvYcCU0uxdE6UVuxMPaJ3NyRdu/1XjrLsPA4MMyYPq+G7Lqwie3i4N+zAodO4DSoo2h34fnyDvNiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRGv04DHw04efCFvZfr21VOyktQAKp1SuNfrACtAlaHtzoXAKT
	vEm3KZpSvBn7q65NY+tP3kbNrHKERfK6cg40SFc+lBASDijb9mRG+fDE
X-Gm-Gg: ASbGncssvZS9kwqDcqWuHg10ooF/71uCpMuY9JDfaRErBA3UA7C53B1T/4MYikg0g3o
	/el08HdkudOAF2WmrKEmfvg0Jr9mGnPkcwZqoQi9WwIZToYgdjBOkp7NFsLZb9mWJieK8oYOQ+9
	3dmaCE7oMDmtAoyEPH6+BoWQyBjUPp+oWH9HngYdoFUDKv66areNiGyDVs4BZJkWbAUSaPRtCES
	33byEPrQVWmIyb2GGfWgnqYLuDoZafOcW1yWPKHfUClCJcJ5Jqv3OCn3/Ep0x7CQIOd61SKJ0v0
	+bypc44VFGDgplUXm1CzbVrn3hIGjpiVovKYZRznKes3lTsoE9jM320QC6qpEvgETQyPaUvk6xc
	qm+f3FznT+N7HZA6RaDhgQYbIc5/2jfPeFK4ohQ==
X-Google-Smtp-Source: AGHT+IGLk7qlbfVScOMCIeIb42XcLnwpLlMwiHFaoZOJPZ+XNLGGX7CNUjJexYFNYFgrdXDdh8bXbA==
X-Received: by 2002:a17:902:c653:b0:24e:7af7:111b with SMTP id d9443c01a7336-2517427bc46mr80800895ad.6.1757325675347;
        Mon, 08 Sep 2025 03:01:15 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:14 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:31 +0800
Subject: [PATCH RESEND v8 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-7-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=HNTQqQJemqX0WI0eYRGH+l+1PjBhJi/4JkQ/C04BuCI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlD34FCamS7+BvFxzQI9pN7EpC0Hbp6D6ALC
 y9ge2t7aEmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQwAKCRABygi3psUI
 JCtPD/9Ufjt9jmDhmxNUAxoA2V2hfzWrlQmETddcge9lzhC2G+4lt9vtNcKyoJqjbR9EcVuuH+N
 0SF1IYHPgbVm6HiVcUf9sAvi7pQpj3D0tXtvx1y3IIUONGg2MrYDjqbvQyRehoWYfc5c0DzNfRX
 9T3FDbDuaHmQWVLEz4H++z6nnstjCLImgqVDK4WC+QqD3R9vs4QHpkeYvyYKWG5cGm202IL66+Q
 3zfH37A0bK0eRn8dMahrHxWmRImZ8Us1Nm+Q2mVwXDbjHJ8h3PPyuCvggNGXgSk9sz+EuMYRuT+
 EAucmWITr9kYf6lKOZLN4aKXS8Gv66Us+OMTMBEkHjP0cm4s25JZtX7k85vC/SQ0+dNP5mJCITY
 IlA4Dvg1scmk5byxkrCRR1T5BiEdangbWzRvbr/JQpb0bb8fHGxqR+AkeEvf6IELA5cnelHEG9b
 pFXm5yUYNcvOWCJkls3XGyLILQGnP5s/suOebq6BSXb4G4f1qiU56y8kggJ+zRafdDKIzicZ4pa
 bYcNDSgadB939lrENMqO0DQ3yJrLCSTFPX/aEtqdqQ7YQ8WNr83VZJlbcxswJiQfIKTLfEJS7Sf
 T4Kr+YsEgfgZ1sN4PjE+SkVKbuUVPFy1lcD4Rd2t/p85VynzhTwijW/Pir/6Z/qyFdOZVcVPBg2
 UJkGyS4ezYQjliw==
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
2.51.0

