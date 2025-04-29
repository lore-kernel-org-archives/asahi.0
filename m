Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9E4270EDE
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898226; cv=none; b=Sj8uG6tVMr0dZxahMF0AX6Chtn8jmSRElZ/mHN4fpd8t5dGOcZyNiuabm43Rf/qmc/aEgk2i2tS4845b+ihsp7vw8XEcbteWFDDc7n5Wp8be+xNe9H4hCU1JrMk5mNGsYi5UvySji2gkCbECiAuiZCJ9peGSl/dCl+5oE89bxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898226; c=relaxed/simple;
	bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NyfApJDtqCtj35ABDq1XQcX5+5cXUbLTRN3Ai7utR5Ldp8rGKnX0NhuJfHEciZBeqQK0R2udozSlzQAkuzf0P96j9JBsYJ8Ina7c4FD8+K3pE2aJoXbfIYb3DVVI2iAavF0RJsebhX6E4uevbzecPGY1ZMXz+X3n7fleQJj4OJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqTN8ybL; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqTN8ybL"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af523f4511fso5464387a12.0
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898225; x=1746503025; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=QqTN8ybLP3IGn2l2CgvQSuG2FcZpEF84V2yQabN3uk/WPawCBn0bPfdq1hjsFQ2bKS
         lLhIoFKqg0O+oRb1WBEN/TszC5ptcsRN8d41thDZhqcEfexhQW//cKRXp2zThV3ggD3Z
         jZGvrJG+m3fg2OkU2MY3yiYh0vNEafWjRowIT/He8xE6Z6JyooH7gmvVjn4KmnP2G5tZ
         msxBG1SiqEHXXZJl7R3ReNJrh990aOTlSqxI3UAsFQiBcD/x7CIvh9RnIBHibX3AQcAC
         K1QjvG5IcKEcS8YYDfL7g4QE1q59dJ6Ebd2ZiYzILI1OPeh9A174FtPUWO7RG3//4pdp
         FlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898225; x=1746503025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=qAJ6fLRB1v6gKlUEPcMg3v8Ir/3BX60r/Q1kvjwLTVJ99O7O6Gsn+v86eOOk4/Khh4
         LAtmf2gjGwlNDSfXw7mlMTeBB2TeC31uoqYIw+WjSAxyc9s+2orHHnW0sr4H2VrFcBUW
         IAVrlefiNJ+tSqm/AJ+gxamnJoVEK+o/rlRNuvbuxeZMLA68wlDq9x6mXEXsCtkfq01q
         Xf6BQOTHQRZoKMMrPk/DkRcrBATQrIjJoZBClhKWImmwKlBLaP6CzZwjBwh8ZSiz1mfS
         ODC4kBf7LH4YSQw1VscqJW4Xo0koJ31Ewy1LrVWBWMEVKhTCOXZswoDw+/Xtcxomg9KM
         Z+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCW4M3B+9JZwb4oT82W7M6QAT/Q9ff/vGKMqjXz2nML8+kyM3wLATG1b5+FAy4hOlvaetiZ4sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBHwgfP/JcaBGLqdY/3VR3kRr6DZOHYvTqseDPW0EdKEytCC7r
	kENe7b4VioqYRSuYcQZY2K2KDjhDtSlFeJbkbgJ6b6lrCF1WeIYO
X-Gm-Gg: ASbGncsLFWyntXyEWW0Jet695Ct1APcNKmj+XI1qOz/H0Z1jQYNdq8tQs6vpo+IfVB+
	HullOlU+jWxr3QhBnF/FeP05rJIfwbkzd3Xihs69kG3Jixnb2TFTjvObQLgEboBX9kTGL4rZb41
	wX6aYCtBSYzKpyncELnkejRcSMqXAI+/ghCDgJ4BjmIkgIQcUZCKTW5sC5DBaPtd5PENpYuIjgy
	DZqa9X5xsqTkiQnV3+cVznQINeJHX5jDjzbLBvmKGPsYqF2SLRSzdhc+PHuU++E12mHtuovnlrW
	ogUcxBzCbVIneuP+7yFHUt2WKO4E4k94TmIIidQryKdKu+XrodpPSVTFkg==
X-Google-Smtp-Source: AGHT+IH0QfnRZrHDVi9u9tS8SXfAhYyEOmXMgFJu3ii8LTS/mV4wfXLUnUpn/pv0G898oqDjmezJqg==
X-Received: by 2002:a17:90a:c105:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-30a215a1c05mr2568143a91.34.1745898224710;
        Mon, 28 Apr 2025 20:43:44 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:43:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:26 +0800
Subject: [PATCH RESEND v6 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-2-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErjazzO+NLo3kdywX7pJWIqZFooUQqgBzJoe
 fadMEORQrWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK4wAKCRABygi3psUI
 JOKSEACbThOdFHwrnvVn6sxZv66ea9SkhNl8R4RrTjcvjuF9BIVY/PIZYjx8tfqK4W+fynHpppu
 1+DFqm5j0iM71gkyvAV+981xWKS63ks9e1tJMVwPm2hmPkNnPYKMo8/PZiglrsRvcWCvLY8jts9
 Q3ZI2tAvfmAmmRHzyATaEG0RxGUiJCunxE1XeUQyJSLjGUe9Ex/5j25UNSCp62JlHEIE9V1Q24v
 qJ64TSCl/9nlCt4jRYjQHIM1LdyZlXHIvzWF36c3i6ZICWK/6X7DRCz9ndjuV0lAMK8+GO3leIB
 kZckjRyKGACOvAfb5L+xNJwPqPoXqwIOM8WG07/Gt3zWVeO4w58bqVVqSuNEPYyHR+iWOyKqAwV
 zM4ho/Ph/ng4+cgRTRDuPPiA6HS37DKHuqRqEfylkmajKRL0R6wX3girk1waJQ+nnOol/jOSBbe
 OFnbtNIjeYbv5/Ix0fRyU+Sxuw4QlVWaovWPWjboIHp6vrVzAnofdjnW63M/S+iWHE0z5MAGh5m
 ppwlFArOU6clMBsXhOjKqnun0lhme88ETBTYYuG5DsiA9jK0faJxrthclc12YZUbEIv0u1vw/0a
 QHhgEXkolJBpHhGSrpYcYZ/aG9CfH0BMJXNTVWguK6XKATBuSgWXVqEtWmU/tuK5mSBWYiapxa6
 i4+nnovqZOneI7w==
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

