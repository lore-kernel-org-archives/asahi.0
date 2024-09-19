Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5F1A0B00
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762552; cv=none; b=tBet6prU42kdIS80OG1Jn/JxzY4uoLDp1PPM3+TK1bVoSbpQsKVJWRedkSj3rb+3pclBuoZ/Aag68ZEuX2GhkK3QxddD01WyHK9XhT0VZCnNjbpO3467pRTz655K/OoEWz1U9IbwXU1Bcl1ZJ3OBmHOaTD++VKQft8jEABhEfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762552; c=relaxed/simple;
	bh=wjv7S2defJHb4w2LIijyyI7ICLEtDGHr6+Y7Ed98jvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDE/OzAwiiyEy0XB20/b2eUGA0B1uOWP1eiLGN854qRtseNKMcns7BM/4wXNnDbo5WFJz3tDhPs4phazBe7C20NNurlWmi0CvEKCL9SYnsYxMZ5auIFXnBQTn/4uqhAxjiRQAaY6O2VWiCRahL0SibURjXQ741fkv9048d2+vFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTxR6xbt; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTxR6xbt"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so925299a91.2
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762550; x=1727367350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=eTxR6xbtDCnsVK1hGq1ZZoRt+F2jWNiznpi2QJ8wBJ15FUvud2RQH7RP/17eTEyN59
         OO6bw6DKKUWAPENA9iGNbHMD3WygOOAu6m7MWB6KHoJgIkGN8VMiUeqdV9/Ae4NE4Iyy
         B6AlzokWmytcsqWAhfIf3PGRtQFP9cbjer0K0At3UacfNK8g5f64zYIM6K/0aEZyFx1e
         lcHP1xcYXXd1le25hEXHpytqWKxtcPsOzCi/V36w4zfhvzFGbhlDhnvn9TJx4nNjAKu3
         uPh6GppUZmJYvYN+mu6w/qviXxKqR3WCkLGnvCJDgBh3sLfKVIrYio2fhNJ+cpscnExu
         RA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762550; x=1727367350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drlfe7ijxNosG2VKP6kf49hdRW10I7zx+SACXHP4QNc=;
        b=izvNa0k6RmWBGEVjBPn5B2ssvBQJHCbagANJmD4joicHo48MTYFQlm0wGJuylFHa8Z
         cAkpGjYvVHRk0jjnu9v0SEoAo/6uCtwPxCPKo/Hdobdbkfc9M5J0II2sQmYAsisfK9Kz
         Zqu/VGPGSn1xkb+0axEmKJGwvgtlzT3y9bR92y9NVEbigDNsqXryvCLzJDy5ccdxqfvs
         /86D2ZdZ1uxPckqQFRSncpJAW3iSeYW8OhjgAAjSEBIZc8QCr+zLf0BR4vvKO9Ds3d5c
         9qb/pPnRRjJFzLjBIYaHcT+J1T3QAfjuBS9uS8HCNMHA19ronbgSPw6gCCVTfSjg1ylM
         qJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW16NRPLiz70kUaHLIrpgJoiZW1PCtXoqK1OBBZDUzr82RqHpTHr6uXmmoxQ/R98tfCvJTFkg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2I8AgEK7x+iOZJ8Jjk/Kxn0s9TQJJQuFetqtnjgxsmmQhHN2q
	VJ+1BGlc+eRzFO+/cKRCE6zNQUqoZqn2QKA3q/B+NL/GsS6OafDE
X-Google-Smtp-Source: AGHT+IHBa45a3i0mBcEALSUXYEP4sZkfBrpm4+r2kymteTZliXjeUmZ29WQUDgBzdOh4B5cgeiDtBg==
X-Received: by 2002:a17:90b:1957:b0:2d8:6e9c:a765 with SMTP id 98e67ed59e1d1-2dbb9c251e7mr29329273a91.0.1726762549704;
        Thu, 19 Sep 2024 09:15:49 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:49 -0700 (PDT)
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
Subject: [PATCH v4 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
Date: Fri, 20 Sep 2024 00:05:51 +0800
Message-ID: <20240919161443.10340-3-towinchenmi@gmail.com>
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

