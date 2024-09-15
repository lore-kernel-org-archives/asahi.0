Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DBB146D68
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387747; cv=none; b=oXIsIT6fjywN95+bB7eNEj/TWtAuwUvkmz5wTVfA/mU4Yn6chFRFOd6d1pZ2oYMWPo3WyH6HGzOZy0mcWEIkXnCoaMxO34RhgRLo2dbioJ5wvFVZL/p7KrrCR9leI1F85H752f5g/btW/OWSDA43bFmIB0woDKvUvlJBiXCYCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387747; c=relaxed/simple;
	bh=CU0qhw7cssybn85/OXxghtzpEYf+3Z8n2rJk8dTkCQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIMwk99u6lvzsQrhnHSRqsBfjlZALr6ErEpLFHHfa2XSF3BX6K5vIrbasHQ6X2GSRrKGC7Z9VpTN/ihhEjW+/7ZOxPfaC5mGQYXOZpuR7z0rh3TWRgapMwC8dlW05nkS+HDWGXCGC6diCFH3UvDcyYGKbpFluX5pTHhP0I560Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuWnK6FT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuWnK6FT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2054e22ce3fso36919675ad.2
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387745; x=1726992545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRXUjLR/JiIWhsC/W3OBy+N3UT+NZIrNxtiZw/1dARQ=;
        b=iuWnK6FTgsWRu99DOm59dyVRMso+5zXfvgjpUsy4hHgsljfjTg7gjbbtPKLu3wEN74
         2f4Si9aHJd3oxcGXxlkxKiJL4n57szrbIkQHIRpxij1TEMJFTyRLfQm0O3uIGHe+3M4U
         AGzr/ZUEESjPbNQ2p2Y0A1YMFEZuNXOArwQ7M+F9Igx8qmURkqWfKZFNHnbAE4BQK86A
         C/yLuhu6TZNwkoCrjpYJACE/uyRvpnZenJ/3ob+v6zLG84E6rXF9txZlcTizl/g1l74y
         2SYcZL9yFsNjHG5QFMeRppL2k4qquRouhvjQwA5xq10jA6uI/0RrhpKDLj2NKGu7lra+
         NweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387745; x=1726992545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRXUjLR/JiIWhsC/W3OBy+N3UT+NZIrNxtiZw/1dARQ=;
        b=ojW+yQNjtTLXoSjX9Pbo9FzqOphyszfAcPdXfdMZh4rP63Ro1P0Yy63jA92sV3H3iS
         nnS1eLWBv2M04wZO2fkgQu3UygHER0W64EEDTetujbphddadutbHcyZ9UR7oM1ohU1xF
         dTdHday5gagOR3NxQPDBvGtoHmJcIKAOYqOqwesUwHRj1rxA1U5+OudsdGnyS8VSdM16
         KKLCwIzWN0EuiUjHioosPZ73Y0WpVt2Ius3sMQB9oV0a01Q3IWWCDtreYSpxcs1dD5Ii
         2RtFmwuXJEOfitIGCR7EyhDkXdh37V5CgEdtO4sEZYeuZymj4qa7s+RhokGi7O/79O2U
         205g==
X-Forwarded-Encrypted: i=1; AJvYcCUkL1rn76+PLKjjK3C2zHRM/roftFK6w+b2xXmOg+lfi6dg5gbW4DfFN9k4Pj/D6/JUs7Rvuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyBt6zs/gD865odvGUn+AbqpcJnuPyNK+c9nuTUdKxtwUgbWRt
	5oZz+R5NyHwKpHgWZ3KeUi7ORVhyILT9Sgn3Soc9dinrSRoI2Hq0
X-Google-Smtp-Source: AGHT+IHbRHqKWnf46snj8Bwlc2hxypaMH4tJ1qLy2TOPjmZ2LDGq7qjDWKm36Gnn2Yc1clSRFysgHA==
X-Received: by 2002:a17:903:26ce:b0:206:d66d:a30d with SMTP id d9443c01a7336-2076e3155bdmr135102815ad.6.1726387745011;
        Sun, 15 Sep 2024 01:09:05 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:09:04 -0700 (PDT)
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
Subject: [PATCH v3 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Sun, 15 Sep 2024 15:58:56 +0800
Message-ID: <20240915080733.3565-12-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index d72d8cb5bf20..db32bda29336 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,12 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "A11" SoC:
+
+  - iPhone 8
+  - iPhone 8 Plus
+  - iPhone X
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -205,6 +211,18 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple A11 SoC based platforms
+        items:
+          - enum:
+              - apple,d20  # iPhone 8 (Global)
+              - apple,d21  # iPhone 8 Plus (Global)
+              - apple,d22  # iPhone X (Global)
+              - apple,d201 # iPhone 8 (GSM)
+              - apple,d211 # iPhone 8 Plus (GSM)
+              - apple,d221 # iPhone X (GSM)
+          - const: apple,t8015
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

