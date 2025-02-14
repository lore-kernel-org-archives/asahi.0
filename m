Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02B92753EF
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 04:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505842; cv=none; b=KpObeAYKssWZWK2zjWI13feY14K2ycZNpH3NmNxbKJHao5Y3fEn7UPsGlEeHHqnOrUpV2fnp9g1vcQpSOgUmi3XMTI9odxNuuisV9f+Nmuo2ODAGgkSSpF+m7GmvXv2xlX8PJQe8sFE3It5VNb/1X/X7APdEQOljaU9HCDXzynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505842; c=relaxed/simple;
	bh=egiR+CXl8AF1IHhs1BWoZ6rt762jDgubeayg59ockyY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u+pUby8bPefSUjGpw28J2gULVtn1f14dwIPeRhjy2uWIxeA2jPjkRydoB23rU9tgunIeulhsX0KF+DbJ31lO5R0ynlGl33lI2mhjucGslmwQI8DKH53wIoZXvbHFaIH4FOQ/nXOZZ17N3167An+Xm49GzQYzAEbFcgy2+AukWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTBixPW9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTBixPW9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f44353649aso2429381a91.0
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 20:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505840; x=1740110640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
        b=cTBixPW9Mb9RZWO+Cp9V7tRyS2/Mnmln41GNwoQeXaevs0PXb0VAnE84viBjjUEfb+
         akpLepBZi+MXfavRCr/aaEwt2Y1GEll8Y41MCe7GBbBQjOjAcjvXDHB9nWWVopupyGwP
         0uT2rFeK6zfBpgDyWCg3xxpTa89eVWjK2jdXmGCeIALno5SIwpyVG6RavhbzyiDNKiCl
         k4DeOLa0MLh9pDvYeH9YnPur3xOWct8BE900wyrTe8esk5VifIXvwJT0gOMWr09i7MVo
         XriwkaQhQqiY3vnIrGIGU05WLTkDt60wnqcV8n3SxFMyvg9uC9HmyGS//XRZlHuk5KSV
         7DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505840; x=1740110640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
        b=mxF45LA0BWTpeZMklEva4nGGT3b7MQ4NbnABVb2pPDSGNiaWUdeY4gs7m3Tdj7HUy9
         w6rnDC9RMVwWaZtFj52+QzN10LO5ERMcV7KlFKbe/0E0xqKjcJ6CYkDFZu3i6+xBUGYr
         pQs5Ix+JbslWhCwJBQQtaTg7udHAYvDUTxqO+d3VM3mR78rZZDgbM72Yxe2457pCV0HH
         wO8DlhbQQoUIwqe4g9GBIVhPH1JaKSo7GJS7TmhNHlXnxMvoG4WgHAGd+FKQEAihkJT/
         a90qYyd+mrnF++BRXJzzxj7XcUcaGmxpDk/ogF5fM9xVaHeA++DYEyaJ3Xm/g5RUjo7G
         Q5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI1SsO4dFaMiix684BGsQ3l2i7hMNxz01XlSw0TeB5x0LH6M5gOTb9agH7/xQtuzwOM66q3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz95JmkDVr2teOND9ASWXz5QYd5ycgvyGrLnQ9vXNpjpcUOQAQD
	BOheEOyQVn3eNAHhsRAP8t5o5CkRTHoC8AwPvGLIepU0NTom+LT5
X-Gm-Gg: ASbGncvMj2Ri/L8KIQC4KUhetHfkiPpCYxxBx6+ZG4w5NhwXegpa0DVvkNZ+76zyDqQ
	hmk6ZPNHuIt/G3D21f3kE9soNaNRzx3SqaRhG2BkAea9hcAbxrMrCO1ECQOoRwkoyRAGWReNxfB
	WSVVjLZ9BqPD1M8BKduCkUQ7HApzKRGrOngmGNZV6eM5KdOm+F6tEsp8+eu/maj7qmkMXx43iW3
	YUt+vjgvMrnERXWulmjj2ubvuncZcNGFRkvKdMiOPQJg4c9vdl+EK28QWV7EX+Y/yU+6iDzuQfv
	oHIIR1JJxq3h/Mg=
X-Google-Smtp-Source: AGHT+IG/lvp3REMuEs1TqSkR5QKUuTnGFxemCOEmduTyXWx0aA8kwUQQ7GuOdHz5MXhdcM3OB4TycQ==
X-Received: by 2002:a05:6a20:c998:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ee5e666792mr17049651637.30.1739505840029;
        Thu, 13 Feb 2025 20:04:00 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:03:59 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 0/3] Apple DWI backlight driver
Date: Fri, 14 Feb 2025 12:02:11 +0800
Message-ID: <20250214040306.16312-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v5:
- Remove default y from drivers/video/backlight/Kconfig

v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmail.com/T

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option
- Indicate that the backlight scales linearly

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan

---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: apple_dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  11 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

