Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09DF223707
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001186; cv=none; b=NTFSJseDrYQiZCK9lHVMk0tQqdJKKTe98StafXWpJ81GbTN1Y6KLPTROw+P3t+NvnfJUYlHQoh8GZeSgHCLxl9lMuMSe+t9MoN71c9ndMxNCqTxuSUiCa7plGX1PMiUkMmn0wsL+fh1ViFOwNjSk8DMHuf4F7Tith1GblupPzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001186; c=relaxed/simple;
	bh=XuN7zsZ7YOoemig6fmya2Ywu9aWxTuisbfQnSd0HHz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRPHIh8zLugMkF3NgH6+tD4bULR6buJ/vQpzTXCMot8j2wQqM1AlVT0l/sWCFTDZv990HJR1z5q+dDZe0IKbohdlFrWqYQ5cTH8wzGFTJGRf6rYYIxNwQbq4gFdU5BvPv+bdHKcyUYDQUhoYPXXIBermO0X172FqZnfOQQXQZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgvxBKgC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgvxBKgC"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso2574533a12.0
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001184; x=1744605984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=RgvxBKgC4fXIom67BbCNGdFG+jxvVbkvYwWzZQa8qmKIW5LmPYaeIsm1oV082Y5zkY
         cTYtYuMU5jAc3hRttLoLDhDIqqJF2XW1XY4w7Xbsd+wljjDAp5d18HIBchCyXsEltBFZ
         s+FTmEaHIeUx1+gfzn4RScFEYE5WmEsnmmuXf71XtL+mRtDTbiNpsEUuddZ8W8oYrLW9
         0fB7/uVbe3o3lK5KD6VRc2qxwOZjWKs98od3By9om68S/LpognQczbnADOUzKQamP+yi
         WgY+Id2nhUIuV79kEyWwZdQqaOeSHfezSdbpNrY7e3DHxlmlTzM9dlAKWg3pA+RH7X0P
         0Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001184; x=1744605984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=OEwn4uJT+0AsQyCg6ATphDj8h64zJwvCH2KXSHbQ467SucL4fGYwZN+YBgwnwMv/gD
         nYDM13tz7vg2U+NWOhNzThuI0ibWe/z2wEnX3GdMtUFqykW4ztx+D4Z3o1dPXPGlqYto
         VCYlQYXPTrziUWRNSuRneKWd4a+I0cEZpHbiR0fsSzA1jsDUhG3W8oynPl9sa3n5D2px
         FvXEQMWcYY3qNIMna8GBBhGiB/i1jKpcfQ7/klRTZucJwdHfkNeP0j5t5c18CzEf9Ftl
         CEhuEwulg1lcDoWqW6OaGwf+0pGbFrlYDORd7qN5F4n9vMgjeh3l/nMdwxWMcMXSaRsD
         ipaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcNMd4CBnQMHWq79KfSlMwTN8God13coC8WMvoQKk7hKlrSN3dEBOhfk8bJA7C08KC0LvXZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyJ8RerrUFT+KOrrkoMxjMo+DQL8eQMATPOmVZnPeqqoqddZJb
	2ZZhGQ0ysfezCeF9bAIlvq3F4PTWpJ8YkWwFQthtf7nPJaW9SiPB
X-Gm-Gg: ASbGncu6oGurqTabA6IFzx7PzMJuNmreXYzBJi4A0tr8gqbqKVTgvQdVmk+p6uApQUT
	nJ7h2Bce2WtnMC0xuQ4TTY60MokU9+z63nDNhbp+nf46McpjsjHxjjaE9RgWT5VbIXxN5ToOfJm
	zIdtDcRPFyT/nz1j1n6b1eeXaC7Mio4+wpqC5RK+2RHr/zW83aGIaHjcI8BW66p0lL/0GrvtM5q
	/EUEcTmTXJ71gpKiTxoEtoFH44fvbzB9mtGi+5+SjNgF0YMC0PIDjxm3bm27yXoCB1OhlirO2O0
	PfBZ1LKk20QTFGOkCj0iJx21yRXFl6mOBA94/Nou5Z6xDrGEmJoyKjXLhQ==
X-Google-Smtp-Source: AGHT+IGYQoaK3vw8XmhPvcq6HkCDrn06T9cMzDEgAiLjyJ5UOyzNsi1lR4Ihahet6xHWzu4E4Z37Rg==
X-Received: by 2002:a17:90a:d646:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-306a485e486mr17007211a91.9.1744001184276;
        Sun, 06 Apr 2025 21:46:24 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:15 +0800
Subject: [PATCH v6 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-6-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=XuN7zsZ7YOoemig6fmya2Ywu9aWxTuisbfQnSd0HHz8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iGrPE67Q+X5dil2ghBm2CGl7DhIEIc+JlRJ
 NJTDrRde/CJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhgAKCRABygi3psUI
 JAGoD/0YlUpOe37l+KbRTZhMKDfhWXru37w+hdyNOlWkR7VlVG6Wm9JXOoi6TZAfmZ18hLmEWFI
 ApstQjHIziX7xMZmCLoqJzhyz3z+jT/hB/KOZkyqPuXGP9lqXrUv+ZfwOoriN/TxipED4iaFQ30
 RcZojMN02vgjs5V/q70m2yCDB0woPyl0Hi5veJYGk9gW/eWkV4/M1SPbLPA6hjhcPaTBwVk4BMm
 AFYl7Kwd9JGSFjmCX65dWHCEF/oIyYDekVF8eclHld0rb42++mI81Be745a1LnQlIyJ08OZ9aKP
 2Jt9hb1zXMKZZSShjEMijmFjZJjKRMXrF814vXTis/Zz4lLDEF1RRu24GGLmttLmtlvZctbCS+m
 fMAsnjibZCTX6m1QeX3rL4kIdzRbf5AT4jdZFPBXiFAiZkvqNvgxaQ2pxrHhRbokO415JrhDLhJ
 tynSka+I8eH7afYDNUZ8ZxMPSsI+DnELqidBUYQ8Kv6e+zJQzqNYq54TJ4A8kUylkNLpF1wsszZ
 NeOO7hm40HKZMGArEfsv9cgXxJahNEI9jOs0bj0e+fqFzDXtHY935bLrUjOMNYTRKMETpT+KWkU
 hkbrfmnCimvRl4LuLLJIrPS+jEna8ywL4Gh65CecJZB6OgIXY7BKcLfZO7UtsRQx040CazpLyoY
 lDfz2AsMUSeJ7Xg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index f2566a0f8d330fdc0d71ae298f16ee9700a13c23..38fb9200369c11d0d7674bec4f350915c67352b9 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -660,7 +660,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -682,6 +681,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -700,6 +701,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -709,6 +711,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.49.0

