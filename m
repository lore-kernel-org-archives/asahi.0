Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CE23A58E
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889915; cv=none; b=OoNfGXfQCq3hKw9me4wq+bXlW9pgejebjOuHDBBcCgIE3qDoxkPJylAGKVwlMCETxOMqVxXElIgiiS9vWrmzD040G/+N1jq+q22Qo5UTh0xksj/z0VHp3EaP7Swt2IA9jrO699SsAXmoJW7te/PZxJSXE3mPkqFo5CL+miizcdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889915; c=relaxed/simple;
	bh=rgncqluFC8hqHT0y83Q4VleXE9Vishjne/f3KrvYdxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpNFwLyLOeV9YAODmDX80h8r4y7BExUerzt1gClGeD+iynSKLDxuD+LUkyXrvp8uR4/mGcvye17JZGgp+285jIXR4422Dqm58k1+pnlTHEaV8zdU0EIz7ZWUuFBn9Ks2tn6C2KorD6FHhRI6dfSaSigbInh/BX6J6L9InG5UsAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU6CqFTf; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU6CqFTf"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7423fadbe77so1558804b3a.3
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889912; x=1747494712; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=SU6CqFTf/QUZUDsclqNILU7p90G6klg5VeIcmySsphbsi9aRaEP5IwYLJ2UoEIbXyw
         gMiFcJBCzw70IFGjtL5OctpII7Gox6umMj5/CMQR36sGTwcb1leNC5GF8wnXGqGaCD7w
         50T+oq2oyFgAR1GC6l/S2qakcaSieub9WauZV58I479jZ2W8PLpUuuRe04b8EPId8SBd
         m7W7FGi2SF20Jx8sjyYoscDmnwNBUQhHQ3r9cD9srby+Ezx3pWG3pthWMSDX7DwhwqVv
         F0Drbd00fq5iaQOiaZ6OaZEdhePZ83rx6pwVSVSvSzxv+GWAJ0wEIw5Nnsb8sbOOhkAJ
         B6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889912; x=1747494712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHnX3hiTgygahZWce81xiavlKw/l1jLJfkiYMRd1Pzk=;
        b=BITywgrC3bvbcWp7Wxk3r5nG3xXuZnKfjVR9LxCmzQokCDhDg7b9jlyLKyKqMH7Gnu
         BQT2HpYvbQpxkBqeqPkZoYL7zqasYOvnFkNyUhL15r9Vmz8FMl8hyRHTlCl6jADp3lf4
         yplsSlYFt6ZbjGY7wG0xzxofF69qvPflyE7by8ROEIbORQG8yjiEILDFyTH3pFY8TJka
         b1p5MVhbfEVycJNi/jvb7OFu4NgyG+u1zWWlV5p49IfHSa7rHY04ZtToCFQWVbF4CNfT
         Lj8ULJkW0g46T6jTyo9N2o5i/xsSnf5BG/C40IRtA8CdzhmzjPKl1sKsFb+SngjymKUt
         zi8A==
X-Forwarded-Encrypted: i=1; AJvYcCUodsFXfMCy4/71ZCwTBDXoczM7OTBuPm4tZxNfdzHVQ3svJcs6GG4ewAV8CjnDXDK6yrsD9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7gy6HlNxN2yQ0jKOgNYuqFSJdwUcTTJi7MzuOI0MO0qsG3jg9
	smP11sv2Ng9yqOoFO45Vs22MMihBmymgxWGOpUqdE9hSu7w6ippmLXxPjQ==
X-Gm-Gg: ASbGncs2knFSrEdMoViI5oMSpbaxdXtXroSN+F6bCbrAjD2sTHOVZ7FpwlS2zyLZzzX
	zt2xBqyO7ERMCRubzfqS2Y7PqOdfOuBNuLk9m/63Diw7cjYmZclGJLD3s7cxjPmjhPgKAUW2dFu
	lU8M2qFVWu+D0YNeP7V7JbESBp5JVVjn5pySCvoJmi0H4BlNaEuDckEm65mWfw+81dK1GhQxQwN
	6vnQfJvhXzBW+QaVL1FIwNhTBD27r9R0RqP1s/+wsCwDvEQj9fjTmeMLQV0sk5AEvpxzH/9NO4N
	B8qKKInX5vjdIeK02DXnrusDDOTqBFlw1yTVOgTXwQ9LBRt74n8ddw==
X-Google-Smtp-Source: AGHT+IG1oolXpZC71xiAK1KDLMdOMfFPZFR+zlNsziZN127vpwNtiOQFawx3Ol2KIxb9Dh20vgJuBw==
X-Received: by 2002:a05:6a21:1645:b0:206:aa42:8e7c with SMTP id adf61e73a8af0-215abb03fbemr10867630637.18.1746889912215;
        Sat, 10 May 2025 08:11:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:48 +0800
Subject: [PATCH v7 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-7-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=rgncqluFC8hqHT0y83Q4VleXE9Vishjne/f3KrvYdxI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yb7rnuCR7Li8wbbvfQFTwLfFVHzy6bxk2ON
 /21Wc9QrAmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smwAKCRABygi3psUI
 JF9LD/9CH1pB+i6CUmG4pNuZ2YBvdZwzfb8JRt6cxM/87YohcZxQbGI/3lrVqHmcaLEWWyFez0N
 i4Va63nsAm7S+vWinaCwzBufEyhbneBRTmL+Vr2hXow7Q1v0ubMg5llq+e11EZIU0SwkenR4izr
 Cf9suozi3ke/QNH6RiOD/8bOHfoLuv2BhefxXTf/PDjO6pWdJqwcyk5SGFOieFpSZn/Yi6pVTlI
 78zH2nSOqAVyg9/JfjPMcE2ilWZUWDhtciYHclc3oh/Zf7UW0KBtevYjTsRfJwag/hB4ESaeDe1
 UjVTqerq9sccgDDRqIGIWbtuCHQWC2ru2ValsaKUr96CIlpBVMoVigMpCymCXW261NWYvYJDWYN
 c5t7jhHYPkw3FOPAIs/38lW/fpfruX76X4uOGcpJAG8II0qJ2IaDOjKGGSmegJhftIXGKer7gkA
 2UUYxAcQK9DlJgLrDNYbvmo/5mRyVI5OyntCY02k0BPCTvoZH9HHeUj9rzdAH9ujEAfv7joVBiL
 YsSw+zN+TQTQlPp7gzmPB5phcoYVhhBMnTSGnf40L6fAT63gMrF+HfPQepU6GPQMPTnqx9oz835
 ZKldCvRWQ/i/QWgGWqpPR7HRThpmRD1Pw3c87goMfWaS/DGX0+jJjcZ2nzx6NJT3MfE+qQhmx+1
 bl++riHSQxrXkUg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index f4d8da4a8aa0c197cd16af422b33f4cd943d379d..74e9e643cef7f9a3c9ed599da36cf9b04b124810 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -669,7 +669,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -692,6 +692,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -702,6 +703,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -712,6 +714,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0

