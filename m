Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A861A4B9A
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762589; cv=none; b=ur0ezEHjasv08jl8eWtIXJBeWDtvz1fDCo6LawzwvazshuL1x+3IlBkPKRvyxAN7BAqfSGwK6SWv6u/Kx6bXaX+hMs14Adr756mVdJlWjLDbURQBgjN8wC2nt4FAFjv6031nt0Q4EYDkj7TEL4VjtK7nPjk6XVIyA6TeKN7gLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762589; c=relaxed/simple;
	bh=oRRZjOe8crHuqKO3fJOPVea9O1ipoSrxWoL3J8IvGh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQe3bLHtz2mmHljFYwG0osSzhAnXA5RquA80UTD87ckGEf6y77O9sjIL/If3C0LmmgDmeZ2wAXZv+KoDD/kgp9gP37DHDsF1gwpkeiyQqzdxTcCd7sGjsgeue0No/qqnNE9k3I0IbgNVkxkj8ArskCabYYd8KTXF2daYxxUb4JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HolmEeTi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HolmEeTi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso865313b3a.3
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762588; x=1727367388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWKpEVOCov+RuJGQrOjklAplcYwSkE5zO4KxeBxyVs=;
        b=HolmEeTi8Suu3i+uJwikEfrdLpEr2O+etohhdRtW+fSNOpSJO0ku9chRZDgY0/Fw9B
         0ckK3eKHI8JacM07ycNswfJe55ogiAKbO/MTw8C/fAK7OFdYWxdrHHkCmuSHgo7lWykh
         L2RA4odbkaJ162JpR5idq7M3739kuigbTL8Q86rOh8zpvG9IXCkLLIPGNd29qA5utPEg
         6qpNSTrh8+qXN6pO74IGcNQ5XChk5ito0KrM4XEs6YrRPN284itiIyf9xbhXMJ3uNPAg
         gchi8s1kC0ty4MIxvsTKCqx9+HaSqCxUMCWFta8FcPv6eBoscqaStnOVi8AXK2IVgT3R
         V96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762588; x=1727367388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgWKpEVOCov+RuJGQrOjklAplcYwSkE5zO4KxeBxyVs=;
        b=mbYf1XYD9VAoMHjv+VGZF3G5Tj+qj1srmNNuEOSeuDWlQhrhIfyy2jB/7q4zg4B3Uz
         viA+NFNlp6iptya1T0FlgKp9jhro2ad9jC9pZ0vELZZLe5fS26uY/EV9zr3S8MXQndvW
         wYBauGQtBSv0CyuD1P3HtFIUKy3sarsvc0dYc2jM4LslF4n/g/Dyq3WfAB71onODb5/d
         ZqoguvHZtODFIfiyM8NVtGusf/ARsxcIcNDMMJ/Kk7Lrl91C+BPomB5PcOJ2A3PJQaPn
         QUCCl9lS0GHCyujS1VjBEoXHr2Gy4KxV8lAnhI3jDaehYGgZmEmjmMnp6beBIEz17ohf
         dFUw==
X-Forwarded-Encrypted: i=1; AJvYcCWQAYBy6L3/zOhGheNtCzZFP0K2cNQBzv2sM0YZ6COmTRsN4nt32pEmwmR8KvJz/I6ipwe3vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWh0QWxwQ4iGpzZuZ9ObP+cLj+vvF21eObxwJVLRu5B3hvQjJJ
	uArYu3GKW/HXl6HcEi5dlYIcTEV4uJGVffTxVdYacPFAin0kyRV+
X-Google-Smtp-Source: AGHT+IHHnFuSvqgGScSELj2y4e0Y0hfFO95m/y2fVsqznlF2laG4grn5xTp/2H35jwUVczmZzDXP6Q==
X-Received: by 2002:a17:90b:109:b0:2d8:8a03:b90d with SMTP id 98e67ed59e1d1-2dba007f3bcmr29289731a91.41.1726762587665;
        Thu, 19 Sep 2024 09:16:27 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:27 -0700 (PDT)
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
Subject: [PATCH v4 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Fri, 20 Sep 2024 00:06:00 +0800
Message-ID: <20240919161443.10340-12-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

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
2.46.0

