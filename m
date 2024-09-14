Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B41547C4
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291552; cv=none; b=XY109ukrfMLYxrmSUkd8AzTSli4Nh8+Fe+oyTnkv23+xaOQ0A48A6mhfr0h8STFrS4v+N3YY0q3k2yRBvhe9Wu+rUQbr0PMLTn3sjpTqCwl89lvghASK4GQZSt3FinFIu437RmPAl9i/FJVQZRvSs0IWuhOgTYqSC/ECApoPKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291552; c=relaxed/simple;
	bh=H7nQJyFzW8irtHgkfEKc3loIPXzwU0X7CnNA7CmXOoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF8t63IooyXxJIvydgNRxvFSd1VrubHjAgurQQEGdqimZu26mdTvTOmz6N1jVZMpbfX592PLcn6pJkpgMlwQI5PSu0/G1l+BLYke5A4uHJJnkCOOwnX2NB58aKmDeRrm/y+guQivIv/ugVhK5eHf3jCTtkis8XkeWedfcmvYvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKXGp3kz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKXGp3kz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-717849c0dcaso1583106b3a.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291550; x=1726896350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dRPdb1DUSAE0eGOvVsLMam6fepF10fMmDJkxTXGz1I=;
        b=KKXGp3kzpNoeEUKU2Ok90FkgYmJxMT6sb0lzhz7aIU/tyQcYp2DjPtGhi8qJBeB3rF
         2JBi9yWWialq3haBsBKwJPmc07qVOiYO3sj6mhu+JzNMQCfR5JgPRdpJhZqV/GWSOUE7
         fC9Ts74pti2RTUbq/ngUPkzJJz36rgriMj1nDnngYP4yhu2fhTOOWcF2m8+9pcxDCa6q
         mfhPPZTajjN9c5EOUoKxRmvjjM08KOSHcZGYGl5XoIzFioap5mq5fB5KEIO3o33Zo5g1
         5kPBOFSzriQD0Yr6MVm4pTeFETj8+QHamcLc3dnQs7i6idTeSSsTTymLjVbfPxDpN4vJ
         Ha6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291550; x=1726896350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dRPdb1DUSAE0eGOvVsLMam6fepF10fMmDJkxTXGz1I=;
        b=qQt7EMAphbtiIVHuZgpTfMoi8Ld9Pj9RudyzTp/VvegjEMLKez/JnXwt3M6LwoILVx
         KHB+tGqDl5jL9f/OMs6cv9UtQl2BMrf+atLaXFsMlStS71gJA9rTX0kzrdTZminxcKUr
         X8QX3vhfKZKLv+ReXrmY9My4EceRoq6knHmIKwcWunxK6ZgOcez7uaDR44CkrF7SmnVy
         ddLCrZxhHN4ksYw9LxVK0KVFUIHnBMK7uuOzh0sd3oofO8yx58MZBjXizXXHk6OCJMc6
         5YfC8ZXHM5sQtHfZvryx1Y0JCdCgp4ULVzaHWcFiSyvXN51atmBIMtkcTFlZJRaRvKAK
         TJNw==
X-Forwarded-Encrypted: i=1; AJvYcCWpHOIURP57hZNjn27/IBEkMMnFGhlLl0NVofYXHKTQ8JtiVEApa3HhnJCQg1ke3xblKhlSww==@lists.linux.dev
X-Gm-Message-State: AOJu0YykWwJ9hKr09cPCzCfo9xDShmV3Zi2e18+WEUGgzc3f6kq8Fv9Z
	8CqYhMkJL7PYArJq3o2OZTbiCcZu2GA8YMCuHQ2HALVnSkLlVHNtdvKWBYF3
X-Google-Smtp-Source: AGHT+IE3vGhI8pjucNbbwbxrDykfqnEFixVSB+R94RGRk7HIBhBBek4yxU+zR5U5cppdjic22bhwyw==
X-Received: by 2002:a05:6a21:a4c4:b0:1cf:590f:ddad with SMTP id adf61e73a8af0-1d112b60f07mr8963836637.15.1726291550547;
        Fri, 13 Sep 2024 22:25:50 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:50 -0700 (PDT)
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
Subject: [PATCH v2 08/22] dt-bindings: arm: apple: Add A9 devices
Date: Sat, 14 Sep 2024 13:17:17 +0800
Message-ID: <20240914052413.68177-12-towinchenmi@gmail.com>
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

Adds the following apple,s8000 and apple,s8003 based platforms:

- iPhone 6s
- iPhone 6s Plus
- iPhone SE (2016)
- iPad 5

apple,s8000 is the Samsung A9, while apple,s8003 is the TSMC A9.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 0e6a51fad2fc..baf0ef632231 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -31,6 +31,13 @@ description: |
 
   - iPad Air 2
 
+  Devices based on the "A9" SoC:
+
+  - iPhone 6s
+  - iPhone 6s Plus
+  - iPhone SE (2016)
+  - iPad 5
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -121,6 +128,28 @@ properties:
           - const: apple,t7001
           - const: apple,arm-platform
 
+      - description: Apple Samsung A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71s # iPad 5 (Wi-Fi) (S8000)
+              - apple,j72s # iPad 5 (Cellular) (S8000)
+              - apple,n66  # iPhone 6s Plus (S8000)
+              - apple,n69u # iPhone SE (S8000)
+              - apple,n71  # iPhone 6S (S8000)
+          - const: apple,s8000
+          - const: apple,arm-platform
+
+      - description: Apple TSMC A9 SoC based platforms
+        items:
+          - enum:
+              - apple,j71t # iPad 5 (Wi-Fi) (S8003)
+              - apple,j72t # iPad 5 (Cellular) (S8003)
+              - apple,n66m # iPhone 6s Plus (S8003)
+              - apple,n69  # iPhone SE (S8003)
+              - apple,n71m # iPhone 6S (S8003)
+          - const: apple,s8003
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

