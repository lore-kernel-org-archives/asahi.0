Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DD187329
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044461; cv=none; b=F+tmVinhhwEMgRtuVwcruH57ENBiTFfgpu9mHQ7iM3ccET71duvz30kxSzPtPFCI/5piBs3RTRNyRNmom3RYtAwqeq2Z5RSg8B0212oW+tEVwqFrFuvPXKLVbyKXzfwQKioRoAapl0kieCqI/dSXplJYIA7UU7hVKEnQCnEW2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044461; c=relaxed/simple;
	bh=PxOC33i0Rsl2lUZhdV9oiRVYZC88KWzOhKL37rPt97U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQufYsWB2epNTIPnB5YR4CBEpMQ1GxVvXvXx/NiESWHRsWa8zaejQF+kpb9nNjb3hL9N4N0y09hlUINQmquYFoN2Eb1MhP2GZgqGML84lgc6rBU8H/h3ACBF08pBiApRaTlr06SVmXfUymgSEnvve6M87nfkpbqj1SIJH3JHZuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SChVJ1LB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SChVJ1LB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718d962ad64so4769802b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044460; x=1726649260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+/aZHkh5FNnLm5U5M09ijcJHqZIVes5WSergbQUG0M=;
        b=SChVJ1LBST83Cj/s0IGT5mle2LlRJLGEijDA9g7st1mEiloiErbZ3B8rK3PZh0Q3dQ
         4tjrw4mHvZavms5qOgfYTlTxYFiTUq5xjcYJ6xZKex8qFOP5OO611ap9gVPrcUC9iG3O
         rtYcSZIb+Ou6kuz1+5c4evGtMYpMwgp6R5IgAzQOlvsXpcQcvuFZApXKxa+5p7cR3CXA
         tkdDwfLeLFGZj7TOkvQnK2MnbCIAswzB1l5nZZDrV5ya6KNo64cY1mV/A8ELbIBU0RXW
         FQvRUv5WqtbA9HqGapHsSJtQep/0AJsOHGuB2S7trwToFOh8INdo/Ax5+5kd093O5aLy
         RSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044460; x=1726649260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+/aZHkh5FNnLm5U5M09ijcJHqZIVes5WSergbQUG0M=;
        b=rbo2SQtmAJYpMWHrHV19uJdjTao8mdDa+SJFvNbIgYl9py2Hv/fqgMTvAwfHBxFlE/
         wgVkbrQb4NgkZKxT++CILxq/FyWxElDRMIMLi/A1VrZvVyUHAGzTK+jAHVkakAhDU7Pm
         d3TMJqQbduiAk+9ao74qxtzbS1Dr1kaBfN591mbIvMXcTfxK6TT7BCeBYHwBJ4tKsUjv
         kJCKctMGjIRKBfTKmBXOy5HbGLRarbslLxV8smMPwVdqJSFDhtQglIM/V+C7BJBJj1Aw
         WDJ6aSth4om1kEjwe75w+yqMO9vzOkIhTZH/D78JEJHwQ1YDLisIoiDucMhhKWhSum1C
         mAtA==
X-Forwarded-Encrypted: i=1; AJvYcCU9fXoGBQtNZ8NnWV940QpVS+AlEbMNvfuhMkpufvsyjvqH84GL8kQU3vJxbKDAy1AkUNNXKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YykgKfvECMdFdS0EtTixSPbDTKAZkYPDmtEj9W94NkZM3CyBcQL
	SP9FtBW3acfpUNct6idxJO98jXYq6apyRleLL4hRzrbAG4D8sM9L
X-Google-Smtp-Source: AGHT+IFWm+lBeW7Fn0wnv9eqQIov8poKTN3KAm+U4yVC5EqrImWQGILS/ta6tYOmIbYfpse5ZrzOdQ==
X-Received: by 2002:a05:6a00:23ca:b0:719:2046:5d69 with SMTP id d2e1a72fcca58-71920466977mr861707b3a.22.1726044459800;
        Wed, 11 Sep 2024 01:47:39 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:39 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 10/22] dt-bindings: arm: apple: Add A10 devices
Date: Wed, 11 Sep 2024 16:41:00 +0800
Message-ID: <20240911084353.28888-12-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod Touch 7
 - iPad 6
 - iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 27311c75faad..873b62035bc4 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod Touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod Touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

