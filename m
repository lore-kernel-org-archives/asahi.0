Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBA3002B5
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454286; cv=none; b=sjvSIUdH9lG3pQhaH9nrcdqU5kdx2Qvx8qzFBRKQUVFOnYbAD4bI9YHYW4Kec9Y2KFxxwq1cMnUeKl8aCQ+rASVv+2N3IUnGYAT4s0CFExmbU5N782ISbPuUFiBcSN5Vu0GvqLAVWyjBMdXoeCfi1A+xxLl7Rnn/7Jv7LxZmV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454286; c=relaxed/simple;
	bh=HNTQqQJemqX0WI0eYRGH+l+1PjBhJi/4JkQ/C04BuCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGGx5NyLL39HRViZ/MmIDK63nG1gWCJvZ+IzqGrjWc9KHHP4YgdwNhupqLuR8na34ua/zaWIOTLn3w4JzvKDRuq3WcdXQPApJLJg6RQu7JpmVwZ+ZZCDoueQD1HjwsUMSuyPBabK1rqdUopQAy+OXTwu61jYp7hDcFRljB7GQ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnXRgapQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnXRgapQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7800ff158d5so5132248b3a.1
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454284; x=1761059084; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=HnXRgapQ/SDDSAnZ6SNUYdxjYMnmt8otpxuuSZUWmhRQH/i3kNyB2vuNBZlNTebsd7
         IGs3aU7rYyxN7YLhJbVN5y72JfyAXLigmPKa3Nlu6RbBBSsp4nbzflEftkW1XHLp1BYA
         Bfols2bF0JLU92OfhXP8bCY9XcFEMymzao6aQvwsark2+uEbnxlgf4aOj3K+bfeShY65
         SD1x83+zE3EJdFSEHBAaf4pwrZgq1SYa/ABgHJqH7XzwSr9wXFBKuURZ3VXdlD0NcHvk
         LCv+JrfANvh/uqdpZ+eNoxeyw9KPlmhU20v1YKvziCN3AsLUTxytIWwv5m9DRpiiR9+L
         2GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454284; x=1761059084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=VQXyMtAtYnWmYqiHPCPbII4iMe5WYj7aA/2C40VBg8pPM5H6OIgP7jMeJqZF4hQhju
         tVZMqUUSYFySyTKklDMvcwwziUL87d166BR8tTBRmSetZ7f163KmZI3lpcq6ehswBnzn
         pfqgzJcGUijZAY5use08Zp7vsVk0uOwKQ1CBItJGKOwJEyqKejrazhUHlLT8vSVGFD3s
         nkzrNQ0IsWWJD0ye1xUtDYirjS7RDF+w1EDVv06tN6JmajyG73NfgZfZNM2c4MZL4att
         81ZqsIBreMTIZqJRgUGc8PsmXAWV6yEGetOg2cebn9STTSMdkeyKX1ZyoVoCj/Tfn6Lu
         F3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXk53mtDeef6hWsvi8eEvnYZ7rNJYTZy9dbxIje2GUJAq4lB3auBGvLySIj18SiLOHmjOmEAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4LheVYlDcbsEaNdX/Lz48nXksWRe688acL2AVkI7Qv7wW4dl+
	4CExLQdCfFJPShhUid2WJo+qvqHcMozNM634MmDf52FqABKEriRaFywI
X-Gm-Gg: ASbGncsMlIpd0uV/HKSJ5o0ojtN7ctPLAAYQkjGcjRdRWpIyXElO/xp+W8Z5Wc9c8Sc
	VPUsj3J21LxMLIuiPqi4BNEJqvTUgwCvxat9lB9+f+ADoOBsQ15KBYqF/fb3BCZm4+v93//zrCM
	iEafrWhQ5CwMuCpEjFLqRdlgau5bvWTncwK6xJU7TF6nXmOTMKWYbovwC95DIG+tXCRRR5WORMR
	PTSkQ92Ee6yle4c0HdpM/+qAm5u/aIeJ+AokK1uNmDUrOJaYUI2NDJNsWIuzF3c1dr0kUWa1WxZ
	054WID9YIW/tFQxzZnSv3ablpKCjAuXtd928yIQwwdyGwSMx8d11E6vpWR4kyOWN0seih9twPY4
	mfYZjVH1RXvyO6+RIZEf9ZjQC/fSziStZRH4UO3h+EiU=
X-Google-Smtp-Source: AGHT+IEUcKWN4BM/rckq+Z7v24QtVl6iV0VHt+z7yTPuHHzwk99+jGJZRM1YiVCJ8sEIrmXiCaMaYw==
X-Received: by 2002:a05:6a20:158c:b0:309:48d8:cf31 with SMTP id adf61e73a8af0-32da83de278mr33888699637.32.1760454284167;
        Tue, 14 Oct 2025 08:04:44 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:43 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:40 +0800
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
Message-Id: <20251014-apple-cpmu-v8-7-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZt+33mUgbufYlHVGEXhWTArkZwbw4rK+t3L
 3JK3LrfMTWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbQAKCRABygi3psUI
 JGsYD/9znkC5rAzIdt7p0b7H6L4B7xbkk+HxpkH85ZoVUmLNgveosIcz5Gyq3HXZq+kHAmOfnyJ
 KUJc9b4QRajZkLSGVUx0wb1GgySCYBuDATXx1QvL9bsTQEttURZbArA35JKtENAOj8Ik53ln2bv
 jxdO6MaRZVVSNOazCh3mvwO/y0q9tfmR//S6VwQ8G243/RWa07UHGBp2gRqbRGOMSm8FYottgh9
 Ctz5IKY9KClKMbZ94XRTQLy4kA5r4nhQpiGjoBTmYq7EaAYvbjpW7siBWAItsOfD+n6yVez8hT7
 csseEnllr22746D6LJoWm7tU8re+DC+hfK7OK2Doxt+NbrLRvAVWtIHT4Tt/2hA1pGZEYkamqzJ
 MZ18iXbSGKpRy6b5fpHClzsMO4LKR4tKLfKZD59tf0XMyxJ6O81/wi+A//QVCDvdJ8BmTaxpC/3
 PgmaGqAQD7ZNk8x2gHXir/lfEcXr+Tx7iAj7tlqQ+zfnnn83w56NC/KbRq7QRsrpQpmrvAV6pqo
 +5t2xj2dUTxPAO03uItkrj53zETg2wBwBxVVzEMjo+a5hpOACkhG4Atv+uDWXkBXUSfuuqMd1Ap
 evJgI64NRMudpI/XdtmHWeB9EX8O/bl2cASG3HeOwP4WmyZnXTjaAfRi7p1YKASPma/S06RkJMZ
 JAX/NiDIbAh2VEg==
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

