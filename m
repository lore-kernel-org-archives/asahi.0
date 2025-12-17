Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E834C137
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988688; cv=none; b=gkpL1M7/5maawnLX0yj892ScfULYsxWjOQEe3VWtlTTZ/UGU2osWParOVKk/5jEHTZI9zfrI0znyQr8/UMPZAfT5ILPe8t2kQxCY5/U/Z3NvUHiqKikJ1vA9v95EhYcI8BsQ6GL5Efvx4w+3A7XCyyyQVYyh7YgL+mZQYtiX1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988688; c=relaxed/simple;
	bh=T7VIuEp6hEe3RkCETbS7KqP+//z7d2ZDmQMS7i30tSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DMw0qVS+HDvP02f3rIZNh5uQms66xAr69hR9ZTAeftKkcR9YhRW3VKDmOPIWAHxURn1Tzn0NXzvXZmxEXoF15C+2pACXK/Cb5Xs1L253JFbFIIsgg1DZXpeuJhLBbgIEBxm6XZMFMVfrYP6c4tK/yr6E+DKWLWAACovyP/kzMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWRegv7k; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWRegv7k"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0834769f0so46490505ad.2
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988685; x=1766593485; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=TWRegv7kmKsCq+3qigFppL7GVnpvlOjspDGttzNbeWX+oQ+5DFzzZgojUwnl5GurYo
         h6kigJzYpBMiedKpxL+7jv/g2yBsr969AzT6dsYvY1e+ANG31KWjYfZKwMAPW+pqCwks
         tgj+qDrDnEby4tRU2kk14Sfnl76fdCrrWVuPrPhrNAzYp0D+/2O6vIYe6tBOFtQkB2i1
         doMZUqCZfGpOHHjc0+niRCpsgP1DfW8Bt1lDTCWYIIi3akic5T/OsrnTwG84JgGxr3+w
         5C1obknD2yLrAzQFqjUmi2UHT/mgNH+c63PiYFtSRXWMHqJPk5jZJmm68pn1vS9moVJc
         Gc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988685; x=1766593485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=hQDfdPnp74fb4lhLIOal82h/MNEi1cLati78WtECdGTgoR4H2+Y8nAQc7sp9JOcDnm
         TYVmlf+SCOCbEs81IpD4kTRMmeKJn/p2/ew6Bx7cXpd516xPjspht2iSbjlY6FDKt3h4
         yQbixe2Tr9C8pl8ZC9u9y2LAij+vR4iKr19W2FAZJZ2TEWja7QFSqdJRYIv9c+vgGBdX
         xbxABdN6OonhJ7ZO39UBKean5n5Bp9gYiiEOXF2HnXdcEkSu6exJsQ5e0bg34clBf9pb
         x9qke7MAZLhwyS2OW8CDzQedRK/8Y2kIAdxKSSe11fOV51eFReY06rpkn6wnH9U5/P+N
         vIIg==
X-Forwarded-Encrypted: i=1; AJvYcCU3CxkBt0l3CbdL101+eo8qajc+QsRSmZZq/JFbXO8DDdcCstGZ2E49pnGL+Xx16+BKJHj61w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxR2ebHRoFobHuTDj6ny0ewhs5kTwIo1OrMVLbB3yDCjpZjN5ab
	wA8RQ5s6jEjHpMZSH+zBixwnrYGP8ml5AB3XeAG4y3/MmVNj7lZgl62j2/Crumzk
X-Gm-Gg: AY/fxX6k6ir46tHZyTqp1f7Tj5bZvAd6V5kza+yDo5PB4V0Jw9Hwn9iCjlv8g+NM2rP
	V5tqDNc35W4Dd9bO0mEE31jezFJNJvyYi8RxRdyA3KjsEc2lkLxvOzgsV0hHkOKqyUbIfJzhqKP
	JK8HlXJBOp2uCsXuUiKSDMRk/oPNXAuPUctckkQpmk2yxGTlDnIqLP9g9Tm08YQJk+FKPzqvYLP
	EeRzXzfEgPbdhVxElyBO+pT2r17w9OkM3nMe4h3IRik8D8HUdq/ibU53d+0KMSY+gFR2MNWNHAh
	vXNgu0XtAXpeJBfP1t0q/Zd5dkBayMNYrwWHhoKSXuhv4lOA6CgtFe+QQ+oIowbvROb6QNWplgX
	jTYXEsEtsQfa9w+ZiTaYrToSmh1Iq8+2pDhjzndbEyt7SIfhzqYClspW0NnLp5LGKD5jFEERV3U
	9KEXpef5SVq5BG
X-Google-Smtp-Source: AGHT+IG/nquZVvdb7hdBfthWotpPmdj/WUeQ/0emdMCtPLX4TCGdHlRO8AWzO6VXDeE101kKUDS78A==
X-Received: by 2002:a17:903:4b27:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-29f2435b8d6mr184902615ad.47.1765988685325;
        Wed, 17 Dec 2025 08:24:45 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:15 +0800
Subject: [PATCH v9 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-2-4deadbe65d03@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T7VIuEp6hEe3RkCETbS7KqP+//z7d2ZDmQMS7i30tSU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlAE5NDqs7fuGSBDfaoYGlzVF4qIaF1lkua9
 vndWjdJ4UuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQAAKCRABygi3psUI
 JIu4D/9aF7Vmpryy6HujH92+R1amWBbT29Pk0lgoF+TezSRD2mGenGzsAFgeGPO1uhu6SNcGhLA
 9aovgC8dRLUhnM+lq07wJN8mog+EtcMVDUCNPbS+lOF+fm2lUb1E8v+mUh2AiSG98pPOXyxrLVb
 aX7utsSghAD7AjWd+CDTx4LJxDbLVNs6ZYCNlVMxhz+einkIjKBqs5k1+M1omv7BYR9QSY/kyU4
 7yfSx3/VqpK3jdWJnXMhYqLM2a4iwar70Fa8v6zCUI5i4eLqox4VsBNEKcmWiYZk5XKQC1wj0Wk
 gKs1RVHwkOPaweHbQgnnQQOw2lAl18Ot0vvP49Gg/ZGi3wM5s3C3PXqIBsu+vBYthkDeghuDWod
 SXN1xtbIfDPrSdruCYMpccow4QJv2+aTLMFutcf37T2prLmgRAuhVEzvsFsQfEmGgL0MWfgxupM
 8azf8sRLi5FuFbdShEK9mwZPX9mrhc4/QkSJzYc1VUtX0U4v/jxWTKgFT5mhSegmsIpeP1EqUHB
 v5L5Jr/PiJ7k2UCXoKOYHLc24hMgpROoVNyWt/DJaY0YKeAu5hohiEPlbz40CCnOa7mQDGw94qq
 MpvpFbZ5v1p8NCmvBMCDOij33xk0cusBM0Ep7YJmCftcvETI0FZOrnPpHIXcowieMk4zUfpnC1y
 AURR4XPLwieqCtw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.52.0

