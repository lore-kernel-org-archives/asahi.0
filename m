Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4313CFA1
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658721; cv=none; b=c14DypaGGY4h/QEOAS42M1wWcsARWYxq9PyYyO9keXRSf3px2A2eA1d/8V4d+/zw5T9KLP7fI76B+SV5ePdY9fHyYbDg8fIudyCGpVkKZPn/eZbEdUh3RPVickyiTZDGGEFtbHuL5GL+c0Dl4kSmUNN3Gx729izghOsavHb25bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658721; c=relaxed/simple;
	bh=6B3oNBth7WdCDZKAEv+sr4ONIRSxuWPkgVqTYOi3EKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6Qw22GDF+JHrp1HEpNJkFtJZJxkMpUC8F2Z3fmUbi8H9/KJjK3BR/bYLwkXTMNdAAuykBXys0FAO4SeHjN/ptabWsIGthvOfves8TNQ7sVa9aWPAhbqcB2m7Bd5ucnmkvq7ogti/0/e/6j+O2o86Mt92Q1whOZJFhgvGCxquG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6+A6hhS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6+A6hhS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cb47387ceso57362495ad.1
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658719; x=1730263519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxIREcENY/VE72Bee6nwhWXzCYg9Bd3zdNVXoWML8C0=;
        b=H6+A6hhSPgrfgqVUFQolaJobhNXv6vyl3YfiVhHgKraz6V0UBiNtjiRz+O1xJGd45S
         7XxvDN+Q7RGL+bak7bVAvFZTFxmwqzq3HEzkp307YKFO41egSCfpvHw2kSd4hECo4GlC
         nJ0G1DbdDPIK0AkAS2/38mdnqpvYmHKWccr3l4vgxc1wFxb4cIFm74XP2//Sd+bUJ7qh
         XNBNPfEKOqgzPrKGiRhvcz4fZnwrevBiEkpSdD9Lo4LL9VoAP8gxe18sIBBLNAqP9utZ
         8uN8frJf0ZSTXvRiTkpcO7frBErr5ov9lSF3i32YbaqhPcRlOPrBWLWu0xKK4Wb5az/s
         AZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658719; x=1730263519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxIREcENY/VE72Bee6nwhWXzCYg9Bd3zdNVXoWML8C0=;
        b=EMlA7AmuxZPR6nsxpkiAdKmKtBilhvWZLcUbC8rbLMvshLoR3/nXKH4UtbfJr6oM7j
         c6p0c6DnSG/UgtJsTpJFGapIvkrULRGHnN4WO59hOV5zETR4n89IXTDrinydooVEv7jN
         u6+SLZ2G1SWhh/eojEti2UJEAQWllwUD9FMnqYFqX59jeXlugXEsXEA4G686itp7h3d+
         4MkEE4iyz1MXctnD29t1tcv7OLBheJttnl5w7P+dMWvBOlFK4K9JHe6XUV7yUTQIeS6G
         HJFULAA2a40Y+rWUpqNiJmbLujc3R+lyabRlD3HwdUiMTFrz7QxR85fqxu6QPVyninPl
         nm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOqAgrNrJj1AE+HejDHUs88xP7aaqoevrAx+lZJJC0PfBWkbm/9tcJoYFp4xq+9Tz8a4/edw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2uitfqKFhAo/+1QXAN7SvvoWgPlvou0GeNC3JaHVBbbVGPbRX
	1g5d1jQq8+g4ajHB1Ck7P2Tqy+SMjso9Wfl69ynay8zSCAK53yR+
X-Google-Smtp-Source: AGHT+IGgXur+PX0IJXc2NTjsffcocHTpbrnxwthHzYoKrR4LqxCxd1MUW6l8EO4Kl2BjcMtY5PnxnA==
X-Received: by 2002:a17:902:cf07:b0:20b:8776:4902 with SMTP id d9443c01a7336-20fa9ea14cemr19282485ad.38.1729658719265;
        Tue, 22 Oct 2024 21:45:19 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Wed, 23 Oct 2024 12:40:42 +0800
Message-ID: <20241023044423.18294-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the following apple,s8000 and apple,s8003 based platforms:

- iPhone 6s
- iPhone 6s Plus
- iPhone SE (2016)
- iPad 5

apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index fecc4953df33..01965890b4ef 100644
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
2.47.0

