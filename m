Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBAC165EE6
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284927; cv=none; b=EJcJWPEgW44oK5d4l/jfHY1xWEGwto8nhq9GS7LqlbQ4mQp0gjjSpOiBKtS3FdDar+4NGfToEGDCFTdMqXWhhin8W54X7KyEmPRebd3bdIstMWsBqhBw3y5rZ6uYc/ZHZrAiJzs5YABksWgMqMn2bM0mabun6yoZ8DbiYRhsl9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284927; c=relaxed/simple;
	bh=BMDLPWz93cklZvFt6ApJuRF+wSZGYPWm2JdeptOkju0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOQPuG68GEJg50H07fKOIATlO5UvLUL4kVdxe5vfp+JKuk6dH0GwCH5zOOaIB9+5jbHpGX9bv7yecJwPBBke/2vZH1zAiKUrKgm0X1lgOBCqBsz/9RMjvRgwPcc7ksXJtg4xqyasB9DGzPYfiSii/Bt7BnEGTGDqSGAbDz9/7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHv5bSxv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHv5bSxv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e01eff831so494148b3a.2
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284925; x=1728889725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrlUOXSv46yuueJWA44YvW2DID/cd0AQqk3s5NIwe9E=;
        b=QHv5bSxvWYbHXjmQm+/6h3K5+QOizSoLupWnPbkbDP0v6pn7bahAc4YwOWwlU7Sxmr
         O/rTJUdkUpdSwmXngZ540QsrKORMJN3m8lpgOqoQhBRdt+SBVPwiOn2CAphcKvKUoZOP
         3otDyq5flYlWA37KWGWkKEeIeaobI21cnfh5GKAJ2HV4b4/6wzBwJD2GDRZorgOvDmrT
         raZLxh1Jva6hE7cjqrUffqAncNa9DvtRBV14qMxtWAY98Z6seCMSFEkwiEQvTwlFvRME
         2/+Wgk7rrutZ3jGJ8x/6Ip3abOKnyb12TuqYnH/tLLFiCqbZTe+HrafqzXRuBLmjVWEi
         MbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284925; x=1728889725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrlUOXSv46yuueJWA44YvW2DID/cd0AQqk3s5NIwe9E=;
        b=LI1uDLDsC57g7XZXgDqWdxKg8LRq+1vXmNJSFOBkTr6IUbVcWOc3anTGm2xdgdbj7Z
         7lf3G8VtpxJG1yrMWrTOs8yIJZgNxy2vQ0+UO+lUGLjCew7j9cquBWiJAAe7l2HMO0NA
         9g8MO8FVNGdlbubh7K6WXD6T7YL4jDFQPXkYTUsgLLqUHPTQXevvqkV9h81ZciGwXv6Q
         eTBeEQZKIBCDqABn65tB5JHtaSoHxKanMMRETO9uhOoK23JIzgFJbi5/Z7PbLictthRJ
         vSicCTfyFaQAymvxLcdrymiZvWUyeEt+e5W536jqgYF0ScwDOEWa6sckK4N/3Z1Lniyu
         St5w==
X-Forwarded-Encrypted: i=1; AJvYcCU6v9/CAV0OJSBEQL76WJwhFLRsS2uoefUFmNRWx5v4sE8ZhyIS73BUaNRKBv1ZsuTDiNOxcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfSS+7zf4ybHukXg2B5I3uvkS+WCbZf+h2Q5jWSS1t93rpoXnL
	JEh2CQ5UmwEVum6mP78pkcYdDGLsiGFedbvKNb7UOldQfB8+5OP6
X-Google-Smtp-Source: AGHT+IE3JOnZBjIYiADVptAQIVvbE9N+JNI3Yn2Do7qK3KMd1FDW0gDf2tY773k/NVFjP3DSSy6THA==
X-Received: by 2002:a05:6a21:3942:b0:1cf:4197:6697 with SMTP id adf61e73a8af0-1d6dfa46a97mr18167307637.23.1728284925418;
        Mon, 07 Oct 2024 00:08:45 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:45 -0700 (PDT)
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
Subject: [PATCH v6 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Mon,  7 Oct 2024 15:05:27 +0800
Message-ID: <20241007070758.9961-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks on A7-A11 SoCs are compatible with the existing driver so
add their per-SoC compatibles.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.46.2

