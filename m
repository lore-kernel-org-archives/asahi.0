Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1E018C90E
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284962; cv=none; b=tdnYNiPzHaWDE+/L9YD5cC4Up0vLBel91AwA9sXqCsye4wx/J9fSHN7GhGTnMmitSr/viGZwN+1oPe8uTCZO7jIbgE4snLRwfl79MYiKJlT14hl+5Qv7nPXhBrCyzRZiW3yUQ7GUCckdELn6TKtgN7H0CK+8uo4zYqNzJpPv8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284962; c=relaxed/simple;
	bh=axB8KGq+JGycqUSiDu96r7BR4lVXFJttsQF251Chsk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldECof0BeiSXr6menScfJUyYYXph4hYBDamRpP8Eq8da2yjBbhi5VPoj6DLB0/zVrR/8xvOcPkod6XOTjIHryWVAGdwPhSepIhPg4SQ5nDZCwirS24B1Iyl6uRKoGfTFbbkQlT+0e7nGSeQHDWFzqqz/2/7t8jJzt0hKUzWVomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0ME8hcX; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0ME8hcX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e0cd1f3b6so58947b3a.0
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284960; x=1728889760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g4gRZCGHCo1rLxKmX/2hEmMSo1WKQ/Z9kAIXCkaby8=;
        b=e0ME8hcXiiv6sMskL/Mk86/9dLIILp6qGEpdqQQLgN9RxIpZp1BEo2n7byZzomoo3K
         gfpOblhSOEJT4vb+UqG+o8raIn84koFegijUIggpJXXU5X5NLUNMqDEGwbyMM2Vn5/+j
         2cX8jKlgf5ST+zdN1ilmYrWOT1s6yxy1Q29yiD7Dvfrso7d4Knl5nZQTkLy54sNE1DQC
         iLxFTuxH4pBg8WJt1TwWjq8An0bJaUQ1apL/qpxi5Cs/HjvvTlu8Vm4L9rjOTN/58eYb
         gP6yIv8wdA8ILINjvHv2DgGvW+TaImI+efHDJ8mE85MApOSnECpl+YukM6V1f+39+/3w
         XleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284960; x=1728889760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g4gRZCGHCo1rLxKmX/2hEmMSo1WKQ/Z9kAIXCkaby8=;
        b=wihVy/dkM32/+EBnq+o4lrc3zP1s0EASNLpzjbm+8dfr73k9X1yBoMnzUy1YRKXP9E
         BxMBVvPJoi5J67G0Lg6r6RHeFpMSw5IBV5XYQThpqfFp4dnXgNbaKcqz1DX4KmTD5aLg
         TQmyVvJYryMz3BW+oNi2m+3Fp3UGSXpofpNopaPK5Xt64FcBYMqBIrrs/zjJrKP8iw2q
         qqZi3eoTGP5xzjVo4Jrool757hGZ0vtpzNmCVaLN9S2OxlLSE4jC5JuBeg4qPwkGsapu
         4ul3dSNQeZxRxNTffswNujZgG8mQgle5YlF/IB0vp8Q6DReeI+IAsP1Bvb6oNKShntLL
         G9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVCFvczwF7b/iaFlGshlAWvT63403hHbgRmpOytaZrWEWPem/aM7Mtq1So92sz5q4sVm283wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOOXg5pqB24AmsWSaDXpUqYC9YvhTUYqSb3tDVRJeomS/DjdMY
	G3U/58D3MwUOqMhsKA/BdVBhX5TJcGTjCKgiOUId4pdVqRF/V+te
X-Google-Smtp-Source: AGHT+IF1cMfn/nRufvbr/klzHOxtlkRzYprffmyfRZXIeT0sFZViWXk6TH7oFwlUjqJmvuuvs5lv8A==
X-Received: by 2002:a05:6a00:124a:b0:71d:fe40:7e68 with SMTP id d2e1a72fcca58-71dfe40808emr6377612b3a.1.1728284960458;
        Mon, 07 Oct 2024 00:09:20 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:09:20 -0700 (PDT)
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
Subject: [PATCH v6 11/20] dt-bindings: arm: apple: Add A11 devices
Date: Mon,  7 Oct 2024 15:05:36 +0800
Message-ID: <20241007070758.9961-12-towinchenmi@gmail.com>
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

Add the follow apple,t8015 based platforms:

- iPhone 8
- iPhone 8 Plus
- iPhone X

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 96efadad15a6..dc9aab19ff11 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,12 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "A11" SoC:
+
+  - iPhone 8
+  - iPhone 8 Plus
+  - iPhone X
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -205,6 +211,18 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple A11 SoC based platforms
+        items:
+          - enum:
+              - apple,d20  # iPhone 8 (Global)
+              - apple,d21  # iPhone 8 Plus (Global)
+              - apple,d22  # iPhone X (Global)
+              - apple,d201 # iPhone 8 (GSM)
+              - apple,d211 # iPhone 8 Plus (GSM)
+              - apple,d221 # iPhone X (GSM)
+          - const: apple,t8015
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.2

