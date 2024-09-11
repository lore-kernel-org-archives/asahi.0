Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AB61885A4
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044471; cv=none; b=MjltvJ+NGtfx6ziBt6Ioc533OQwbHQZu+yDqqILc/xgRFdbN5aSszj5KhXvoYyGVlDWyn//vPf+LHBp2BptUVIA4voT32L5IjimwxK/DR3ReB+zAr9L6B6U160MTRuxlM9jgYH2iOuUHU5L78LDELKqbp7ZexWzUzcQCDfUR3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044471; c=relaxed/simple;
	bh=ppm24EhHTD4hEOGBkzF6TqV/PiS5UAOxThSexqShUAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=samVzMrteuvow0RwK3M4WPDIZX1YAby2ztSIj0aBsx0Ds2S7VlSYSb8MvLRIynszcnD5q5W8J1GwtQs02QHHWMy8gi4353Bvtd7A6CGGA3QMHLobH0GYChNFrZs20kqF+n8dZQmDlBIqGCi/TQHOvU2X15Y/Tx8whZF+DRlIC1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3G48Qsd; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3G48Qsd"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-717849c0dcaso6053316b3a.3
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044469; x=1726649269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+WqBT/YEPLVK1UMgD/sAA9WnitOE2/cu5y5DWlVtYk=;
        b=f3G48QsduooaAs1sf0so/2U3alGnYiCQSLpi7ibh79d4Kuxzcg2wbhxulLvjMOYtzH
         rP4Q4n8e6oU+qpccyXlemnksHJJ+xMhnzSeAEy7zfFuHO+aOfvjlfpGiwipXZ4vehj8K
         uxC3444hA83IJP50w1aYhsV1A7BdyrZ16ZycWSg2vOjE4xLPoaNnU6Ykmk2mMhz6YzdO
         ILYmRCEgDtSk9pBcTFriWoju6FOX3AhOgp/cW7O+3ETJ2cFD/EANpjPEk+oBd7WRPH41
         XQACjdCs2kmaaAJqk8peLxDiSOhvKsl1wOPIQWevUwg2FkVWnmMP5tBV8gBroUo8QtB0
         yGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044469; x=1726649269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+WqBT/YEPLVK1UMgD/sAA9WnitOE2/cu5y5DWlVtYk=;
        b=rP1gN9O7qpVLWeVvA13xXPqbD7lDBipu3tWJ0IGef3ZLCTErtrw1rRhAA7+Xd43u4t
         Czw+EZGduJM5iqlshcNH/Hjx6FLdtnqxIHD+KjWAehfDY/MhFasE+b/R/PeRwsxXuzIk
         Jhh6I5hEw07nLSw0cqHsYiQ6XSt8Hg8rZgvgu9VCEgQXh6StEGwlNnBS0EVUmu+2cpjO
         T537TXVVmoTqV1oGt9ztWYUUaX0xq9LBPpaCmF59OvWMv2f+7kF75GeLZOvkdTZddDWP
         iZkpcWBoc1HOlVI1YNPAGxjmbX5dQcYqc3pRUKFVBSOKGEe3LRyjRapMxYzJO3RiyoKK
         NW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBoIeTSV/ZnHG/Ms/NhmQKO55LPW1Pn5uHNCVM8amwN74GhzKZILShrOEdfP5Z8+m7BuaOpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDrFfgdhtMjiTtrdmsOYBpaPCuZl51eU3snV9XFZDsN+hbymhT
	ZRBHY1ByZ8xtM3geQaM72M6LGslfjb1yfdooRrZmilqTtwktQQTN
X-Google-Smtp-Source: AGHT+IGFBhuKkq7tslhEjhMirf+wLTw0A/dg7JQDlTNh9KZ10jyDQP2kpndSU+9+CF/mEy0DUaEvjw==
X-Received: by 2002:a05:6a00:9141:b0:70d:2693:d215 with SMTP id d2e1a72fcca58-718d5e9daaemr19669536b3a.16.1726044468990;
        Wed, 11 Sep 2024 01:47:48 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:48 -0700 (PDT)
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
Subject: [PATCH 12/22] dt-bindings: arm: apple: Add A11 devices
Date: Wed, 11 Sep 2024 16:41:02 +0800
Message-ID: <20240911084353.28888-14-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 2831a662f5d5..15e46f13fd2e 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,12 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "A11" SoC:
+
+  - iPhone 8
+  - iPhone 8 Plus
+  - iPhone X
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -205,6 +211,18 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple A11 SoC based platforms
+        items:
+          - enum:
+              - apple,d20  # iPhone 8 (Global)
+              - apple,d21  # iPhone 8 Plus (Global)
+              - apple,d22  # iPhone X (Global)
+              - apple,d201 # iPhone 8 (GSM)
+              - apple,d211 # iPhone 8 Plus (GSM)
+              - apple,d221 # iPhone X (GSM)
+          - const: apple,t8015
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

