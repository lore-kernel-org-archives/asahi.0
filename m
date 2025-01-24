Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074AA21C175
	for <asahi@lists.linux.dev>; Fri, 24 Jan 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709140; cv=none; b=gUVqrGRCeWFDBh3VArgZjTwmp43u6RJ9IN9rkZueV14meOGgtmrj/rJWfa9yn2d/bHDAchbWNZa0CamvUUCYbS366GctMahn4n3r52peAsmcAaHJwccFfXDF5OLu5+FztETySf1sfzjKbf80u2S070DJA9qznTcbiqskAtUrAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709140; c=relaxed/simple;
	bh=5Wt+y1kfE0SNlUgZf8XNj9qMfwaP2g0NAvwYLLYwYqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKIMAic9hQS1SAVOZdre0aV9Pc+hGVMGsoetmv8DUTonHYe2+ZOgu46gOUKeRjrTDpIG7qDhJW34ahwQqdu6n6yBBzL69rnM8Ta2ckQrTouEOTGMeSIlhM6Urpk9LewiJU0QzSvujRSkDzivFLV2sO0z8P+2KSp/ECUNhm9A/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ks26eaaN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ks26eaaN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21675fd60feso41651875ad.2
        for <asahi@lists.linux.dev>; Fri, 24 Jan 2025 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709138; x=1738313938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMlqr/+/x/eRJJM9d3zjLn1HVC6jDi6vYxdaFPI1JRA=;
        b=ks26eaaNYuzsGz+HtGwV1LJQzoCsp7pl1F16+7ju2gcO7iRZkAhH4eXGUHLfKrRAMB
         gWdxOQSA14a+rQ3oFvNAl3FSaInjuoxPkBUkQEDeeZ2WkWXo4YIcfcY3uMrdfRsk+kCz
         6TOe7BN7qclvrmS+SDzuCB5C+1BjR2cE3CT/0LUgQBXNvrIHAY1bF+DSA3SkDMHOFFrQ
         asISBZA1OaZXdRoZVSGXZlGgKrvfLVsKopVHroBkerJTjnSXwg5PR13w212APLXrBl3q
         vgn+wbFyi+jvOnl34Uv1/ReyHfnXRz/l9f6mn1rUVi0hoOa+4oad0Qs/cz+S5HaXsGCB
         PKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709138; x=1738313938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMlqr/+/x/eRJJM9d3zjLn1HVC6jDi6vYxdaFPI1JRA=;
        b=AxXuyMIVD3sKpEyIY/q2lAvzbTCPfW54AyWOYDgzKR6eXtF6o/NbRyprf7iGY9IEKi
         eP2oE0yhOwwxQeOYYQKpDce3yCgGCJxrTEdn77SRxdjlpZ8c+lbDeSMDNiLB6FZcDNRg
         homeyIbI6RFVXVGRrok4JGqjdHFfAxM3W5UXTwvIuszD6pU8CHAwFAJpJq4h4L2IdOcN
         keYxuWaNH9wuEY42hnChPdxXnG4ktgwJOON6r7pJkhYjB3ybxGXHLmLYAGkpskpcfstA
         TZzyC4pEhNmB42JaATC66OEKe5tl9cL2fKL8Dl5XOxlVbZMccFc5uLOXRVpSNbOkgyOc
         DtQA==
X-Forwarded-Encrypted: i=1; AJvYcCX1TyDWxhgAbSxJCss37j9b2de6W3gLkULPvX3wKdzuWGxqYjOyy6u5jOotByNSeOfty9H86A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD2lpLtm8GOEDg9rQ4lxOfcGZK3n5IIfTHW5Yr716JVZZmCmaf
	OUB1r0t8crzntIIHDhyfR8VNTBSm02+y2MrO3w6XyuenX4rvsjI24RSWtpBoJ8s=
X-Gm-Gg: ASbGnct29kgHkGxEjd1dpw0kaYcaauy/eAAVs1jd46OfriWep9m30JBvR1thb5VSPzA
	6Nou0bVy9kxCB9j4LVL1FgmGtK0z9wEMoZmUdf5jJ5ByGNa+rWSAsvjZffVKX4TNK040Dlvlk80
	rNmgNvtP4QYBiP7rcEP79hu4ENMW92BfpKlcug8TZy3ufHM7jBJyAszYFJ9/V2wqvbLHI8AzUIM
	uTLSVN0BCtnihJBZF2917o+raIochSuGpmbxb5dn3yHwTW3BZQd767njLXEOTMZ3OU2eae/qHsH
	PG93YMw=
X-Google-Smtp-Source: AGHT+IFw8pe4tFyZIYNOF9s8Ywp9EEDR1mTMV9kBrefpwpJLLbKS7BB6GQPOd2o0T5Xa7ofgRk6iIw==
X-Received: by 2002:a05:6a00:ad8a:b0:72a:bc54:84f7 with SMTP id d2e1a72fcca58-72dafa03117mr40695468b3a.12.1737709138233;
        Fri, 24 Jan 2025 00:58:58 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d234fsm1337263b3a.77.2025.01.24.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:57 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] cpufreq: apple: Set .set_boost directly
Date: Fri, 24 Jan 2025 14:28:12 +0530
Message-Id: <417fcceae52d5173cc2606dcaafe9886fd4cfeb3.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently the driver enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets
called for each policy and then there is online/offline path too where
this gets done unnecessarily.

Instead set the .set_boost field directly and always enable the boost
support. If a policy doesn't support boost feature, the core will not
enable it for that policy.

Keep the initial state of driver level boost to disabled and let the
user enable it if required as ideally the boost frequencies must be used
only when really required.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 6ff604a0fe79..4994c86feb57 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -310,15 +310,6 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	policy->fast_switch_possible = true;
 	policy->suspend_freq = freq_table[0].frequency;
 
-	if (policy_has_boost_freq(policy)) {
-		ret = cpufreq_enable_boost_support();
-		if (ret) {
-			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
-		} else {
-			apple_soc_cpufreq_driver.boost_enabled = true;
-		}
-	}
-
 	return 0;
 
 out_free_cpufreq_table:
@@ -353,6 +344,7 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
 	.target_index	= apple_soc_cpufreq_set_target,
 	.fast_switch	= apple_soc_cpufreq_fast_switch,
 	.register_em	= cpufreq_register_em_with_opp,
+	.set_boost	= cpufreq_boost_set_sw,
 	.suspend	= cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514

