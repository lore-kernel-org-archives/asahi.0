Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968825E441
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380997; cv=none; b=QIuxmapwoWq2XnRvYFcucLp0YASIINT6bJJ2VAsgWzcJqWfujrw2uo0/SnygcC0drZedKYHdNtCHHPOYVGeuKn5cCBySZe0y6+47gT/rVmd5FhSIQZVJF+giuOJWx2UZzgHaRORa0ecOG68w260S1X3qnGKBOd42ShQtbOMkMc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380997; c=relaxed/simple;
	bh=/4qXPFHVNQhhoJUabUe1xtQ/R9DQ+Ipv3G6eXZu+6Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biauqkGSSc9p2oJCtsTHnUbEiZxKlA8FL98G5TeGcQ9BeBUge3/tIKB84m75MGh+j+jiBaPlok14sIFYUl6x95I+xbb7V1sUTeFf01uWeTkoXLUnS0GHVvNFUpNDPgTM67k4mBVCLiVynR/3XoUKkH8IFhvZYBwXhRLdQYmmkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqaA6gzz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqaA6gzz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220d132f16dso1201405ad.0
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380995; x=1739985795; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yMYPtbWoioljIi5CGJJ0bbQtImjQrSrLugDRy/Wgxc=;
        b=TqaA6gzzotDE4JPj+wIOO7ioUx7MGqEomnPh5H7v9dpb31e0sBvDjppIyURTtlBhoL
         fkG1aTOaUiVTlwPDeQBvLBJPHOmyYD+cf/C52Ncbsc0kCFpeILk9e4LB7PzE0WZo9+J+
         7Tog6gcGreXv60jmG3843kWiPYdMdoC+/aY76d/VD6z6HSP4K9CbYcih9NvG8MPKBs/R
         D22GI21pU7jqiF1CZ5OQbeVXPj9BVu747WNNA/rzh0zy4bF2e9evUMOkMAMvo8URG+Ym
         4jMZflsjyr4T0FxX0+pY176ENJs/EC2tDgOvyoZWCB9I2gHFR6AxMJ1QYomYgdEaxn/U
         hLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380995; x=1739985795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yMYPtbWoioljIi5CGJJ0bbQtImjQrSrLugDRy/Wgxc=;
        b=UdGp2QyCe9hUEqOALjt0/Smot3M72Z5rml0c9Iq63GH+OgG9448kJKF3yP7sjZSos9
         wg+0+zTuK4zUqTawkg9N4NtBCd5QRrRj4fN76O3zch4c9yPEFAiOJMvCF0+J1VeJTD0a
         s2fZ8SSBg+MGyD0vUXRq2DV+EDZtGbS/SRIIUDdUQe28gDb4CJ0UvpPrh1gojqiA6sPK
         IdwxeiWp0CbLgQHoDj5MZLs5GD56zx8/xO2jwoUCFsQgO7kefUEqJB3DQBbeBlJ/S0Ia
         5WE8EDh/uXX23ePHFNMIbU2jXZ3xaAGqf8k1Dnmj8CKnY33v8svQFZnmr7VWA5Rys1Vp
         mdow==
X-Forwarded-Encrypted: i=1; AJvYcCVkBNNzt+PN1djXtFkxS8r/LhbwlmqC+UEyME0YT8rQVdhg66S3KTfWxCtI4Zm9kL8X7WKHwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh4w1NaU4wBqmwhwn1oWNY4YbNxMczX7o0QdJy297GYXiRCqQG
	r4QFP9+MM4BlpszdWSgp2lm90Zh7rcheldKfZrnSmF1kG1s2nW3/Nexzeg==
X-Gm-Gg: ASbGncsd79bufUymTccDbVlcoKk+6cw5rDH1b9CzLh2KiYEO6cYR7ef17FgOSC5h7S0
	H9a2/bpGa37d7mAK2d3Hq2E+lJsXpUIcGtxTlaiJP2H7JcO+gAIpDNB0Ruq2vjUCnGyDJYMSynL
	q1oGxP7+Pvi2Y049BlKmusk1s5oJqifieTTgeGO28jM8x2N8Y3k/MG3+164My9a8yXN11Hl6vAO
	lyxjcP3UY4mVW6tPDfwNDxVkQgn5ZF5q6vjVxNoAHRG+Lm1DAEYfUlVarmdN4JH9SqSV7EJwAQA
	aXhSoQCj2PFOtgeXZg==
X-Google-Smtp-Source: AGHT+IF9Hqg1hDtMETPcTVQMDIUifIcDM3rTf0I2IXiMK50CYiFNlKKpQ8vQz3ex521MFyS0zANQ0A==
X-Received: by 2002:a05:6a21:6f10:b0:1e1:bf3d:a191 with SMTP id adf61e73a8af0-1ee5c83db7cmr7106147637.33.1739380995098;
        Wed, 12 Feb 2025 09:23:15 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:28 +0800
Subject: [PATCH v2 05/10] drivers/perf: apple_m1: Support
 per-implementation PMU start
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-5-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/4qXPFHVNQhhoJUabUe1xtQ/R9DQ+Ipv3G6eXZu+6Qs=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjwdQLJ8DKd8ePzg7bkvfftYg1GlHSWGLpkf
 g+nrc1zB+uJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY8AAKCRABygi3psUI
 JBfpD/9guHkkdm7MB9Lf6dTLwpTEkIlSUVy2My1ORooQxfsc1CRRCjYApVz+pI1XTsydkT535XU
 /T12u8brSIgFHOpgmGXTvedcWQL7JmVEvbRG6i6vnN7j4ymwR/V6jgRIoamXh9AAAf/n0Dteret
 N+3WguwH2fqY+64yR2/PYkJwSuyRxFr2YiY+Hqroo67BD/bXk0RMSqTfPkmhYu7bRMjPLeRrkUB
 6SOsYDSnwFuVbUSvv/LJZHAqsYAsXL5RLQUzDNTCszx+xIpr2kFyWrm5S8x64xVVaKOJSHPAi/M
 RvFyWP3s5LWfgy3FotRwZ2TyQpl2Ai5FMF+Yv9GJW5Bv04h/sAWwfGfmJMOAFSF7wIcWw02GP6b
 rQ27MB05ApxpnGE6OU2L2PbwZYD7JqqRF2UqueCkJ2kDR8HtO6c04u6p+7pCBMbtms8uulLdnPT
 XbhywTNKNvja6+5Bz0etrJ53Z0ZzRGnNMuvsYxpWA0cVLYn/bUbzZaPk0wAQo5PkFHwk6Ml2JLc
 HtZU7z3mb+94BJin8Y5EgcCh7DljwnubxtfSOav9jdEanL9o+8BwX1SnWROQ7jYQH8wK1A7/GUy
 Om9J4NzuAcIu9EPJyDk64ZQQMMPYhSwXOMNojHc+nnLXiV9Rh96SQk/seTbLBuQpzkgrELVsc2G
 SiqiRMKS6aqAO/w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Support for implementations that deliver its interrupts in ways other than
FIQ will be added, which requires a per-implementation start function.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index e7b898aef45e9e18899693774ad673fd370b19d7..12eba1075b36768afc29e211926331b9a426c54f 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -605,7 +605,6 @@ static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 counters)
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
 	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
-	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
@@ -622,6 +621,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -631,6 +631,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -640,6 +641,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -649,6 +651,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
+	cpu_pmu->start		  = m1_pmu_start;
 	return apple_pmu_init_common(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.48.1

