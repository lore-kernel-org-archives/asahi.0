Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8343D374C3
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291543; cv=none; b=uSKjFypC1J7EP85g+7AQnzv1K5hd8/tXY5vyiftk6+9eE9InuvTs3dEnCB7Y8mszojZtABask7InEPGa1WcYkP3dA6TwH09UaT7Egm5EbkIIGPfUbMu8ge0/qw8YlDyiZW4tRmc8kXqaSScI9MgJPqnEgpTcj3guGEwR0ix5rIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291543; c=relaxed/simple;
	bh=OlUaaTcJopX4ImU/3+mDs+QLmMEXACQQudQfC4ZPFbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsdXQ7GPvDHJDW1row/DKD5sSlH14/AZHncpa8K8f3jdJ+U1hUbu9ogNTdwwhAlgwQSNw5+e57Go18oMyzo0UJkQrsSvOeTLgIWFQC8ncwEd0/vWqpENaWmbJeJ4vJkb27B9u6OlmVDw1Le9BeXADiFlkR94bo6+Luyt6rGubnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEBTQz2R; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEBTQz2R"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6bce380eb96so1729994a12.0
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291542; x=1726896342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntbAqOWLE9Au/hBzMqkK764zm8fpYo/AOME1Agv7PAo=;
        b=kEBTQz2Ru0NtqmGYwhUKOVoyCPDU65bLxtbCBnFiWaPQvNb+M32VpsU5J8K/pl/xgl
         6JSoZNaUQU13jCHgsKOJ9aRAnvLEg2oN0JQryWgaDdbGDC2UcHEmXjgIE6/rq+UDcgEJ
         ck+hogM4F61IeTZ8YF6IXbccDQdGkB0z+O0tvroEz1el7FBmBv3cskC0Xmlas4NYT2tq
         4t5454UM5eBB71UcSw8CwL+825ypIB8wFmdp6UeUGAyW+Se9V7WXIIPiYShMSmtQWsL0
         eQnZDFiXhaku3hLM0alxdsAsfJpJKuPUpq0RbnAVtRftYba3cXqJUiiOWyz6FgQ/OpEW
         qw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291542; x=1726896342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntbAqOWLE9Au/hBzMqkK764zm8fpYo/AOME1Agv7PAo=;
        b=bp439XlIU27p94OQ+yikRtYxT64GuCZhvVo+EXX6hfYT0N1bE8R/l+FS8hGstkcsLp
         RODmjw+UU26hlTIVK0S4tZ1vVLyratQ3bwqPNwj+A8HcDFt5rzVzrJc0kfRLYQfYFt+c
         l+VzsktSfqwXGYaW2G+N87HaqTOMFY3f3yngzDSe8HchFNnQ/KIvKUXufRl6wTZuVUae
         eqnfn5Cz6bp4t81voEkk4Kfe0dXZgHfyQ9BoLtewEJIaaSTD0Al6R+jyvy46FayZjM6i
         EU02ccieJ7R3O8FHj4dCW7sebMlyCkF5XhCnlnv5P+vhgpg9mc6w9E0wB1TnLh+iclwv
         udaw==
X-Forwarded-Encrypted: i=1; AJvYcCUTQrLr3imGMThZFlJ5qQWXdOHt72BwbYTK8XKnG8XnN2qluJFSA9MvTWoeUGZ1qzvd521RXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyUo6YeeYZ3DBTsaL+CwE5fJ09uf4X1Q0kK+f+YWCzx42AUCWg
	9dLtLgmqHwqvYsSJywyI386mkaQqohA2qj8oyR3FtiF8UN2Bd1RL
X-Google-Smtp-Source: AGHT+IHUCDMF0XJkmpK9w39MJw1j+WBVI/KKw6WJabD93/gkagaR8BS4v4H9pSU7zGPGaXPd3iORnw==
X-Received: by 2002:a05:6a20:e30b:b0:1cf:6d67:c078 with SMTP id adf61e73a8af0-1cf76237989mr12510902637.42.1726291541763;
        Fri, 13 Sep 2024 22:25:41 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:25:41 -0700 (PDT)
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
Subject: [PATCH v2 06/22] dt-bindings: arm: apple: Add A8 devices
Date: Sat, 14 Sep 2024 13:17:15 +0800
Message-ID: <20240914052413.68177-10-towinchenmi@gmail.com>
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

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 59f5be84aedf..691f3af19622 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad mini 2
   - iPad mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad mini 4
+  - iPod touch 6
+  - Apple TV HD
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -89,6 +97,18 @@ properties:
           - const: apple,s5l8960x
           - const: apple,arm-platform
 
+      - description: Apple A8 SoC based platforms
+        items:
+          - enum:
+              - apple,j42d # Apple TV HD
+              - apple,j96  # iPad mini 4 (Wi-Fi)
+              - apple,j97  # iPad mini 4 (Cellular)
+              - apple,n56  # iPhone 6 Plus
+              - apple,n61  # iPhone 6
+              - apple,n102 # iPod touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

