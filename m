Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC77DDC1
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 06:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743833992; cv=none; b=gUsyifcmUf3NwY6ZPl1H55pj1xRKS8j237qo+90l7QLPXwuNdGT1qI5isTgai1CE37M9vX6hkfmclzPfQxS6HG6UbM5tVYWNOViQFp5apLiuw45C3U1BuSMrQ8UAcn+Dp7hdnpNPRqyYNUnM1Kr/Wp0EsyuZEBkfdGBFuwi9hRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743833992; c=relaxed/simple;
	bh=kOe2Z+PD8qy5TNtkdQdGx6znyJnRdjYOSo+/Z9ZAFW0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A4MvjzwY9jHJOvhp3wMgO3DvKe7VEAGEoAVmjSUL4MS9SwGskhJHmhzAgXHkbdAX/0rDNiTn6UT9PP4MQyY2XhlTWPYYP3n/uJUcVcHhH0hSwsE4TqBGwUy25NsorzkpKaHQFGzQtstW/31fy3QrTgZvX/aYfX5PH8zHwCtKzS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO42xEdx; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO42xEdx"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-736ee709c11so2366472b3a.1
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 23:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743833990; x=1744438790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvlWzim6YndqWu3ZQu0rSQefXK13/0JaECZ5f7JnfO4=;
        b=gO42xEdxzMHGNw/nwgG9L2It0ScLIiRsvQxexMPiMU1TJPEFDa8GFUkj6hmJk1vD9X
         H8PFWkcbuozY/jnz6DI/SAX+gvN2a8vJG0A8azTAW8fTAy9MZk5s4B7s0NYr9KQcHtnu
         TNoOWnBF7wFaap9+uzzxdwypPqszcb7H+X0PqQlP5pHFqZ/BhfrbjCgbAw9C1Mmu+7rd
         wD/SLhwms2cmQbBrbSPJVNWDVbmw5301NYAG1qJgsmlAsM0pn99Y3esVxJiB15Ldlm1Y
         Zqf/7PAD1mSoXa2FExeEkVIOqO4aYU/dKZzov0qY9hVWgaCNTGzB7ksOQe0WvN48kvtf
         KUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743833990; x=1744438790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvlWzim6YndqWu3ZQu0rSQefXK13/0JaECZ5f7JnfO4=;
        b=kacVcuc4jY0ADoTfZDIdCaO/gXRAFDqcsxTm5SMo0ZHrMdz+ZfIuIt66E2/e5g70vj
         /jAY9x37gOe9s8TQpCjTl31fFxUYW0RQs3o/wQRD5ZM4QaVDXJk3wcEsRtleegwHQGKj
         iC0+HeJySQM8jy60kxAFGsuszFgzZBmnW1/sCEyvwY4QaqgHg3j/itcpq0ij/qotTsId
         jSfe/rnfQ3TvFK1Zm00WugSYHxiEPOilk6oqRBmkH8SUeBP/TntoRaiS6JFkXxCElzmh
         MzKtGDo8RbYJY4QolHvZ3dtWjgazFJblrd6p7W+hwuT+p9UXCWQHET4/sA69+bBDqEeq
         GZHg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ncIGL/8ZGV+4r0RBive+FGTtjsVOKJHfr45r7A8Gj2d3nFZMjrW3t6g5guW1hbvnJoLqxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvB9DoYd3jbmuBaOENLWM0HGSMkwLpcv+eqz+C00paDwSfGhe5
	s0h9t5txakulLet+QbJzr/zIhb1ytsekBKR5TfAw28yQ+1kO0hCV
X-Gm-Gg: ASbGnctZfhHqDJfy4PhlZAyzOlpiJ9pVpKN5yEmLuw0Ltv3vDnGGD51Ec5voNd1eaEf
	YLfEPDYClUFIIQEZvGe7iK4VghiN5zFM9Mebv4w1171tS1xPlz3yqDTjVYcrCD6aCEHMN8IEnji
	XfrStySIoYwrXlksTp9tY5FMtvA0uwdIR9IxJ2xoLeRzNt6g7x9B0VgljwkdqHzAQgJqY/ECI/r
	KTSSJqLtCIqobRdt0aW/fMzE4/9twGVdtygxiN1KumzWMo05KuVB/XattKS+q9kv8RBjNn2snSs
	ss6xY9lSvlbyJy8BL/LE12ggmisaI4cQ4NT+6qdFVIutsEEQvL0v2UQfJVDrDy8KQOxE2VgFfUW
	u1yn3
X-Google-Smtp-Source: AGHT+IFAtgmoL2nMv36spwTBvOI1Zop6q8ft1LpTEtdlGsfFq6JVDVDdNNkOWYXi+baTWF6/wwaPdQ==
X-Received: by 2002:a05:6a21:900f:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-20107efef3emr7651006637.13.1743833990025;
        Fri, 04 Apr 2025 23:19:50 -0700 (PDT)
Received: from henry.localdomain ([223.72.104.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41a65asm3830209a12.69.2025.04.04.23.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 23:19:49 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: alyssa@rosenzweig.io,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate()
Date: Sat,  5 Apr 2025 14:19:27 +0800
Message-Id: <20250405061927.75485-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
for this case, which results in a NULL pointer dereference.

Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4994c86feb57..9156becfa367 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -134,11 +134,17 @@ static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 
 static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct apple_cpu_priv *priv = policy->driver_data;
+	struct cpufreq_policy *policy;
+	struct apple_cpu_priv *priv;
 	struct cpufreq_frequency_table *p;
 	unsigned int pstate;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (!policy)
+		return 0;
+
+	priv = policy->driver_data;
+
 	if (priv->info->cur_pstate_mask) {
 		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
-- 
2.34.1

