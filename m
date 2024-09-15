Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD129482E9
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387716; cv=none; b=FH89LMonYzzeyTTV33YXnOq+FrNlyw0Ic7PeJWfmGH2Uv6nXDj0hti5wzDvSM6UMtmBpWYPI3SuzRa4V38afv3mo28QElcvJeWDh6nGbeayABOM9N16S3DUNBBu+IzC+seNjBBZtTYMmmz56w71WnWoNRZCH2dh2kkFgHXQLM5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387716; c=relaxed/simple;
	bh=1do3oMHa+zZtMgWoYxSILBP1btrTVDMYuMavL2iJt/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUIenfkLBlI7aC5qqn6iVRFcwvOxS6x1OkXSzbPcybOYFg4SK8i2PIWQ1yOmzoCYh0FIcE2UAjPT1JOwyuOWd/DBD2veWXb6+C9Pec3jiCIUnw8tjBFOzn0/rYDXysUVQgH+Uf99z/Ra93yfigk8hGQwAJGZiAB0Ptyn62RSEP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEYa9NSM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEYa9NSM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2054feabfc3so28480905ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387714; x=1726992514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx9QUOiQgqEszXRAMdnqMOxDufFUf+ALloEhf90CVgc=;
        b=AEYa9NSM96OAYzZ310kGcX047ddhnokD7NmGyU7NFXt4stJq63tXfFnTZwLYFpCJlx
         4xJTHMGhQMQuFRH7/j2EdN6xTiQ+beQlSt9eoXi/qT4oDfKJ/irJBEi23lvB8LNcfJXu
         6vduEAYkXe786cuLbTfQbuFpOkjYkrgaNah2GwgVH0gbemp3JyE0iHDcmfZJ3Jn3WvHU
         osq3uy5h+eIMcyVgLupvAcrxwUCO64TqQQSdIMtJyAD5estBsG8ad59z7lsGS/Klay5D
         3nZOaP9kUFWHSc29wxP2bKqsKvNEs5VkCFpyEIcTLLQq6vFAnJZVyjlJPZHtAdDv0bIh
         62yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387714; x=1726992514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx9QUOiQgqEszXRAMdnqMOxDufFUf+ALloEhf90CVgc=;
        b=EhmrGb2T4v4FEihepcMPvOgGMIpDCil+IoZSFJG9rW2H0eXOAUsPwDbL2hllXQPfca
         QywlUjswe74tfNP3l60VRhOE5JBc1rxAttOQGZmxMDEnnklDj2l+HwRd5nUGvh5o6X8z
         59PJGaPEVnPOFElPQDTxCtq2Wr/w/tCHEie9u3CR6fPl1VOrHxzSfUI5OyBIAfH0x3hT
         wqjILEdTLUxsVOcepYAAaZAI61qTAy7vo0GuumVtP/quDqLnJIn0fDkTU6Fw1FY8CW4m
         pXYt9+r2dRVl5Z/8hvtMHjYVG/ZChBqS8Yua/7+hf4CBA3y4rg1EXaRdIaJ927DwkVd8
         Kx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8v1kHa08fWRRGpwdEdVp8YOY6fHg0uVYSE4KGHELT4Mwaw4ElBVUseU09/Rd8I8egvWAvdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmVMcO/h2LOCblzsjKaAytrOkdq2L5Faf+krbE6Ku8jZp4bKGu
	TmEzAZ+kqVs80eHWWLWeG0570PPEL8hshMOoQbSKc3twuQEioED2
X-Google-Smtp-Source: AGHT+IFNSoyeirgIMK/595Vgd0JN4ZFIGBPbAzOrW7cJtm/MKE33wVVuObYNcxrXh4Lj2EvKvj/Sgw==
X-Received: by 2002:a17:903:18b:b0:202:301f:36fd with SMTP id d9443c01a7336-2076e361277mr159798905ad.18.1726387714123;
        Sun, 15 Sep 2024 01:08:34 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:33 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 04/20] dt-bindings: arm: apple: Add A7 devices
Date: Sun, 15 Sep 2024 15:58:49 +0800
Message-ID: <20240915080733.3565-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915080733.3565-1-towinchenmi@gmail.com>
References: <20240915080733.3565-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the following apple,s5l8960x platforms:

- iPhone 5s
- iPad Air (1)
- iPad Mini 2
- iPad Mini 3

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 883fd67e3752..89c1e35e404b 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -12,7 +12,14 @@ maintainers:
 description: |
   ARM platforms using SoCs designed by Apple Inc., branded "Apple Silicon".
 
-  This currently includes devices based on the "M1" SoC:
+  This currently includes devices based on the "A7" SoC:
+
+  - iPhone 5s
+  - iPad Air (1)
+  - iPad mini 2
+  - iPad mini 3
+
+  Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
   - MacBook Pro (13-inch, M1, 2020)
@@ -65,6 +72,23 @@ properties:
     const: "/"
   compatible:
     oneOf:
+      - description: Apple A7 SoC based platforms
+        items:
+          - enum:
+              - apple,j71  # iPad Air (Wi-Fi)
+              - apple,j72  # iPad Air (Cellular)
+              - apple,j73  # iPad Air (Cellular, China)
+              - apple,j85  # iPad mini 2 (Wi-Fi)
+              - apple,j85m # iPad mini 3 (Wi-Fi)
+              - apple,j86  # iPad mini 2 (Cellular)
+              - apple,j86m # iPad mini 3 (Cellular)
+              - apple,j87  # iPad mini 2 (Cellular, China)
+              - apple,j87m # iPad mini 3 (Cellular, China)
+              - apple,n51  # iPhone 5s (GSM)
+              - apple,n53  # iPhone 5s (LTE)
+          - const: apple,s5l8960x
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

