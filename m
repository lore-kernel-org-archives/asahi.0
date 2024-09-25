Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA2186603
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248873; cv=none; b=edmMfNRlRNgcOO/6oLFNJr50H6UiPjQRPEuZ7D2ex+XIeXFIxneH9qQkOC4KZRNFe2qkCVZrq+D2CsYvuyobtsZXBW1zZeELWrdgD5zH/H84IskpoOmkJ5OPODSg3xoeo58AAm3SL6omo1k21QuQi4Tv6eRbanTkL0+DiWPEzXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248873; c=relaxed/simple;
	bh=mwHK5GHiG38texeDGYpGeDrNMRO0Wo/5vFLRgwSQrj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6Gl/JGbf2x/eYiZWUoYkYicxNIlrOzB6J1hit6seax0908IYcvwuzvN3jxOyyyp5RqKeZFiOnqpr5yfapJS/yY424K4bWNG0MbCx8URez7xMvaEkx8GGzkVYZGc7kcWUKJM6S0sjacVzpii8TZyFBtcGCCgRRoKBmcF4zU6XVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwAdR091; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwAdR091"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so5370109a12.3
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248871; x=1727853671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qL1bUZmlpaNEXcSDtzcduMqg904aKTZZJEvyhQxFwVY=;
        b=IwAdR091pkmRaxKFCSCxxsiNjpgYJa2lVa4hIqqcJC23eA9UQqlHeA5Km7EpLRMwnD
         rGZaa+Rmo4UEwRNAaCn2pUWLNWAasLDY1Z4imHtJcUks3gQlEg850+MZhRghDSpu+lCR
         7WMQsBQcnV8GtP1iDMGGpRIP/WhqPe8NoQbGK2lXwDP8TSmXpjLsmYhzGbcswhn/0uCT
         IEAfogh8Z8OxKcOHgOXN0nABLVykOYc/wd/pVzEMfAnmoySCIVWVzUeTvZ0uM9Bq4C6y
         KzX2HO8wh/DkrwHjP4+HzG+UXtucLxeKf44RLWK+P0VjkW8P0GQ0BuSaWuWnqTNaNr7G
         C7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248871; x=1727853671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qL1bUZmlpaNEXcSDtzcduMqg904aKTZZJEvyhQxFwVY=;
        b=XxTZH5pnHcjX7CKT1U3kJmjOhOq7x7BNw4drn8P8qegeF9uwShdu4Pf8dlX4HEkJ93
         QSaxfVqmCBK/HKiyWtPUSmuD+EU8Cviwk5AhU9L+HXkzZM8siMuX7OZwMJgmonFVmqVR
         ho/RoEk5u6XyMqkDR66fVOoUOJdnCY+X+FImWypBc4JVfk4AR2sExFozNUk00IkiwL4/
         MWpgUNGbn+ov8EhDZKjypxnrThTpwYENzULnm/jNel9s7FAYnqQtPYmgHsZ5IuRDrh6e
         +M8l4L5mXHvjGaxxln+p0yM4VEh+YPyJwWKjbWirLLGe34wRkTKkxhYyI7IfaWVtyKiQ
         1wwA==
X-Forwarded-Encrypted: i=1; AJvYcCWMaXcikPiB4p+58ezRG3bfX0KQZR4FmHGuJHsT1yC5hAf51hAQcSkbw8wR2muQIWIKkKqHTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKeGH3AeU4o2G4UGKSABLRIlx61aBPrUYt3lGOzmlxjHmt/2UF
	+glgfBaSIwnGGnN+/C3Q+d1Rlmjmnkx7rDzYc/Bp9fsz9tt8X8wm
X-Google-Smtp-Source: AGHT+IEGAuegRViCnSuJvwVYQger24wdPcK/JpLkMgsXxyB6wQFokWL4zigD/vmbvh1D7uOFV5xX1g==
X-Received: by 2002:a05:6a21:a4c4:b0:1cf:6625:f08 with SMTP id adf61e73a8af0-1d4e0bb0850mr2818860637.45.1727248871511;
        Wed, 25 Sep 2024 00:21:11 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:11 -0700 (PDT)
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
Subject: [PATCH v5 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Wed, 25 Sep 2024 15:18:06 +0800
Message-ID: <20240925071939.6107-9-towinchenmi@gmail.com>
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

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 01965890b4ef..253dae759f10 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -38,6 +38,11 @@ description: |
   - iPhone SE (2016)
   - iPad 5
 
+  Devices based on the "A9X" SoC:
+
+  - iPad Pro (9.7-inch)
+  - iPad Pro (12.9-inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -150,6 +155,16 @@ properties:
           - const: apple,s8003
           - const: apple,arm-platform
 
+      - description: Apple A9X SoC based platforms
+        items:
+          - enum:
+              - apple,j127 # iPad Pro (9.7-inch) (Wi-Fi)
+              - apple,j128 # iPad Pro (9.7-inch) (Cellular)
+              - apple,j98a # iPad Pro (12.9-inch) (Wi-Fi)
+              - apple,j99a # iPad Pro (12.9-inch) (Cellular)
+          - const: apple,s8001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

