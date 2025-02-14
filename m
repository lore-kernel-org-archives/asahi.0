Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE9826659B
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543447; cv=none; b=N6JWIPfYDzPXYxUijq0qD97xcAIRFjhn/pVSNnFsEk2SJRFrc1m67/QJ8LP5UQBRzFsCHfX20zu7CnBXgnHb6Y3zlYK+igmtphSrVf/Ulxi4pbi3co7CSAaFuFQq/sdkP9a7szj6BODtzbU0EFyaWQZX5DfkN9wgjf/cVgQVSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543447; c=relaxed/simple;
	bh=6YoEPxJ23tlB05Hr5lEn9IwiUxu3JyxaBoeQXV7L+7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DTTHjA/25Bs4MgPN26aKVxnEq/8qbQ9B55rcAAzuHRnO0DTzVre5Lxj67ZpDU3sHKxkr982r14McGSrnu3nVqKD9uEPoCyI9PIs8bwSyxBJ6TR5W3bOoj8LPWA7ymiT6w3Y4YWqPbGuuVxbaxrZvvqjvD8VEGrPbdq0BRx3ffEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvrrdNgF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvrrdNgF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220e6028214so28720325ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739543445; x=1740148245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=YvrrdNgFM+bS0J3/r91tWT1jrpaA+u4DVXwGqp7Ok9v3JPYxKxiaaOPcsOALNGnwSa
         Y/tNesKWm6CuspkluImpT1YjPdpZl18NFrlHvo2wABPHSm64YHGMMSjAYnrrYwDRgZQ6
         lBFe2rS3WujbgVXgx0YwOMSzL/qebiX7RuCx+xu5RHe98ZbFGZNmh0wtuyBgmwS/qlxv
         0xOo6svFOhbq1bL63L3PGY37gvRo7eEfMHK4pfIwFAG3+4LwOSFnTYGtipRB0sDJEeu4
         Y9Wevrhb0NjTGF2Vs1QN3zxHM3CRd2+3G0vQn7AjV2aAVlVJbCBqu9vB/WgDTPhDG46G
         ubew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543445; x=1740148245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+eZpJ9eIG68InE3GWCQVcY+xomBgCqyQkRTUGWCeg=;
        b=hEINfqY4ihYkfa5Zvn12acCa/5ugfxau1EMOTWLTg8jA+vPRpy203W5v5aU1GyI5EU
         v7rHelKEQUZNA0mEXoJWS6sPvKvswWp1d3yMQV07s2VIlYk7ZGAqHXnOclkPDjVECEW2
         /n074KxAafy+hdhtcIUhJmjegxvIite7zg/J7xONREeEdcjet//yIVjSKiqm5/M1UlS0
         8j+VvAxvml4svBhOqB6+j0a1QkyM5u1U/YPUvs4jvO/fXf2tQq4sVAN562s3uQgP1Obn
         qQZkqH0pjaK16HfkVzOepTfuryEwyTd8T4buHugQkpSl7T//lbmu5m9dV4ldsZquJg1q
         ZunQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaRr8VbT1ahKBsEpK2uJu17yA97CQDE99XQHLG1joZ4ExV5RtJN/aBY/gqrpxtg0uyrt3rJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YydUB6eN2gViHukmsGz3kmZzsb/MP2jxgkejRGziHa+UTelkd87
	pPzFUOvSfvwCli0A/5VOYX4FivOZNslXsUGFY4uOTpHPpYdWgS9FQg6MuQ==
X-Gm-Gg: ASbGncvWE6NFrBjvdvyeEaJ3D47afqBpeFaw8yDITPhNYBeHPTvZAKVg4YU30Bkcl63
	wXY5BjMG9uIp5Ib+agkGY2bWziky7IixEoRtp0EZhY4O2LXm5jgHZ0GzqpkZndzmWBXqJ+GMpuz
	z/4u2BCtxBX2JMQ1HavBkfhf99xKle/+ZoDib0CMWy4+5AGjFlXF3glfY60PIwgApB8Cd5hoj7/
	P6NjHoi7IPjLWH2LbLZacLABa1q6s94xRuN2dOGyKWvVP8DK0/dLPn1xdsZCQjRfpAZNeeNrea0
	QSORDw4PWWt2B90zqA==
X-Google-Smtp-Source: AGHT+IFRr54NQGh/IgFm9UJ+j+G6mFUuuYOyOtSYg0bwbWseWMm/5RMmaT7XUoR1sxFLmmR2C3cCYA==
X-Received: by 2002:a17:903:2350:b0:216:410d:4c53 with SMTP id d9443c01a7336-220bdfed345mr189976225ad.41.1739543444569;
        Fri, 14 Feb 2025 06:30:44 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d545c8d1sm29490315ad.113.2025.02.14.06.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:30:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 14 Feb 2025 22:28:31 +0800
Subject: [PATCH v4 05/11] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-apple-cpmu-v4-5-ffca0e45147e@gmail.com>
References: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
In-Reply-To: <20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=6YoEPxJ23tlB05Hr5lEn9IwiUxu3JyxaBoeQXV7L+7o=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnr1OARxgd3D8G0gBs1fVW5W1xQkJOrG7rToycf
 qFi8+KQB+yJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ69TgAAKCRABygi3psUI
 JA8zD/oCREdDsqvpz+u5NdKYTBBxaf5oGFqwWIjo8D6W1NxIjU38x5hUAaqm0rDKPyPI5EI4Iog
 SMLIRHb9efzNadiYddp/P+y/5m2Eag7+F30WnxRpPNrdpBYix/vyMzCoxl+RzMY5B8l+eYC+HLy
 h7k+Vjkn0Pw9OMZ3qUF57pWV4iBgvQecShwPNjQ7AAhC8fiQqQjMHJec6+fCllGR8BlgOQvCQd9
 KM0v4GCIyFnvSZG4gUNKqvkBc9DReuHvE9qKtu0PQhMnoGlKag9AAHxSE98ZbDoHRnyENW6Ww+Q
 R5/nM/o7WN3KVqrh4sNKN0E7NtA8gNx0K+AhPveEnxrZleME+zKfLFzvYQLEY3xwHIWPiMJQGgZ
 4goZ08rZ5zlGU0NLTK+db653yIrp/zht+pqJuYMJPcrQszCWACEkwfLRgZspy7W4zXcWKkfYOsT
 w+QsznZUU90mHFQU1QRe6g0YHVtm4RaOPVWOQvzgEIYQCllqntlCRjqGU1ZcgWFAT0KbQivc2mn
 z3zbP/OQPBnzL+nQG/ygneSGzh1uy2iA0pFfX0c945SzIEQ+0LEr12/aSSW9wDUbZmjYf+0ZjPZ
 mMGbCgWSxJufQoQ29w8cnpjHeo5HdY1gBuux2zZDzgXozqtV4pO9+yTHbqjWXXL2bNcw2fomT9X
 a1Ip3ibTj9oijog==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation startup function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 73ba9861a15ff931b5e388b6d809dedb140e2292..b601d585d204f9e59ad7f5216679b97852a46a04 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -608,7 +608,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -625,6 +624,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -634,6 +634,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -643,6 +644,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -652,6 +654,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1

