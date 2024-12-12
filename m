Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4C20626A
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987101; cv=none; b=qb2bibxhzgKxSxt4kTIQSPx53sGxAvVdmNbT0IiZFFD8x+8r9+uZ/8vGr4CUSyZ4g4DiqRfhiJGodDIdh/2qdp7U3vgsEc17jjxuGRo9MyNpdE9famb/+qq/6pItXAB/eJxwrywpk+1K4mIZZF0GDaIslXe+yAhk2VK/UFrYgZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987101; c=relaxed/simple;
	bh=yE0aQpLH/1FOUdWsRUbN03Tzw84skMe8N0rw7qw0z1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk2zs+9qxf0PAC5klaBZEXPkOoJ6ew8AOo75rDVUaiBAjWd7a+FeLCkS0tk970Prmy4xKBeOwGP5zghdIw7PITOI35HjUL1NXFymCEayfMnMBKsIpH9HcKXgGdBD5yodlGV4ADfzpdykF2XETOLhbNtnsN5MbbpCjRItuF/37dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns6+b/+S; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns6+b/+S"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-728e3826211so213043b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987099; x=1734591899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+xNT9o8scJSCGD7/hX9myZPXhoesiiISnOX8ftRSxw=;
        b=Ns6+b/+Sb86ttS3hG0QjcNo02bOKfTR2pcAolFyNeZ6mDfu+l6+BdE8biAAGZ9yKWK
         TN5yCACC7XDLIR+oijYuk8soQ+5dEx53aFZU28uAt3WVQvdE3FAE2SDenGLg9I0SbGJY
         FwTY2SW9O4nbXHBPnT8D1q5d5soqO4aJVUk16rUxiNTxKBOgtzoAm9PqSbIZGjRKqYVv
         zrKRUDKDn0RB3py/04UB1rufQdkng9fFQIfVMimEvw3mZiXmt/YMYkoIvFIdZp8NMbj6
         5xrjUxS0SQgk0BK/T4jrDkXIe2O06/9P3misA1vHEP3WqQzQbCMbxs9SZgwNjL5YF8dx
         8b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987099; x=1734591899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+xNT9o8scJSCGD7/hX9myZPXhoesiiISnOX8ftRSxw=;
        b=DGiroU5WHDsXD2LBBPkfiGGjlrR/8FNRLNBmagtLHTRxMcS1U36tLGXgFXElqOVly5
         QbNGWVuLkw+h9l9dCl3RN0Hp9J0enD1cfzVwN1k8VEpFkpLmpgqysCulEDeKVC8Y/o9Z
         cQABR9/Vk1YJr5N47HRiIcSdPZu0Yd5/gtVD8sV8a0yrnp6ECP4WJS6x2pRo9R6mlXKa
         nXDH1tA54ziq3fBM/r25XIDVLdpO9dCcBdSuAXaYgiZDnR4iEIgmkphsUwxN8wj4W2JQ
         WkTuXz3TMpQI+PeiZTJ4DsO3WEpZtzHLnqZwvGFhJDyKVo1rufdUGcr/nyBfYGaxeXSs
         yUCA==
X-Forwarded-Encrypted: i=1; AJvYcCXiNxBSvwrYoHcJQWm/zlM98dXwINyP9cubrkGkQ0ENv+8/HqGN0CrTMW0mbiifUL7cx9h8Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy86ums0OXXioicZyLewRcgRtJ2xRRzehE+dj5CjgG3JUL0OX2e
	SrbL9N7LirbHfCthQ6BHGHYBvatatv2d167qre3dvXiwgMrrGY5I
X-Gm-Gg: ASbGncvTtWvAPji5jmwSP3zAYJDPfGSj97NovKk/fa5Y512z/OaXt0HpDbI8pU4WykC
	6KFzn7N4wsGYiM26OfUOZsc+KBwm7l/IotgZsQ0FUSKcw/YP25OpZxJSfYacd55fNcFlPf2o7qC
	49ynIEOrPYxZgVBuI/64fyRxj79PBOxgPYaVBX5Yo+VScKQYMoa5Nm3Zg7jUeBXsyjzdtZNmpY9
	rXWhWrqCXB9lxBdk4tp7HABCZhkwdrECi2H2sygjwTNgBaKMaIHcWkKmL9SzxnB660cCKQ2
X-Google-Smtp-Source: AGHT+IEWZFABNU2cmsx9g4Vfkxtd5tDRV33KNAhW9o7B+oCf+G6xKL0qxxHdO05yjrF+abxzB9dUcw==
X-Received: by 2002:a05:6a21:398f:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1e1cebb7f15mr3582956637.30.1733987099042;
        Wed, 11 Dec 2024 23:04:59 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:58 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 6/7] cpufreq: apple-soc: Set fallback transition latency to APPLE_DVFS_TRANSITION_TIMEOUT
Date: Thu, 12 Dec 2024 15:03:05 +0800
Message-ID: <20241212070344.3858-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
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
index 94e57f055a5f..c9f31a3653e2 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
 	if (!transition_latency)
-		transition_latency = CPUFREQ_ETERNAL;
+		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT * 1000;
 
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
-- 
2.47.1

