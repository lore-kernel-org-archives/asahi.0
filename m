Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF79222590
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920532; cv=none; b=IrP0NKq7sHgM5zoJbkQmpeu1B4BsrxegfbCrTXXQB9hqsip2UeDZIqLdP2uUFxsf3eyrsKfE2hvzaD6SnZ6m8GZZdB5Elxof0viwAQ9Nycc5trDERsYnL2TGdsICKXOCzjLBv8BdoDrvi7a5CCOkzmiHIiWEA6BK42mwBmtfJq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920532; c=relaxed/simple;
	bh=/PeiCZRRXTs+WYDUarH1jFdEbam99TBMronNZaQIczY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBTIkJ01baygxDwqKLUat/JIJeM6Qf758+zQYSIUFW9umXZe5ajEejz5o2hTuMnXxLpxRfGzbRUDKIivuBA/kFGLUhVU4zV5qTGzwnFaJnPBvqLTnvQgk3nUT6O2Nqn8/v3kGcCZmwWcfdY2VN/DL6qXRdtNevIgQRwm06vegTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpeG5Wt/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpeG5Wt/"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso3726720b3a.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920530; x=1755525330; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9Aanu/g+hL9gq0ALIBjFsl0W4g2TJYUNRbSh54dgYI=;
        b=QpeG5Wt/yDaRKz3rvwlYyuezhi9pMau1LMfo6JNxk3IuQKWMCnFD8c8UvmYkqisz2H
         ahzxl6nJNPPXhrVlfFuqsJGBonCyeFrprn/Wf/uueXxQ3hzj93BiBvj2tLcVUNV1JINj
         tLvH095bGhf6ueLyJ4XgTlsWI3mqpxMP4ncdRlFFElWYlx5whS0gy+vUmR1IOaeStU11
         NkP24q/NMP5xfniS+rRliENWSnrR3ExAkrKSVhOkZcVDL19AZd0tgI33vpDKYwvBsTaS
         2TEUMRrnq71qHkSjQCXJipvJUYTw7rR9yvWA3vop2Uw5RVnHJu3Zr5PakHXslD2IjLRq
         2OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920530; x=1755525330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9Aanu/g+hL9gq0ALIBjFsl0W4g2TJYUNRbSh54dgYI=;
        b=aG9v6bc1Uv/kkiC6pD8Cnmw4EmkHXyRteYOwzVN16MuSylL+/J4BLuu7HL8eFIwSf+
         rYEzH3cFXWzLtE+QsjbvSrDrMHrZDh1jiYUUJ7LzKmGwcY1E55ylkm+KSCuQ/cHf+BU+
         rrKfr32D3Hnyp/kDI1BzPIvftWdpVInbCg8ak8/8esgCYUG5yysT7n0C0XpFikYbwgSy
         891iQtxlnLxn7cIQN/56hOhNX87j9/xEQ7+EWL6YJxo0bXaQwDHWW90IvaVYktR1qNZH
         TXZDdEqRZC/rybwFtEneDgPRJNivBy+WthKUDIEOnzSyo2RWcDxE8PbV9RfEbTDPl/XY
         5wqg==
X-Forwarded-Encrypted: i=1; AJvYcCVk94uFmvFTL98IEevaZpOHZXOV81ltvrAy0Ah4sq87Fyyc/ZWZvmwnDkBvhjnGqchIA3faOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9zTHreX9+2i7/kstINby+O/4CPnRkMKqraCpMDd6GN+BELhuH
	bX+9eqKWhlH6NgeZcy366hAmXdLZy/Aj84dHCD/ScZfvlszgibn/W9ou
X-Gm-Gg: ASbGncseIxqPriZ1/P4DCLs+eNovMStwqDpzcui1wq9vNadVIgLrO6VI077wyNlnAX1
	9aZy73kF0/kdWHsrFsoQ3NoqDi42LZy/+4xwumcRo09aL1xHDP1yh0xwCObZWgNb2gX9rgEnGtX
	KNaN/a+BkS6OD7UXwe3Zixc+brzIWqs/TasCQlnG26gatZe3uWCodd2dFyGXUkqbN3+mIMl6U6+
	CO9wCWIOTXtlGJrvr38Z/PIl85JBStVcaSYNFzxsleJLyvGRNnXiP8g+L5PV3OA9z7WrYgNX6iq
	wrWlilCRMYI1TWI4LLQjDInANa7HoVAvtvwxjSY9Dy2ONW7KDpfLOLWyCkdHU7vGwutpH3p5Iiq
	t+ZV8qnhcawU0XsHpY/18hwaeyKW0SmLEHomnGuwW7Umekrg=
X-Google-Smtp-Source: AGHT+IF3ZrUSel4K1BuqKwEOc9pQQQUf7+NY6zqoq22ESLFTV8EiYkuG39Kx4E5+ym6f4Xi+Pvqjig==
X-Received: by 2002:a05:6a20:6a23:b0:234:80f6:2b3a with SMTP id adf61e73a8af0-2405501aa88mr20984035637.4.1754920530416;
        Mon, 11 Aug 2025 06:55:30 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:30 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:34 +0800
Subject: [PATCH v8 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-2-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/PeiCZRRXTs+WYDUarH1jFdEbam99TBMronNZaQIczY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZAjJ6DSFyNEbqI7WQb0Cs1/cpoqcmkC5M9x
 edA1YRSzTyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QAAKCRABygi3psUI
 JAlRD/sH1t2xS6IlKyOl1wO70gblqwbM1KqyPFJvf1yS37xaYtta2EkTYwoDnFJRADzM4QOucKk
 EuCEThPdttD95EZUcAjkRVe+c5FInsMfLCUlOnBzOXh6pI7mU8f2l7On2mMyuRR35Nnj5dI1ZqN
 l4Xozo6NtcqOHGkO2In7dkEqrTaiBUFzxdkux/24RHK2LgD5KvuFi/v2PL+IgSxWtB4NcZ3pZGe
 q2xTGJA8h31gqwrZSAhU8NZdDFEqa6vIXJrbuqU3KEXB2xFoBXo07TvFDIBsdX/xolnlcSse+G/
 85NbGGinRlTvj71bYqnYES0DChPgkFHyYdFgevzSPIn8jU77Czue3U17LRln3D0yhQkTW1UIJ+7
 jL/N4QyZj2sHTMqcFIyqtA0QA4HaR+vNf0sSnYVpcv5+suUB1Q2H0LAOxhp/3GpboWnBnX5gi4o
 sWCHwFDJHbuEQyjfKFZYLoKpC6CwfYDZKt9RRxjbwwcZn/0wb2YzTVU46pgsEyuQliProBHsmyA
 MttHNUmZxVqRt7qJt8eVNu86C3ZFZr+mPqeOa2Hd32VVqXsuGPKN1iLkhKDZbO2BdctJdCyhykG
 lAJLxrUwg9aSmiXbsAIFyhpzqSAJlh0UBDKn1GH3sD5h4NmbdbX2msqe9IhVZwvtXLQ2kr62VY5
 oFjjgMuO95pcYYg==
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
2.50.1

