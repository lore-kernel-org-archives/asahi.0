Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DCB1A3BCF
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762581; cv=none; b=fG5a47ricbrT07uvAFmg1kZdagCuQ4guTyuYEYD/Z5l6nwno64JpgJI0StgMTva7m3J20B1uMe8XLI5G/7GFckGn7bZJZ6UC7d3tTcND5NF4LL9p55A3yFsjFu+KP8LUPLMuL54TlQsRYVO6Az8X9EhVyAAnLBmL2J5hEk6v2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762581; c=relaxed/simple;
	bh=V0wAJ3KgOJQBQptHA1TQBm5dVVW7DLpAyWuD7rLAvWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJ6jznakp7q+7AiTPjGoIMxYG3J6wzZHnWvyrsrRJD+Djno7wbBS2XoEPonClRtku3X03e2pYkl8WukCC9z4zfCIbwM+XzPum1jEvruTlKRFGrsFfB1QTzTr+eAyNqvcKfCMgxYawJ9vywh4XuQkj83Qj0J8ujuWgiQ7+Dlz4fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3/OGgLl; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3/OGgLl"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so852569a91.0
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762579; x=1727367379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed1R7heD4sdGMJhfePEjEjpAPx6TqwKkotv7yYVzxAA=;
        b=V3/OGgLl0eQ8tUHjJLbAVls4sXgsCBCIjTIvHpL4FIhDn7GGQEIxyoAYywITQ30cG2
         eu+PeYZ7oauJB6Gz1X8T49qGjqHiLRZNZ1WZTqGaYkiEw2a//NWA6Ci5qjzHLw2oNGNA
         i3DJWmiaxYt8rHv0b1IKmWB4YsNfsnKr8lTUiG/te+BYb5bGFycgR+BIrp7PfYol5Dvb
         7iNgSc//yVHGUYbDaIXHPAG/r5Q+I0HzUw1MpDh4P8vzEzHDpr7jPnm6CNCa2EKvWeGe
         MgdoJABvI8wgLtPkkGEXZNWZTYebpBPPwxPhyxoPSTxA/yucYBKGjhQdCoF5vUy1AYDM
         JqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762579; x=1727367379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed1R7heD4sdGMJhfePEjEjpAPx6TqwKkotv7yYVzxAA=;
        b=cknoSKWRo+a4obD2sNaYbsDMxWXClwWw+xuxV4jQY/Fv/dzMe/XjNLhxFoF6K1SSi9
         txVmndPKdjsZvWdG3sf9hkoy6gI9iBjRPFMzc6AhRQ1Ze+xKKWtoT+kja9QanpyI1kCF
         HaV/YVQF6VFpibeILAy4pZobK7gsdFXVH0/69IQgTd4JIf6Z+Ms9mIVsPekp4Qsm9sSk
         WppADHN/Gsby9KgGTw6lx8fafP7hiAZKh4YkbOwwSkKr4SsXFgBtDBq8/2/f7fk3bTqv
         uKy+57NqsFO1HAh5++5UBa4dsagn/SNE9eTgncF9kjyjRUgtMO76H9G+6DwS0WXofrQb
         upfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVMRyP32TVSDMej5PCsYgXjwRs/XFA9/0uDTryqsztWH7ijL0IKFouEJv5SNWXQ1hSKi3W2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9AIo1mSXkES42e8EHuYvSpqr1YwdrXoITpUBrwpYDAyOLmfRV
	wnIWoDmKpKg0hGR6DjOnxY/eIOTygQ1v7wFJF1UGmq6karMz/gCk
X-Google-Smtp-Source: AGHT+IFMEiRQEO96fXpMQJDT33pJZKtVeKcslkgQq5lZT1LI9m5cJrYWA9C9RX5x+bWY3lKJYJ8myA==
X-Received: by 2002:a17:90a:8584:b0:2d8:b923:b56a with SMTP id 98e67ed59e1d1-2dba00822c3mr25077757a91.41.1726762579393;
        Thu, 19 Sep 2024 09:16:19 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:17 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Fri, 20 Sep 2024 00:05:58 +0800
Message-ID: <20240919161443.10340-10-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
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
 - iPod touch 7
 - iPad 6
 - iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
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
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

