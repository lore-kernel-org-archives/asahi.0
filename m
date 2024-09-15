Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E213C90B
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387729; cv=none; b=QvwMnxZIrz7b40/QEmidG+f772tzH09RejOBaRLEHzLyQvKKPP3KO4loSYzDyvk0ft2h2TAJtPtf02cbMpZnApnrj+EgLLQDhjKhNg/+qCMCFNMQIaOPCCJrR4LZzHRP/DVsSy9e0IwcUo3Gb+MT6rj0fWzWJolU/N4jiLNlwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387729; c=relaxed/simple;
	bh=gxcmwltno7gzJ41Nz8gyYVTEjmeGDyce97eI2RwGLXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNahiuZC8gw1QIrgSuUNJU/FD1ZDnPbCXirAEOw916UF2jl0ImTTsanZtqHQz0kkgaxFUW0goLcV5GtaWDIHzOSWUnLneIsPA7iyVzgf1XzBjEVC6YQmjB+SxP45gr/eLj17D1FIDwWPfIMn4YWBFXPZoyP7wJtRWI9kk3R9WDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYj1GU2n; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYj1GU2n"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-205909afad3so37027455ad.2
        for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 01:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387727; x=1726992527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qYZTFW41o+4HCo/KseCTomc1lLuFsUX/gJnprrWHX8=;
        b=TYj1GU2naNbCamjkjJr3oQeqzt4gIccLCBF7fNL2XMSJ56oGixvpxXVVA7Kpp9l1oL
         Q0oO7j5aaDJ0w192lIl1z7DGR3qH2QG/fqRrScatkZxGpvsNgEM+Z5nY+CqKKRDiwVpk
         hiEg5Cwec6hByE8AuemkCBe8exxIoXEgtzq2O6CyEfW/KuHjBcuJEetNIjpXfznycwxh
         5h/rT+It0o+OWXddNSnOlsNgG+AxDQ0cMdzMyDvmdO93DnoNjItRJlrSFDW7BY3ORaTu
         apwQFYoCqYACNwbjebID2fl7y4HHcBBFvRKFVEjIRqATTjQmAfI2eqetQEaGomJXb/ir
         Q8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387727; x=1726992527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qYZTFW41o+4HCo/KseCTomc1lLuFsUX/gJnprrWHX8=;
        b=Hg7mc5ZEYz7WoXFSM4oHCu2lUr6EzBIokh8jyw+972pJrQVUIEL0o5NoVPs/2cekBT
         OJX4fbL5CaArU7fPD2NKCQZBkEOnKCGx/Ii/xNJcofN5nJKKRiMyJOkQkYfhbW3WM5BH
         f48hSbjXe1et5uwwoEf3yMhfBYyCRLLQPPeUidfn1ke0bnsHb338l2V2SrPQXjJkxUmn
         ncg37Se2uq9kkjmL+ZQ3QyWn+vWXeNZGaBknhJyOlWQAZmFZ3tSWDPbU9rz3CxnXxB46
         5oP9L/IdBZTk1hUnvP4xRh0SEXfSwmr6rBd1S6ukAzTEzL0XODzNINDKphcxrKUDUN5c
         uDtg==
X-Forwarded-Encrypted: i=1; AJvYcCX7FUXsjma1EyneAl1MrMj0VGpUVfgTsb3aG4FwPaoY7+G04K7LrcoSyzIitlgL5P1/CVVe1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw313a24Sw0iLlvc5SN0MDxn/yjS3+Z36N+WhGoptNONIhJ4/FY
	4WoQxH4sifJnpzWa981CKWceqpsYXWDBVv5c8g+A0+6S03RWq8fE
X-Google-Smtp-Source: AGHT+IFimI8s5LAPCS3+0jjnpyOg+jD/pIMmIa0AqF8LhY6nVUow38MFnojIQT6ZwwEtcTIZdgX2cg==
X-Received: by 2002:a17:903:2282:b0:207:14e7:bdfd with SMTP id d9443c01a7336-2076e306656mr212768345ad.4.1726387727390;
        Sun, 15 Sep 2024 01:08:47 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207945db012sm18248865ad.19.2024.09.15.01.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 01:08:47 -0700 (PDT)
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
Subject: [PATCH v3 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Sun, 15 Sep 2024 15:58:52 +0800
Message-ID: <20240915080733.3565-8-towinchenmi@gmail.com>
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
index fecc4953df33..01965890b4ef 100644
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

