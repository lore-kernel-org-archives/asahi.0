Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD5878283
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291562; cv=none; b=LBRR8mVROKNqXX1k9HbV6xvZBHFFIVq/vdwSqDdtKeeNvMvSS0Q0T2ZFr1nsqWO1jk/Szx0oEBt7SrmWHKn2cn9/txp5SLj1R8emsiJwvFOYjoQnjWVnUJ3H6Pwj1adsOQ8cp2UCOYrFcH7tNi2zANyjwUuas6kMWm6chc2rkEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291562; c=relaxed/simple;
	bh=Ip2tb3iy7JRH2Qjba0QEVmokUA/nKu6k64UrMnAWYDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyunkPdoiwvdNmOPJzNy803/NoUYJ8oj7PYUiRkkBiWgYgXeVD3/wWa9AIG4697NBWcO53Dg05tzMFLZ0h+qtytdSTlL33W6ayaZ5yP2P6/f6XYCqSk8yYYH9y3KW5PH692DeIanP55nNkdOQGPLaT3PD8fyw6Y44vPnsRsQq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV8ytyxA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV8ytyxA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71911585911so2482792b3a.3
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291559; x=1726896359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XASDwZWUX+C1//Vw0xrpdBLG8ljIMrpmRJ18G2XwTwU=;
        b=YV8ytyxAaTOjf0sxc13W3DaQm6OTadBzYXiQ+rEqNIqIjEPVX2ei8FG1bMv37+jNTF
         OOs84bqppvRn3ZQdz2BxYYA5b64Mse0gbsApeFQdlSBsWWldZD/XUFwuf7QyZTW4f1lb
         ph2jVBQaJZvzs75DwQ89uUPfm7NEVnvOjjwfaSTi0r4wuBxwupjYtjuSc5q4IqIYYs+z
         YX8h4comL5Q87QmLfOK/f6xuBpavAu1rJU5NKICy5PbLXY8wJB14Fm7dlW9WxxL0P3YG
         M1rHLhLUanSyfE9RTwxR38DUZP559sbFYaP5wYgxxVH4f+kIpyWh5dmpLzxj/45SHc0m
         G4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291559; x=1726896359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XASDwZWUX+C1//Vw0xrpdBLG8ljIMrpmRJ18G2XwTwU=;
        b=IBk5+skAeSCuZmBK2xT2rAWalSz7FGlNBxXh0qneZ9Sf5i8YPkWVIUTF/HqbhQokTT
         gTSXAMCzfHo4Nxp8ro4TcCjf/ZqjqN9tA7smNDMhhvkZwdFo7PIhowN7qKzz6lFvfYDL
         q2Htn+Nl+pFjLwwH4xdAcB6yRVE9ISmrdSwKFDs/BAQInCD6yiiTymSBlWmdhhaQUjl+
         cYFyPxldGi/IKNOoaeXHvmsH+UlKFi3GTeYQjekwPzf6Ymql0tp/JKKBS4cqkgm4VtHA
         JuK1EjFZV0S0qkRDRvOlLFY6dplvWBu2aZJcItWlspiymLGUJ+F7XUKj3xeBx903opz0
         ohDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8/TucA3/vhbCEe9PJbDkdKD+yHJ/+1SCvFo3fH59kUX1cbJXSp7oQHu4uQKeT0gzwyGqsSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws8ko1bCiAt/TwQG8Svvb1dH5Dw89mZGuG3dFfOAZquQ859YYA
	tE8zd1rmsg7Q5B4XRI/Et2A8NdXoOUfgv50OB6T3rXn5ho9cjiIFSGQclwZZ
X-Google-Smtp-Source: AGHT+IGZUn5gSNpsB3krCasHpMWXOgM2hsTIduT6Log7/dlk8WDYq1PZYEh0VB0wLcsuIsqGbHliwQ==
X-Received: by 2002:a05:6a00:acf:b0:714:241d:a323 with SMTP id d2e1a72fcca58-719261e0ebdmr14007202b3a.17.1726291559499;
        Fri, 13 Sep 2024 22:25:59 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:59 -0700 (PDT)
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
Subject: [PATCH v2 10/22] dt-bindings: arm: apple: Add A10 devices
Date: Sat, 14 Sep 2024 13:17:19 +0800
Message-ID: <20240914052413.68177-14-towinchenmi@gmail.com>
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
index 11873b2a9421..cb33bd1e7a2c 100644
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

