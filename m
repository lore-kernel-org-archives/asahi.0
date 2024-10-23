Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406514AD3D
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658726; cv=none; b=Ho0vaLySkaHm36Y03RFTME/MbjXBLjeACHPU1jx6IecMXvLEm4f5uo74TSz1IRkWE76Baga2YNgxfPQVKahO/Ho8lKRR7992QwmgfiwO7OUFF18i5AfLMn9+92++ujIn6f/ouRb1LnLiuzuoAijKAQ9R3F8UjXTyM71fSp0NAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658726; c=relaxed/simple;
	bh=EUU78kZNwoHO8Nwzpazo6uRxyqhOIPAANrOLKIujOpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHbgU6A/JmBxTn+OMxXIQ6WbzpmvdzP/tBOsLaTJDQstQ6kKSz/ItNbhCnasclRmQfWVP3tRIVdR6d1r1zRZvhNjPzi4m2vAJTcveyf/Tp5FSrlgi2plPGV5YVBp22u8SQ+OhQHjEi25IVUnFZv7dhUDF2NOImlF56fo2tnP8Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARCxH7XF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARCxH7XF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e6cec7227so4961061b3a.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658724; x=1730263524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcarKreMP1Q/pdoi5/P9xmiPp+4y+yFJL0ckVrG3Cq4=;
        b=ARCxH7XFikpGmJeFfsnA7xA2rEwfSk/LlShnnwPcwfIi6rGtF7E/UQ2HTXr8dRo50P
         n1AMBC+ObUyKCO6r9EVe+rCYm6Xob9o5aTiu27VjfNDbK1sPoGAiNyoNKH98dzLn5zQ5
         hTdju3TB8G1Ahj/4pzdMnDv0xqb1jF2RmZI7sr0SH+vnNHoVfvY2a0JNKXCrZYIIGhOK
         8XTK+nawhSUCHx00vZtY0vcrfJ4QNyw40qesQgRV4JnoZ9vLbPF+zdPJya/HLLQf2vpw
         cWlqJZ/ZeUvvOoZgfCEb0ys9ixydi84Z3vKX81I2NT6Acmn6pBDtBeBbNYgczHSEh7QG
         frmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658724; x=1730263524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcarKreMP1Q/pdoi5/P9xmiPp+4y+yFJL0ckVrG3Cq4=;
        b=mtr0GyV/68hpTPgPvpvly+gkg13SP1As5w5yT14b78mcyLc4DrIXgKbM3mykaNzIyX
         TeuAM6+Hs/nHv+eOtMLQU3LXHL/ZCdkBXWIWXrk83DrUdKDNgFxMmW00PTrciSdmXNIT
         kz8HQgWNx3KFAt9ANbCTJdujdw563L0C3ByVuX6g1Gu2RmFujZ7yMbwUN4OoNJA346CT
         sD1j1V3FLnB9WS9KCcSnI1/c+DrUPWwqBOKhmtpAwj5e7J22xNYFvzU8O2HSLBXtOvES
         dwym5BoiKDTQI97bjvo2n3ZFXTJSZ7PRThoub96ynMth215By/qYUH0IeZGVIF43Xl2V
         BxnA==
X-Forwarded-Encrypted: i=1; AJvYcCW3IkswSD9/y3Nk//krchsWBp84CYI9iVNmDHLj+/yhqrKE76c8Pdf8RQWmyXMqsaDc2l62hA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlOIsZOuEUFko6el4Y+9RR+uuOwXEJ+fi+sAYQWFraWuRfaNoL
	RHAe9UA36gccprVsk/CYu2PgsNIoGNQvWWuF+Bu5lnvZr6vlmLpA
X-Google-Smtp-Source: AGHT+IExn+fPRcV10FHE9dtg/+zBAnh+t9Lwtv8s2LJ4pkCkmAnCSv3NLBBJjN4CFeH8Crk1vVbBkQ==
X-Received: by 2002:a05:6a21:39a:b0:1d5:14ff:a153 with SMTP id adf61e73a8af0-1d978b0fb3dmr1939343637.12.1729658724392;
        Tue, 22 Oct 2024 21:45:24 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:45:24 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 08/20] dt-bindings: arm: apple: Add A9X devices
Date: Wed, 23 Oct 2024 12:40:43 +0800
Message-ID: <20241023044423.18294-9-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.47.0

