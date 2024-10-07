Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85E6189BBD
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284943; cv=none; b=INA/9/IqfXs2NxYmvjojMnZOQbmd31Q1zSmpuMcGrglhOfOqo+DXJTqvQeSoHiDsCLPDY2xDE4dcWfZl5EAgP3V2aSLlY2omDqEnOrl/EtQkKhEHM+TBrRddDXXvvVDAXtokR1DaXCW8MkHIV79kd4Iynxsmc68/XYgv+Ni/45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284943; c=relaxed/simple;
	bh=jKkpVBJ+mBPvRKjYAZrgLzemE5EU0UA5QtAv3xIoawU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3ApWV03nMajT25xZSCzVkUuHSLd3SNC7P+MEYYvrGN+LfokJ+tG6MvKxWJI5TPKwoEuXE8Q/WKUn/wWiAuHTg4Yvw/+MeVwcM8dNkgbowyVCSGE26CqRPOkToXOE9UQKxarge1YqfkAfSF/1N9nVIZmWLCNAnxDIw6Sxed1abI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQJiggRe; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQJiggRe"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e9ff6fb4c6so1844457a12.3
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284941; x=1728889741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdN7qegJvA70c8rJy1Z9FAe9FRFAtpJPWh08eWIZEqw=;
        b=OQJiggRekvVzO1hIF+8KRxfKMMST7qQCF3WvuTUtsvIOLWCdBjklEtr2GlsYkI9e+b
         1UMmz1A4Rm4cqvXDtHBAXRehXw+Ed3G9Ed0wT6hWFOqShfyNLUwlaJPa/qaXCY9kgwUx
         wOIyQUakD9NsDtnxrJkBdTcMGuRWarfI3gdOFFdKQA3C66fko4BuBDJJstCNwE4jB353
         G7vdfiFJrU2Z67VaYZ8+wK0YWWhnDzMQcT/9EtF6zz4fv6PQXL/odCWSDtuhmasxEadm
         hR3JVlvDb1pk49tVqrmkPh3mRe3N44YmAcNHH80ZRBshPzpwgLvpoDr8EbWcaI9US0Pm
         DENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284941; x=1728889741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdN7qegJvA70c8rJy1Z9FAe9FRFAtpJPWh08eWIZEqw=;
        b=lXez7k9l70eett6v6Iqns+Zr3MnsIXtKL8nFXmnEb/Oi/Y4ZB0LRyhiwyMh7oN/j4o
         0paM4UtkN3OD947SzemivQrSe+4WBgE5V6cvbQDIzLBY9eDesU0jVVyi+TCdG33hqsan
         x1c6RbUC5ICpbh3q33YRCZ+KiiURdbb5DRs+54L79urqJIQ0FnRjFESVr2Upka72gjB0
         h1K+pb059+EXnuDCjblG6Qwh50w8RwOh5/ayRHhSnIDuqq22M0Bmd5uDoZrJhgkDVIij
         fN/D14dhFRlL2IlSby9uVZcCTVc8ONesuTrXN8AF0+AsW5ZXGJXSavY2FInaPk3EzXO3
         buqA==
X-Forwarded-Encrypted: i=1; AJvYcCV/3UZFgUzNpc4CWrbyMmZk35b9/mQWt9QF18gWMbJOPrQpgL3FDZN7G61w5ky1EW7SrT3xVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYEAWdMEZHQ8OgwwEcMAOoQuH2DOUW2gwiOWdXjN2n5Mm43dno
	Du3E8IgPWG5OvJDICk9HadDvxjXDcyUZbRGxp6IBdPqJwcF14RHl
X-Google-Smtp-Source: AGHT+IEYLZ3CfSfHKi0NaZZrLxIkVDrzX0uE8Z43T/3LSz9zrp2CUhMWk4gf9XWf9BxdS+iOn2knig==
X-Received: by 2002:a05:6a21:1583:b0:1c0:e997:7081 with SMTP id adf61e73a8af0-1d6dfa41668mr15574000637.29.1728284941137;
        Mon, 07 Oct 2024 00:09:01 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:00 -0700 (PDT)
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
Subject: [PATCH v6 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Mon,  7 Oct 2024 15:05:31 +0800
Message-ID: <20241007070758.9961-7-towinchenmi@gmail.com>
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

Add the only platform based on apple,t7001, the iPad Air 2.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index c05a4414c8b6..fecc4953df33 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod touch 6
   - Apple TV HD
 
+  Device based on the "A8X" SoC:
+
+  - iPad Air 2
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -109,6 +113,14 @@ properties:
           - const: apple,t7000
           - const: apple,arm-platform
 
+      - description: Apple A8X SoC based platforms
+        items:
+          - enum:
+              - apple,j81 # iPad Air 2 (Wi-Fi)
+              - apple,j82 # iPad Air 2 (Cellular)
+          - const: apple,t7001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2

