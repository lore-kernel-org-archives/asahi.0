Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16718BBBD
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284947; cv=none; b=QAkTYFZNltV3aPKj/i6khZZRYPbbQEvVk9J2qlpwq/X7rTV/G0/oHYeWmq6TFPBic5Cpw9j3XQOheSfp7JEgrM89TUv2fSBDWOkpCqz9z73ripVtL9NGw87Yf7gPO64CvhAN0WegPBjJ+0Xjbw2O82Q46+fIPxxkwMUFVhW7GSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284947; c=relaxed/simple;
	bh=bCnh2aQC5OVHshLZNGNmvjurPxNhzTl6bwKiulsS3I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXqIIBLnKxyPjR/GjZnLhRzSxvME+NgAcusg3wFNxCD5n4oHIigOaEx+I2RGR7m+al1hgEweS4MRTP5O3loBj/9uCcPw+RUYjHEg63jQTEnNvzESpowh/NQNUeXXgY2bKgVBvVL5IZ/d/7gcaC52eiqjImED6ylAuLWlg4DRK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leAJGQnj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leAJGQnj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71df8585a42so953305b3a.3
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284945; x=1728889745; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxMNA/RNvIg6r3MEyAPgARFuu7Q+nWnn6kz1wu/WjHM=;
        b=leAJGQnjJmKJENLXP6ESmbxNkO91IOOZwl4X6ovGQ7OHqM7RM/W0OqL6B9Ia2Uo8q5
         gOxyb7N67g3DJdlzH+1IJ0ykOiGGgujBiJ0XtivZk/qR2gHvGpoY4NzUjbpZebTweIKS
         If1oND6m6wf2IQJrnm4DxPM90HUTGfgG85mt01ZmgntEj6WWuspBLHRR44axjbIH1qmT
         /zT/Npf/DVn8V6xaKx5INbdY1YaQgB6vj/aet9TnTEDnewSYDj5iLSoLOi3Duz3R9VXH
         ps/hkm6skpSirXQNFLxxGQDx8kjwFop4zA0U6PWBgqxLtsqBJqRDK772iff6nEMRNy7l
         blFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284945; x=1728889745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxMNA/RNvIg6r3MEyAPgARFuu7Q+nWnn6kz1wu/WjHM=;
        b=Phh2t6dCpBcFPxZsWSw9i0Aoi92kyTy3F7EWg2AjXdaTpBhZUxax9gtOwRfStWYWOB
         ccWqA/r9uB3XM+zAzKyp5izOsgvGxv1ytbJinncAaQca3vi8Br2RS4002rJyCdKWOdpd
         vGxciJlLE0WxUekAa17uBe3UEgG4P/PCJVQe/aH9IyE0emPmes7fNfsogHlWhCY4KBaS
         13TOd3pLAs7QIcjv7n5kEzfmupGf1dYK83BnL/Kz71vdEofER/rJNHBxxOdPHp9hsxAv
         N8r5P7faj8AbPXX0qZtavAuChT35hf1wkNpwoQrbeGAvN7ulKKFt6hgqV0z5sBAwfPHf
         fAjw==
X-Forwarded-Encrypted: i=1; AJvYcCVu14Ej3Pkcqc5QKAAoVhTHPyNwY+UznWov+oq12UoFCR0SRwskXOhoRTsqHp4tG3IZ90LRXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi47rUXg1qEF4bVyTD3zzVk7CzYmzd7E2ql3NQNEJoh2hOvt4w
	BEZgDiiDfTsb57kmA3JIXBD6cTtKkh+mv3ANu454sb7nPzZsMBLM
X-Google-Smtp-Source: AGHT+IFBAV9R9YmCshOgBZxbmo4PdTP1N54EmwTJRz+BxDKqQqytnadaBw2Zp4aczBmvcN1jWD0J3g==
X-Received: by 2002:a05:6a21:8cc4:b0:1cf:2a85:722d with SMTP id adf61e73a8af0-1d6dfa25a45mr14931970637.3.1728284944986;
        Mon, 07 Oct 2024 00:09:04 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:04 -0700 (PDT)
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
Subject: [PATCH v6 07/20] dt-bindings: arm: apple: Add A9 devices
Date: Mon,  7 Oct 2024 15:05:32 +0800
Message-ID: <20241007070758.9961-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241007070758.9961-1-towinchenmi@gmail.com>
References: <20241007070758.9961-1-towinchenmi@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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
2.46.2

