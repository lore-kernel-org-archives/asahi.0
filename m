Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8B187872
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916185; cv=none; b=dWIJxN/F2FBY1xQJKkp3ohONBPDU3IZ5CXBPFOALWy9oEqgUitUx/RRxSCgyW7LDx49GFjUM2VhJ6l5wyGYsCBnvFQ3JI7m/nSD4OItUXORG9Tc6xvzj00/MNaZ02Ub9ILncAnrLI/BgUhSVUEuUG+KJHu2pTQZa6WbKxb+vZ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916185; c=relaxed/simple;
	bh=bfYMhLAAkkZc88mag8TEfhSuTWGW9xyLT/3qKbgJ2ts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m5p9Idi/k0gru2m+9tkJGwvcwipW2DbyuevNWjTAub812ppz/5f6vuiR2GskjUmKyVT16QBlUs6hDxrrypwLvDar1smJsf7n7SFi+gRMaLsT9FcYZLgcqc1HRRL3BSVP9k0yFvq8IEb8zwKgcWhI190MyYLA1xL/sQsK/vjaGuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3NLQLEg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3NLQLEg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21619108a6bso39064565ad.3
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916183; x=1734520983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2fBpF4DPgk8VjYpxJsEGAE8QpoFNbBTEEgsMSm8FzQ=;
        b=D3NLQLEgLLqvHuYww02MtNoEi73GY/sVfAigsT2XAf4JCGVuTM/YSFUW8DkB3MheBX
         9yrCtXpqVBpk0wA5nG+Dpwb0qA10tW57fF/EQ94M4lIRCdl4wPjtDXaDIvOVyURofEj2
         MXoVyvh23X6xLZG/fBr2/78N67vlHD70iSFaY2/kcZk91sRBQRq6PkpuiInkUBKPkJT7
         VYz9tOkHZD1fn+u0zAaZ7sgIIafR1/Zz/ZIdee1gfNKtYVO2MBKX6iZCeKxQ+cOweiuc
         CHywWP+xl9Jr9VgPZ8pDQapWd7IAgWzi7Sj0nw98ZV/Q456QZwUJtaOh5hXOjDL4b4OH
         4pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916183; x=1734520983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2fBpF4DPgk8VjYpxJsEGAE8QpoFNbBTEEgsMSm8FzQ=;
        b=A563nbGr73UPOTW4fLlUAyzyd3baZ5SIF6AYLUItFs4+nf6J4lJYbOjr4gFHDmPmjd
         IxMh8mzFU7GBS9gLF+9/Cm7xKSnoDcDuIKSrQ3srIuDUwmYBOSB+FTIicEJyqVQaRPat
         n0oRNdwWIbQEQ+0aEp+8OUx3NOfipvjFOGr/syf7vQBIP4CG4WGuZmGNXXqhYzQpuVy2
         MGpYLrGeODv3Tysd95EB6zJsVm6lshoB/6hDjaWomfHE4QYG47znyfcs8zNUKF+hNXCB
         cMcWQHObCWVBC6xDryz/AlfKf8reuiQpParqXhRYoRhHOIuj2ESQcr90jIMfLODbfR7j
         m6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXizscG+TEhPchQ27mdNk11WoeGSjWFYVwyNminDv7MX/1c8vybAKw1et59b44FGhN0kzpzLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwICcohknjdWIqc4btHa1wAc1DjoccQH+L8Cd+V5arw8ab0ZMbz
	3DlOQUMBTutxbjgwBaenA9rn035a4dqzWQROBNFDWGx9StxuIy+N
X-Gm-Gg: ASbGncsQ5ZuLUAQyfi5oYOZjE7Eb1nwBRO17vQ1fJy2sQ/afXZV1c5GViNSgLzP4CxY
	Ej/FP2iwS+xhFO+juRKuso6sIHOsDuNvTJ7nrDJDoTr9N/kxqB2GCHhc8XxBAXhX2+q8+QU1Kso
	6XlSDu5n4iNvCJBxqnLSCkm7VLwRn+ZOxD11IolufJ3xSGMAUggtchhacitDgENANDouY9mIStU
	1IkfUeqyB+GBFGqU/FAZL7YGB9WxpW5/r3UOEch7mil3AN8LURfb7VWrxbN0o3TPlPDOA==
X-Google-Smtp-Source: AGHT+IFQ2IW9tilUc4WqlMVThxJsWeAViNnNodENYGpepZHa2B/aZBLf4geEEAiOuYgDZKDGadI7tA==
X-Received: by 2002:a17:902:cecc:b0:216:2b14:b625 with SMTP id d9443c01a7336-2177853690emr44032965ad.31.1733916183466;
        Wed, 11 Dec 2024 03:23:03 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:03 -0800 (PST)
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
Subject: [PATCH 0/7] Apple A7-A11, T2 SoC cpufreq support
Date: Wed, 11 Dec 2024 19:19:27 +0800
Message-ID: <20241211112244.18393-1-towinchenmi@gmail.com>
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


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1

