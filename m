Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333122071
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291570; cv=none; b=BLfRmV+aNQntusVadG1tJ3jpBfjRorQC91zckV3BVOPbHaBb6C6fdh1/Cph7y6L+zNRP2AhOlCLlQdPCu3ypmmlBmVoM4nnJwINVinYcTdApVwYHbJ6LdOBF7IJ+Z410gpodn5Sf1R076IrlGovha5sIj9GkKySMnuvPE+/gu5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291570; c=relaxed/simple;
	bh=LFzv+ybZl24X73SDlUeoq7DGJPVkl9oa6qIMbQ5kWi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fENE44QapfoKZ/ZvdrbuDdzaKJLiy9FVsRZYc9Debws4tFf/wNzJEFPMFso/bG55hdbiT+dyK+0zbI7Ij3hG/GMbEH7QX0+DkmnhxqGWvfSTyRTQAiym6JmDe+USh6RNrmIx7WpdoZyorx1n++gq5qcOlQc0W2OsVvjm9MXSZ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1h71Uxq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1h71Uxq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso2502928b3a.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291568; x=1726896368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxmkdiRq54N1MFYxhlP5pg6YjtYKAD9J3M+YFYas/2E=;
        b=f1h71Uxqi60UvMcjig4wsxO4nF7hnU4yKKwtb/BlOS5rUKpgsGe7vvpgm4j5Q4vr4k
         SsmbKuLxMQNH3R4bA0IZ961j5mrj9l+rUvJaoar4dHusaRzEXoUUm56MdFgvEBP0KO86
         VRXh3CDxVhBr1DSSIgJqnO91qGfBd1O5xlfQZcgSTVTKFniENs9VFLH5QwpPUR3cT9OI
         nBe2EmGD74Lx1tVoaAbNO538NvtMgkARRrCz1PRezB2ndoIukA/YL+F9upOcCQ5BzDca
         hAh1QYAD6Axe9m8Jqpg4VSp/vPwSXd/rtcGJPqb6wKn71MZIdjorS/TFZNyznmGb/JIH
         HqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291568; x=1726896368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxmkdiRq54N1MFYxhlP5pg6YjtYKAD9J3M+YFYas/2E=;
        b=WxtQD6jvLa0Bkftl/XR/GW6hEpC/4/uFxPyJURJ3zdYiwAVGdv8zktEoaZj5QEoXBr
         uEF/MRhvcaCbABlpBopRzrgs8ySB1mVxRiSCDUL1Jvv9yP6evbIXBpIbJiMz5vz5F6Uc
         E7/+vM/KACgWXQDGb6FGXSeOxDpWesJFWSTTd65SXr9qd/D5aOvET5d1GhrI+5CDXhZG
         dA1xDyrCUF4N2WaUSv+pYvsd8zfwD8bP7gpzHLe/gEZsbYAj4jXaPavB7lOHC5K4TkzQ
         E/ifAfA80S2YEB4xBs13h0sNQsoTELqsr+MRMKRM+OOkqy7KVHmRuJ27Hl7qENopt8XC
         QvKw==
X-Forwarded-Encrypted: i=1; AJvYcCWwhDeakj2grkf5/43jSpBEG6Nf8b9qrx8JzB8svMZDERxkmSIEG1dn0BNjZ3in6pp0Icrv/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0052cdcezobWGoFa4iRFS+9N7CRfnpWpk/WUNQ8E1HQrcnf4p
	l+B/na/33q9huEVvpVZXkpFRFz7U+l1FfrHKKwZpEvaRevsgY6vo
X-Google-Smtp-Source: AGHT+IFjCQdTCgKHorV+PEdvKRykkSx/Nf7CjbwpllATeXQDdK8UoGhSnTQE0aLfguSQ90/rKj8SUQ==
X-Received: by 2002:a05:6a00:14d0:b0:717:9768:a4ed with SMTP id d2e1a72fcca58-7192609318dmr15345794b3a.16.1726291568317;
        Fri, 13 Sep 2024 22:26:08 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:26:08 -0700 (PDT)
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
Subject: [PATCH v2 12/22] dt-bindings: arm: apple: Add A11 devices
Date: Sat, 14 Sep 2024 13:17:21 +0800
Message-ID: <20240914052413.68177-16-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 92fb48aafc39..c39fb665a4bd 100644
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

