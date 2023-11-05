Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5749623C0
	for <asahi@lists.linux.dev>; Sun,  5 Nov 2023 18:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNPu1/Nx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4083f613272so33497445e9.1
        for <asahi@lists.linux.dev>; Sun, 05 Nov 2023 10:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699209722; x=1699814522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p4QFuKK4zDjK7JmREfNGLdO3brtt0j7Hb6QAgVUrUA=;
        b=zNPu1/NxLNfouSOD0Q+i+YV3do8FFUAUVahKj921zSXMuSCPSQ0HKpOGUd3/EwJz6T
         VFJEHuxiQ/XEA5znvUqaN9W19gYCwoslLNPUQAlFrbG3JlaG4jPWVt2nzqprKNvLzwK9
         6RWFSwmO9sO6HrVjOw8KOfUp3A4vugUxwKvbEbbtz+Kbv5sa6OcyQnWocUgfU3Cuosam
         I+kVB1vgpaimRjkEjbJfw9SehcgdGcxfUl6tWRpJA594nZMNV5qwPSSJm5OXk9ryJQkw
         UQWyw5/PrD5BiE2IHS3k8ABzcGACC/h87KG5nS/m/k3Lmh5zN42PH6yJu7AynuIvVl6M
         wZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699209722; x=1699814522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p4QFuKK4zDjK7JmREfNGLdO3brtt0j7Hb6QAgVUrUA=;
        b=vOHdWMudBjF1dQigV9NKI/StcJZcrjoW712c1YlAI9hUzgh1wqlz8UFh2am8WkRB4X
         tSDyoMhBdc7CqbB/ikonP8ZNBKEObbhxRBLxxZWu/vtv8x5CQVqGJXz2RfemCiNRJdcc
         897hHHg1LMq8Nyiy1SUJZzcFwP93oQDXZxeloxM6D3aWBaiu5NVbBq3+kfc4mHtfdNx8
         VcTpIWwyUtz9sw1m+I30Vaq1XXRJLZ3CLsZRIOkb4lwH2pGB87b0NNql65nGrYTSyOIN
         wgH0JYGZZHIzyD/bIICwUs9CWdgxSwX3Zq7Itk98BiIktnaGg1C9/M8ImGbVwWqbij1c
         WnxA==
X-Gm-Message-State: AOJu0YwKlWjHFE2XRD3n5BQZltFwvhwUhOtvX862y5LK6nI+PJasZ97R
	+gzqS1u6MY4UeljpwliXvylPTg==
X-Google-Smtp-Source: AGHT+IFSpmafwOZq0U7CWe+nXmQRtHQOLcDbi+JWbFPNcxG5YLhYbhIL0Wd8ASmATcTAoMtu5NK/OQ==
X-Received: by 2002:a05:6000:18a9:b0:32f:a5af:99ca with SMTP id b9-20020a05600018a900b0032fa5af99camr11998596wri.69.1699209722530;
        Sun, 05 Nov 2023 10:42:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d44d1000000b00326b8a0e817sm7370111wrr.84.2023.11.05.10.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 10:42:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Ripard <mripard@kernel.org>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Justin Chen <justinpopo6@gmail.com>,
	=?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
	Baruch Siach <baruch@tkos.co.il>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jamie Iles <jamie@jamieiles.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: watchdog: intel,keembay: reference common watchdog schema
Date: Sun,  5 Nov 2023 19:41:54 +0100
Message-Id: <20231105184154.43700-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
References: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reference common watchdog.yaml schema to allow "timeout-sec" property
and enforce proper device node name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/intel,keembay-wdt.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
index 1437ff8a122f..8231dde2bfa6 100644
--- a/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
@@ -9,6 +9,9 @@ title: Intel Keem Bay SoC non-secure Watchdog Timer
 maintainers:
   - Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
 
+allOf:
+  - $ref: watchdog.yaml#
+
 properties:
   compatible:
     enum:
@@ -37,7 +40,7 @@ required:
   - interrupt-names
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

