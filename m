Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745F1F9F5E
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546543; cv=none; b=Pj52WViQhNn28Q8lSGI6wFgPdumPBsy504OyHscxLVEcFaVL7LKvdKg+bBfFGqDDTtdMI+NqBQaP5DNImRlPlt1L25Ixxza4optGFZ37juBB8Q1IYXerf0dPwJMZJ0tcR5X/BraVbamgNdSzu7aP6HyBJvo3XtPNdspZNjP9q34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546543; c=relaxed/simple;
	bh=McLCdUey2bygS0M+iCLLl+cF5NFr/HCPPVvW6wGUNvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLQow7cHBWk5+hiRzIn7U3DjJch0VbB6pMk6W56UB06yZIrcYNaDwPPUubVr5Un0geYdZHGL3ios9KHiubeZM39Hn8slPjcrQGG3VlYduPvg0A5H5u7rowOAycUfb3zX2En95KtX/h5WcWautXjnmwYUDL2erXRhLfPJyV23JIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avKVP0/n; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avKVP0/n"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2156e078563so51911265ad.2
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546540; x=1735151340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNc9bbXIkaEAXHmkzJsg6tVAk/RGNozbWEU6KnPyaP0=;
        b=avKVP0/nyITzjA08ESwiCSJG6n3f3JncavMOYq61cwWzGGbc+U+tuTyTbmNK/r4+XP
         fP86cF7x6CansWbGVwuM66XCv1hZx6XO+4xlfkXjGiHkOrtRJXSwAK3f3xXu+2hGD/nO
         L45xz3nBpOT+GOhYgsgSG+Sd/k7oNvHJwFoKHTHi/MI+hiv11vm+NuPwoO/IVkEcHpD9
         qaVfx3AlGedUR5qpNkTVyNDo728KEv94HzSDnm5ytEG3EkK7ugIr+EvX6XQyErPIJW/e
         yPMuGLl2Yvuj1ASs72v9SstSyjlUn7+zjpE2pZyHtbcuxKkhU/RPxbXx4597Va90MjsZ
         6Q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546540; x=1735151340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNc9bbXIkaEAXHmkzJsg6tVAk/RGNozbWEU6KnPyaP0=;
        b=jMsyCfZWz1gIihEZfjnC209GidLykDHOtOEPnmGRwEqJB8U3Llex9jEo1A8sFVxmx2
         UOnPa9gPdpdJpW/74VkDLTw1wTkmfWufUKjNlKGK2DLDSuoMqAofzaD5bUPWPsFc0Xe9
         /RLeA77JDfj7JqcQ8CACY2INh3vWh1WSfRcQiHxtxq87vjrrDvn2YJr6DKAQ/75uE8WZ
         gwzarrMxF+8YVF226c/EqZB5pJHgVCgPQ828vl2LEeTi1g5cIZ7zsOusYbMA3Q+cOu1K
         11e/auwBJnGPYCvY1WRA4nM77I4UWL+ivAVrxvS01Mq2aqVWt7bWOp8wy/4+XW9VQQRW
         R2pw==
X-Forwarded-Encrypted: i=1; AJvYcCUo0sOwkikISrxHs8mnuDSvDhG4yfIePwLcAeWQt3B4MJ2NQBjB3uT2+Lgctuu5D+Zta3LzeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaMr/lk5LQ9m6oSDhTzIeEysYw8XnWoWMl5JSJCnY16jxm+pWe
	GBwOdrKCBqkhT6CMy5PCe/d+GclbQ8YWWBVZDdtDnHB9sNyR96ok
X-Gm-Gg: ASbGncupoySnxaU9r6Z6JL1/sWr26igQNrRqO8M/S95GPOE7UVeqRM8v+FtJcQEQB1G
	A6VRW8Rz0Xs+CD+CCJNwb88YPNXYLAnW3ymjMUTZ1SCLPqH1gbMqTtXC2Ych3HHSLJyELwRjDCS
	Sl9vrA/zmvGXZiDJN1jX4SqrjQrdVCSISksgkq7ToG2f2ObrB+x5qT/J40oXvsLoLzAklyKcA1+
	1w0tSc840G1HAuVNjFLgDud8wOt08ZzjPbc0qW4J+v1jDaqr4fJDU/heQ==
X-Google-Smtp-Source: AGHT+IHxXWjf3S+DdVVf1jMLuuc8tXpGWFk/e409lCT+hKGNpbdRe9fl9r68eLBILkwmcXvTlksMPg==
X-Received: by 2002:a17:903:120e:b0:216:4cc2:b1e0 with SMTP id d9443c01a7336-218d7216b93mr55843765ad.20.1734546540124;
        Wed, 18 Dec 2024 10:29:00 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:28:59 -0800 (PST)
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
Subject: [PATCH v3 0/7] Apple A7-A11, T2 SoC cpufreq support
Date: Thu, 19 Dec 2024 02:25:02 +0800
Message-ID: <20241218182834.22334-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add driver support for cpufreq Apple A7-A11, T2 SoCs.
Device Tree nodes will be included in another series.

Changes since v2:
- Use NSEC_PER_USEC instead of 1000 as multplier.

v2: https://lore.kernel.org/asahi/20241212070344.3858-1-towinchenmi@gmail.com/T

Changes since v1:
- transition_latency is in ns, APPLE_DVFS_TRANSITION_TIMEOUT in us.
Multiply APPLE_DVFS_TRANSITION_TIMEOUT by 1000 before setting it as
transition_latency.

v1: https://lore.kernel.org/asahi/20241211112244.18393-1-towinchenmi@gmail.com/T

Nick Chan
---

Hector Martin (1):
  cpufreq: apple-soc: Drop setting the PS2 field on M2+

Nick Chan (6):
  dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2
    compatibles
  cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
  cpufreq: apple-soc: Use 32-bit read for status register
  cpufreq: apple-soc: Increase cluster switch timeout to 400us
  cpufreq: apple-soc: Set fallback transition latency to
    APPLE_DVFS_TRANSITION_TIMEOUT
  cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support

 .../cpufreq/apple,cluster-cpufreq.yaml        | 10 +++-
 drivers/cpufreq/apple-soc-cpufreq.c           | 56 +++++++++++++++----
 2 files changed, 54 insertions(+), 12 deletions(-)


base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
-- 
2.47.1

