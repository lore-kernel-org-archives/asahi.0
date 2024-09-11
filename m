Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B87186E24
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044457; cv=none; b=F56b4ZNpsG1sXLOKHC1ZlJYwSuAY+g/wHioLJWZMWpH02Tco31CG6WEtxo/Eb5RUu7R6IBGqxzvELuO1TgX11NZqmnd7OXsKP3Vm63Z70DYQ6Yej+I5Cs6KYjcRwVWkP6v0iu/AqYvKdsOkxOy0doHdsokq0pPHFKWN746l0h4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044457; c=relaxed/simple;
	bh=rlWe3x1oIfwBFP82rKxvCeoNstM7m0ilhyiMtpKm2J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XitaRTf1E8Pb1i7ofRrFhZz2osq4oX26/bg3OB8bUdvPxrioXaPN+bfUJ9W8oOMlmBDxPbTUh3S7ABroJRlc7mKo3xeok2QZyfqONZzVImCoZ0WGq70YOphbICgyQ3BG3jb+hmceDNzJZhROAS9sYDLe7PAXmZIGZd6iqgYjvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMBufmKM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMBufmKM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71790ed8c2dso5626242b3a.3
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044455; x=1726649255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsMK5dZnZxr5aimciutwu7vmsAuU926u5lK8CD2rBnM=;
        b=WMBufmKM7CIcUgD8ILtOy5IpNXlejhWezLfjdN9No4PrcrkdP1pFVtSI0kn1G7y1Uy
         TlbvFbqvY1m/4jb+6iu1ZOAXLdZZg1dGr/eU+hBmKhpaDV/jhd/MPVSWi9U2yjB9Fylb
         +dl/EMHqcoATDHZgiBGxnjFyZhgVylcf0xsMA1honEBZmpw8S/g7HLd+nq7puehZETKL
         Gl8FX0Pey1xhma5Edqy5n6MlwYnjxTmFd9r/R2NE1zBFWrXO0MvyeQt68hR+ug6pS4Aj
         TA8fkrNB7HJcPu3r9Nu3n/jddvn4w6moG6//IQsK7KXv4zv/b/RCx3ifE8wNKn7JpuOf
         y3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044455; x=1726649255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsMK5dZnZxr5aimciutwu7vmsAuU926u5lK8CD2rBnM=;
        b=V9xbd6GIxy+EwJTsiYBOK4b9v2o57N2xLYUduhjnCB9uNyfs2PdQ17g4ucvX9OcSaQ
         5dzfHQhtH1pQ01JO7Foq3BLvtx2SpsxvaoGCeIsbPlKFfNiWVQSjp+c94szQ3xBn2UrZ
         cryj51uR9DT04J6hs8oyMjQEKKIBX52GCFAtJModhNPfjp+0k/pJnDQ26amFf+eOsnEC
         Ndx5tk8IeQKcUq4elwtPvC0MAwWlf4ylMBEvqM1CPTsbX+DQ8EG8d3Y90awUN0/tcpyx
         Mr63z97h1nUcQl4oDPDPeyLXQdns1A+/roV/7a4yS5uD6HintLvYAARCyxHGIU2hw+D5
         /WIw==
X-Forwarded-Encrypted: i=1; AJvYcCXWVZiayqGTk9tB0/gy4rMHddL5lVrJdflLViZ2fcYWO7GJ/suiCG/Cue/gSoTvdpjJZ+7y9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLe8AGfPap4lmpBr5O2yzMil1a+szOVG3rJxBI3M5G01jGHCFi
	5bXmqBwEG38UdbKCGrRe9hfSyC3mA42vAJRG3vXt499+FRB7Sodx
X-Google-Smtp-Source: AGHT+IERnHemvoP5by0tnHvzp2xdkPOo0seCRQgLQ0okm2hEjw0ezJ5MPH2AYtaklWcPO3AzarI53Q==
X-Received: by 2002:a05:6a00:244e:b0:70d:2b95:d9c0 with SMTP id d2e1a72fcca58-718d5e55d73mr28265695b3a.14.1726044455161;
        Wed, 11 Sep 2024 01:47:35 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:34 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 09/22] dt-bindings: arm: apple: Add A9X devices
Date: Wed, 11 Sep 2024 16:40:59 +0800
Message-ID: <20240911084353.28888-11-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911084353.28888-2-towinchenmi@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
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
index f3f100ce8072..27311c75faad 100644
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

