Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4972036F9
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583547; cv=none; b=NbmaS0a0P0IW46GYG2QAPy10HoKc7avw7xb6b+axyuUAk6D+7bVAKpCCNKsYHPOJUd4tmp01mr7UxJyCIUGD8lNa+T15WIR2nrpMIt2hgq06OpmiUlOfIQLmE8hnZ+YsjxYqPGo/OdhLjTPoBN3AXn5pJqStuupKtNM8QxIdSvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583547; c=relaxed/simple;
	bh=pg37Hkuxy/mp07RBnXKjy3rnbdPYcoYwLXNI75XiooI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DO501DDKodQ/iN6ICCWAreHU23i/TmaBnMl5VYyr1GVxZiGklcRaVO7JqyN7+zDRjFmDFpyNb+dsKhyLXeRFwQB0+ZtdBKzwYad9FSczlTkaqLwOSbJEJq8SyEitF2eQMEARga4TBWn7WdKIA7sP7PzeksBguGV4Hg/BLK69StA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bso1AezM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bso1AezM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2156e078563so59965815ad.2
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583545; x=1739188345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
        b=bso1AezMmgsTIyCKoEkbBQABsovN7r/Ro/fFYMnwuzMrIxq/mKFQ5Ihpdpgs+jg+Bp
         MKFAiC1bPR2n75QP2/1VDn+i+07rCaMW9L5ks8rZIEuhtSgaSEMehXsinoYCoOq6sDiY
         BRRCVS4Cy80KZdP4lP3vyqctfd2CJI5iabjy3hpvlAjGaGskiwoyYbCVAheyeoGYMD4X
         pmKag08iO/mR6qScjuJOEcOkeVjR/GwEpKcxgmuqvlML71HrHleVP/ptQwJxpNAQpVhH
         CKsL19gMjXfzohqs/YHAmBdiSEkdyoKq3G1+XM7Iq4bBgWX7d/7opcdhlYchPZtKmd8R
         t9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583545; x=1739188345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
        b=VjRrM0Ulj6Nl/naH1s1JClPFpwA0v6ig3fc1BWAC8OlWaPmfP/nzxwv9D0TBrFFRJr
         QigBy/ozegwUU2knuEqKliiFpkDN+pCi9jb5X/cPi24Odl+smvqEyGVEHPAtrd18KdhM
         MRe1MFUVRboG9CuJQx+DxRD5Kt+TOM3gMnOj6mCQa5RqCCEuJh/XJc0vyG83bPEeFzxJ
         yH5sRtB+okR9G9m3mA/iZFI9izwKcx87kLuWFqQcs9jvavGN1M9lZSr7UoNzT7X47V7h
         HmY0LYM2Z4OMNmc4hV6O+GunQXAN9U3PuBD6E63ZtCXSX4PEdOHlrAWphkZuBYKIG/XO
         fIvA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+CwEKd4nUV1GYuYidBM9VzgGefRNkDPtb0slwKAykWx6mi2rBJH8vR9GSizNu5ubNsISuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuflmIwlGQFUWQlVqx0QiNkIP5aOPMHs0LWum6vOBWnpNhbNqg
	3X0KoC1SlBxzlLv5nVpcwPrBfyFEMmUjKLBjcX2S0QphlyyQeLoY
X-Gm-Gg: ASbGncsn8PeQTLVDiziVC+UOzGPxzn7mLCuE7MINEt5Qs21wfK9ZGfbD/59rw335C3f
	vp+0phVkpL6gWRMkNZUnyM6Dr8mlPXyBf0pzZTg6HqBiS6+tHJ5u8q3vbahFiOTnHdNNphuZmlw
	nXUtBPknxzXf8DQuckhe5BoxBhUwZ6mH1R5r3UMtdPCneVBV5f8EEPrZI/SAIwqtrMr9RYc40sy
	K4rS634rtuwZd6ynLz/Zi0cUOyxQLPh/9iy7DYd4wA3jnGHk2f6SN6XWkSi0hVrqqHKMJixlgOV
	EhuffBBqL0AJSFql
X-Google-Smtp-Source: AGHT+IEdhLM08AT2wmM/NO7irAEic85WuehISVFGzdIXsWFirVgVJJVcaDE2suDIVnMIJ/r8VGZqsw==
X-Received: by 2002:a05:6a21:998a:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1ed7a5c22a1mr33704475637.1.1738583545121;
        Mon, 03 Feb 2025 03:52:25 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:24 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
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
Subject: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
Date: Mon,  3 Feb 2025 19:50:31 +0800
Message-ID: <20250203115156.28174-1-towinchenmi@gmail.com>
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
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

