Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DDA18C344
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284958; cv=none; b=cdGTvAU5ix9ppbE5tGGBpDItTAs4hKpVsLarVD0A+1HjDNt+tY7kA6hstqpwIMqh5ak2PbjKfaDujrB1mwdvd+uvTQQAjs6ODkzbnQm7SW82vOsym7WiaYK7LMFddNA/TNOYSuFgrakBmqvsGm/K12b7YlInPAlAlV2bAe8Vkws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284958; c=relaxed/simple;
	bh=2yb7n7gKNJS1kktb+Yf2SYFW5hBXjDXQF3TG7PYeqTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvNB1tdrrY/P0ILxNzmF2hgGiLKMDfPSciyt/MbZq0GBIcO5rkTF7kGIin1j2RqeFv6SR9IgP2ebiQbgOgUtsYnlBVXAtmG2C9vvk2riOAxGMAlBz94+dJOnLsLZ7qE5eCFCKlDOHiUKI7QoHp/8kRa73um+CPkcYql2/Cp+fJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5xVMtYC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5xVMtYC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e053cf1f3so437707b3a.2
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284956; x=1728889756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMvAFFeWkPWBXgzkEAJzMHvTNWtfW81e6+GO+82Em9M=;
        b=G5xVMtYCRgPNlAUn/KG2WL8DTnlA4hjBxUriFbCizbBumGls8Z45Kaz9ovx6RHmgE6
         VxF2L4vZjyjE7t0Chk8mrkYDmSLnJibEl0FxVh61kp+fUcYT4nwIVyJju062mbYtISxz
         lvCF7lAP5KAhHoDiPzDMNxXh0pOE78gOtafajpVjZDpv4gF5lRRb5IEgBMvQEztZJW0G
         E9m0+3/WY4gTGQuUXdG0zTdX0D5BBcY6JUZI9ldVc2akRQpTLcoT8qFKXhQLsKp0mwRp
         z5v65TGoiqKlZuZ3Bf1LSvuY4qOSAJnN3zYwKGsRfkuLszBOTBWzfeOhO5pppHuNiiKp
         cI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284956; x=1728889756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMvAFFeWkPWBXgzkEAJzMHvTNWtfW81e6+GO+82Em9M=;
        b=d1pd5IVzQgLWg4dj3yrwEHXzIKccbkm+LGPerPSfuZzKm52dwQxV8JVOEiXXtNZYFX
         gEEfzgAV0EgFqNxN1+9CsVkwrp7L8EHUGcOkvXqYIldNv68iOCAhqz0G7lMSmBmdGeTh
         VeC9MQJAwPUJMc29sJV3qPO9j8oG5N6eHlBCDSrz2jtjQ7K/ewxnKRYswU0dhj355Pt/
         rcoWFegRG8lC4hlqP5Aq8oMA7mCjc+bTgG1lzajwBZcuLqeug8JE8+3II955M5ZtlRUJ
         L3wnscKl3keUEqTF/u2WU/n82Bj0cFXHdcf929jAQPIKWNo0JQwGG+UczLLuVXcLSQ5F
         u2fw==
X-Forwarded-Encrypted: i=1; AJvYcCV5BoQ77dTSoFn9a2rxcfgcHQH8UHQ3+ISTMhcJgSVlT231BiZFRn0fgXBu7jmhSSH4YNcADA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd2oWgi5baOV7gpiKffjrH3dZhAYONLNV7L3WgN2PGfMKZY9Q1
	xjawyBJjtMCBB96VFbUh1pOiG2UAhD2q2QJ0hPlEAasiKpDDYoZj
X-Google-Smtp-Source: AGHT+IHH8J8izOhOEj5haFlwY9o3pI3ZVMWYVItq9zEqkmyoSxUSlllOKhIomN7kYBgqPLn0AlcVVA==
X-Received: by 2002:a05:6a21:999c:b0:1d6:e61c:a5bd with SMTP id adf61e73a8af0-1d6e61ca5dbmr12829355637.1.1728284956595;
        Mon, 07 Oct 2024 00:09:16 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:16 -0700 (PDT)
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
Subject: [PATCH v6 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Mon,  7 Oct 2024 15:05:35 +0800
Message-ID: <20241007070758.9961-11-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following apple,t8011 based platforms:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index b6a2916fb0f6..96efadad15a6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -51,6 +51,12 @@ description: |
   - iPad 6
   - iPad 7
 
+  Devices based on the "A10X" SoC:
+
+  - Apple TV 4K (1st generation)
+  - iPad Pro (2nd Generation) (10.5 Inch)
+  - iPad Pro (2nd Generation) (12.9 Inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -188,6 +194,17 @@ properties:
           - const: apple,t8010
           - const: apple,arm-platform
 
+      - description: Apple A10X SoC based platforms
+        items:
+          - enum:
+              - apple,j105a # Apple TV 4K (1st Generation)
+              - apple,j120  # iPad Pro 2 (12.9-inch) (Wi-Fi)
+              - apple,j121  # iPad Pro 2 (12.9-inch) (Cellular)
+              - apple,j207  # iPad Pro 2 (10.5-inch) (Wi-Fi)
+              - apple,j208  # iPad Pro 2 (10.5-inch) (Cellular)
+          - const: apple,t8011
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2

