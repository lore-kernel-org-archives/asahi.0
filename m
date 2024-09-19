Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D91A071B
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762547; cv=none; b=haM2Y4K9nP3TJkRZcYC2LGrzhQsWHOFjY68R56AHiphkv2WxOcDBufVwNtvc8TazC3S0ZcF5viXjoynC7vMvfi0wn3VS0u0GNvKpy3mVH+WxhteNUWVYFrKLs3F/HHXd4fT7GAM8J46Oxp3oVwqzG2jHzHNBGwrPCRwuLYwTo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762547; c=relaxed/simple;
	bh=E3RYCczoWAIl+1EFjhBF7vdIp/MBXZu9x12iEfKWfg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqUMFc5106HBSl74Vwa3xP4aNBObpZPpN0bSxARySNaj+Uh2nqYvfFNwFM+AZgaUMOtlDpTyA9r4td3jRm8pHMusNsGT8P0HvkzArSYkE1I44xtsWWLLE5oF8E8Vlqi7zE/d+MNHEngpjmlSFgrrWgwZ54M8VnYFqaFC9BQbH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aamk/If8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aamk/If8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d8b679d7f2so906798a91.1
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762545; x=1727367345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoZcPIwsVHYtRMkw/5WEuN61HIysTMbtkDEFCrxAqpA=;
        b=Aamk/If8g8vOquMRHOE1U3k8KSs8XCT2SdEOt4nJjYwwlMSpKEPuB7msFMx5pVPnlx
         mqrDQ/iZ7SwET5/OEwuq1UvcgW1r3PBayNSgJaZLWejPuNynGcZM4MyxXnp6Sh1RABRd
         D5FkMVQrIK49o/6N3N8mOWxA5ebrLX79JKCV9Xc3hp3DZiXq48EpqyJZN7reBNInIZ3l
         k6bK8svyD5x+vmZTOOiSww30qIS7QiWo5EibhL+Hxo6HUQLOCOgSJ58p/FmMqcHZNEtT
         g7emkvW6fWnMuCQzlSbydvCXNXCsctfq1MlMa6o7D6g++dmym3uLPz983282cjKi5sna
         yYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762545; x=1727367345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoZcPIwsVHYtRMkw/5WEuN61HIysTMbtkDEFCrxAqpA=;
        b=FWiJdt5utmAASw950CCM5vRz45+/rqTNsq1P3e/DoIwyAiG3swTY8YMGYcpaYq0RNw
         7N6GK6bPmn1LWvJvmD8loU8kE9sTmRLWaKkHQv/HgYHzJh6/0MzwhKGvDVNchEgZMyfV
         i+RM1VYC/xRLg2Mpd5cFHJBweMWAcRTOuFx4foq/T4eGcsXfRPRvIJxUeydLgJ1i8CNS
         pStlm55J0i1jhZK3EL/bVzew+AFAgW3AgWLoAJP8jr7itfN2aGBzXrZglaAkZWkiaqxR
         isVpYnd283ElXM04zYjmdrVYGiIm98X6ZtvLxAHHMKx7wKXegXzYulntoS3/7BLgri3C
         tZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyiLcv8TnNAlNZLk5E1wzCyF32QOfXghJ9uIb27jsjtnIlnlI36+ZDhVhj0KWCI7wEsD93mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvs/cvUv0UhJ9o5r9S/6IFbBwLaVOknmNdmYSPemwVxYDD5Sw9
	CtauXf45aqS1rIGIDnARN0h5cB3MIIGk50qyWehBPCppwqK3f7LQ
X-Google-Smtp-Source: AGHT+IEhvS1/8bHcpqCM68pV2gaO+sQpYTUh6bBazzrIY3p1js5/1/bdomadlg6cx2Bh69svA1xScQ==
X-Received: by 2002:a17:90a:5e0c:b0:2d8:f7e2:f03 with SMTP id 98e67ed59e1d1-2dba004842fmr30745184a91.32.1726762545103;
        Thu, 19 Sep 2024 09:15:45 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:44 -0700 (PDT)
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
Subject: [PATCH v4 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
Date: Fri, 20 Sep 2024 00:05:50 +0800
Message-ID: <20240919161443.10340-2-towinchenmi@gmail.com>
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

Add the following CPU cores:

- apple,cyclone: A7 cores
- apple,typhoon: A8 cores
- apple,twister: A9 cores
- apple,hurricane-zephyr: A10 logical cores
- apple,monsoon: A11 performance cores
- apple,mistral: A11 efficiency cores

In the Apple A10, there are physical performance-efficiency cores that
forms logical cores to software depending on the current p-state, and
only one type of core may be active at one time.

This follows the existing newest-first order.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index f308ff6c3532..f69b75afd258 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -87,8 +87,14 @@ properties:
     enum:
       - apple,avalanche
       - apple,blizzard
-      - apple,icestorm
+      - apple,cyclone
       - apple,firestorm
+      - apple,hurricane-zephyr
+      - apple,icestorm
+      - apple,mistral
+      - apple,monsoon
+      - apple,twister
+      - apple,typhoon
       - arm,arm710t
       - arm,arm720t
       - arm,arm740t
-- 
2.46.0

