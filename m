Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A996188A0E
	for <asahi@lists.linux.dev>; Wed,  9 Apr 2025 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202758; cv=none; b=k/48f9+kYLLCu3y3JuNnNUSG2/yiG5J4nlL5JI1xc7HUaz+cicEoxMI8P6sjbYMNW9K7WdQM8coq1HSdB8oSpLJUci3Qgq6Pdf06Q4F1jpG4u9lR4p2u8ss9KiQr9QEKqXFAOPBKZ3xyTXGMhq0iuBUPcF+FLlAAawox255Ysec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202758; c=relaxed/simple;
	bh=0idBfCTzKenTxIiSwgSu/KdenyNnfTy6Efd7dSG2ssA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oYLTS9EP5WRRTBri/3Er1ERWk8EXa/Co/k0Vn76hIWoghD+U9Ggm/jkxGTX4+shF5VDHjEuX9v12Ayb45/HwOdSxV0/VfoiCZcy+Wyaf7JK9oAX809nY14VVZLrUdt6C3/iem49S2U0c4kZVyPQ0L0Z4e56LKmMN4slaW37RFq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMWaG57U; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMWaG57U"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2243803b776so94035895ad.0
        for <asahi@lists.linux.dev>; Wed, 09 Apr 2025 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744202757; x=1744807557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=;
        b=XMWaG57Un8iim/mZhOrbT8aRX8IWlKwa2Nf3Z/1Pddmmg1ThwYtnADvVRyGk4zyuFa
         biSd43o4Zj9+cRqSMBZjWs0CTb4BjTJx6PsTTHcijhXUXg0v2hzHp/zUCn/4j4R6i+Uu
         nJiUAzpqWCyxBAxkkCVl/i3YDdwmJWgdyiZ9cr4EX3LCZ/UazoNmurVqCxiwyGJSJUae
         +DnXj7z46+dnHrxaC2HWuQm2/U2loKdOwK5PcJ0wFdKM9LKR/o6yg4MWlV5Mhqhh29ES
         EjZnG95AhOO/T8eeBEWfHFc65bngFNScqXRydHJNDdI2tRjBgEmdYKh1qVgN74qWLM0Y
         yuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202757; x=1744807557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hW0uMB23s6rTN+79K6wuOhxoVdGvng8abYobjgd2dY0=;
        b=DYvI/RIfsSXq8KzAauIlAkG9C8FUG7l5sWF70w3dg+SZoK/J6LdmEzb5VvHeQTfl/7
         HB4xPTANw3AOOTup7TLZsSreuWtozhQqKh5WIVN6aaT/J8KjFcVXDoVMruYHfoGDCIUJ
         MQxKMsM/5otIcpHTmMgRStxN6cKILQPSshMK+sK8g0rmIHHtpxmUyTh06lqJi2oAbMQ2
         R5aKUXFtmHm1l3cxHpVfCq6vJz7WahzgbRT7qKZL/Tf/MK7PEjce6JCyUX2i2VN9zJxC
         evXAXt7/KLrv7AQVeSof4ZC77gQg606awiv24OnCUTrLE9OFc2b101vR3dIrfZB1CvZE
         zanw==
X-Gm-Message-State: AOJu0YxjRyOV0XSvui/6Bo9zoBf1bJPwRUVPZFUwCaImL9xWC1e5KPTJ
	1VtMs+XWphu4s0E1YwtoQog2ZumrbdoCo6w0wI+MBB8pSJ7wahWC
X-Gm-Gg: ASbGnctc3Cs0wXIWd/S1sizAIgQuFmyDDjSzDCuPpiw4wi13nWJZ0c3YvyMja9VnB8E
	8jOjsrr4KIUy/5CL5DN3ZPETnMczqzJLgoQIT+wqrtTW3AZycqYSU5DeFyx1Qv2z9KebrCpnL4g
	F+CLo5oI2h4DklVGsI4bwMz+F78vppiCaGDT61N1IovA7koTlyWfJg332WD25x4+pwJFE1rMPGF
	ta1qGojTgWkYBi5Boy2wyjLFcIXunUkIGRLqYh8Czos4S4PIjNwxWXuxRWGdHOYDakQT/xY9ST9
	6jvr6ODn1bF/+JbBJf6wytZj8nOZ+bY7gFLFCdiRJ1OxfvkMeuIGObPrsAKXlTuAWs8=
X-Google-Smtp-Source: AGHT+IGmBiCflS+dqQ9MaoOZ8ceeMEIKcTocd1UAk+LlHaQn3WAQwStGaWQzSH4vbgk2NAKmvL6ilg==
X-Received: by 2002:a17:902:ecce:b0:220:d078:eb33 with SMTP id d9443c01a7336-22ac2a1df21mr41865715ad.36.1744202756563;
        Wed, 09 Apr 2025 05:45:56 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c971e4sm10531465ad.136.2025.04.09.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:45:56 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2 2/2] cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
Date: Wed,  9 Apr 2025 20:45:42 +0800
Message-Id: <20250409124542.47166-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`

 drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index 17cda84f00df..dcbb0ae7dd47 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -29,9 +29,16 @@ static struct scpi_ops *scpi_ops;
 
 static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct scpi_data *priv = policy->driver_data;
-	unsigned long rate = clk_get_rate(priv->clk);
+	struct cpufreq_policy *policy;
+	struct scpi_data *priv;
+	unsigned long rate;
+
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+	rate = clk_get_rate(priv->clk);
 
 	return rate / 1000;
 }
-- 
2.34.1

