Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B51156F53
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248832; cv=none; b=hD11z0y+Bayd9RmgZMxFnEd5RDaFJPePvCeksRspVKCx4PmvxyPOdFc5ORNzO6Fe9mtQWn9RTOgTdXw8apxFXPnMUJBBzuK1i//5mrpfsWI1JZo3IMVq9z9yrKOZA7JRG8uqvHkHuZY2obIb7zdU3tH6YC0PISitBbRNY7je7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248832; c=relaxed/simple;
	bh=PdLJa8MVBvaTO9CgZ4NY7AAkJ0lR2z9Bnany8DBGvs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F++x2JWYnvsJvMFG/9cOEmLLacAfk3YUL/AA+1yfsrwiyu0/xfd+0tD7cwbiM9555Zhi1aCvG2SUNqVh05tB1uWBNefx/TnlXsBHCXa6IX5rIFbNemtEECpVzNKioX/i2peZHMbsTVYSmSpE1S1UbzH48p8j8p/Ve9JR5N5jxpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yhdx8DnG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yhdx8DnG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20792913262so75657435ad.3
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248830; x=1727853630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/G6U4dNeBchLENbWDi7+ka7XGG31EAhRde6PGiP6iQ=;
        b=Yhdx8DnGPGmVHaYRnEr+GAmYwmlBYnkIxuhTqMeX/Fq6o8PXVKk6S79yu3naf+DL3h
         ++EKp9H6N58236sS30cV8pDKbZeJORuU2t+VrGXE10/UP+0DBsSLOBJLsNwbaby7ySVh
         MSxG4ayuKT//lZM67hkar7hNlO1FhJXTnrzpDki6C7rwOukBhi264elnVcdN2UgoJwP1
         72xb7OjhJYKbWsTJpuZidWBaV0+w5lcfr4yxlmAHWjB3OBN+p6uORyc+RjH9lOcQATBz
         iw784XxzyA62JZvO4zLOY1flYOlTMvCY5qlyoqGZYjB6ZHqZI5Lalim1XNhQOwYOI5H/
         Im1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248830; x=1727853630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/G6U4dNeBchLENbWDi7+ka7XGG31EAhRde6PGiP6iQ=;
        b=BnCLOF7dPdsGsEkNbKglIhdDWjBHUhz3CIbkUK0ES9rreOpuG6vdkE2dx47eUDV2O0
         u/E6Z8bb36wuj/qhXiqnns6zJOlObdlv43NdCHxBDXVXmZHUbQ7Vq7N+w4UzYZgT7312
         e8xqTl89R7sN7XI2efFqGQLBmpj4fuBXFDQbthYW1T54G9utRhJ9hVRcmRfEtLcVmXlL
         X4kIvKRXu248G8hUIFBvZpUSydbNSdjDO1/CDdDjQNHOSEwhMEjthOV3e03TmDDq56PG
         cLTOaXIECVzRQQnm2Q2J8t666tpUcgjQ9xUy6f5NkegAmOthjGDOwYH7V/xkwfEcdVpA
         o6tw==
X-Forwarded-Encrypted: i=1; AJvYcCXoJb1BuYjAbocKiAIpgV3Jh+VwjEGuI3Si181jM0BV+MVpFgBBnsrwJVOa4AdqnDNrZF1yLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwuy3vEKw2JDaKLZ6pqCYpuBNQhOKSHo92vVIjc+Yup/kZK2I3
	9/+8CJJ8XH4P1GtRsu/Vi3ufyClM4y88WSjQlddADwVJ/meArqQz
X-Google-Smtp-Source: AGHT+IEBz9VxvKTpWTU8dRa4jNNJ7omba+lnmLfBNzwvBOGKgxhGFwlAsnO2HYZwQr63aKE98A1nvg==
X-Received: by 2002:a17:902:e5d2:b0:205:6c5f:e3ca with SMTP id d9443c01a7336-20afc606134mr25437695ad.53.1727248830557;
        Wed, 25 Sep 2024 00:20:30 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:30 -0700 (PDT)
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
Subject: [PATCH v5 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Wed, 25 Sep 2024 15:17:59 +0800
Message-ID: <20240925071939.6107-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3532..f69b75afd258 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.0

