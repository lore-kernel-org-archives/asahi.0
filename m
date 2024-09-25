Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA133158557
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248861; cv=none; b=lci/E7SfiAaV9S31OSFnHBZiSei8TbFLjq0wMsfa9JpVMInkr5DjdWLUvbmZwLr4hYdUc4AGbowYqtu45HEzVinzTNiTXEbVBUPY9bCX5pzgAYqwyBn9xg5s2wJMELrHj6FMd7j0Pm3nHF2fuHr0xZwbK+MAsXJ5ZaphivoYqYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248861; c=relaxed/simple;
	bh=8QBzJyx0+ZVrX3wAJY2KWC9c5+OMby1GZPstnqAo27g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aroE9zoCa60YwZ2YUAOwKA06aat/cLWl+c3JvNgtekIy8BSWqasFEDc4Ywt87SYYCYhbTUXqcafdvyVOHcYPk4E6XyhD3lmG38g1WGpIFntp5/QoqDtH3yGBfK7cNjpegdJGbBZmMw/J7mt2wRbiOHpq7at3Z5dzqJHbYxrYkVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoHzAGSI; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoHzAGSI"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-82aa4fd82a4so249422939f.2
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248859; x=1727853659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/wc2/LABeu7MWNhfG7leQqnAhaWbUPZEJ8Ap5bTOf4=;
        b=hoHzAGSIjlvhl5CIuWQIbX84SkloCRX7goilhOPlwbpKeTfaXI6eRx7Dfv2BbUigrv
         ptkA7cWYOv/RuEe7V4i6jL4M1Hgn/NuNYum4e1RUo4RPotPjjN14iCMASTgt1RSSpqdI
         VqdBmMZ3pfKmdrdNsYBxsA1+WRvorxlyQag3jwoqQdwbdKiLrutsi/BuMtSTe/OX7e3t
         tbxBGBFc2N1IYhrH0b55enkb+QSq01C1Dv++gYlm01PWYtRPz1AyYEK+LmbmiwAhXS1r
         9giPwwuGir2GWP9V6X2hG5hZ0XZHb+jZeMcAmXy5LDeEg8pjnq0lEUNv068k6PC9M4i1
         un4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248859; x=1727853659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/wc2/LABeu7MWNhfG7leQqnAhaWbUPZEJ8Ap5bTOf4=;
        b=DaxwcOSOyYfDtqQH5nHX/AG9CYrO4nsHTyK5/TUoj0ismLpe/+dsjll+6V/R5sLejH
         zgxAGYmHCPwvhJ0z8Qc1yAcXD2x3AMp5/9Cyaiqnwt8+uZMheFAFwk2yQuhheDYiN+6j
         LliN6TvzMf7ag3nvtSlZrnMW0qRZCDF/0XduOilu7pT/vATyld20bqF35DFemD/dOBjJ
         ikiSJlsPbIHrrRFoXVwKI/IybXN4inci8WA5sEKUvmCh218Fi2p9A4j4wAFxLXZlH8WR
         kD2LkGQvpF6s/2+apsI3O44Q8h7iDzuW7J1GtYWVPNioVP5sMhaJy6nto9KcgDj/zAsf
         6bcg==
X-Forwarded-Encrypted: i=1; AJvYcCVu+EsMrZsmFixEF47se5fPwMYWuW/9rQAV/A2DFo8eErBRDCXJTQRQsBYT7PaJhv9rCIi1Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJxnyexBYZmVaOzaVf3ivJrDqnRTkIiGbVNSuCYtx4eT3jjcdH
	BqRHn08HPFVox+SeXmMpCWSzl4HhmSTy01lfB9MDjnBRgYq1OB5g
X-Google-Smtp-Source: AGHT+IE2XjRQV1+SJQyElqLaBdKDjUd5x0NHdSE6OMFzMv1UOcblr+RyfG+A/ww2rG9SzrbrSiuMDg==
X-Received: by 2002:a05:6602:2dd2:b0:81f:8f5d:6e19 with SMTP id ca18e2360f4ac-83247ced469mr167161339f.2.1727248858783;
        Wed, 25 Sep 2024 00:20:58 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:58 -0700 (PDT)
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
Subject: [PATCH v5 06/20] dt-bindings: arm: apple: Add A8X devices
Date: Wed, 25 Sep 2024 15:18:04 +0800
Message-ID: <20240925071939.6107-7-towinchenmi@gmail.com>
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

Add the only platform based on apple,t7001, the iPad Air 2.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index c05a4414c8b6..fecc4953df33 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -27,6 +27,10 @@ description: |
   - iPod touch 6
   - Apple TV HD
 
+  Device based on the "A8X" SoC:
+
+  - iPad Air 2
+
   Devices based on the "M1" SoC:
 
   - Mac mini (M1, 2020)
@@ -109,6 +113,14 @@ properties:
           - const: apple,t7000
           - const: apple,arm-platform
 
+      - description: Apple A8X SoC based platforms
+        items:
+          - enum:
+              - apple,j81 # iPad Air 2 (Wi-Fi)
+              - apple,j82 # iPad Air 2 (Cellular)
+          - const: apple,t7001
+          - const: apple,arm-platform
+
       - description: Apple M1 SoC based platforms
         items:
           - enum:
-- 
2.46.0

