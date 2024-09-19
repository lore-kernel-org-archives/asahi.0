Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A8D1A08DC
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762572; cv=none; b=s3IQojR9yF2pc5zeymRmWhHlvNtV5d/OYXPsFKqFV0WaAgpwbxdXclJ17aVALD93Dq6JL9jDz0tyXtJg2yks13mRuy7Wngf/WyC9g1bxlHwiwEc3ogLVcU4hSiD+HRvzEk/qyU7Z7TeWkJm0Z/OrVqCqeapCZbEbJu9QazM62lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762572; c=relaxed/simple;
	bh=gxcmwltno7gzJ41Nz8gyYVTEjmeGDyce97eI2RwGLXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guvSjRZWcdFaTs4eqC4Xg+ddr/rOCdYv1Qw4XXpMFlvpKTWgfV07+NiR2r/WuUc0klc88notuj05vm1mqx596/fzzZUu2qzlXeC2mfvJttYJNZoyg9eEMKTvHbDRIpfCBwXP3pgc6t3XuA93vsMGXFGCdBWkBK//90Zm928XZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXYmPtTA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXYmPtTA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d8a7c50607so785732a91.1
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762570; x=1727367370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qYZTFW41o+4HCo/KseCTomc1lLuFsUX/gJnprrWHX8=;
        b=hXYmPtTAU88Z/L4fRr7Fls8tXMvfl93wWgXLucdRxvFNKAZ8mlHgsG6KvVhWPXXWNf
         OFPW+mUrwXs2RRnQtL8kypyZRKRyJ9DSvnEl59WtR5Cl70iaqu9d4Ce9elfUCowL8ReW
         QD8YrqyE6b+4roVHEnBttrJM5fEhjdnQQfbyTh6qp4sqrfuDFx2ldz+G9ll2e48Ma/Ww
         LEPth/BbNqPfbGSUXwoO8mmyZ7AgkrltXfTf4shLkulGGep3JsplGiv5+f0YmL+cFGkC
         /pyCVr9BNSS73+I3yk4Oa3Xg9GeD8Uu+XoxowQC7S01BlqRfFVrilD84A0se260xr1/q
         LNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762570; x=1727367370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qYZTFW41o+4HCo/KseCTomc1lLuFsUX/gJnprrWHX8=;
        b=waCMej5Kf5SghRleez0/DwyXfGcY3jdKWMwRcG8tv4Vt2NnIev/ZaAjsMsAQR6qryL
         YikaNj1+cp+q4rtkKbhLhcqktRNl3QHp7Lbu0G1Wm24NJoXq/sHgMUTe8QGShbpftycb
         o4lCz5ttLLBPaibmADCp4lat4uxH7yxFw06HfC/Rsq47tZOk/5mBqs85OrQfWXXTIw4c
         gARd1p5P95+gFFcU+sThR6wDxylnWnZxhcvVMVZnCOPQc8TKr3w5vAsSl7sOZpwOGjPx
         0n/QwCueWKJgcmB3DsbDixaa79QJIzfg1WzHhonDnI+qvvYxMKL7WeHqwE1cg/o0Ib/U
         Df5g==
X-Forwarded-Encrypted: i=1; AJvYcCVvdmh1b3h/K3lC9WrxmhJCgCaDQHAx02Yh88xFlgwuoLNFBZLnSfm/F51cZrobh1YAhgYgtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDy83hhTgPkZk4fn+rHR1+1VBMb8QDV919sB4FRUZgLS9SmS86
	3x5wZzT4xgnK4g2mjSfdEjLdB1P3zEeLft3qNHTmjBM+5jPPY8Ss
X-Google-Smtp-Source: AGHT+IFZnjxf5+VdByhmuCWtZzDszq9rZp0DmzAmzzCbmkACIkAItPYU42x2sx0DlOnUrUYzJEHRfg==
X-Received: by 2002:a17:90b:1c07:b0:2d3:da82:28e0 with SMTP id 98e67ed59e1d1-2db9ffc1c9fmr26383630a91.9.1726762570180;
        Thu, 19 Sep 2024 09:16:10 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:16:09 -0700 (PDT)
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
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Fri, 20 Sep 2024 00:05:56 +0800
Message-ID: <20240919161443.10340-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
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

