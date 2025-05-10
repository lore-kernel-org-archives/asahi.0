Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF6C238142
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889912; cv=none; b=uUzg5ZE7qnMqSznMI/xsPNJhP7qw7DWYSyK/ahbyIR9ax4vHbzv2Pp9VEAob0fpDPaSkA4RrRNmhDKtuWIC8WsTt9aK/TLHKuMqeXvtfVHFwUYj9pI9UjswLvFW8ShwdNWm4g0Tkx4+wksDspdGXlRRE67tWg3VtjBYlISLu/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889912; c=relaxed/simple;
	bh=EHqn1hF+O5cx1kCcX9b9emwg/l7WZgXjC8JEUTZtaNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KiLCmfqK+bXL97CZPyGsIoKrErgUt50VyMfd7IWunnEdNMkunuYcdeIM8dE/cQn8ndvN5g+VqakCWFHE9owjrJrgqTw95wfkDafDxY6HMl0gRLYe1i8mTryFoUdDCHu6QAMZyo3WpnsH+9HQ51kaMCR4Kq7c9rfvrFidSZ3S/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+XNB0Qq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+XNB0Qq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30ac55f595fso2893225a91.2
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889909; x=1747494709; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=P+XNB0QqE4RXB44RI0yTU8bxiR4W0mUu/1+BlZ3MJSbBvMA0ASuxw6QYvyehU4Us+a
         VPCtZOJSnTVYVQSEBUOEgcsWLuacdMG+FBQV9MrJo60gkwYwC9bKQw223d5hfhoA3tsF
         xnHziFSi9znY8KyTdOMvcffZC7vlEHj/A7mGkGEdRLIEIREmgLDC8Qrrj1sT5Yk6LXZo
         zxTNqFxiatmkC2kvmcKC9bPSfkTsytiQeKVCzOM4XubnOFdzPSKOuvHZ0n+HayJfZlA+
         bb2tuoI9X9pw2UMxIfM87ORwnZdHERDxYZKslIAWYUj5R9wYhi6wL03Q14/0h9ZW7ODO
         ovgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889909; x=1747494709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8V1iPWcqNA0HiKYEXXLEH80k6K3piZxher31w9nAbY=;
        b=LsoRq3FdMMwJQHXIFz83Dzq6DdaLcDoaOqfCmOz2NmnfVLeQZxVDGUb5+dNRnioJze
         9gWk2IPLcBib8PfpL0f47S8FvehncJbl95JDddMPygesGxiRgEfPZxHhE11sdasOjUJ/
         EpIIx9kBG0RJSOrm1Y3NJAsrjAyemhU4TeQPv2fTXBMfduGVIemlHIgR7teGo/bQqBuq
         a6D8JQUpcXhnMmwlngVtdObT3qpnKyTrNgvl/CRkCDO2UhsUrXWa9QsVZTnu9Ef3z0pA
         B1xg3pQxeu/+LhWu1hQYV2OaFlcxtcPWcLCehYL4SnVPqAWx06peb9OE+yDrr0uqmHNv
         doRA==
X-Forwarded-Encrypted: i=1; AJvYcCWLWbgJs59a8006wtDTm2JOMXwBRtr15awtzDYFDTTQ88u0Ce1b0S8rPFW9UUn+bdNRTtPfUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEojbf0vMJ99W48WTF+hcOaUrABFKXcNheh61IXF7RIigfjFqU
	0ba+jvcSzTDTN1yF6HpiTo6vsl9vMPuje72yQfpZOEWpVz2hTEWDVXdwFw==
X-Gm-Gg: ASbGncuPzOk95+8efMAju5LcS66K3HrQrDy/eO+XZe2EbJ1+QyuWoLxwQ0MD1EgR5fM
	MXNg2tqR/d0s99V1gf/WJfvyosWR/oH/ZZ8dLJQ2Mg7BNZ2PwwPa9ThHWUctT7KivOsQsiiBLA+
	RMdnCgxwgPplHb7NFX5Xxx76YFnQms+z4jyu9L6VZ/YPRWLmkq3O2DrevAjui1zy7MuXGs0wvS6
	1aH+quWox3dGztfkLG1yZqe9weP8XmCTygUGkgyZIZ7Eu53fXC9FLvKEYGvKf+Vffe5zMsdENtD
	Lzhc/qlDbM6GIUW+KdXsti1iiT8+e3BWaNo++C9YPjwQNGyQcDfkSg==
X-Google-Smtp-Source: AGHT+IG+6iuaHV5VMdUjI4NiHZ4ZYI6UNAo/RMO/6rakgw1KRm9K6rCnAM+HbTPpoBA2+u8ionYImg==
X-Received: by 2002:a17:90b:2d92:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-30c3cafda23mr10665386a91.3.1746889908845;
        Sat, 10 May 2025 08:11:48 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:47 +0800
Subject: [PATCH v7 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-6-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EHqn1hF+O5cx1kCcX9b9emwg/l7WZgXjC8JEUTZtaNY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yalP9EYa1Hto2s555HOXngh1U9zcmMv/j18
 10nML/8yWyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JFPKEACLAir2vysaJA4vW2/wJNXc3LFvdB6JbUIkeCnNhdYZBqPk1wOsy+4D70Zpndy6fUI+g9O
 pTv4FMrBHZSJGO1gIVgM4uy3qYT8TyQiX88ZGV8TEy7evFYsT2HGn/wmWmnKuXX0kS3ZsFm2QgX
 HqYYqPnINxdvSzgENDCWcqRxaelhXDu3j6EFVS2vIcJrODPFo70JquC+FJHi231FTSkCo7gxuIe
 UsU4DL4Migghp4vlXdFCmrfVCH8YEo3ivJuXHljZ150YJNKAyxV8Orfr7MiVTo1zsiiEeTuq61z
 88CwjDnbGvTwTYI7iFoXM4RHnMFiBUFDmyeKIiSizQSIOxJVjq31LbiXCGDyF2zFKlM4FNnKwem
 7loSz1HSE6p/Ps4RAN0pag2hl9DqPGdmevV9ZrczVaCSK2AkuNdQvw7qSzXC8vVY2g0i3D7xI1T
 hQLUE8XUtC97EkKkUXjXSx9wd3o0IMZO1VWYuM6Br+Q07NCv6r5H4ZTQtkP7+xGzmGskU6/IhpQ
 Ini9u3C/Sm8s38ZXLNJUo42/ciLHuJlpNiKFIogWlnAmf/3HZin/0mFixUTV1HlYIoPnCsBa8aM
 8j7yR4FDBuKbScHabpHy2go+ai36DU1SZVQSJCBLU3ZP4NErrfSoaXyKV3FYwNiyya8yXJZouR+
 2JCVzmaTrq26L+A==
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

