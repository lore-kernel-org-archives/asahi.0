Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7C1865E2
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044452; cv=none; b=A6ofXpDSqWyeDzwSEaeIyA6vpJLxr8DTIPwg4/L6H8PQ4kfoZxvcVgIUbQnxpyeCCl/eBYECf+clVLs6MbAMcQXz6lbWyELNLQfiSQUZh/YtQRHoimwKmKbou3Q6s0EbT6IdPijmiwuzpaQ2HmF8tZSBQJiYNu2q1cQtBNd7z8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044452; c=relaxed/simple;
	bh=UhU7//LLPdJwfMnsrPFXCgGaL4nYzWl6Sy0XKuREjU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKOXiGtYy7uFQGZ4nvytB+bx/ZKMgv3GLX+yFR9UHNypfYER3w1il9iChxCoshrMnZxOAsB8/o+WvrceD6owGy/0Vlxlg7R2dIIFqmaJWXCrUVTX2t4qpeannE2POLNhAiml1DkDJ96he4qZl/YiLpXb2E54MWxNflL5jiavFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TY4PFP8D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY4PFP8D"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20570b42f24so18653915ad.1
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044450; x=1726649250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGIw9gVC7lsgAYuQP3STO88xNXXw/JJZyndkt0vNvtc=;
        b=TY4PFP8Dl8XNtuyeYL1pBq+nSBXD+Iz9MJfdhttaGDtM6NfTHqRf1IfNwwiIc1Q9ln
         BB4Z2m6TC7XYPlQ89EnQacu3MVmRTa54r9Unxh5ERr8AIyADG+WjmG86sKgSehebk5AV
         8GaSO00dAl41NotC2FJ7fPX1cNaijs2qHwZbbPh/C13tmNqYh7RxIIU+c8lKCtfmujX6
         aeXUvjP47Uzg4VmXJ1mZB02LOAUkF1oXGDhANlGgsXzq8D/tkaCfiPiuaibO97Vbu+hJ
         QpJdk8rn6eM4P4jxfLlNFPjLQFEJOc5uQALaTErxgXNTzSVO7ANWrrqjBM3Rh/AnCS3y
         4BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044450; x=1726649250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGIw9gVC7lsgAYuQP3STO88xNXXw/JJZyndkt0vNvtc=;
        b=sjF6RYCxJ4BSbLR5P8xv20mSOqF67ezrhIT5oB15jDx3B2e/4V6hg5Hxqd6NbGo+aR
         jIpqeep8xTlgCmuAGivmva/kIrpxH0rSLKGKH5HJLDQzzILKANVqfkWRz5ktoySpdqyW
         gqtLFc0zziJ5FB6GBbg10t4NjXh+8rWzNBiLq+3BPTN4rUpLuoTc3FjkTYRDtsAoo+lA
         mnauW9tXdLLFaZYPCUze40P5cLHyycSRsarIJIQovc7z2JXYE3dH2hkRjTDLelqIBhcH
         N8uDYOltlozE0F8tyGGxLvZcSqYSoT4VGzw3S8gC7tMWZni8C6XASjtuT/KIvXgaLpif
         XiHA==
X-Forwarded-Encrypted: i=1; AJvYcCUkMFfdsUgTv/0EuJr8rqULQRNg4soRz4sKE6XDSRnFmV8pEFN/UM0284SxEDIKPYEoA+bdWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyacRkfqtzyc8sCG+FSrOoWwuH3AGJ/L+jUG+vx6KGOMkBtFZ3i
	j+I9zh1U+VBw2daXLjnx52xFuC0tChjhPs6ulrLqpdhS8A1BS1Km
X-Google-Smtp-Source: AGHT+IF0wh/4ve5zW3DQwRA88FpDWlUvKJZ0MPzTYhVqYgh0gGlRFOCd56bPec4nO9iXMD5ZBj7dOw==
X-Received: by 2002:a05:6a21:2d8f:b0:1cf:440a:d785 with SMTP id adf61e73a8af0-1cf62cba095mr3438507637.11.1726044450055;
        Wed, 11 Sep 2024 01:47:30 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:29 -0700 (PDT)
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
Subject: [PATCH 08/22] dt-bindings: arm: apple: Add A9 devices
Date: Wed, 11 Sep 2024 16:40:58 +0800
Message-ID: <20240911084353.28888-10-towinchenmi@gmail.com>
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

Adds the following apple,s8000 and apple,s8003 based platforms:

- iPhone 6S
- iPhone 6S Plus
- iPhone SE (2016)
- iPad 5

apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index dd5f0f6eb52b..f3f100ce8072 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -31,6 +31,13 @@ description: |
 
   - iPad Air 2
 
+  Devices based on the "A9" SoC:
+
+  - iPhone 6s
+  - iPhone 6s Plus
+  - iPhone SE (2016)
+  - iPad 5
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -121,6 +128,28 @@ properties:
           - const: apple,t7001
           - const: apple,arm-platform
 
+      - description: Apple Samsung A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71s # iPad 5 (Wi-Fi) (S8000)
+              - apple,j72s # iPad 5 (Cellular) (S8000)
+              - apple,n66  # iPhone 6s Plus (S8000)
+              - apple,n69u # iPhone SE (S8000)
+              - apple,n71  # iPhone 6S (S8000)
+          - const: apple,s8000
+          - const: apple,arm-platform
+
+      - description: Apple TSMC A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71t # iPad 5 (Wi-Fi) (S8003)
+              - apple,j72t # iPad 5 (Cellular) (S8003)
+              - apple,n66m # iPhone 6s Plus (S8003)
+              - apple,n69  # iPhone SE (S8003)
+              - apple,n71m # iPhone 6S (S8003)
+          - const: apple,s8003
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

