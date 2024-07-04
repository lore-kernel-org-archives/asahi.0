Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576701A08DB
	for <asahi@lists.linux.dev>; Thu,  4 Jul 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720076053; cv=none; b=HkRys1It5vTvmW/CFBSpf5inWYvN5sWXejmvFz4vwA2OrUt4sJUW1M4MttvF9u7Ud79TK3qHACfoyHzM3lr2nGWmF3hYUUb24EtvPHCxS+3mzii33DWrYASHZpguq3Z16ehPNMwDvw8bNcwC/OYk2utiV+ZKglgKwEHhonGhFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720076053; c=relaxed/simple;
	bh=+acP1k0Nkw7OnsyYvGJb6tDt5gJNkeqeIL3W8k34Rd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LKvXGuMsJ4Tg3rIoQfLivuVjYB+lGnw2/EkDp9ZjLjv0WW5md/kR0aycBi842lt8LnfZULvu5tRuXdybCNTIb8KVwlVMfuz/NuWVn8T89mKdW7vkFNB2pcr0rkVpNIS2HFn2HsjEYUDx+TY1/6Q+oyu+p9Tt8YpN9ZsYXYamzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWyKr4wN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWyKr4wN"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so167397a12.2
        for <asahi@lists.linux.dev>; Wed, 03 Jul 2024 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720076051; x=1720680851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=;
        b=OWyKr4wNvxqDwiqmyhfjNoeIYWSsksiuRMU/QpCyN01PCHJrRUJeqrDgJuQs0X/umr
         YXIph6/A6YrzeySr98O/XqUrqQkQGpdmZCrua8zm0XK2tFHuBJnwGERsD1ZGFQj0fnmB
         XJHpSh70UIMCpPXaBZaxmUTsrAG39cl6l2TjVaXdTXJ0DIwrfkXqLrCM6J2pw3ACZals
         Muior5cxTybp0DsUOdpyjMxcmYAhN2IIHMVgS887KZvmT26pPNxgBd7O+CAlwvPPe+Bv
         XNQTXzI4enojXgpWGyy/RyEcPXy1XOhXABJwKtgXVpGAOewec5YOawKQm/TMzQaaBl0O
         VoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720076051; x=1720680851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=;
        b=YsXmIPT/fkpdxGx9+s5oc7r2bNZ5fHMqNpAQTKfd8fOItKnpNAiHqh1PcZ2DBBECOw
         xIhGgwSw+qqqvI8Fy38trLhzn10xEGw5hAMvEUjYZa9mkVib3aBwDWy1VIWkMhdJUbJK
         Gzw1WHFr/+QI5TSi4A180tdpKaz394soZlcXbiH3/+iHI9S5WKsyDXISl+xsoK7Tf0o/
         RgTCAH1X/lcTLpPlB0xIikB8F6po3sxZrJBN1TefOPwUKddsp/qMKuwan8bO0yUrBcTA
         7puOIckU19x+ebcn+CVNDmyhLpkpILYCLtYi0xD8tUr47AgHwJ9oP1ieuWbprR4x7kUw
         WTWA==
X-Forwarded-Encrypted: i=1; AJvYcCVrUQc1BYxjtcIcLoF+xDDpctPmef1mAGKgNHVBhFvTRjsAQA/EEdem0OZj6V2FjMu2qWHaJDyLSQ4ZYCaFV5u7wCtDrv4=
X-Gm-Message-State: AOJu0Yz96Q7yTjFj8oVuTcZg3xEuuMh/lu0xN6YTV7K+ADfnTBcsZnXE
	sOPFQ+oA02r82dX57ET7AKW0gVdjclihN4aJ9ctKQv/nv9y6q4CQ4+Lspevpytg=
X-Google-Smtp-Source: AGHT+IFgHGJtYuDCHwF2hfQyaKB/hypmybNqgZV2mdKvHoDVjRkC1GVw1vaa0cTn5Yput+q/r8OwGA==
X-Received: by 2002:a05:6a20:2594:b0:1be:f080:6d27 with SMTP id adf61e73a8af0-1c0cc742219mr739965637.22.1720076050677;
        Wed, 03 Jul 2024 23:54:10 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a989416sm711460a91.29.2024.07.03.23.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 23:54:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huang Rui <ray.huang@amd.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH 0/4] cpufreq: Make cpufreq_driver->exit() return void
Date: Thu,  4 Jul 2024 12:23:51 +0530
Message-Id: <cover.1720075640.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make exit() return void, since it isn't used by the core.

Based on initial patches sent by Lizhe [1].

Rafael, I will take this through my tree for 6.11.

--
Viresh

[1] https://lore.kernel.org/all/20240410132132.3526-1-sensor1010@163.com/

Lizhe (1):
  cpufreq: Make cpufreq_driver->exit() return void

Viresh Kumar (3):
  cpufreq: nforce2: Remove empty exit() callback
  cpufreq: loongson2: Remove empty exit() callback
  cpufreq: pcc: Remove empty exit() callback

 drivers/cpufreq/acpi-cpufreq.c         |  4 +---
 drivers/cpufreq/amd-pstate.c           |  7 ++-----
 drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
 drivers/cpufreq/bmips-cpufreq.c        |  4 +---
 drivers/cpufreq/cppc_cpufreq.c         |  3 +--
 drivers/cpufreq/cpufreq-dt.c           |  3 +--
 drivers/cpufreq/cpufreq-nforce2.c      |  6 ------
 drivers/cpufreq/e_powersaver.c         |  3 +--
 drivers/cpufreq/intel_pstate.c         |  8 +++-----
 drivers/cpufreq/loongson2_cpufreq.c    |  6 ------
 drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
 drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
 drivers/cpufreq/omap-cpufreq.c         |  3 +--
 drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
 drivers/cpufreq/pcc-cpufreq.c          |  6 ------
 drivers/cpufreq/powernow-k6.c          |  5 ++---
 drivers/cpufreq/powernow-k7.c          |  3 +--
 drivers/cpufreq/powernow-k8.c          |  6 ++----
 drivers/cpufreq/powernv-cpufreq.c      |  4 +---
 drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
 drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
 drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
 drivers/cpufreq/scmi-cpufreq.c         |  4 +---
 drivers/cpufreq/scpi-cpufreq.c         |  4 +---
 drivers/cpufreq/sh-cpufreq.c           |  4 +---
 drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
 drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
 drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
 drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
 drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
 include/linux/cpufreq.h                |  2 +-
 31 files changed, 37 insertions(+), 102 deletions(-)

-- 
2.31.1.272.g89b43f80a514

