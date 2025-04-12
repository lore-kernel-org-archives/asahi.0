Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D0F5339D
	for <asahi@lists.linux.dev>; Sat, 12 Apr 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744473923; cv=none; b=joWTV1ZgQLMRZSY/OKGS6AlzMiQVCbGmy+5hVmRw4qlv+99XQxRoGk3Vmp0MZLnK3W7/vrS5EnFPz1Cs3Z+3wf2ayyCXgtY0X927V1hGuy2jWE+jTjSD7xI7QiSLyMY08yAdMHwnb2NMsDkx1ch5lClZlfD56WrwO0KV6/1PA0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744473923; c=relaxed/simple;
	bh=pmfOx0ByssuAb79V71tEtlJ1QVhMnmrwa7zyOqEos0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JrHt8++nOnCXqDbGS+XLM2G2JA+85NaV86ZwHsHSZJozCPnB5b3LpdVQUVWg5VTOjTjggLzgeIDK5KwCtQ73lVBxmeAFYzH2QBD40hnxae7+r9MZlcJeC7cJQPMgJ41u6fo9JAOEtkkg2PD3mOzwknXAdfvmtu7mgbDovWQDIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix0i5AZe; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix0i5AZe"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47745b4b9aaso4769321cf.0
        for <asahi@lists.linux.dev>; Sat, 12 Apr 2025 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744473921; x=1745078721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18rNRUozuuywP1tNu8idsUvf4lnx4Kb0IvyRGbZ6T3M=;
        b=ix0i5AZev+qrGUarFHOxY8ax7+YRr9wqonCQBjtWytZjnMMSBdF8u/IODnS39GJJHI
         DfvdhtPQx3K5r1FMyzdYy7rXrrk3ciOPdloMmf4iQUT1iaX+cjTQmS+2av96n7K24LYO
         ncMLPnICmaCGg7aNsQfJEwKR55fBj/tlUvztPOgDu4bFB85nOw9ezNLohkx52i8jDQ3B
         98yR4eKv8FVjJMYeC4Vy4qCgY2q+GrCsdXhUD4dn/3RacWbQ8NbqTsWJwxybvVyBqZ/G
         kUJ/fa+BSZM1sflj2+yuaVOx8qjcmuKbgd5Hd3+NYeLi1nep073dwai0mTzwjLZzZ0Sg
         XyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744473921; x=1745078721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18rNRUozuuywP1tNu8idsUvf4lnx4Kb0IvyRGbZ6T3M=;
        b=AeDzjwaMrG8nkpWClbSLWNKvpqqCixOZLosNBc7ygaAX9lOqGzm62GfXuF6zbCwQcp
         EbsQS5yC5VjDz+M7G8KTS2XNHKbclnM6/bSJNedK9tAIzH+NzJqLqrKGbMCjkGgvksOh
         7c6gvNyknDBeCsVx9PpaMX0RdoVCCIF6KaBvlokEQAWsa5eMHn4Xn4a5Kf67AcirFfAn
         YvCRSlQTkeeBdYHGQLfgiDl9Z7/VNlRa5wdv7AeA7k8QstJWT/rXGrC/7zn7gB4s1Odv
         qoSf4LpLwMa5OMlLVrDt6r6AOkdl1wltl1Xa4bqS3uqQ5nxQo4h+v0dLzUIw9lg3OqAY
         XQhw==
X-Gm-Message-State: AOJu0YzugDk8PmMlJDZ+bSri9XhPo9RzuSZnbhpKalem1VRwY8S3N1Yn
	p9y5wXBxKmc7j6QNf7xmOX2TOmQ+MegmV8xf8xnGcOR4WkljYVo=
X-Gm-Gg: ASbGncvdgkb+n4T3iOCSVoINCRbpIxOpk7MllYhnUfwDv43bUIRGJgOxUmSGXM3o0fF
	6kboeTLXZiRFsGlWIbLQJP6n9kQ27Q215r7SBety3+68771LvkiicDJvVG4lgrqTMmbfaI9m3T3
	lN01uGJiRcWch8iNYULBi5FocZBUOK23TjOFJPjDpNHD+IbKWuVE6joRKX6UXtdLxUG3AXhkf99
	TKyB0OnYhBlMbE3fGWpkTG+FqHO6bxgkDToinYD6NLdIHpDQDMFjRDbaXCWqoLknNO+BNe9ZsrB
	XbLyc4pBDcLH3ljc/rlIj51EM8W/8l7jgIH/JQ==
X-Google-Smtp-Source: AGHT+IFiHWb94k652mgAZ/ZDuGpTVK6w5j1J2J86j0VwdFWpYKq46BdH1rfkKZVmctjSl9dXg/cPAw==
X-Received: by 2002:a05:6214:e4a:b0:6ed:2289:6623 with SMTP id 6a1803df08f44-6f23f191ce8mr39928946d6.10.1744473921131;
        Sat, 12 Apr 2025 09:05:21 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea07f3esm51541616d6.76.2025.04.12.09.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:05:20 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	marcan@marcan.st,
	maz@kernel.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
Date: Sat, 12 Apr 2025 11:05:18 -0500
Message-Id: <20250412160518.1824538-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if policy is NULL before dereferencing it.

This is similar to the commit cf7de25878a1
("cppc_cpufreq: Fix possible null pointer dereference").

This is found by our static analysis tool KNighter.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
---
 drivers/cpufreq/apple-soc-cpufreq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4994c86feb57..3de9bb2b0f22 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -135,10 +135,14 @@ static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct apple_cpu_priv *priv = policy->driver_data;
+	struct apple_cpu_priv *priv;
 	struct cpufreq_frequency_table *p;
 	unsigned int pstate;
 
+	if (!policy)
+		return 0;
+	priv = policy->driver_data;
+
 	if (priv->info->cur_pstate_mask) {
 		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
-- 
2.34.1

