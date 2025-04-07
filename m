Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BCE2222CA
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001173; cv=none; b=I5QGopRGb4OBV5mCFN9ZXjNpiweAaPFLwtJ+sCdOgJdIVWbfBKbVjQ0He53AO9mS6rTfWmKE9uUFE9sCZAm7d4TraELsyEpKsyGnDLIa1hdj9/Ebs/01z0jlonoXBiaJlkxA2eeiinZcGaFOy6VF3EwT9YWl2vYMD1b5J81S9Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001173; c=relaxed/simple;
	bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouYHEYrjR3b5way6WA12lyTBLWsVPkzVo7xQCRy4VeDcRKiyTkawWV7oAvSuOgrmrG0zkww17euWBx/yOYgAr56Cjq0mIN09ClqjIyVey9zcTKNuwcZAQTW5uyOCiNvD6CAbEyGMwqFovXLgDpoMfxavCosTV2YFPQHGH3RWewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxTjHS8I; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxTjHS8I"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af55e518773so2389561a12.1
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001171; x=1744605971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=kxTjHS8IYN95DWE0LroJDqoSvm+HqqbwrnB+gNZ18ME1jBw3yJ1AZXGQeHhDYKPwIA
         0LlOMTUyt3Mc21cE63TUqcxZJl9ceyprBnZ3nS2tLrY0CH0WiFL5vNluwDdxCC5/w4Ux
         7OXNq8Tm36UgD/QZaGSBntWTYuQzRSA4YELovguoGXACxU0B30iz33fXN42UxoQUwYYA
         pjRYdcxuW+GujCXTAvkDD0/H6RV2feNfnmlGZhMu5E+3/MTRVrAz/wOTPogHlValuCBS
         ByelciJ0kFNoBBs0FvsD5d8LsW8bsegRpZhETdy5HilbPWTGH1p7Yp/6q/yKtnA1tlYg
         8cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001171; x=1744605971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=vSq6D8Wl1iPzRNyszdfwahbzHvTmt/gBrZrBrv7mKuf87pytGScbrlJ5N++FYWeFan
         PExnBkhxuUiduvGm6Xwi+M6S/Wt2aqgkHCpO3wx955zC36Ib1fmR1S4aT4gc+VEz6MNI
         YzdobqSADvwUld2kcCNcCKMiWthP0FnAMmyFBOjgJEt3idbDT3l1df4MKJXhibRn+tLU
         m0/L45NtE+CUrnEeRxbtUsEfagKflWusxK5eUw2jJfeU9xIVVQSBu/36mteXHE6fIW2c
         du+4sf8fEEl4OV0cNeiWW/qNsoBiX1UNyBqLM3xmCcj8ZWuwxeT3gHSJQJ9RG+YQiY+P
         KPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeu70c8adM7hCeMVs8gV951ze+94GswJZKqo9yqSo21tjv/MLIAK20mqAEqJFmc+XljB82Cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrkLF01Xiokgc1xo3947GYT82ppvYDJJJUE0Mb064cijQmKZXN
	o2QF4Y9Rv+E0qjHxjxi/loeXzSVQn6Pafxf1EuaBzjohEPE+/KOm
X-Gm-Gg: ASbGncudCWz6ZWhaT2sppUwTn4bHMEqmdW6u4mVA+ftDJpqBAoL9LgCh4FirD50sucI
	/Wz9vyDNpleYB6ftYMFmO24RY1to/1ASLJ3BufcaD1QGZuROFjP4SIGr8WLBSNuAtD3QQFo9ag/
	QYW5oQagnPlg7/6dCknyV9uXdEk05jJyf/6HI+QSUPvWAoOZ+le5+XVd6rujwvABeG2qzBc3FlY
	FcLnaNVvw47hA/M2Js965VUYLNC9/1x2Sk/4+x1eAprfmRxr8246TroT3ZzN21Eqoq+rmlN2D06
	xCiC5Ofn8Z70ju/z/4M0+bf3AfiwxjYWsjAlwbexj5fcbKM=
X-Google-Smtp-Source: AGHT+IGrxaobhUpE/KKrj4rgCnJzb4I798A3JeTUshuwGCuxTpNwaCSNZ7EcgS9JOSvfkcezth+Xeg==
X-Received: by 2002:a17:90b:2547:b0:2ff:618c:a1e9 with SMTP id 98e67ed59e1d1-306a61ee159mr11785909a91.23.1744001171050;
        Sun, 06 Apr 2025 21:46:11 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:11 +0800
Subject: [PATCH v6 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-2-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iFZ5puw9qhFP8u5Nje2j0soWKWkUUFQDGlD
 seWq/74HMmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhQAKCRABygi3psUI
 JFtwD/9QIvFD8R/1BTp/iJHipmTBs9PZYMuBIs3cVUwC9kIXc0+7zHN5ocj1qBmkq7TkKqGg3wG
 GAioGthoqoUVd5C9RXfNdgojjnVXTXO/8fQVRrWftQYMXb8orZXKBXZuh+BEQ9hxzowM3Hscjb8
 tC/wh+VGmijBEl3mxLbbc1ONfbS4IoX6m2NccKLFAE6syIN+izy+2nGBHXulNnb/GqR9SeiT/c2
 LPW7fJD9WXFe0k/gVSD0PMyacqyDdh/HS+uCfFiuriV+53w87Jh6Aog7GH0ftk4sollgTrGxxVy
 f2H37/PRE5eEVTLbDux0PC7tGhX56exzxY7hMO12x+6nx2ax5L1pu9gBa2aVz9GCt11sSL1ZX0d
 Sz/VaJhDyvdG1Onc9Tt7xWlMPfZ3Tpo2vnjLf8/CZZqnEbF2NiN24qZ5wDwZ8/ebgoFPLbfmRgM
 6RUYjPBpcVRArrNu1KsBKODpwEGWdYQ/Wn5oAmOGGUGQBKove52Vx/BOva0JexTrbjCtIZnGhyW
 ZwmBRryhdedFxcCY8YHYsHLkpSKMVuP8EVw0j3Et9a0UVRSt6R2adV4j41hBzZoAEXOyDsyC3KW
 LNNxDgAmJhvlKgrK6rkVYFD1gM+APCwQP0mIHuSPJR9THsQ7eDS/G3vn/6BeW1bZwmbuGvcMr1x
 DvgL3hl9tP+PhTg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Skip initialization of PMUv3 remap when EL2 is not available.
Initialization is harmless in EL1 but it is still a weird thing to do.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index df9a28ba69dcfad6f33a0d18b620276b910a36ca..b800da3f7f61ffa972fcab5f24b42127f2c55ac6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -646,8 +646,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.49.0

