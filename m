Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85D274FC5
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898240; cv=none; b=FudmCAiDiSba7oZHC+L2W247VKAOfN0px62EZxBw5D57h9Ar4rIAtKoe+EEjEvkzrIXwc1MSJymxMhGcOfNmoNdKK6fFNWmJ8BIy2SUPr1fBaduB0T/nuoZQPZyTVcg1o3kDtFNTBKAFFOw4oaFhIn8Dv66jYj/JBnIekdwfEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898240; c=relaxed/simple;
	bh=XuN7zsZ7YOoemig6fmya2Ywu9aWxTuisbfQnSd0HHz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrulBRELITDkGZmcOtDY+2gnzcGnCn+L82Tjvh3dN2e+uP7JlBVpJ3ZQMJpFz1VMHFC1yRVUvPcwHw/Hhci2kBq4Bylv9QW9qQWhr3JsXQoMyxrV9BZ+hHtOdvqVN7760n1DkiaxJ4YZpkR9lMpHbDaLQoR6LOw6CPQKWN8fBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/LpxCRp; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/LpxCRp"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af51596da56so4678687a12.0
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898238; x=1746503038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=H/LpxCRpO54oJ88ZRJ8LDj98lFViN6ra8pq27/5H5//5eg8ZbTuQl6CZqjLqQ8zeDS
         3Zw583W9taZc9y33A+5HQn5S5/FticE3XxY8WAoF0HHBiFFEj69zhm/Rq3CdZ6FW4++i
         Gy3Bd4yyiqF066V5lM3LYQ85D8I9W30XSzPXZ7jjd76KRLTvtlHISLCF6/DM+tPLlQAE
         kgpWOcrVhIm3oUUBOZnhIGtxQ348NJkRRUcdwRbpS8aJbxPYPPgvcIpdmEUY2mJZ7od0
         KSvhd1r33RjxD1MtJFckkBpU6hltzjnSeD69nLkGXloBKzXCspfki6kg0KCwhDoWwpHJ
         15Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898238; x=1746503038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qETjSISznhSwPPS1o1aaIPNAE1fFREGWY+BmDgwUuls=;
        b=pJ33uJHRbzgIEhN5ckiDMywHw9QB/RNUYJ0FqrF+hA6I7wRe58R6kRn3IgjTky87uV
         Md1z7ZH6ww2FoHB9kxBuxG2D25VsA6nfAGCszEgnRxbkwdvpCSbfmGiu85Tad7k/ROeZ
         dPYoYMmruPi5b6sucjkCe816Vnxh4TeMWfvEjh0qDC/ouzr40LYT00E0gMcSYr1/J8lD
         dMjd3fv8f/zNyYSMzAfAFRl1w3469f0Ifl3GIeiOFe7fPKNMKvF4ETh5SEpwaBWh6mGO
         KsonFwRg7qdgHOVrT6XhBRziIy6xZUkTmqXz57ugp8rSSY9zAKa9LUyCXJjW6/Y2oh6n
         7/Og==
X-Forwarded-Encrypted: i=1; AJvYcCUAOZUm7RUBUJrHTAaujR3nzZOqVUZBXwQWV0SBPtjC5uLt0EkRO//b68JiaQp2pmU/eEjqpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeA2uvrm0laR3OEVpCsE1cfuvE2tMfchogNTZo9DGvSesdyl6y
	tgiY0jR3beta/HO4VB1nsJeI33m1BqTbXbrC1YbAX47+xFaE2qvI
X-Gm-Gg: ASbGncuDbKWnLERcA+aPhF8I6Z3VXxMBAyT4tz0twAIvO/1qR7OzknY/yvLHdiehifv
	RoPwUJnAcE+9VXZLCz6QywLJn75VR96rZfz1AH5Me2zqPQk+0SaU7UH7kTcHxMk8jRIAwbV1+um
	RBXChi60OfQo2b8auxx3ZCUKL+7dz5e6xXBbn9htkKhkmnKQPoT6bQYkKaDs0j8H5wTCKZjgUyH
	b6/AMrRWsAWbR0JWtc1Q0UXteSZ0NrwNw4jH9d8oKYBLpn3ilUTV0JXDLe88Rmqal0ecTRgfFld
	+WokDthGvFNyWtidQQkh1BXmTw/FaV3YXS/Wz6LdCLiPuFT2DwIcWEXdow==
X-Google-Smtp-Source: AGHT+IGCv7NUMuwkZrzMAT+2m6PloicFqMmCpwFVHUHLjuZ/63RjqjkmuWX8FBEwwdaE+kDW5LKrYw==
X-Received: by 2002:a17:90b:4984:b0:2ee:94d1:7a89 with SMTP id 98e67ed59e1d1-30a21546764mr2708379a91.1.1745898238312;
        Mon, 28 Apr 2025 20:43:58 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:30 +0800
Subject: [PATCH RESEND v6 06/21] drivers/perf: apple_m1: Support
 per-implementation PMU startup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-6-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErkVcoNrjaCyRf0B+oVVlF/FnWvNI8GVPL/9
 /6IEObFdLmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5AAKCRABygi3psUI
 JHcRD/43EY45WDCCOHH/tCk4vG6bMpTVYoxMtOmM3AG6ssXxy+0LPTgCeIbIKhrKVlPPNNF15Kx
 2zGMBcMedxpKxGE38naXV4W9pnSlKLwJsrRJfFtmn/wRrmqtgOh4HEGmrCAtd+1vgop0WVdjXSe
 WJxwrIfA3rtr1qDT3uvdrNqzAMQUuVIK5bxK3IZmaMccEwowCeS4K3m0ljdCQhFlx8yK0JaNOde
 G9Wv6SCT9BPpcXL2yBqDA+qPdnx4pwghspuCxamgW//wFGOnDmUBA5RlUaOG7DtLTqn95yig8Mv
 5UfX3iDNRv+h6/E+cbv74gTyGf9Y4FIsg2T6h0lgXSr1/zE3PyZMZobiHLwvMY/nG9cRoS4sHZs
 WK7bUTPwDGDdM/gF7sybcIDaj5FxG92PRuwVGxUV5XMuDx7/JeOYaQc6jz5cixN+6oLsmCNDP4d
 r5dLJcUTVkVLbn64bkXAhGZ0fLqeuPQrNqXTL6I5m7PDPaMLg3Gre1oTHDBxa856QqxbTND1DM1
 ezH6qet2/HJwAHenrwxnMfkwLEemNnvQTk4AWx2JjUjUw84hUbaX2khnnQrsEiJ5BqCzv5DwAzR
 jeDLZCiJrVFmi2aOB+LGw4dhCyMoe+AlsehCTNQ+3R0eu/4q5K0K29drrMCGgiC1XWEDjTpEXGZ
 jvbwtgkXUgZOdFA==
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

