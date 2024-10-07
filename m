Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDF18870B
	for <asahi@lists.linux.dev>; Mon,  7 Oct 2024 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284939; cv=none; b=C8nJo5Rn2fTlo1Y+F3wTl3wcYy8zRcUGStlAkfnc4RZiVEOuLQJGOyvyOTpxASD9XlZPMOx3NHfDBNIimX3lwzC56h+taKJLYZwrtPcU5DkvTINnhF4T6NlgYhNCa+AzQ6iyYE8LKIF00+U+2MT+uYFOkGdfGfGVOepotNLKhJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284939; c=relaxed/simple;
	bh=HRfB2cVxNJsZGB/Yge5g5UVx4Mjkd+/Dzcp3QbR+eeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGn2R1/4AilCDpGav5y9qaKwQgiuIgfhWGaDhpjYV+IEgUXitpnN27uONo/O66xJURDK47f1xOM5zjYK6GdEJehOGHFKdOlHKhq8d42JdtKFHJpfIfAsF4lAw++HiOz4TE9i5NIrsiXMRipqz45Iizx9mfe7prBLIUBb/viyxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZC/ptp5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZC/ptp5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71df2b0a2f7so1338920b3a.3
        for <asahi@lists.linux.dev>; Mon, 07 Oct 2024 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728284937; x=1728889737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLXZ49bajWJJx8bAXLSOk/QnLsRj+shderlmWknheaE=;
        b=iZC/ptp5ttLekxQmOemzdBqyXJzkWvvsLzqq+Tr2gqJ7o6a5KyBHFX0BFXDvJ0o6jD
         p3ZiWwoDKzoR4vuepv596oN6x4AgvsCVRdkcOGhBPZXu0WcPVKFK4wbDU0H0CS5fR3c+
         BbeYwxHdlXHvEm2JH3a7tkzEENQZ9EDrfrdI+HISRgHSVLUWyOpXjgYByUyYCrmg4417
         sIMUrS4kTlWgSXJoXf4wtKnzqN8V0lIkytr3uKTDxZZZJK7iVoUXE+jHqtEqKS9yy/I8
         tnROViOwyDGQv3z1usIAj8KPHU468MBvgxTbOZmaEAEPOHS6iATh5SethmFcbTvhZMYq
         /Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728284937; x=1728889737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLXZ49bajWJJx8bAXLSOk/QnLsRj+shderlmWknheaE=;
        b=KV2V3OfRQv//r5fQkeN9D1mUO73Ed4kWYPERzobyf54MnnEtOAVBbUnguhdogh0fwL
         3wQgKe3to+AFvNRvFEDLx6+Ds2qGEyy8z8kaVx8YmDr1WSg0pkutWKwtD48m9MielmNi
         3mJ7sm4Q39dBDchLtRvPuDEgcTqqYW0HZ2ma64VOWhGv3oDu0ds6nYStFRPijVreumi5
         PTqDjjXV4kuRCpJ8EWPNtafYYbCrK7OlIc7Sidqv5vGyzPEfdXsosG8dNPQPTDbrQ6A+
         No/qfkWfPtP+yNWiH+5Ay2FAAIzxkv6Y5ZPOYkrH29Am0c5ckNSgCMMsU4GFghX74lto
         ni2g==
X-Forwarded-Encrypted: i=1; AJvYcCXVVkxHfcFq0z7/e++mXV88hoCFj0+KiPe/lmQpU6bP9vRqHhWq1uihPdrFYOl9z79Y7lTLEg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4tq/BFQD193QX+nSYfNeWrd/POM+fx+Z4j9IYWuImJXDRdjD2
	jZroVWg88LFRwBcZTByWt3Z9YXmCZAzqBDTr1ljXwej1NswJA+ss
X-Google-Smtp-Source: AGHT+IGT996U6ce63c61zU3HCm3aj142b34ghP+upFDkmtXado75z/eCf9GDbs21LIlnwFpQes/niQ==
X-Received: by 2002:a05:6a00:2d15:b0:71e:209:512a with SMTP id d2e1a72fcca58-71e02095209mr4635445b3a.18.1728284937236;
        Mon, 07 Oct 2024 00:08:57 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0ccd1a3sm3764147b3a.66.2024.10.07.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 00:08:56 -0700 (PDT)
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
Subject: [PATCH v6 05/20] dt-bindings: arm: apple: Add A8 devices
Date: Mon,  7 Oct 2024 15:05:30 +0800
Message-ID: <20241007070758.9961-6-towinchenmi@gmail.com>
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

This adds the following apple,t7000 based platforms:

 - iPhone 6
 - iPhone 6 Plus
 - iPad mini 4
 - iPod touch 6
 - Apple TV HD

The remaining HomePod is not supported as part of this patch.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 89c1e35e404b..c05a4414c8b6 100644
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
2.46.2

