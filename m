Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C60150994
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658741; cv=none; b=U2zOmWLjJt/obyqX5JQT05aenjvEGBVHPN4xzUPdlmNEHG4f/gMz3Nq0HllJpxcEFumkxOGhN4lfh1LU5tY6t+tkOju9OlQS/LlpLDmMcUpcOx/fByyCXdiGX/blzoHsc8rygvzwlS2V5FI/GJXdPj3hDw60hClbCJ4FSdwCkm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658741; c=relaxed/simple;
	bh=clRC7SlCVokGRt05BZkHjfxvxOHH6WjJTUUbgEJzcqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+rsYXs+66P2w+oqR09Zpy92jp5epE1Xw3cxX5DI7lahzCCcMnuqEyf85JwHFAtJiGY+IVlLh9li6kT/r602g8YbU9lFdfu+JgWo4U6ATG1deGxkbG7QBbznWAcEnHula0c86BQc0xDV5tWLf1V1bz7l94vMPlqVWWDbjtGXGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfueLr9x; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfueLr9x"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-207115e3056so53730735ad.2
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658739; x=1730263539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8ySFZ/e4rYDchZwRHVmsRhqGnJF26yjuWxa24CCZHw=;
        b=JfueLr9x9/wxvMLpo+XrqxfHaJ2yrY0Ffacc8JH+kuNgkXif+YX6yC8piqCPglaaYB
         uarkzdmSWuzAL7yx4Fl4ytrOnNAVyI1sf2Q9A/uHFM5s+T7V1Yo3pFP25/XpwBfm7QMw
         qKAzniCX7yPPnUDotL7dvNa8dpGCOAnrFewyKwaM/qF9znzrWSQszuuA4NzqSPJ+M9NY
         4xKE8NSTvJ4Bo655gr+7l1Z2eUCcfMQv0BDHF7fxvg1/lQHlq62urTMCivRguYGoKwUp
         dQ1Tqg3afagyS4nHOGk4tfddXdMIOfOormCzfX3uvPFg+YN1f0nC240oKx3qT5nfKKgx
         31UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658739; x=1730263539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8ySFZ/e4rYDchZwRHVmsRhqGnJF26yjuWxa24CCZHw=;
        b=cEP8l3mK3eaMwvfxmXxBSqGA6C4BPXFPtkmwizHMTS2TJEJnfZIvwuLUexcexjQGK4
         G8ItRwaddTI8aS5xuNM8qgAsn/L5QD+IAdYCcnw41jogTDuYZ1DvWlW48mV5gFLMqh/k
         MrpDdFgoEcIvrFP2xYp2papiUDPeuqQUa4J15nHqanluHJLdUL/IN3zHxqwqYc7lia7N
         c7zpVsf7fKi8XbY7/6eY5pDRp/PU2gaDjT+dAlRVngHMhuDAdqh6Iv+AtloHXbMAo23z
         z4mrYdIkH8Vom2C7Xcd4naCmXHDAMKhBsIP9S6cJyFkE2h/GSo9dGpksSXN/JjI+59nj
         6ZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFyH6sA+eP+Il118N6NZGB2nfdg+5TH/SS5BVQfov2q5SkLPrpgW7uJ5wEOf8dfxCah6Dp0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRPNuPS8coads3OSIn5eBEoxyD+Y+iD/9r+9UEQTjhVoTTKOKC
	E9kfmoxtQj+euqBomQJOvTfvLW+SetrLR7UFn8uCfixXYyHtrpGY
X-Google-Smtp-Source: AGHT+IEnzOstKHuAoKlCyOmaiMfvKSyCyMyYjgaGD+r5AD2jOIfOABw/OXeuqWTeXltAhA6ge3A5hw==
X-Received: by 2002:a17:903:2452:b0:20c:9821:69a4 with SMTP id d9443c01a7336-20fa9de8c00mr16520565ad.6.1729658739269;
        Tue, 22 Oct 2024 21:45:39 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:38 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Wed, 23 Oct 2024 12:40:46 +0800
Message-ID: <20241023044423.18294-12-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 96efadad15a6..dc9aab19ff11 100644
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
2.47.0

