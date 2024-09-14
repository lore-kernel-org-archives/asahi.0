Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4C14F9CF
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291548; cv=none; b=uMYJrrR0Xbd9Mqb4GzcuEYGu+G2oDW6AWZKmb3sGWx1KfYbl+lVHrfTh8tthq0bQU3azSsbn1YxPmUt7FqqlJigRzSGIXBVBXgBbjR1qdS0kqtFlMyt/bEn1VMEKWLzlZhMF0/w8AUyK0U+k6PC/8LdHJg16ny+672PqEZNyyaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291548; c=relaxed/simple;
	bh=zpZe6xZCfSGF7rqzh/aDNFZKpuhqDtvGqPzTaqzxLlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuYWskKXj92/csS+bRPH0/jKnQr9N2u191BrqOslP2DkDGuxl6tmeQ7wcgZ7RXfK/jUeqt1LMEsBY9TBlHaq8RQS9kKYg8EiTtMEadtjCGkv/NssApJ/FdAmSMIFVp1cNlOtu2LWPr8LEnV8uIgg4f+USGH4hs7s2HccN37JUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOtXNMjc; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOtXNMjc"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7db19de6346so1778328a12.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291546; x=1726896346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKnY2tYCpQX1BHWQ11UETog6WmuVGfr1qz3Xgo6tJ4U=;
        b=NOtXNMjcIl/yds4yC4R7Pyh20LbujejwoZWMZV3B4X5ZDFs3k+/ym+0/O6HHmwmK6x
         MW4kQZwf+gYqxtTzfyvc52YeVUkplg169YZNGtJWvetHdtDXxzuSqqS5KpH4yHVAuWJW
         o22/0AyHed+3l3rJcDTzJUHFlKKyiG1L9csmNWYnT7wtmn8Qya/WSVcDeyRRHgIJ4jnK
         WwBC7k0WID3iqzGXoD4RDnZUKv+tE6vn5HHIy3Bgzmjt5je6bmB5t7sN+MzZeS0daXY9
         R6PRB78QjHpQ/5wDWIbzsr0+Pi+EPpQSo6UYq5PM8JSg1He9IGEX6p97yPeJ2e0LMKbK
         0KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291546; x=1726896346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKnY2tYCpQX1BHWQ11UETog6WmuVGfr1qz3Xgo6tJ4U=;
        b=Vey0PMGJynKtBDowaH4AyLZHybI1oJYGB38RNY5lKpbtXV5FroVUgIF+UTQSNTnGfC
         VKATic7DPU6ELZDvjLRqHoIkvlEP6SJVGxbLKxxlKYp1rYl1tyA7UUT+AQyxKoDQkU36
         3a/DBNls9KCjaGYBntkmF052AGDPRXTQkK2NnEbgpH6yRxBpDu+OoUaXdfK8N4lzinGI
         jybwZd9ZlWlrhjmFcjXSvETMX9I29tcPIqsW7ewegIfrdyYhyzfGcL+XG68GMsM0r2EH
         x5gpve8TTse16NnoREDYHXOrzi1RJhyGKfsTe/D1/XwviGx8056e69pcldUY8++MR0Iv
         /plg==
X-Forwarded-Encrypted: i=1; AJvYcCVEo4Ur5PSrtQol7DHeFgVOBsLAevOsnqa1WUFZjvVAPCj1OkDK0DOpQAZPUsbFI3LIE7yH3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSeol+9cc7o/cJjJvrr6004rhvN+XcqgGAiVeQtlAaEBxe9Vxp
	/hqii1lv57d5R9Eg3SgiuGbU6EGzM4gqXc1zEubsOygZNsA81KlN
X-Google-Smtp-Source: AGHT+IH9nRZfznFybfbPMBOkFdFbVQJJrzXWZhqJ6/jdwYElHzC3dy6jikge0iEfZkznzI0FlsDzxQ==
X-Received: by 2002:a05:6a20:e607:b0:1cf:4932:aaa with SMTP id adf61e73a8af0-1cf761e58e0mr10573497637.33.1726291546154;
        Fri, 13 Sep 2024 22:25:46 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:45 -0700 (PDT)
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
Subject: [PATCH v2 07/22] dt-bindings: arm: apple: Add A8X devices
Date: Sat, 14 Sep 2024 13:17:16 +0800
Message-ID: <20240914052413.68177-11-towinchenmi@gmail.com>
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

Add the only platform based on apple,t7001, the iPad Air 2.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 691f3af19622..0e6a51fad2fc 100644
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
2.46.0

