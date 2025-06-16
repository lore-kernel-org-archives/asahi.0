Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49020C478
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037556; cv=none; b=Tk92+Ccsxyv2chdR3lG8MeA+RNfefTRXd5bHm8i1REen0hLvM9ajK06uy735UxKvG0L9fa8tk6D0cCDrFaygApObTDM5xS4pgrOQakNBhGruUx6wyRo7iUROpNnnswQZZB7ZVFNakziCKc1yCAMVYPClNaLBGlrQIGmJfOp9ADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037556; c=relaxed/simple;
	bh=EHqn1hF+O5cx1kCcX9b9emwg/l7WZgXjC8JEUTZtaNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nENjSL8DRFiU67EUgCSQHQHpQfZK5W1a7lIn2zJr9AW5IiKOjN/ZJjiMHvyPx9xS0bRRmU7YDqh8CEvjP3M0xXlRe83dF74rkoNaZyuMtJcgxUNNQYwDnum9TrvBYG+Xf3DlB/2B4ikEVgq92oYH5EAFXlcOL/t9GToty95NMOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8rWFG/8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8rWFG/8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235a3dd4f0dso24756155ad.0
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037554; x=1750642354; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=f8rWFG/850ZXD477B9DN74/8hChti8vx3GtRjIdn4G2TCm0IrvaC4Qes4P7VK5vAY2
         K6b0z8CR4g0XgnWcIcegPwefFt+GTGaWzafftldPIpIgBQHMrMideIZ3/75RUngFSqUZ
         pT2W4qJqbR3gC5UqdN6bDvC8am7H5v9Vcuj/7B5TQ3mCf8A5ARyIRSPsTG7xGcMD/aS0
         HzY0MzL1I/0e+bh9BvDoakWEbyDJbOx9niqPuhTHJfkOwpgNp92UxMAQgb2leCkRu6qV
         w89KKJF2DzlMe16HSwQQ5OTFYbwgGYNP2CQQEYG7WuGkakUsf9x9LEYo1UArNqE5iuG3
         UZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037554; x=1750642354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=J2ZtVEGvUYkGTUws1nlK5AgJBPb0yCMrunqwA3fm+4n2PAZmFzYmw8F6p4+c/mYMPd
         JRUpzhEp2PQTxp/gy/zLizD6tYAJqfyszqqSv4IxIzUaSxQPG84ShNu9CHeCqDYnEeOJ
         kWiAGbgypxfrhx3yS1QQFe3FV0EOmk/bCrTrCpvr4PZDJLRGy2E2d+ZWBGlHNhmzNdZ3
         jPI/VFxABZMG8eORbEF1wkEosiSOjPmR1WksQgFa4dtUdWY5v7nfeu0wzDSy5+pZ4BDv
         CmAGGt6RMdSvxEPK0iibR3YhPfbj0YK435hpdcEDi5drCQomsXPVq9VWfW2IojMfLuMs
         AxgA==
X-Forwarded-Encrypted: i=1; AJvYcCWKb/nGrU8kakZIfW3hwHrhk+Q5CAnFNqD2aqtIGRg7spgQAVag3qz/RbnijqmsiFmP1CP6Tw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9xV22ZMOxXduZfyCcxOLujPQwB+l8YXTa2yHIKh2K4DNPH18u
	c8nmhb8SSE6qAW26IlR3qWT2FyEIl3ev9GZw9HXH/oUcsVsXNzx1IrdB
X-Gm-Gg: ASbGncve8oHFF8Zv12CmMQCilTyNpLykXvnYvjtn4TYmjhMnAvAd4xk6oYYL4nkKMsC
	wIcft/LETCAjsNpwkFmtp657i2XLOmd9ITiUR1jTklJwFwDsL840cfcaPZgdhgebolXAyQlxWzJ
	VMfNPUeTNOBqF7kQ0dNF0Ug/p2/2xcByF4b/oI/yPFvBcuiH5UsE8zFW/hWMcOuhcKhYyIN3Y+m
	m7DetG+ffjagh/OK2LBjUqgR9Q0JDKNWhVq8AP/tfpThJsqA2s9MZ38jRL1YGEGz6Bn6e5yEB/H
	/GNTtqlZe4M3xsjyrhm7wIGz9zqcIlvRj2aEG93RgX86BG+1JkcyjmSQi9FDHi5pREnaoEKvR25
	51wY=
X-Google-Smtp-Source: AGHT+IGnYwyNO6goCwhqMS76Pt1h5EgguWJW1w+NAgLWXSvJ8YRko+g652YOdF2HCeek9omQa3nO2A==
X-Received: by 2002:a17:903:3c25:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-2366b137c14mr110398865ad.37.1750037553638;
        Sun, 15 Jun 2025 18:32:33 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:55 +0800
Subject: [PATCH RESEND v7 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-6-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EHqn1hF+O5cx1kCcX9b9emwg/l7WZgXjC8JEUTZtaNY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QXUmwc9/dCynBWE/WKymn4LvmWDoaAkcPa/
 twzLeqXmI6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FwAKCRABygi3psUI
 JJt2D/96iuNKzAxGnEHVosM27pNigeAU5uos6CMZyL/eSOYYapNkzJGuEJOz+7fmbN+kamRLRxd
 f8iUjNFO8N9IYliG2cSGn8hV8NudpPs+0nbt0Iwz9QaZ0y+1XPMobYMvrRw/DzYj/YPJ0boaj8P
 ZAHPMAnw9roc9EoJzyyvj0+CwkgwVGZ7SvuYWsAJ1dMLtRTF0Uc4mtU9feG3KSn8xcODyBwcIzs
 eE3aNyPEtCBLqh26Eby3t7EvnNlD01HiJUIIqQAT2D8tHvqSwuHBujet9sgHIw58UjEz4h0vRWm
 JhsJzu1IcgoQckHppjcxvB2xZKd6+Pkoe1rmSpzRPJFu16DGsD7sCOYJu9dZipGb+RUBWmpiVIj
 hCy+2FSj53gJvQ1TMhO9kCi+4Dqz9O3VWV2LnC3/Sd6FaYJcy79vf8hFXy9sc/OloohbE1+7xOy
 unDyyWbfXnGKkOw68ocKgvFSZinOEtgnGzsw0MPrllKDoB3wmXTUcAOrjySr5NBQJrZHFjJSNfz
 4OX3XhU9PKPAb4ZPix4I/LW00wGMyaJxhGsN1bkS+mFkX1tTaW9OPZYUXouet2u5E6GYn433WMb
 IQrseHjlezYTW2fVewcsPYXJqXORyZfrSziRAe4NE/8YvG6iUVjYdBr3LdcjVFNDD3p79jFyz+Q
 DTwodajb9kcd8iA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 6736909a7df672a08938a392d450dc9b5b7bce9e..f4d8da4a8aa0c197cd16af422b33f4cd943d379d 100644
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

