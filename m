Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C882D3A63
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920555; cv=none; b=PGjd35e3mo4hm+a7OdcLf7rYOgliXR1K4KBTqtzPKYIf+2vIqzkk+4B6WC6SnrPZYe3UN1M/qrUoW88sV2IvoO9v4M/YOJiJHwVMWPBc0jO/jMcsukDMnZZrHczpPhDcLfnZAOZLMNY3kSLpeUB2SLi6QiAKIhGWIAAGVnhHxDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920555; c=relaxed/simple;
	bh=rJEh82wGCRPwRPPohQLW62LiSlqQUIRYkK3du7yGRa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vb2oBNfOPYVoQ5FkSbIOm0aUt4zbhf33UtXgeksGW4ELzVK1c1lVH7nReFKzYEAxrfZSP8ochnahhWn/y1g1jHtHcvRF/zQvukJaO5Uh4cH+DCWGQf6lwPq1OeRvkixhYlD03mc7XhkbiZWXixDnXj7gudUTLH7oj1Xay8oD6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBSyqxrl; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBSyqxrl"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso4810083a91.3
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920554; x=1755525354; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDVY+floFa2ezVtey4+H9rO7T7eR2nRSfvvxjj1eIPU=;
        b=BBSyqxrlKo8/H+tm3khSbkKh9LBdskHFk3MJReKA3nXSEUVr49qdMnexU/w+F6EWOz
         5bhVLoDADrcmQ+1vM0UzJBIKA4Csgqn7Esve75BqJ5V9O4IEtplgGtsaPaNJT+ZE0mZk
         Oxz7gestpBt9DWhIiDNuVgivMzcyigk4F0YrCrzgTibeJ8SD0UzwPD+xWN7BnD+ZDY0V
         gKeRXvNshmfGeiy3TkX+gwwRo/p8qb9hQZwyMpJyWKbgXwpxZTf6liJydf5uddNyAm6r
         lsfOjB0ia8gIKH1jNWKABnO4esEVlwsUI7su7xxYp5cN/YqTZR/VYP/z5tQ3piw/TyV+
         dXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920554; x=1755525354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDVY+floFa2ezVtey4+H9rO7T7eR2nRSfvvxjj1eIPU=;
        b=ZaFW+Euty9uqkGhxYBqsN8s8ZCSTW9Ha3thkaGxoXUPyj92mbev38oCB4tmmU8EzBU
         fih6czdm1v2qWUI0O/nw03PRFYX1C/VUHBBtN9ZqSIa+pQ5adsxYnnkKVZAN/+jB1KYk
         sJSQFH7CmInLoyv8SvMxdpXXzWOTD8o3tiF2JgNsfGZv5zz/NoEBlLoryDDISnj+yHT7
         L9rc5HO8uyj+Hdq3o06BOeuiWDEghspp45CqFYXUAnbJOgh6pnPJ+lhcpUh4tIyWCQHU
         q0/OVYVxKOOcVBDJKu2iXzWGWD0CigofqWi95EcKkStjAZVdlMcr/krYN5D3QHOWxwWt
         j5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV52R0yrsoCHk3TzALwrPfhIOfmPKSmfp7qkmpDcjvMi+Ztjecb+6PDjxpna8Pf5ZgCVfzQZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxogF5trdzhS9lgEGMgIuYEsiq+TbxTXdQnxaYWsa0xqWdayH/7
	Xf5ayJ98AQd3I0p88oBEJjAcpOeKboL3M86Wp5fgJzUs1AYFRDpW+RVH
X-Gm-Gg: ASbGncuO+l7H6k/xutyxnkQq1Fadha9eIl+QMomWIlNEF3RqPJwZhlJtBZqWgzx38JR
	5hPTqdMgfOWOplq5ByzBWlEIR8HrswGdrAmyAsPgBHs9DiZ8xRhEKYYVF/MWCzo4Rkk9qsKQswY
	FtZv+ZV+Zrc6tc0H5R62IeRs4EMIxmFm4jyweVol9LI6U8TQ4NkrMvmqvqA2LJuuCkKj9WDazxn
	07qTffFLFdRWfKFfYu1EbuRoLYL4c8bXlkNl1yf2h0eH+gTC0EILAALHNBMP2E4H4sIL+k79Z4I
	vMPRRtCciUJnhIVV0CNzdbS8Q2a9Iih3usHJwQNQ8NbqRn9TgI91wMn9L0Bm7zQ+/Q00EEB7YrP
	RsP6NMIqpLrd8ML/EjySd4pcZQC8qfwq1L515j3SL2tGKk24=
X-Google-Smtp-Source: AGHT+IFHYu4SuygTS2Pv64OtW/PfhQ2vvq33RBw4veHS8wGA7QxBbIvP3IPZUwQnuYvJwPanzLoq1w==
X-Received: by 2002:a17:90b:3951:b0:31e:ec58:62e2 with SMTP id 98e67ed59e1d1-32183b4372dmr20235148a91.19.1754920553651;
        Mon, 11 Aug 2025 06:55:53 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:53 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:39 +0800
Subject: [PATCH v8 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-7-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
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
 h=from:subject:message-id; bh=rJEh82wGCRPwRPPohQLW62LiSlqQUIRYkK3du7yGRa8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZBAE1ZeRU9azngbXDBhjZOrauWF+RbwzpcH
 d151f7gM5+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QQAKCRABygi3psUI
 JLx9D/0RwIYF7uC/co4Z4YfJCCCwa4GKOGenRwclXld7Mei23aSRP2SbAu7AdS5Lisyfe2ZnnPn
 oY5NZR7E+Hbv5az7uJqmlJhD0Adw7RYeTKwa3IzegadLYOIaOtiqYY+jysGgka6O9L7pZm8YpDn
 T6JmnJ8NI99qmvjqLBQre9fFV0R3h8tMPnuRIrt2RwdANnB4Kfbpc7m38+e/4A0wKbXfaDKZ3GS
 UnhiXU7GHIYMBeHjmE8JOZa+HKxses2Da49GiBDEPeP4BBDrMmWRY/yd7pCdRZxM20JkTpVhib+
 uTJMoCFT7j/+DgWS+lQuNPmzFlMv3a8mMG3p52jkxmY00marEBVFf4AkelJa7zMAa+5haOPNYHs
 9RYuo+LeGIlrTi7PjnqUCqgStXq/pgV1Qb8RFpYlfTUCN+5guVHjBrlbO9GB/46X9ganQXaAHt6
 MjwMD+1TgCgsVJMqFUPjnXq8vVgUgN6PmU8QCTkEnfPfS6oyWkPkXXp+5c6j3GWWMKH6DBC7SZH
 ngFn6ruLwIBn/bFK9P0iXNwva2IWVpIKplz0NF2TXcFkGBdwyMIiiYQvHAxgysB8gWp+9ysjqCx
 cB8hjO+bC2z6NZtIw7IRnSM5DNVM5Sfc+PL13ROLXPAboyr0c06WoaFTs3Q8HYSlBXBNoTj8cyk
 Mw08b5AaPgb0EgQ==
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
2.50.1

