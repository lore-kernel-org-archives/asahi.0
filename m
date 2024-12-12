Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05F16DC28
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987081; cv=none; b=ctcy+DNgkUEszHcXIJE5Mf0j3cLrK3SkBwRgoxVSdi9rEL0EwLspYIr6P0q1tG68yJITIgRZv9Y280bj70BIUbvO9anCCcLsb86BnGyvOOatydvO6ClZbiZeXAXmNrw/xsNGAsXmx+5neM0yigbAXyTTtxqiPmDkpr3BUB7wWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987081; c=relaxed/simple;
	bh=2clUMBF+zfM0MT3b4JiMSxRP50eR+oc99K9vxRX3gc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gKWRQ+jYNKWqumI1YfGglBw4xZgUtFC02WqwFLCsUGpgIs6C97Qiwt/sc78+JieVRuxEhzqrhIY14K7NrCD8feeA4FqBT0wT7tQeG7llAZCUt+0GPME+OeHcOs8ar18tpcnW7FUZaTdB+c17XnRXbgbe5ajswdbF+mvHxYfaw0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRwroW4N; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRwroW4N"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725f3594965so205656b3a.3
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987079; x=1734591879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIv08M5NuYFMrbLnuplDgqYvTP/RY0BpL7xzh6gruXQ=;
        b=WRwroW4NJIaq2FmCWe3AsT4E46KMgR1Oj+1gqM71YKdDvAYsJL0PZI5ybdyAB7wzLP
         jWi5QLpPKgdFYoA68XCVyYiawLFt/dYz7tpJn3dIVa4HD4+hw7YxYmZEjpW3r1upCPOg
         ObWos9TfzgyYXB8PyQ6Tr6pOa4OsqIcRX/BXtAk3RepOLiokbY9NHvy/Nl+cdCS+KLMP
         h7xbw2zZMVLcbjh4aCJksBn+FjM6HaadBHNz2fTlxaM5zyWf3wrhz3YlyBqAZeUjLfNa
         awiROD6W3bbh9pr/Po7xIvI+TwANy/tWZIcueWyQdkupgajVfugkRHyzZF6ke7Gua+Lb
         V+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987079; x=1734591879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIv08M5NuYFMrbLnuplDgqYvTP/RY0BpL7xzh6gruXQ=;
        b=uyw/Wmtbr4MPdaEeq9k5D8rvHn7hTz2F7iZ+rViFG3JTgw6CD/62o+GTYG7+F195OE
         7ahNmiirFMgu6l+Jy1MFkmiKQlXW/srA1eA6342OCBsHvz5Yu1qrwGfEdP8J8OqrGsVk
         tPC1uqsbLhjDbMqkArj/hEU95MZNGFXxijwjeOocVeAIDs2JXZGRVC+j3hn6mULgNAh4
         RRu7A9/6LdecMbUr4zVYbzySufsLh664Z9f+tkMDFM70G/URXlLGPlRfo+n2XXKA/PW/
         +aDlJp8n4BpYrll1BkYPPa1GUA/Mxks/eSb8yeh5pLG0dBsHWQ9wpD/THPYuhMMFjYig
         /BlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhHKbmS3kWBRNrPDwZnQGnm67QqvzBh3kXbp+8kndpeaLQfJX4xCGFEJEzsP7+aw82/p5tVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRhilRNZsaV1nx6+WNQTmKwuEkDCwUpICQ5lumYBQZGeemlEQt
	qDrGguvj96wb7SzTNUosiHTjPQc1yEP1NcjX9X8j3UHE8DEhuSzB
X-Gm-Gg: ASbGncvnc8jQKqOl47b1cpEDm9Q+unKm7o6lUoYIvmU+JORE5mxJM8taNkjesQNajZG
	a8TIreIu7uEafGSnbtcNgR9Yp52hSyWal0eevb0wZX9F6HI5ks3IwrAGTgffIYOJH7YknIHxjYT
	nnACySbjmIU0SWvmmh1tG5wQz4hHZOBrEyyOpZmtWcGee7Q0uzSZ4StztwzAZxUhB7a9jVHjzXh
	GP6kGZZ7YZOzuTWXKc78XsiYNAeZNDysQ2+Rcy7uTh5iKN1HYWlC7SSkdSn3iRfprk1hM6N
X-Google-Smtp-Source: AGHT+IE2taDr2+F/QNnwkBgUaYbLlW++dErTzZng9ixbTcmDK5lHBmPiyyr/YT2Yg8/ifsjbQynqqA==
X-Received: by 2002:a05:6a20:7347:b0:1e0:d32f:24e2 with SMTP id adf61e73a8af0-1e1cebdfe8bmr3622509637.38.1733987079385;
        Wed, 11 Dec 2024 23:04:39 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:38 -0800 (PST)
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
Subject: [PATCH v2 0/7] Apple A7-A11, T2 SoC cpufreq support
Date: Thu, 12 Dec 2024 15:02:59 +0800
Message-ID: <20241212070344.3858-1-towinchenmi@gmail.com>
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


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1

