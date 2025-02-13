Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4701C24166A
	for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457400; cv=none; b=H2LDtpuWJyugqhpYJ+2ukm7XlZUbMGoHdbvZQN2OMnzXe7R6Z8javHP9DU2x9HdMp76iFjF09MPkV7ab/XegOq+DdPRbzK2i4ZbuSRYpGUS1dQ4hieXWro06jPstQ94WAcF8RGZzfwNtdcUnK/pnaSqFR93c2d+hJbGfwUYo/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457400; c=relaxed/simple;
	bh=Ba6tnlIzm8hDFqRo9e/Ta1Gy5uti3Gdq0jOkoUN6OGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gm9lsUMVp202LwHoUU2Gptujk/m02uxWA+ilM3uR6KepYLDoz0hpMxH0Ygdzah2dZEhfkD3jWaWaozmKRqCBn3xjg26kewrVeRqkpIJrEsrKd7OlxOHzUmRXFEYTQ/dSWFD2wm0U+EPbIMJ3BP7wn5S88kS97/aHXf6l2D2xVCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJAIy+Ru; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJAIy+Ru"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so1424777a91.2
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457398; x=1740062198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brfPicLLdkrgI41YwzQ0UGM6yUtJtaTRoCcFKs9+F6E=;
        b=SJAIy+RurkcAoNX6V0A71WAuzkOYeLb2WKqupbPmiP+OCg6XSHkVETf/sXoJOff+6X
         pLor1Dy/E5TZCW4CmZUa6Ux55G3DXU2fCzp6vEA0GdJ7PWNh1Bm8E892HSRuOfYdmxHp
         jFAH3sh9QtD6/6LqVhYfMBu+ZTLmQHjJrqjekMSoDKSaP+x6leX2PYFkYNlqVGlmKI9d
         k1l4azdh+ITxciY9RNnSVZKLZ3vbVK9/qheBsL/hJi4gBDcmqAwGHVGlqSFcxqwZkGTj
         OoXG9x3vUybruigQB8wh85Uv+dmY2uwp4rCJZcz3nGsw48wTWNNNxctMfz+U3jwRSYcF
         YCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457398; x=1740062198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brfPicLLdkrgI41YwzQ0UGM6yUtJtaTRoCcFKs9+F6E=;
        b=Sdz5Jk5meBHi41RSps8cAtAx6/VW6DHDCWJPZ2Kw103HTnhnKE9JCZfv5sx7MeSPXd
         lvtR01djhSapIqBd9zOEuAlHSKzqrBW4HMiRMH1KbHwaNKJQ5zpCzPMA0H3A0YOHk7Io
         ZZ00JFFRNrez5nfUdktPRhAW3XnVxTAzujaAG4OmOgb14DA7N/CKZ73AZ+dZ0ZqVHYP/
         ASflMN9h1aQX/VwQc8FnyZ3tfX0srA7VfrnUW3vh3G8GWmH8iv3BPHqGypuGsHAjVlWp
         yqwijqhsAzNYfATwnRJylxHoR6UX671yBMt3l0N73H3U/EhBM3XqerRBKebwYxAIqCop
         GuIw==
X-Forwarded-Encrypted: i=1; AJvYcCUtdDlJPR4XYs3nY2lCtUHHThJgzAQJCjvYw+ZigIHx303FGcDKhCcwnAiFznEVPBTnAxS36A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBu1Ak40TwnoIfD6evBFHHInRe9gDUd6K088tJFLZl6LEF7kvc
	KxF/Gx9tsswNOgDnMdw2f1BSl1A6bBPtXi6z52ZAK3ZLSc8DrgD3
X-Gm-Gg: ASbGnctp5CgJxpzGy+KkMBDJ4CIx6Pq4/O0ZJ9lOM0qCC2nnwKEAyHLrpA5WUeiQAtn
	0Mrx+ZORDevj5r/ch4WOCcidK/FRNv2tl+4EPc92nAoR+UmYaRzw1uGVrmLkvVadfepNbKlZOX9
	W26JfY1ytZHmkmlD5d9bb3kb2u4ytbei27a3GZKSEuyvnWnQVrBeOGSjtDG3hcPcgL/lsA1l3oQ
	Yk6S089ppEo7IVtmZgOvCY7kRaHeOMCgudl7r2+MeVnPCK2mJMIlL+fFNJeoDZKYJqKrxQBpq+H
	iIZ2ef62tGl+Na05OA==
X-Google-Smtp-Source: AGHT+IFsbySmksHdNXy81h6YvNNHE9BZZniwa0ueT3pNOciifsTo+H4RXh2Q7qtiAxq0zRNb3OkIGg==
X-Received: by 2002:a17:90b:2c84:b0:2fa:229f:d036 with SMTP id 98e67ed59e1d1-2fbf5c6d38dmr10765873a91.30.1739457398543;
        Thu, 13 Feb 2025 06:36:38 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:07 +0800
Subject: [PATCH v3 05/10] drivers/perf: apple_m1: Support
 per-implementation PMU start
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-5-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Ba6tnlIzm8hDFqRo9e/Ta1Gy5uti3Gdq0jOkoUN6OGI=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNj0lJErC2qtod+ZXsZ0DIlOQ7lXM29HeHb8
 16Uak6bYMGJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYwAKCRABygi3psUI
 JN/TEACJUDyO8R4j7kouUyMBNb2JHE9lC3cKD8bqCQzfNvC76EEXAWDjU/hSOhlybaLWuX49jWz
 7LUWeyJ8wa0uYH1LnXo9uRc3wkPM7jPGW03B0RM9CYNXlZEiXBmDBHXopBCGHTATsm4yBHaXBER
 d579EShfjFCbPX4SEGp/+ZiJJti1ou2PrvFwwhWJi/jrv2ZrbahL7L44G+YO+DpwBJwoQ2iotGr
 Og1pUY3cz8VtM870No4VidVKfEg0x8sarH8YA2rRo/W7NhMcdL/ZlzQdg5DaZHGQwnA8IwCuUT2
 AZN0Sh+fJPPpw3DUwOYt3KzPNYk23SNoFpt09HjU6faa82HxuPSRIlDEMz9G5hO/fheW7DcaBof
 Bz0SEOVOzIkBr9n+llUpcgvRB5WdtLCQQbVFuIBAVef6axVN5tNmnoblxfFK90Y3tpGvwEUbCFa
 o10DMLnJpA+sEQrTHmn7Ooy+vtPyeXbLzOW2hf2VaEYDeaNmRE/xWuadyfx2ihCEsAGFWs7Ca6b
 m8GfgEGd35ODmkNC+jv5OA9fjSeU5G4cQjSLt7WpzAM1CM1jCSzAPBK2OwNLLpAvml23+xMSK5o
 auUNFvJP1u3PY6S6DGo3ikDQiaDosC9uQvGYW/4Gu+lEMIe0HV9CSfSzKZD+o8nc84YFfhs+Qio
 UPoiQr53FGZvOIQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation start function.

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

