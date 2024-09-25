Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401215DBAE
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248867; cv=none; b=DoKx974FBvFgS+eFMbyvJIH6qy9hOjxgd9mtqA3ZaF97iMvgMyx5a/KRTh5Jjwgvxm/FvuWgtywI0vtgvYMFj7oj2sEib7ndWwvRWvJ6uqoiYb7J0Q0LiAG6QcGK24zJ/BEX1E3UMhnl5J3JgDLV8gRGk/0PrbKTTC1Rr1aLhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248867; c=relaxed/simple;
	bh=nXFKcfSCBd2hhQ2LEB0Wn+zEqtvm7yqHEZh7oXPnPu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ad6wPiIy49A+fKvvlvbtmh0adYHpHt+kHoh6+xDifH/ckWuk/zlfEN5p55vvX1sDAAM4O5nfgpQ/Z9HthWGHZjfGZolMXVrlI+oDCo+d/9ESyfHUP4K1op9CT1WkXVri5cmea4uuOjBNmPrUOiFpIyZfSy296UxTuEzI8iXZC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+hmdmil; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+hmdmil"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so438631b3a.1
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248865; x=1727853665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOjVxN+4UCui/1bGVCeKqXEKHkc9ro0dr055Y8OKSYI=;
        b=l+hmdmilvQHRPmwuEuYSJbpL6Fk3k+nfW/RxjICUAr9hvbGhR4LaVoZQLVctk0WK9f
         HylJE1O4aTHXS0YV/KV9JGSvRiBH2M9NwxJWCDhMNup7cO285JOyMmxaMic59dsN7/9F
         XviGjDFbnBIpGX1fS3xpJl7MBIe+32Uuf1uA8pC5qzClS2+edNulATjt6/9s5dUaHVey
         i8QS8ez55/wCLL8qOcX14IssSs405ODxtSyzUbtuOdFMooDbQU+TIQAyZcXjh9DlLNIc
         b6Y16jSM7yGnchf8w5e/v9XBzYvDpkA4Fn744ws9pA9aP+XRu1v5LNV3J1kjdp5cyDz+
         sIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248865; x=1727853665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOjVxN+4UCui/1bGVCeKqXEKHkc9ro0dr055Y8OKSYI=;
        b=h+QMFBAe2gW8Z2e/1XKeEdoBRXTrK2o0gohBVBQU601ggDzQPAm99abZnFF+avr7up
         pA3qN2CsHxq0hnueXhN87a0MFObXmiSFdrzYq17NOrLuk1uIgZr3ELLmnl4xDL/4z8DZ
         x6wpuejQV/58f1CqzA7ZM5AeE1p48lwOmilNAeSe4pVfQ4qO8RALeQUMP6tvI4TXvRlT
         0qTOYOg6MZ/kUceH3uh8h/4XYbj3HnQEmBCWPPRqa63K7cnwbaKMU7r6Xwq3IapjEe+4
         7ZgQ9O7Ypu35I7U8FlAJrAOpbbg7U4vk5CqMn7jzT48XrrI/g4abn+eP7oh8Bz6+KwBE
         W7zw==
X-Forwarded-Encrypted: i=1; AJvYcCUq4F5S9NHcWcdMVNnWZXS8X1llRwUZLkmwlwzfszQKaUFJ3ZgxAWsiUDk5EVQOTSnaS8g8mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYZhcZDGCm3qfB5SadMWf9p9zwok9XNCFQ3xzgqnBTTRxZR6tF
	FqDVLR4fMbOJZg5UvXX10tAqCEXIqaksD0KsZzVmSGAClYQy/mvw
X-Google-Smtp-Source: AGHT+IFkEqW5cQWTnJdHp+oQMG5w7aNEOsa82IG6A8zXmG4k2wmgLgb9XqX+XPEM+tCrK3pJxkSOOg==
X-Received: by 2002:a05:6a20:ac43:b0:1d3:1fea:27d8 with SMTP id adf61e73a8af0-1d4bed0b288mr3085067637.5.1727248865133;
        Wed, 25 Sep 2024 00:21:05 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:04 -0700 (PDT)
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
Subject: [PATCH v5 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Wed, 25 Sep 2024 15:18:05 +0800
Message-ID: <20240925071939.6107-8-towinchenmi@gmail.com>
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
2.46.0

