Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1C18991E
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248878; cv=none; b=tNS75sXP0Y9PTw3MaRiEd9Pivu9rC9LTgN8htd8OYvv3vBlAyra4EtO9GV55COWivFIxEzlDNEbdMMMEdbNg3cuo3D7UZ7S8kWrJft/n/UMDvZKLMXbBLvCgCaQ/LqbeM1NcsH1ByDm7CV1UOUPdZSBVwfIcFphuY/4OaCnbQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248878; c=relaxed/simple;
	bh=lLIpUpx9sX7Qxk53isyMJp3chqURyyT7v/0grC16keM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iym7OqcoBFWzAD00KifAUAzUHolKGlxlqd80pzjJBUg7iFKdoUHad6MqYLMzKuQ9ZiTECNRChxFj+mjPWtbJpOSPUBS8RhLB/hJhXZBN6edpBrjW00uTBdLWg1qQni8unyypQbK3/gfQ5VsqV0Ov6AFyZv+/pr4wSKMmR1QV7ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jttORiPl; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jttORiPl"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e03e9d1f8dso3593042b6e.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248876; x=1727853676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNGT3yJDofmpc53HtmnunbqePjpMbshwu+vDeo17w6o=;
        b=jttORiPlM99ARJbj0rlPJ8QRiOFnEaQ4tHLdL6ZBf3Ry8Qc/sGSTE5aw7EwfMQnVS1
         4rdw04/AZIHfkU0tLO8hKWa89Jm8C5xj1q+9T7vvnrFfrlfeScKsSSBxawgSTXOJ2Tw1
         shYMtMfqMmI0U/Xh2wwCDFQlks+Z25ce8PcbOxSRki3fIPvLSDacppUJFxYOvF9UIe1O
         S7/mvDAUcqVYLoVHjWjpL/YYO6Mbl19EVnLJ0Wz2t51pM4uO7duDK69bPnuphHul0g8w
         VETdXoJFDZ7UwWKSJyEe/QkGy16T03x4UN9qJKd9GZPhsu50bFckeu7PR8nZpezmoB8U
         MXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248876; x=1727853676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NNGT3yJDofmpc53HtmnunbqePjpMbshwu+vDeo17w6o=;
        b=YRt7Vo5sj2bGaFl7/W30RVwTm7r1F5F0mqkdYZTln+kTIFV7m+S8km/DgMGE3o+LOd
         6r7ugV7iSEHh0rtzh8tcnDtT+HTMlxYALaz8HykXIMpap8qrnD3o38yQINuKdPYiV1eU
         pN+zCYPvNWlusBb046U3gldyjnj4RzH4f12kLpO4lotdiNt7WbMgCo9QhQzlberuau+F
         JvX/yXG9tuTxTkTJUMHafrosTfyvvLcL4KsHVYVq+31S1djrBAoRtFsxvONHl3IKqXf7
         ocxDF7BvcjXQVqpBAK2SEfI/4/sAXbcDC4kd9G/WJyWBXqt0iMrygdTPSXG8U+DkGKNa
         Xu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPHpAfubWXcgxzDCO+CNEBL5HLgLEBwLipLINGYe2I9xtDtYEIZPWdXCEzpyn+xqiLIIC2Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YygJe7qD26318BdMzk/xM+bTMMEpHje+Azse8zgJ2q3/ryfXj0v
	x2SAbrAqQMeP2QlC9Of+/kOz4YhLifaEvEEz/Qi6S9+13BwgyFWK
X-Google-Smtp-Source: AGHT+IEH+eVIQLfasu9dmEOPukCBYRwG0d+Bh43vyIopQLquRuxM9H7X758qKOFcZWA2TLkwvZ3Jzw==
X-Received: by 2002:a05:6808:1902:b0:3e0:7678:f665 with SMTP id 5614622812f47-3e29b76cca1mr1682703b6e.11.1727248876587;
        Wed, 25 Sep 2024 00:21:16 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:21:16 -0700 (PDT)
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
Subject: [PATCH v5 09/20] dt-bindings: arm: apple: Add A10 devices
Date: Wed, 25 Sep 2024 15:18:07 +0800
Message-ID: <20240925071939.6107-10-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925071939.6107-1-towinchenmi@gmail.com>
References: <20240925071939.6107-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the following apple,t8010 based platforms:

 - iPhone 7
 - iPhone 7 Plus
 - iPod touch 7
 - iPad 6
 - iPad 7

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 253dae759f10..b6a2916fb0f6 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -43,6 +43,14 @@ description: |
   - iPad Pro (9.7-inch)
   - iPad Pro (12.9-inch)
 
+  Devices based on the "A10" SoC:
+
+  - iPhone 7
+  - iPhone 7 Plus
+  - iPod touch 7
+  - iPad 6
+  - iPad 7
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -165,6 +173,21 @@ properties:
           - const: apple,s8001
           - const: apple,arm-platform
 
+      - description: Apple A10 SoC based platforms
+        items:
+          - enum:
+              - apple,d10  # iPhone 7 (Qualcomm)
+              - apple,d11  # iPhone 7 (Intel)
+              - apple,d101 # iPhone 7 Plus (Qualcomm)
+              - apple,d111 # iPhone 7 Plus (Intel)
+              - apple,j71b # iPad 6 (Wi-Fi)
+              - apple,j72b # iPad 6 (Cellular)
+              - apple,j171 # iPad 7 (Wi-Fi)
+              - apple,j172 # iPad 7 (Cellular)
+              - apple,n112 # iPod touch 7
+          - const: apple,t8010
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

