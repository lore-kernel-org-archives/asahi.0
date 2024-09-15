Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F9A4779F
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387694; cv=none; b=llrIfKepGuPI+X2sHakx20sOP9ll7IYBZVCeuUOcn6f8Jn5mnrFzLZwmHRAXDOt4wMC+ndVP7b86FkOmLEK12lyX3v0AVeakc7EPxcWQoASqWgz0l46lmhS9ljFwbh++Btl+FmJwdi6p3Vbnkq8o4zrk8lQ+g4hBddo0s6X+pkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387694; c=relaxed/simple;
	bh=D9QNipp2Cu8jdxZF2ATT6QNQY1AaJfGlXa9a8v3AUeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5mLYeOf1H0zidEEOrw8s6TFZJ2y8qehpHxNSqS8fJCBNrM7EtMAYDHEYcPnkMOotZlcPIdNhdWvRxzVBnnYyeOB12B1oUWdjAwHhp/ZGCxrtd0vp7DipgYgqmi4yECotDJsCgtwMn1h2iIh2SM21xdzsO/ZpRd7FcUkaPGg9to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjEw/9vu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjEw/9vu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2054feabfc3so28479925ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387692; x=1726992492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfm635R2ZedUv0K9CBomURZ5/GwgVeWzLysAHmmerM=;
        b=fjEw/9vumr9L+IBGXQ4+AjCAvVU5v5Ord6/Hed1PW4urYhnsqwiTylB/cPiQJQ3rYQ
         DusOIv8V6Eww/332TcuxO/TDrc7VhNTEwsKzKV8N+AOfXcF2a2pVByqP3g48TxElkO2I
         voZ3IZmRp/uV/e2SQJ/eCnyRLTkRq3CwTV0iwKGyJjeSE9/ViieQSS4qbem2g20NvLwU
         GhJPd8eHzxA8T55raKfdtQ+n+FMCJtwJwZZGFCOZXUEtrOMFSWO3PSbTk/DWf+1c3oz3
         zrVgbp5PaL//9J0mi1cg44ivNzm7C6sAVm2CNJSL7yD/RhWGPMaiBU4yMqHgbhxODhe4
         Bwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387692; x=1726992492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMfm635R2ZedUv0K9CBomURZ5/GwgVeWzLysAHmmerM=;
        b=gYu3rTyP5OEtzuUchmbsQd3KrzD2LQRHZuChyB7gY0myIkbyoO05G92NQNvMhQrYbH
         M389Ek4yZrMI2ESoUeEVohB94queHDqWO3/ykyDos4dK+m90n4cCou1Xqb+dJmrjd5tZ
         flPzLbWHd+XU2v4mjJLwJHF+Pjt/8Rl9cTRxgNknIMMRXWd53pX3nqcjzZZk4wXEtQ5l
         MVAROHgt0ZWe+RhX03kmW3dnynHc+9QJanEtSiRh1vsBvC9EiBAtCzF+BC1Be5dBrQfK
         1FQ/TkJwZOsFV52POyRYdr5qvemCcBLdJ4OxTrUE4yzUkC8yLpV76c1joGw58ksr1Q2r
         N43w==
X-Forwarded-Encrypted: i=1; AJvYcCXDfMhRcoXejjfUI4wQ/YybrblnbyKtCkjz7fxCFvJT9VvD1G7zWPTHClCYo4MpplbBVx0sYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWxv444rr0RiOVKuKQ4pwBAS6vygZ0I5p8FCx+ydk4RggcFXbz
	BI1dFtzta11+tQVHp6yYwbjS81o7vR0Zd037Ntz17CQdas8ubbO1
X-Google-Smtp-Source: AGHT+IE/qszh+sXon9hFkSl0gzu7I4zOgWGsTfpxsj9vDQNvhH4nPsnn+vWNd3I1POQPX7CS1BPQRg==
X-Received: by 2002:a17:903:2302:b0:207:6e8:1d84 with SMTP id d9443c01a7336-2076e415244mr193313555ad.42.1726387691965;
        Sun, 15 Sep 2024 01:08:11 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Sun, 15 Sep 2024 15:58:46 +0800
Message-ID: <20240915080733.3565-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915080733.3565-1-towinchenmi@gmail.com>
References: <20240915080733.3565-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

This follows the existing newest-first order.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3532..3959e022079f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -89,6 +89,12 @@ properties:
       - apple,blizzard
       - apple,icestorm
       - apple,firestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,hurricane-zephyr
+      - apple,twister
+      - apple,typhoon
+      - apple,cyclone
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.0

