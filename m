Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0925E80F
	for <asahi@lists.linux.dev>; Wed,  9 Apr 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202905; cv=none; b=Giy4vDRE9Bc42rPycFUmk3qHTbLRsX5VxwIgBsDQOL8f/k0GHXC7zykxMZkyzVVFZ5G87U3zNl3NxTSdgFRP7tiwWC0nSOUEe7YEUBlomxzYEg7UTKByHlYPLMvXBzYpesqM+6gw79qmtby3TkoCk3fSKnJvxiJFi/gxoREhaaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202905; c=relaxed/simple;
	bh=EY+MCYO6+/Do1rVBG7o49cZhvEu9A77dcSJzw6meaMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IrcN9a33efFBtfw03nwi/t/cDvYIrQLS5RHHr5KqLe06+QEw4D02YzZZbUuAstzUxDgqvx/5Q0J9M4aZFa8MtQYT+2q8kPn+NjDDcdK3FL4V4XT8HHNvNX4vHuhdFlaOH2IZ7PxvT3FggSbNXpo5gIr55a7EDVay5jC3UZX/L5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTpxMSEM; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTpxMSEM"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso4620450a12.0
        for <asahi@lists.linux.dev>; Wed, 09 Apr 2025 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744202903; x=1744807703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gcS051l6b/8O+Is0vrcSeaFJGvMI4gz5XJTgTf8jE8=;
        b=HTpxMSEMMztOiV51alcd0iNj9l4WQ5iRygpWhIftAl6bCjli7lcBlt9wtX1RCpulG3
         UaZy3VVSMTUPnPf+4K4s1BxOrD4jC0d/BQlg2xQDq7f3mw1sbjnqnwdHXj45oeWEe/Zd
         SeXCR3sJ+MN9QAOqbI4/v2/Aa/BHfXC0ehYX/n1aQOiG8ogrRy7E5MgLHAExxJ14jd/+
         ON5zftmsson1qgMobH8BDDurSj+DyBcKZur3Q8uAGKcAJv0bR9Evjt8zkcZKHTW8Nor/
         Cdefx05qg5uJj+RQsO0iCi+cVmOP0HVrLg8Tey98vZ12Y6mE58M+B2KJxkGXPTJkECHj
         9VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202903; x=1744807703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gcS051l6b/8O+Is0vrcSeaFJGvMI4gz5XJTgTf8jE8=;
        b=HvdmbNcYv7CfDb9PRGRRGDK0dEEzcVxi3VTPykJwV66zPzZytZ3ywz6dL350zKSDG4
         MAVRFzOcsVY5xR8tBhcYtRnt27FC7AxxpXRFLgtWHqp/bGc72NMSD9s+afNYz7vWkqCI
         +fzB7g/q2cZQP+XwJM8EaMw5ObGDIwL0WVeCgRvY6pMnWao9biea1DoqZ1nOzc8aL13y
         LeTZPc2NYvNAd4EPGCIZPHChubOHUUNwNj/3LHm0s1GTXAcBW9QyAPz2HKNQMJbxUl9I
         KkDeaBEZMiqSWS64tAbHFvEJ9pzAAo2OuOnTpLzlcpLqT7Hfa3ZXE/pW40uyn9fn3VuJ
         UOqg==
X-Gm-Message-State: AOJu0YxTN+V/y8gQbDf3vKlNm4dEXWOlUBG9t2MQQ0/sieVnJDArPfB4
	uKtcASRTgSlOyCS678R2cqXf5s75TP3CnM/bgAtkjFfB5i/vFTXD
X-Gm-Gg: ASbGnctMhywNGgRux1USmldy9IptMgB1V+Bgz5RyCkrWdM+XVA8HWZjXGeqmIXcMW37
	3ozEFoWSHJC8jRjZTcVKXMpWZJCkDwrgKJ6SxK4P07SqWCeDkjUYT/dUto4TBGKD8Z7DEDJSIoJ
	53HrfuFaPzG9wCzPRNt6/uevlmX3r3aJkCU+bg+q5Zd3kYpf64I1HB1DD+FWzLROn6V0YUBuE7B
	zcsVaoyQ2fYwHin4MGVEq8CX7HNQy60Gt1r2hGbdv0qZ15eH5lWEAlEAdFvG79cRqPamKY7R8IR
	2+BZr4I8NK183hs+Ldn3JOiIlmVbTfGSiuY6fsK+5JELG2HU1cmc/BTSKBgkZQpnCYw=
X-Google-Smtp-Source: AGHT+IFsp1KO7SpkI4Baqzu+PaivIakGq5Ke0rYEIizxnBYl7OLpEKVhaHzNjOfd00JduABwQS6jww==
X-Received: by 2002:a05:6a20:d490:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-2015ae8f37amr3086206637.4.1744202902625;
        Wed, 09 Apr 2025 05:48:22 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d2654sm1103588a12.35.2025.04.09.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 05:48:22 -0700 (PDT)
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
Subject: [PATCH v2] cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate()
Date: Wed,  9 Apr 2025 20:48:13 +0800
Message-Id: <20250409124813.47193-1-bsdhenrymartin@gmail.com>
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
V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`

 drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4994c86feb57..b1d29b7af232 100644
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
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+
 	if (priv->info->cur_pstate_mask) {
 		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
-- 
2.34.1

