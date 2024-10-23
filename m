Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDC145B26
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658731; cv=none; b=NZNdUpH/jj7z/7yjXxGK/99Kwx44B8MUsbTVLCBIyg+/tSQOHe1ntEk1kK4wPS0cPwu5EeKo8xLrj9tJAqXsEwJpoPDAsXV/ikzhhHhYMSfYlEoEgzpnAkc1FgwoaW+q0AeyK7I3KpBL7nJlakP2rLGh/OpzS83XYwR1Vu9xYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658731; c=relaxed/simple;
	bh=4HKNim7HFxJRjrFmDGbWHva7HxDNUViZOa/mq0bin68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is5lPWi+kpXYcZprXEg1Sp4/Jl62um4/9YQa0H12ykqZGDrI4Ld7j8WmXclF8rle8TxlE7UB2PAL+++khSbXPXh9hg6ZsYLopyRWi+ShoSRZ4E/5FinVjhy6yjz1b77NOecLyPthvSyBYOCfL6U4XPwK0kERu6jXJK4MJL0lxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN2f6wc0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN2f6wc0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cdb889222so61802715ad.3
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658729; x=1730263529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH2ow61Xa10eYMI/pQ47ccz7OPzd71+FsvtkLoWx3cI=;
        b=HN2f6wc0zknsjQdc6EzRHjqOZ8cCtuaNJVf+x1fU5jkLWzn2AVjzPkBZPc94A0Hbso
         e8P2fo1jT3cFBfHAHGlKkr4+v9upVRmzIItvgk9jazRwvrIur0RXiadOZu+NrUfdENri
         KelFC4hR9hl5BTx+qt4QFBUdsx3nYB0d+w7DnQJd/juyrwl197+Qq4190Z0W5UANGxXB
         D98S/DJAqXxV0NBU0QzuNA9wKzOPJGZhCShgRNXzjiM2No4JhfaS7bB3c9w/A/lYkq7l
         7KRX8d8rjh66a5kJaEmZvYhPk/O4g33MOTkC2qaYz7RFrJixbE4klYsB9YAsAfAHCLga
         iCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658729; x=1730263529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pH2ow61Xa10eYMI/pQ47ccz7OPzd71+FsvtkLoWx3cI=;
        b=tgpQEsc8R2GP+c/tdJ+xa2dyYdIeIqG8JCja+8clhqIZE5/y9BM+ZzW8MGwfAimtvL
         suiReySGVFKLTraFTdOyJ7SvioXxWh9bVJoUG4bhV/CuitUVZibSy/ZalFGGEh6j7LoL
         d1ILJo+SAHOoe/3V5yC5iqplGWxFIIMnNJDQWgzQXMIWCce92vHRsOmxXFSEXWbvZvOA
         TDh79pZrOxQ6+6rM7X5eClkVj+zmYRAzq9Tg/F0NDGO0W7dpIKwTeZNQD+uUEdz7ZH4a
         wWYSCoyO0oX5SKxKtQmcNMKVmG7UNZ7o3nLjG89ggXDkG/hKg10vwAOkQF/WegZDBr4s
         9tkw==
X-Forwarded-Encrypted: i=1; AJvYcCUgpmqBYiO/B5DYcB+P8zLKtKWqMGhF70366xTzYwdMgf8BNvHRmTZOX7/YNTbJliPvxTg8Dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ/XLvvXVUecCXmPmeqYv8INzMiTopNFJnmmxt5CRSY0IOIFBe
	cJxHZcrrbLSDO3ruEX1IjxmUmYF5AhDL4BvUA2KGZf9bZIdlMUgg
X-Google-Smtp-Source: AGHT+IG5gi7XjdZQIYYPSYGr62YReQleUZiDqBaU8LyLMAVcCSU8coTf5w5e/pm2Iv+t9BbyTg/KEg==
X-Received: by 2002:a17:902:e887:b0:205:3e6d:9949 with SMTP id d9443c01a7336-20fab2dbbaemr16378215ad.52.1729658729422;
        Tue, 22 Oct 2024 21:45:29 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:29 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Wed, 23 Oct 2024 12:40:44 +0800
Message-ID: <20241023044423.18294-10-towinchenmi@gmail.com>
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

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.47.0

