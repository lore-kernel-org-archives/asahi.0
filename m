Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C3148302
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291539; cv=none; b=G6+//V2wGu1/EIqyr1sY8YpMtfKDuECnQV+rnV9K8NdIDhJTBdqtn7u3BL/3c40V6iXxRWmtf02DCbz/lD/u67996HwXGJer8UBTpaVpmRVdmg7AIiB7xXuRtI7r21JNlHTUtph0BKNq/bSSPhm/pbxtXxVkuM2/CYL+X5un1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291539; c=relaxed/simple;
	bh=3+weNr3YHXXle+uvM36RE/m2aNy1s05BypLmiMF5zgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOdwmxmbrFg8/2XRQeBiq/xrQfZOyAT9H1hcYy88W2vPDHZFalLQF4U50rWBYy/xEOGzvEhBvQCQwLjY+hLz23BzWSMVnKXb/9YbpBhcThu+vNaWYyEPObkjtog6LGFyLiV/WxbM+Ou/fKYaevBYVpdhJcfe5CPeC28ZH/uH2aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1/y0Qr7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1/y0Qr7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718a3b8a2dcso1214496b3a.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291537; x=1726896337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4+YQsSwFfB4huKc7g5jUWuJSmEqvrijMAe7lXahRno=;
        b=E1/y0Qr7P3KOWZ0sIAf9utzOgbqip8lRVNQYwrLrYYZ0D1NV+L6MNvgldKgA5wPAYV
         WoE/vMITZjqg2BLc5l+QoaMfi32IcSicOgmm9mMuO5c1CNgwgxMASvNAkzw74tuV5s3F
         2hb0EveF1alFagBD5qgWz2314kymAd/KVBuw/Im0f9LJjX1uipENlHH0dmudcM6eTpYf
         C3JwTAtz8P4OgyhGi27a6W4ZR0vbvj0twga7H0u2b9jopFY+O0RAXPoyijDsplEqtlkY
         sF9kDARLYYbwK93KE4IYRFRAqDAipYMC6e2YHhv9GZDLQX0m4ZlhU02YzXKG7lJvTqE1
         dHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291537; x=1726896337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4+YQsSwFfB4huKc7g5jUWuJSmEqvrijMAe7lXahRno=;
        b=sGmu/6ZVPYfbvsyCIL0GdX8eBlJGt4hbydGmdLa+sDkogkweacrkDFQA4lPadkQ/n2
         rhMcs70NX3mGFZJIKJ30RVPTFQaaJotGK+8Az/xy7RCxLHBa0kb3O2UVSI2LiSEDgNcy
         f5NF+qZ6YZ5ubDl/bqw5wmvxqOjgCrGZaYmDoZTBSzJxh5ioD0E5Dw98ukOVDQHJMOgI
         2Ngbg3HIqopgTJTL3e2iZzMIBtrXN429aMmo7nrIxDfiRZBiECU5f48Aey1tq9Na8BJW
         djVMQydxuBfPNEQ145RWuNPL636ozNkWqDsSCgG2dcirx18bRgXMfU4Poe6SsNBbE2vo
         FMtw==
X-Forwarded-Encrypted: i=1; AJvYcCXy85WTCgBMsjaiyigoC1guHJbfmpCnKHUvlr8lWoY6S9bgTRsJTfGVUftuJLEBBykiLv6/Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz10fqtkhsbntgVGAMPdbGOh8yFA/DSuOyhaLEk7iPHwrQJ7c//
	BVgWcFDTN8nFpe7y1wQ8o+t7xpqc9yCxW4ktjL/GTIv5Yt4gm56M
X-Google-Smtp-Source: AGHT+IGZb4Zp6+TBGYQNTbPKIKUjyE0uB69aRNQKjhc1x4drSXerk5mTA2UjozVOqqCR/y1Ijl5Abg==
X-Received: by 2002:a05:6a20:304a:b0:1d1:1795:4b43 with SMTP id adf61e73a8af0-1d117954cb8mr4443812637.26.1726291537352;
        Fri, 13 Sep 2024 22:25:37 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:37 -0700 (PDT)
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
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 05/22] dt-bindings: arm: apple: Add A7 devices
Date: Sat, 14 Sep 2024 13:17:14 +0800
Message-ID: <20240914052413.68177-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914052413.68177-1-towinchenmi@gmail.com>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 883fd67e3752..59f5be84aedf 100644
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
+              - apple,j87  # Apple iPad mini 2 (Cellular, China)
+              - apple,j87m # Apple iPad mini 3 (Cellular, China)
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

