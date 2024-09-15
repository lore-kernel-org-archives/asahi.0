Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F7E13D612
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387733; cv=none; b=jMw77hjSMkA8CJQdJbBSu8MKZ+J/xP0dBc+nFAzyXCyN4a0gswKjbrwap7Sqx+S3OZe/GCWzzMcyZlL2AcMusB2C1j+0DYUZU2PD+pLNe2MX0R3mtWuw1eYgvpqgmypBkqGIJHX9KzX5ee3Vh3BN1LgVUmDcv1S4TeQOj61B61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387733; c=relaxed/simple;
	bh=3LdvS5KGovWfSeQULeKu1Eh61BWUO6KIHw9jqYb/UhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/VMnI7JMDmmYNWIOcWCuGNBpBf6zszPZR2xjla5ugFEc6Nh7cmWBDCc2ZypW1xFbU+ADmbDBmqaUMjkIpmID2+LlYGoOxUAWhgrZwXzspaRV+lqd54vWRllvO9Fp95CI7sRaFppva2/lIwnUjlkt0fo4/gYlTF9NhsFJR03AM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPRlv9EM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPRlv9EM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2054e22ce3fso36918795ad.2
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387732; x=1726992532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfQDIayDgRSXuWv63W1u5ddzHt/doIYQe5CKmJXlfPM=;
        b=SPRlv9EMofq/7RVW18fpnx86z6VIibiuuNRTa1aDpgx9s+QMWjEzz6ovppep4m4nGT
         ESL1EECHEB92ceVXOKXVM08ApNUQQHyRJXH0Rq4EseAylYHk7qOuEpHqKNuqhW6lc/q9
         9MTjS+/i+1cGvIFnqBPI/QTjVfBjWMOm8QFmDvNrZgT9GYRpXobsOmxHxuTdtkaxYqh1
         Z421Wd5+ELVHz3ZOEtDjGSm0j2qvKfLJOx27qibFlR+xnhZvi+Yzoy5Gl/CbDQGRLg9j
         dFzvczZPC6Z0vb3hitlgJCUKN6vkuxZJUKIC9I42NN88MV5Pyw7q/MWe8ggZXJ8gpcDF
         pAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387732; x=1726992532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfQDIayDgRSXuWv63W1u5ddzHt/doIYQe5CKmJXlfPM=;
        b=WcNTqVZHOazvcFZ+6pqTh1oT4ea5D8ZYMf2VPVXsS8b6513ji1QE7TF4KcZ4k483Pi
         udmglNiaoV0UEC7pJpP6tAJIgLf4izsCbbm8nLd333srYL9jNAuj6RLby+ql/vF/Vglm
         /6IgwNc9IyBT8viu1E2TUe+iYRRej9BtwJKGUCPLIaO7ljLufhBPKYVoi8JUxCkMejga
         xg/u0sitNm/vxtnAnHHubuYVf0hElccnEnoMTj7x9CIIPsXefvlUtACfqtfukNJVPMe3
         I0/LSnKgusiSmmjRlQepPTtdjsG0HHT2dYUVMX1g57G7nbDsNMTjcA16jF9zg8OkKAVi
         4rJg==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZQRp0o+uJxtntz5llZtgV6I57S7eQnRK3cA8Bz6imrct9YSo4wTjj0AhqBiIWtC1WxjU9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAyduy3ouMixRwPrig9cSp7+02jNUl32dZTW5MXRb7W8zsZgyI
	11uK3BmWhPuef5IxMk/5KFEg7aPZur3uiwkv9tRxsM6LTuVqg5ST
X-Google-Smtp-Source: AGHT+IFOtN5uiGIayog+A9Flfpjuxk8iaRJ/48tqT+xmoUDhN7D1/BPYbrd6n5qAFH+0CEEMWl3LOQ==
X-Received: by 2002:a17:902:ea02:b0:205:6c15:7b6e with SMTP id d9443c01a7336-2076e45a90dmr151107885ad.60.1726387731764;
        Sun, 15 Sep 2024 01:08:51 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:51 -0700 (PDT)
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
Subject: [PATCH v3 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Sun, 15 Sep 2024 15:58:53 +0800
Message-ID: <20240915080733.3565-9-towinchenmi@gmail.com>
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

Adds the following apple,s8001 based platforms:

- iPad Pro (9.7 Inch)
- iPad Pro (12.9 Inch) (1st generation)

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 01965890b4ef..253dae759f10 100644
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

