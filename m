Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C77155CBA
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291557; cv=none; b=NunUQNHMIySie9qyAIkh4lSMsb7VnoYLtMQ0e397iv9ciLadBd0kbPzruf/6yOwkyqaB90/WvpLaU4bNzl66UmaT0e6pyYdioMD2tAWPifYz4G4KreM7w1oS2cgvpQJxvoj4y1kJBnuH8R6d4FH9M6SY3GKDQslwnTmrNjBToco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291557; c=relaxed/simple;
	bh=Ol6jk5QblITohJFz2fUul+jrAnYdlIQVymi/NwT8lpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+gt+/xHgWr+X8WZe/2oGpiLu8gYThh81O4SBzsrGkHRmVBECgAdsDdHxL9yIbG257n1yRK3L0Bw0HHr9ISMxj8KniGz3BEV0faz/PV/hRZtOQh2e7T9QYHReUD+Vbtf6LGfmQmVD2egKPlhG9GQdWl265NKRgkf+9hgSvVn7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLc5Vbz8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLc5Vbz8"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-718d91eef2eso1828990b3a.1
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291555; x=1726896355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov/z3kQKwuY1dKrf8PnilixoqOfE5RUmtJyOePMWLLc=;
        b=TLc5Vbz8v8F6dETvU2FnrsYhqYNE1YGWiFiNGzJcMUm2P2Wt+qRH6brwJslxZFioaY
         vwLt/LRnOuF5G45paT6HWRWZO/Dxnud0fThH08hJUXLbHVuqOrugvVKZOZ7xHaeEWiMg
         qECxenCambKZFE/zGCvkhCTM/rvnagpbxdU694FVo0/Z3qNBpPXaXC9ZcitJzzPkwMaa
         V+tDv1Nl932WOcEfdw8jXyIpx8T9RUgUrhxQs2UI3565fDiF6MkHOS+/1+vYglLeS2G6
         pB+yWxq5aUPO52GVKIV90Ee4RCQZmlVuaAKupT++0tGtFAF8FAATjKsrNwnX2yriNEgp
         4JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291555; x=1726896355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov/z3kQKwuY1dKrf8PnilixoqOfE5RUmtJyOePMWLLc=;
        b=G4hR3UW2b/xwPn793Ckgh1QE/q191Dy5/KqKoW4CEx+r23QO+D3k6VRC97Nt2hN0YI
         qT+PbKOyBv5RhNVBdM7rGnmo87cIhOTr9gTiiOZeeCh9xNupVtwZ/QcTpxyyplxaadLv
         J7G54oE9kOvCFugZwbAXMy9q0pa+AwY7piGM90cz2uilW4999DyRLgTPVjVopp6EYXbQ
         gBdp2ucY/KviJJeU/XZie3hcmCiw5opALu9FnTNrODTyNOpV9bvjWDxRsIN+/KTBkdQd
         n2/wZQS2brDGLa95u8y52LdC1D8TeeW88IOKTMNvRPz/aHXxyiSlX42CfuB6nDfh7ROn
         AetA==
X-Forwarded-Encrypted: i=1; AJvYcCXyYzZCr0mwSdrIbADf4v89z1xxWv35EYYgB4WwZF4ZqKdOzA+7vs3bgRlOk6Hvr4S6BaDmVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKFRLx5cOi8whdGhLusUiUfy+49rZZqdYqc7WyEeE2dYoB2jmt
	9Mk42C/W0//DS24l8Rd4s19pZT3O+ll5QsRy+12uLyfUMWaQawdU
X-Google-Smtp-Source: AGHT+IFIA/8fSoKR1ME+95F6ZI/st19HfcPTmRKqgyxSxqYmWUIfRmCy7rU0G9QWYOYBGXWyB6rB4g==
X-Received: by 2002:a05:6a00:2d87:b0:70d:36ad:3f67 with SMTP id d2e1a72fcca58-7192643c3ddmr12846073b3a.11.1726291554984;
        Fri, 13 Sep 2024 22:25:54 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:54 -0700 (PDT)
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
Subject: [PATCH v2 09/22] dt-bindings: arm: apple: Add A9X devices
Date: Sat, 14 Sep 2024 13:17:18 +0800
Message-ID: <20240914052413.68177-13-towinchenmi@gmail.com>
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

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index baf0ef632231..11873b2a9421 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -38,6 +38,11 @@ description: |
   - iPhone SE (2016)
   - iPad 5
 
+  Devices based on the "A9X" SoC:
+
+  - iPad Pro (9.7-inch)
+  - iPad Pro (12.9-inch)
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -150,6 +155,16 @@ properties:
           - const: apple,s8003
           - const: apple,arm-platform
 
+      - description: Apple A9X SoC based platforms
+        items:
+          - enum:
+              - apple,j127 # iPad Pro (9.7-inch) (Wi-Fi)
+              - apple,j128 # iPad Pro (9.7-inch) (Cellular)
+              - apple,j98a # iPad Pro (12.9-inch) (Wi-Fi)
+              - apple,j99a # iPad Pro (12.9-inch) (Cellular)
+          - const: apple,s8001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

