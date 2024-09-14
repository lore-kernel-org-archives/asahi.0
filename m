Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C820328
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291521; cv=none; b=D1yOH2HD/INUFzcsGmnc9l+t+iTNEqFkb/AjPGUVR4A5i3cxC8+t+QkR4H2Gq6xLDAfGDGtcpxa6CvV6ofM0X6M1AcWThL4NRMkE5fzwe6YxsGCQocGqCHZ7YsYwX+UebPwl5Lj8jLe5R9vpaNdZzBsyki2Ir+pOu0c/xUCLs9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291521; c=relaxed/simple;
	bh=/TZwa1P5GOi0weNisvEEpeoua8fx09BY++vgJdF9ecA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+yNPVbMGrp2R/SplYX1Tgp2Ma0szjpaKy1/dP6fs5tupG0GAFz5Y9WH5wpJwqpg3UqeH4khLJ17WHuJiMeYKIt8rYhGoz1EYClUnqiwTG4xLn9Yrb6kknViCAZ27e+1vdOtCgIGb7ch30XF5cEtV0X9Hv6jXFggqEI1yYiRF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT5imrWY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT5imrWY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so2232266a12.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291519; x=1726896319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeDHamkVCqUamIh6SnSmGPyPT7GfV2/5V36/vymSx7s=;
        b=dT5imrWYCwKjSjuFzM5i3UrGM1BYOH14wImnPZyXoOph1AT19/HgLkiUnNpgXnof5v
         lvXY1wJgXA3Wi6lHRQh6x3+XVMMSO5sYED+1/0ifQQ3p2AZENt+A00B6k58LgQgS3QdJ
         AY8xU310IYEa3HLkKkmhc87R7FCErWc0GGY8zTKmbAzeS0SXLaAs9SzviVUueQ3pqHL4
         RL31U9wgC4n/eY112d6dndyy1dqk748PPxljifqFZvJfWey/+cW5ROLRFChcKbJFtPgg
         mCTEawHwgzQFg4K2UK8OcyN3uGSjFhEd4IqxA3Llls6mj/Sonjbn/9wQPw4Yhb3hHfnW
         4XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291519; x=1726896319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeDHamkVCqUamIh6SnSmGPyPT7GfV2/5V36/vymSx7s=;
        b=vLUA22tFfJi20dyh2750M6c9kxlvO0crbsqbtbRH0usq9i5fls2PoaT3I6w1KPBUKJ
         vKyWcw2ge+ggH4aroVdaejD7E4MgB+5YSVoZkwIu5B+Yht3xFBRrXyJgEtJTrXwauAKu
         46tiLy6SV0LfQS1/LCwIEiOypbe0yBvoHR2Nbfbc4pARlq2jLtawM7qL8LVzWtmv8LDg
         JqzCWPGbhoVFBkmP0tCaPLSzxmE9FxoDKLl0SFT75RFswC+zzPnzHWPasfgVCNsCWBnB
         MAgfUkb+CGGHJ78fjZJknuMOkYMokSbC+1Tdmcj6Ox0GBS4Dx50ua+OTJ8kCbP5OEQH5
         AQFw==
X-Forwarded-Encrypted: i=1; AJvYcCX1gyhoI5FEhEXKg5v9GjMgv5cfj/MB0Zg7bQyrm4ish6AOLNPMmDqojCE1fYNZG/0pFyR+lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwkEhWkznwmDZ+GKHFxymte70HKiatBq5T4B12yJVrtVjlvhZQ
	qU9nu97LImYI7vOakJkG6BkPbN1jIEELY8NVU+6oRJhQfQw2mFH5
X-Google-Smtp-Source: AGHT+IEeFol8fr11Klxd7ngVl07qcK9mskrnyYRncSe3V7C2OUexW3oojx4o4eqOFCi1cDiEQtFcLg==
X-Received: by 2002:a05:6a21:3982:b0:1cf:2931:727f with SMTP id adf61e73a8af0-1cf75f005demr14139271637.18.1726291519342;
        Fri, 13 Sep 2024 22:25:19 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:19 -0700 (PDT)
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
Subject: [PATCH v2 03/22] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A10 compatible
Date: Sat, 14 Sep 2024 13:17:11 +0800
Message-ID: <20240914052413.68177-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block found on the Apple A10 SoC is compatible with the
existing driver so just add its per-SoC compatible.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..e0d1a9813696 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,7 +24,9 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,t8010-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
 
-- 
2.46.0

