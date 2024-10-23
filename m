Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3A14B946
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658736; cv=none; b=IVT7OgdVvJNEnpX3wT1Oc2Oa1kdxzN2GoCfRITyXeLhJZphNvhXdZJJ+GOYn7e+RuQY83z4FuUCI7p09eONKSTuvH30mnU67sadS5cqL5n8ihXOAUWf3yAJO+qLsCqDAXKIYhIvPOKGHZLrGJVi4eeU6vnp8o7TJLCVdIRRE3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658736; c=relaxed/simple;
	bh=w3eVY/B29SRF0KT2mswItvepFQQjOQ+Iv2sPUga293U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuCsEgz4lyMcFJ7k2DHCV67S5vvc4tAl1VhGjsBuvRtGZIFfbJx2r44K/7Kj1OwpKTn5nqHMtGsaBtPkpOfnNMrRTHLPUI5jThtc78DyESqlmwsh77JVi66E0j4A6Y+hLov3EtiiVQnky1KquMZJrrX/dMAwRSO5V3jGm9FDoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+BR73f0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+BR73f0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c6f492d2dso73756155ad.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658734; x=1730263534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5tGCZAwgsQd/JEpSzWcjKaVDDVs2G7IjrY/5JPqA68=;
        b=a+BR73f0Sl6kf8TJRQmx29yYRfUDZ6kXFCYOnQjU1x/M5ErBy02QaqqbFZA8CwMyHh
         KrgluMRPVajCPAaFUQ0b05EuxsjjGcy4ad9/HqqDY+eNnpAV9HmKf2PI6Bv4hckdi2oQ
         YvwgozCre+YPKx8Rmb60RHyka8aTj6lh5g+7/gBCDZ6WFIFye1OdDfSXxDvtdxEaQH8z
         Wo8Ew+Ty+btugcBxac17THMaDVMObZyORKuDRQ+rAE0cNP2kA8lagr491Cisvb8GiOZZ
         l1bzbSyqXrS5UIeY5SoQelnGoMb8KeQ7BU5MEUJeGRi9bnfWXBznzN7qycwGFwQrfvbF
         U70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658734; x=1730263534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5tGCZAwgsQd/JEpSzWcjKaVDDVs2G7IjrY/5JPqA68=;
        b=YwZswY6U8+RUuYBEQfHfmET13jq8wzijhhuY7kud0TFgId7M+5ftiCWdy1bFvmi7CC
         8UDS5JK8YaGrdTXQBDN20GF838GNWz5lz+6peiNPCBp61W71uTaWA/hHKWOTCclHjWY9
         Ya2mDxwDvnqwdRI7rNNXmzyMp6Q9QEet8U5BWQZC0oBCXws4Y6iOvm1acsoajZoa6kAH
         7nT1ITSApMggEq38dnGF43dvS+fFcnHSTfErLptyxdj+D/vsdHvpTc34c/UUToNwijiP
         wLNlehV6RqACreH/U9IlwUrdqltsMyHzygf2Z8OcILXECEMSynTgwgLtIuho99eWN0VH
         ciOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlvfM76eAQUs54hBk1LmH0Zk3V37IYv6G7YZMfoZ+37u6OAjJ8d5kdoHmbZWsk/x0DlJN+uw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVMbIIrxuKz5mONUXLQwtSa8Tb6k4rKia8dROQXjNFZTLvqDsR
	xweG8yiIiNH+rAItQuZYuTHTRv2ZCXEx+cvkJkiwRX4p79Jto+cmfHpGEwFAyss=
X-Google-Smtp-Source: AGHT+IGQczJSDPY9IaBIYcgOGXzqfF+JMyKf0dT11UOK8ODDHJNEr+deUWTrKgnZ1HQ/JnYRDqWFJA==
X-Received: by 2002:a17:902:ea0f:b0:20c:705b:4123 with SMTP id d9443c01a7336-20fa9e41209mr17062725ad.21.1729658734324;
        Tue, 22 Oct 2024 21:45:34 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:33 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Wed, 23 Oct 2024 12:40:45 +0800
Message-ID: <20241023044423.18294-11-towinchenmi@gmail.com>
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
2.47.0

