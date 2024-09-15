Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C64DA04
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387700; cv=none; b=WUsgukdpJF9mJzGObAb7FVSnBk6UD4sX+AJVKzB6GCIk73NJ2gsdLE/ZiFmR0EAtlcM9C9aGFwDxODnThX5+vMw3Y8v1Xnt3V+AqtuSoDoRLk2WJJQYJ69vp9gA+vTzMctXNFqc+31PqmVJwS61P7QYy0n0O7KMvkqk8a9Yhdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387700; c=relaxed/simple;
	bh=wjv7S2defJHb4w2LIijyyI7ICLEtDGHr6+Y7Ed98jvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDf80XEEp0M51aA7tgwCwp0gAi2mTUKoi6lRTFFQ9Ai/LZLayJQjDGIdA5QTnb1F9Wyc9freHLALSdYu52Ya0LuIBcror7S6jHdaipO4HHm6z15B6MuDi2FpcBeeyTPgGzPrqvAfcSbsgD4f8W//8Cjf4YoGPeANx2acA0nd0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8qVf1gF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8qVf1gF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20696938f86so28434175ad.3
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387698; x=1726992498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=i8qVf1gFMG64qUxLBAwCCmbIR4JXGPWj1VDRjnQlBseiVsM0eScABgzdJGSpY5SA8M
         06admfk0th2ytGV2MyeE4QJSP0M+999At4IbWoHqVANq0NukVxPWDRvMDLg1lZBoQeBS
         oEikac3o0HDzFXvZUHrAEJrdAg3S2XAJLNNHmOXVZlfPc+lo4+hLQhPNB15wRzizMkT1
         3CdWB7cO9i/y/A76m/1Cqt5BwbD6JrkUzaCnvBIZ2NI5a7XA5u3Ip3QocOFdoPq/+YEm
         smJZUnp87Zwb2aFPe42wkRwcaJoL+agZNfNLkBbGACvYVPVTKtj+cDVJvHdNibq5vhh5
         x+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387698; x=1726992498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=GUXBfWYEy7zg5Kbv5Zi1WgrolZsm3bfwrbqvm7I9vOKEOWG8vXnX7DCTRQAVdyIiNE
         dnZZk+1RKYb38WDwg4kumLcWN+auKRLkMH6qshDjIqKe7+uOcZ7kRU5wmhqnMqRxXgxv
         PIHvpF5VBoW/rLo3ftwsIUrElHechcowuj87stn9Z6wCE0ISOOUEOcHOgGBDIdEkuOjC
         ZS2oloJHanWyejOTUv/tBSVBiY2AZsXzUVoQld3wHUHPlfxBewMFLrXPwcpjFIv7PEkj
         /8AExQe6Hkx3+aZgPerSkZPSC5wJ4CGCyv+NH9SnYuWjF+y3vhb/p6eTnmYN3wBdqQDX
         clkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2uAs1iaFhIZG6DQEoWKmObfYIm4eDDSKd3hU61zQvsUqfaoV6yqE9DpBuu6jzVm2vaxsXTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxywAjIxwAem7DozL5sAEwFW4TFiLkscdnQcfKnC3igQUi4oPsO
	uBq48kkovPVlmhubwJvReGSg7rLM8AHcXC2vZ+VoazTZ7MzQaQ9M
X-Google-Smtp-Source: AGHT+IHUBFOtzxTUHVVyM142oBd/8DpUUq5pjhWEwNRQ+YUW91vW2eNnMp5bhUx9eypT0N323Wt8bA==
X-Received: by 2002:a17:902:e5c9:b0:206:b8b7:84c with SMTP id d9443c01a7336-2076e4247edmr168126145ad.47.1726387698169;
        Sun, 15 Sep 2024 01:08:18 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:17 -0700 (PDT)
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
Subject: [PATCH v3 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Sun, 15 Sep 2024 15:58:47 +0800
Message-ID: <20240915080733.3565-3-towinchenmi@gmail.com>
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

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 21872e15916c..310832fa8c28 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,6 +16,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-wdt
+          - apple,t7000-wdt
+          - apple,s8000-wdt
+          - apple,t8010-wdt
+          - apple,t8015-wdt
           - apple,t8103-wdt
           - apple,t8112-wdt
           - apple,t6000-wdt
-- 
2.46.0

