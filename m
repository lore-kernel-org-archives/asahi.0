Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299C185949
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044443; cv=none; b=cRBY2EpQ3Qj7NL32NPTkMXdaxYlZoGJtzeTNz3XUecI2znj8TdjHQivqV2yMnhrqVV+bE8fDKU+VaZYBMFYZ6Pa+R81tsNqYveIxx1St7wya1Jy7YJBJAfqAS+Vgn5UQ2+tbreQ5e1BPmPdsTwEA1CGXtAgbQ43jpLyq0SzOVIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044443; c=relaxed/simple;
	bh=pn0dBKtZ/6XIFiLt29sYpVdPgmjVJwfbAGYQjqz2sSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+YGTa/PcixqTPFoh4WJFEdZ5lwveOQhlkjIU7V7rSnQEMN9j5bbNw9EbMhrth2N4dMECfBtn3ec6XYbteyaYkT0H94CUUSqdSncLVPlbVEVkk6LHj2eUNtjH0HfN3sYyjF5BnuBB2H5RLvzdpUhaF2Hz8D7zrrMJ3Eheol0nzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnOANI2n; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnOANI2n"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-710e910dd7dso1790626a34.2
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044440; x=1726649240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzKuObdjjifIV6p4p1YvXXo1tsy2evI5DY5jece87LM=;
        b=lnOANI2n20QHqF/w/Nqy8A1nmJHxkTkUOZlefHl3KULftbEf4QUpiWVsBfrFB8Tuid
         KZQeNvf9PSXmOAn/bV3zBzWKHDvx2G/F8enQ52cArSQVlD9H90VQmO0oDY1clTOBUXeO
         p3byUp439jZej0h9ZnyXPncg+X8IT9zciykseBqrZMVsebJdQ69yETdWJ+1qVWp8qqWu
         pi2numRfZH04LGL0/P/wwWUBF8461e9Ks0lN9zDMXYwvLzhxhk1Va3/uiT2uLdhTLZlR
         OGfeZpm0cR13yZvcUh12phHpfDTw9+k/C2ncHNjCQMSXOyf98zM4eIi7lqY/RCipHp2d
         KGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044440; x=1726649240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzKuObdjjifIV6p4p1YvXXo1tsy2evI5DY5jece87LM=;
        b=k108JPsr6A/85n6PKcz68lBAcS179fsAhREMHDor6fsyPVii4oLpr1PmR+3EzIsyg8
         RqZix+L/nm4MDI1Lw+u7Fn1VbQ/KKIaUlVcdSH9CeICO3nEyQ91DOQoknhPd5CMeFXQB
         iuqRypOfg1cz/jtpKlMNo762kU5Ck6tDCw9FuLGq1P32NlcJePHk3KHP5LXX1gQL3GgQ
         LwmEXyu86sQSKY/8SFDp5XMnUi0RbGVCbPkaQFPZmi03yOtYcJfbmNy7rH53n3P9PA6y
         XC8fmruZXa+O5JovV05Rmn9g6kudXE75B2TviJlzy9JQho9lfH9UR4wFkmwODJaBnJlI
         LbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJKiCL4wfmOP6qjBKpuBDQ7VHgaKn1qhvVlfFM2H71tv9f4M4FObtfsYTadKBD/y/t25riiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6nFZ/uCBiY0hT15Tj4GEQHvX1uchx3TxgIgZa65ubgRUHe6I8
	7FF8Oc3nyHE2BXHHn/+t7QRgrsM7a48/wbaHUHutp5RFOxjw4mEW
X-Google-Smtp-Source: AGHT+IFVGTKfjROcC2dmcDyR3+3zulhvPISRva2vpsWPrxA6OsWKXTSlxZPTNB9nldnbZOUYIt0JaA==
X-Received: by 2002:a05:6871:3786:b0:278:7ea:99d with SMTP id 586e51a60fabf-27b9dc85c23mr7226021fac.41.1726044440522;
        Wed, 11 Sep 2024 01:47:20 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:47:20 -0700 (PDT)
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
Subject: [PATCH 06/22] dt-bindings: arm: apple: Add A8 devices
Date: Wed, 11 Sep 2024 16:40:56 +0800
Message-ID: <20240911084353.28888-8-towinchenmi@gmail.com>
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

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad Mini 4
 - iPod Touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 3c81008f0e96..cf4f5d6db1d3 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -19,6 +19,14 @@ description: |
   - iPad Mini 2
   - iPad Mini 3
 
+  Devices based on the "A8" SoC:
+
+  - iPhone 6
+  - iPhone 6 Plus
+  - iPad Mini 4
+  - iPod Touch 6
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
+              - apple,n102 # iPod Touch 6
+          - const: apple,t7000
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

