Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F280236FA7
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916204; cv=none; b=VE+fSKji2ffh1mYJ5ADOV1yqSokUrj8MoIZhK8RzrW9DakPtAljq/nmsnMgtvuXp/g2xkFM8vQ0I6zy4vXJ0Cwb89Cuv2FXWj4IljEiQ8xtC7i2NrdJdQb55SbWpSXaWjEZ8KUDjIs2KCw315Ew4djaIJXOR9rO0Ky4LNMDiU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916204; c=relaxed/simple;
	bh=MDFsueiGJp/ZzlB6eQNdXlWorFXPp/SAmEiTPyvzvK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFTZNSL83qJ2Z0rF3N5eNUgw3niHm58+uvu1LG+K0qbX8uwcxUm9mBQRn7bmYjutmkF0cAd//Qlj+Hngk3mhDFIhN+ZvJsji09zHQtvxibVWhZK9o706IYKRs3GqxsXvrl2LDoSbKEi1TrN0oOpZ/K+L2E2IpEIRCXgZ84wq1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcIqctqd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcIqctqd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216395e151bso3803745ad.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916203; x=1734521003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l1I2ck309o9qdqJYu3bhIkW88QmjXQLLkvder5A/zo=;
        b=BcIqctqdQVmvhQer3x056IUwbyy8Gupj2fwGqzqzKiAAde9g/ZoTQYffxxJMQdE+6g
         Ep0RNTEilkYPYgZ2oW+M1HfVzoDTEl3JUe3p2bVn1Mk4s3gocADYYVi7LIYzNtT/JFCs
         TUusB1jaGEOzD1M/ZklTLzsy0tmetz2jXXWYFOG/0nXn7f8bSorH4zPCXEuFgSip9YCl
         HkZtiY2RaaQcxx/D1f1oi6xAX2BiuLm1STR7i8R8vB6HvMx9TMwLv+SgnG6SjUDUeKBE
         i41GdrtVGGOMLSlj7IZIA2rt8leCqkZv9ooGSbYZ6aQa9MFjoo53tIz+2l/2KfyaTjzS
         Fu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916203; x=1734521003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l1I2ck309o9qdqJYu3bhIkW88QmjXQLLkvder5A/zo=;
        b=osbOkAfzFRDBsFej1qzI/JvuWvfnXJSg7wqKNVWSKwfRQTwyQRavLaVc81NAaq21tE
         Ix3RpWpoXfXfxZ/93BCPh7CTqFt2wKj07jP9dcqhyP927lozEdTA3e8VrrBAdhO4cJtC
         AVz7exAVBE10WUTSjKUT6QSQDKCfnQBga+U1JFVllhQwpu/zDimO2nl4FplYn+T2EhB3
         w34hEVPElShA2XjfuCjyu8LrAcC1dvl8DoxsSogglAQKx09Hs4YCRBoFWZ3I8UY64bnK
         phwruYQgLN+XjTPIBnYu3Jul4Ckfzr3EafYJEA9sAvKHIlKYf2+0G5vnCZlEuiQlN7a8
         4MoA==
X-Forwarded-Encrypted: i=1; AJvYcCWtPgCXh3a+mJwzg+upSNg7ijyiQan5GyAfhs4teTtP5Zxl/PvqB982dab7zKxg9EEp7U8RDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ksSYXWBA82Q/9R3TeKU6L2z8JYbUQttpUFOfSo21rIINZC7r
	UdHLa7uxXZqiNeh+JRPlGdCFDyYm+ErdtSy4R9aXjTOS331kBhlS
X-Gm-Gg: ASbGncupLwNV5tKAECbZ0KrjfL99Br3417w+edHMNth2v6z111CGho/Gk2p0yQarIcN
	2m6d9T3p3O7AUDYsH5bvQ0gFopHiBmAJj44CUm9pDVAl+MIjzgfMhrR+15SDqoGYW8okRbWC5xy
	N6HD5EwVJZ3cKOxXHvGLyFqmTFYCiKo9BcE08VvgK1UAtvMFdMbGfvVUg4GmfqCxKpo+mGNT6Na
	skAdnAheQGBN0FcDFAQNc0TOg8Qk8dSzsLgdQqp0rdPHc9Wgs43ALhDQs5inPtnvqNc2g==
X-Google-Smtp-Source: AGHT+IFZ/i4RQlCJ3AH9/61VkIUfCaOigGZYmLs5RHyiP6u8Y2aWFd6COWq3vEZzepN3j6B/3uPbDQ==
X-Received: by 2002:a17:902:e54a:b0:215:2d2c:dd0c with SMTP id d9443c01a7336-21779e47121mr34337095ad.14.1733916202695;
        Wed, 11 Dec 2024 03:23:22 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:22 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 6/7] cpufreq: apple-soc: Set fallback transition latency to APPLE_DVFS_TRANSITION_TIMEOUT
Date: Wed, 11 Dec 2024 19:19:33 +0800
Message-ID: <20241211112244.18393-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver already assumes transitions will not take longer than
APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
makes little sense to set CPUFREQ_ETERNAL as the transition latency
when the transistion latency is not given by the opp-table.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 94e57f055a5f..0af36f911bea 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
 	if (!transition_latency)
-		transition_latency = CPUFREQ_ETERNAL;
+		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT;
 
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
-- 
2.47.1

