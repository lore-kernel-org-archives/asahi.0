Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63050145A07
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387742; cv=none; b=eiKH4MxZeRm8VD4n6sY2jXf4vPQg1l808ZG4ePcttumc43KaWYCJyv4s4Z1F2sIhhYqk3HnG0Xn1KoJ0Qx99NY1vUvtaQNufjuH3kZxTT+6hYvXZKe11KJhylO3ziz7QXBITjyhUpEpSrqdWrX0s8pv8RsqmYT1PbknX5vXfzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387742; c=relaxed/simple;
	bh=6FSSL/1GJHHM4yYO8TALeYc27Beldx7BQtdFJgXPUnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdRiRHspuPO6h550nzLwr5RfD57+ZIdBkPexOYXB+bgJXPUStKhTrWGOu7DhTcPabJnMdfruDpnOo86Kn/Vo5sahl+9f4oHdZ8F52k/+6Uka5Xl2C2CyhALtp7mu3MbzTUke/7DIRxD95puo6ao2V+hJ1SYlvnHSiV/aFLlt/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl8+MoOy; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl8+MoOy"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2054feabfc3so28482055ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387740; x=1726992540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDPaGS6bVIcDNoI2jUHr5/zaB32Tr6Dax7THrbzLs58=;
        b=Pl8+MoOyUILOOAxwf+vN9Lqz1Ndmr/RY4iKmk9Xz8GLbc0pwwvyiUrxLKnbUsis0ww
         LYV5nx4/b8OZ42JYmN9wZJqIazo3Ckj50N21HVvyCXbMvBuGVwfbZfI2fsj2Vp+FbcZs
         tAMH27Hu+FsDSH9JONbCUBTsjufcIVjKuNcc6okHb8HYTlx5hhu6SGb6OgL6KNGCY7I+
         XEZpc4ptypgcS6Ek+FJPR9DBA7dPDDHLjloKKMrtcmAhW4Zrov9kipEFHNVVA6rm9FGi
         NNkgslxw0Pt1ahDEK05dj9qvqb6sLdBbt32RoGXKuZl7qfZBDMdofe8nmQCRwCisYU6W
         ZQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387740; x=1726992540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDPaGS6bVIcDNoI2jUHr5/zaB32Tr6Dax7THrbzLs58=;
        b=IuocnFlQ+W5kYFLhETeTLVkOsDvXGnJdPypoxjgd2gUlu2Snc1DMppAabS14LzdBOl
         yvI6ECdYql7rMYOrnieIWeCWiG4TxTiIOKPPDDVs9TNUeGEP1mqLIdA3Tsy9irV+5Icp
         Y+AwcO5839ttYlyicSp9ednWx07voueKJTWHG8nCWx0/DebJmMIB67wN5AWLkWzEs6zq
         iH/isAKeSuoinVP4fCNn98DMUqGekLjvbviO87tcERqkTjywt1K83wOo6SPCTaIB0Xa/
         V6o5HPDGPztIE0nxqfJeZTUCj6KERFbZsE4+oi0G75lUT83OlY/DFfnUvegzOnOjgp79
         DfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8kTRjaJMHKhAIRi2ClWgW6Xgj4hBa4bh38uswMtHheCgVNJuH95ocDtvrbvKcsj1IzUvdyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeViNG3zZTxqCroYX1XDMkhFaEtGbyZHybkMDYrGpk+QL9wvP1
	W/HUF2QBaHhE6kfbRiHsbvt02F7AoJQ4tqUPhnXtn2MVyRO21Tow
X-Google-Smtp-Source: AGHT+IEVHTa5Lbfq63PMwEjTcrPbupnkuunt132jqR2BhwlLFkDkPh4npb+kw4rK27I2Cw0H+wTgHw==
X-Received: by 2002:a17:902:f68b:b0:205:8bad:171c with SMTP id d9443c01a7336-2076e31954fmr183465055ad.12.1726387740579;
        Sun, 15 Sep 2024 01:09:00 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:09:00 -0700 (PDT)
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
Subject: [PATCH v3 10/20] dt-bindings: arm: apple: Add A10X devices
Date: Sun, 15 Sep 2024 15:58:55 +0800
Message-ID: <20240915080733.3565-11-towinchenmi@gmail.com>
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

Add the following apple,t8011 based platforms:

- Apple TV 4K
- iPad Pro (2nd Generation) (10.5 Inch)
- iPad Pro (2nd Generation) (12.9 Inch)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index b6a2916fb0f6..d72d8cb5bf20 100644
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
+              - apple,j120  # Apple iPad Pro 2 (12.9-inch) (Wi-Fi)
+              - apple,j121  # Apple iPad Pro 2 (12.9-inch) (Cellular)
+              - apple,j207  # Apple iPad Pro 2 (10.5-inch) (Wi-Fi)
+              - apple,j208  # Apple iPad Pro 2 (10.5-inch) (Cellular)
+          - const: apple,t8011
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

