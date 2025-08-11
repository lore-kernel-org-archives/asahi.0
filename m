Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F60218AD1
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920528; cv=none; b=UMYFw2fGNo/vHmt7V7DidVp/lE7RMTn01RTG2hA8wolE0YrOeigZ2G6jttD4KzC+b498xb0DSLp48J9b+cq0vsiAt+F1+IvNk1uzfDR5H+zOaaPuakhjfBB3Lsb3a/LKlZQRIreeQmkfGdJ42/nuBmEOPQyftIUS2Vsw1zeke8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920528; c=relaxed/simple;
	bh=5SPeH4B0HCgQ3mPJQ2F9oSAh7NyxBKYYgDF4wIcu5t0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMRcUughdVMUBAEZV3aGCja7w6Szmv4VL6tutmNM+o5dItztXdWPvXuY6CfqdY7uqtOaiULMb3A94f6tHqwnZNwjA2eFtVW/rj74z6uSSAGMlF3MuE+N4i/yj5wp6t0fz7VdmOYLjeMVNa9EOuiVNHWVpQt8cEDUFHk/j++thrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFr402Ea; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFr402Ea"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76bd7676e60so3672907b3a.0
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920526; x=1755525326; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yEICwzwwwRaLhCcG1cQOxzwurLWc9XkHOs+XEL3udM=;
        b=DFr402EaVDF7Xd8mJl1tVNfOmg8T4oCU3IdI86RAsOEtqYhJJHWJnkGXS5U8YcyEpk
         9L0+cMU/K6wPMN0slupjc6IKWyerCTDA6OczXPPDmPt6PRdloj/d6zBYsa6Q2Q869T0N
         FB3t/jYjty2KkWpActnTA04YGkKKPvPl93IaGZach8AGVDDkRwFTaezGt9jnHeasozWo
         rMiiu8g//LzelirQFg5Pi5LEepPGCHBhNWxbwQP+m1RnaQWso+hUAhZ+KYrRl+TRKgVs
         2FIrE3+FxcekQcynt6RNIUA3CD0I5TwwO810UlRSWXxQmWDkonxd67cuyXPzotrroJDF
         4GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920526; x=1755525326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yEICwzwwwRaLhCcG1cQOxzwurLWc9XkHOs+XEL3udM=;
        b=sDv8iF1o7sDeIS2y+bCEDDN0DuiczVbkzztiAP5T+m/Gz5FleKUoXtbu7/43vA3wWR
         RsHvs2+v/oR25qFQc3a8hpeU1MGu9MLcfM+UyY/G8kHTlruASXAjmK+zgakpiByki/QD
         nqhvxjrdBdbhj+BE5SE6fDjn1XRuOtbhQyVCDzIeyyLqGk9NabEs1aKscJZZivnVFo7Z
         MlVFrDyCU8FCsaDuc886+rzVrAfIPH7wkTcgmZ3B8irvvcVJGk5oNPG4oI00alKPtmqI
         TAy+HuRx7bxyok1uyDwjG6cAk3RNPiwJCskG0UP1Qc5hJ+mSbBAeHgFjrxCeUixEFslW
         5iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/BL6TZGgx97sxPGW3Jd0zhkdq7etEcPARIlhKrzXMc9bAVclnad8Hn9MzkPIMcpxU2R9fbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzFAAGbSE1W0owW9gwQAhN5Hw1+emzOBNoLn5MHmwaa+SjzNAq
	ZKG/DgdJ1JyoeWBkoayCah/0r90WzlYH+n6cJ9LcrVzlD4VowZyn6JRJ
X-Gm-Gg: ASbGncu9uQ3Z1Z0luJViYWp1+rcFNZUubof1Q/d3UC0akj0yjiR/7ERm/S1zIs/mdMJ
	hJRl2heDE0dK5zlhyEUcygSgSewquDnPSlxeaFjD0NOAfghB7h1bXLB/I3fz3y041lwMaelv1VE
	OzWdodE+6E2fFGkKmpRzsjWF3+CuTLCcevXBVRw6dwYY9uYWtBcRyr9JSp1wW0ZduGIRvsBIvWT
	q8N109pHfcrwigCZcp+dHNnbTiTagxXjsm4i+WHhwrFluoINF1koysFIp4JlFqJt3dfH0xxv8pO
	sf1CogqcAsEEGqLEfam793LJ2ou25DuNnfELZ1hkbNYpj/aNVJBlEAiflQJIZDXqPvRUG20fQ7T
	bJ6RLAKeEvZK/eykG6DnA5MQB8kbjVVN2xnuLsUneq/ctrFA=
X-Google-Smtp-Source: AGHT+IHrxdK71Sac1/zqsEValssuJOnISop/ofjKE/WS0pXxDgvF2hjTi3ciKyUhy9KZJyYZ01xtSA==
X-Received: by 2002:a05:6a20:2443:b0:237:89a6:fb00 with SMTP id adf61e73a8af0-240550453eamr22616449637.15.1754920525762;
        Mon, 11 Aug 2025 06:55:25 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:33 +0800
Subject: [PATCH v8 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-1-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=5SPeH4B0HCgQ3mPJQ2F9oSAh7NyxBKYYgDF4wIcu5t0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZAO5K+imeOa8Dg5N4+Q+5ghWt5CcWmhnuwD
 QW3eaYi3JuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QAAKCRABygi3psUI
 JDWKD/9QBGFFlKRW8463W701zQkmmFBupQgVn7DNzI60gxpZrl6zbdgY0GYMCNYZghcz2jbhOUY
 XechMJLG/nhbRUvM3SunUisReUoZ8RyOdd8+hQNLPGt2raNZnuw3AJlC9mse+vpTFAiN7r3bPFk
 cndw31xaSCtRKxcFjtIuD6zrasEzIkn5gHPwhgj/4n8lkbVB4J0YqVCfJooAUcG/Wmx8eSuXV7E
 a8bRkvIiUJ5vzDjGfP78bhbk2rjhPIvzSov4UJeZUo67a2HC2LDDUg0NV9kFVVlFabbjD8Dtb3A
 dBnkNy1+T5faRIhDNnxCr06QSMX56SqE4MHLWXaS2zEwzQnFcBhy/O8oyihWbIqOGEmAiJ0I2a9
 m+jJ7xchh4jFo8We8SiXdc5vZe8QZqWlXoq8/BVnEAZpf5BXEkYQYJXxs2pGBqNUj9Cvu/cJhUc
 QwohgEye2EijPCbmT0TvQ2ouzjnXiQ9zC/O/LmCqtOlSW98buKEBPC2G6NrPlys0PWddBLe2xZB
 k7CHuuIDoWij9kxdtvLDC2wFovfWrlDIoHK8jjgOh77NfB7KMJNdQCvMVPrJoKozyFJZHtXYFLt
 KSDOTS9NxNP4jvcP6sVcaaMKs3rgze7vdbKAeQC0IHAHrsu6RgsIe53F/wfuW0E2CRDzIAREf1Y
 LB0pE1lHU/YtNoA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.50.1

