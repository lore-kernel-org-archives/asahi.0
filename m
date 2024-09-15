Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D913D891
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387738; cv=none; b=hRcNFF+3bxjWJLQiWHKcnYWp6tOgUsrzp+deAt3vPQZDu7MbtGah5JhwJ0Kb0iFlJZqrSmfviHHGAryX5ru3EjHLPtu5C6r9M3jPlKJy2fMUbXM9JG3DusE4z8RYke0/woLDSm27tgWn/pnJAnUU7HH+k1f3bdYJuSg7HL6C18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387738; c=relaxed/simple;
	bh=V0wAJ3KgOJQBQptHA1TQBm5dVVW7DLpAyWuD7rLAvWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGj9kMWPTgtEK/L1bLSZgPXCBHG3f3BvcuSoMcPyANER9uQKTfNqjEtY0QZdeenvkH0qZiG6oDf99ogLzhu6JiZ1enLUS9pKuz7PGdcT4WTndGLoajqJ7N5NfnpeFum64Vm3vAr9Io6UssuJNEjjvDtBZu5HQmLKRMB+LsrSQMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uuy1GiIb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uuy1GiIb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-201d5af11a4so39126565ad.3
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387736; x=1726992536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed1R7heD4sdGMJhfePEjEjpAPx6TqwKkotv7yYVzxAA=;
        b=Uuy1GiIbDjIbGhWx2QNZ5YOtppt7+9vCtAEWpwYOE+KuIm26uJMOaM3eKaS4gtn3k7
         QJk0/adxdmqsbENlv9ET2eBWtEsCYDrkP1G0917mBhJ8JNVSQKISXIV/zcrBSzpzP9aO
         dWcb7iuzmeYpXljmFA+hIdW09sSId3x0a4oZnjAAdCMn7M7niZjCofNLonQilySQPzh6
         J8pafTivN7O6yBGyg5DPuq/gUqIAFGZqT9vWQXaJIItDenJhVkyCUUjrsaUSbozrIum5
         YFb75/o/7UEeREheUwsNKawvfNMAxBIgr/6o3hHn1zl1YKWgrdj6MDe5mB6TuPntF2Sg
         2CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387736; x=1726992536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed1R7heD4sdGMJhfePEjEjpAPx6TqwKkotv7yYVzxAA=;
        b=TBob68g4XRSL0MKis9nfxL3PVGoFw5TahXZ5cyttUCNX+usvmPqAvIEvjnKmA0PMYr
         39OLO8WcESyfWSnN9Z+EJEXlCstPwg/hDjyIklMnjcZhHXsMXpP7ykxLJTLufe1kdQmC
         ZE3PJiFdpSD4+MJbK5IDGX5DAl92L9wcomn/m89JQq9H4/x7cjVzoUQ/AmsDVPUpXJHi
         YnDS8q81fw3OX23ow441cwhXvAclpUaQCJodPgiFlw7xKzQCaB9UmdgsjibQE/SikbgK
         TIJSKcu9q1gLMVvujCuKuaHO3mEZtZVJJmkzNpd09VjWbeXYKCS9WSHzd9cmWFA7f6fe
         /bLg==
X-Forwarded-Encrypted: i=1; AJvYcCWPN1e6n1AOgJF3PN2VfQy1m6Td1yBKxrbEvaFLoTL0jN76/3CGO0an5fT2/2Qqh98Uf9oyIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/ubw2hhblLan21Yw6FIq3/VUsyIlxmw5Uv243t6E7Wy6xeo1C
	pWRhwEy3VZExIk/spEgf1q6j9yXSmzxpGZ53GJNjaT8+6OVcjWKW
X-Google-Smtp-Source: AGHT+IFbDyCZVl6iP8XvNmmycr8jxaFszAHA+o3/EO9f1b67FPVQuzwl/gzw75MizW/8mo2h1TzMqQ==
X-Received: by 2002:a17:902:f548:b0:206:9ab3:2ebc with SMTP id d9443c01a7336-2076e3f32eemr160906225ad.47.1726387736158;
        Sun, 15 Sep 2024 01:08:56 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:55 -0700 (PDT)
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
Subject: [PATCH v3 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Sun, 15 Sep 2024 15:58:54 +0800
Message-ID: <20240915080733.3565-10-towinchenmi@gmail.com>
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

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

