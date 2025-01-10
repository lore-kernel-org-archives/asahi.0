Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887B205AB8
	for <asahi@lists.linux.dev>; Fri, 10 Jan 2025 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506410; cv=none; b=Fa5hVxwusuTVcbQx9hbCijQ4I5cV3JHubizWoYHezaWDIZ4sUmNfgBnnyExvfyqP+UP8V5xC2b+Q7Lh0YRC0Mef489Hb5+cEuAV0OHgtyml6wsYtCPiCg1lq42x5p38SixSAFc+PqV8sWWxOQmEao+axnhoT6eNuZV4rLuIZZGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506410; c=relaxed/simple;
	bh=rGCRcTAbx7ek3q8ROZaVpZu6/rFfbfIJ7cbQRKFy7kU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=m7DAFfnrr+z2mgTGTQ01pE3cEU3eOx34zzW0REFmbBPTzOYliGKtGIqICGIigxOzVstvGNwR+5vz2jq/ycjkMBxhg24nMdYA2TYO/fCQCxrJIDv1mf31cdIuNEtcJcud3jzuR/t994yuPuH6b7ZLG9Kxt0Rppol0R4uIM1Ha0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/B4wsB6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/B4wsB6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21a7ed0155cso31902585ad.3
        for <asahi@lists.linux.dev>; Fri, 10 Jan 2025 02:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506408; x=1737111208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
        b=g/B4wsB6lUNUvCp/XF2MSt2VwYWOEPo0gt39MGif/cVVPXYzCENZ0T9f1rpTpTKjCl
         SA/oRlTxcglpXJZbfIvkoyeEoQqooNRTdOVY2w1iO7uUgiTXMzJ6lYMy5va05MAZGNOw
         jLlS+k9KTDBoaNTae6ARxKneQtUg7V/+4QWAz1DbtGKjTXe3S1iOfvWmaOz9JHh0kV9J
         wMkK/nXAz8yMk3AgfsxCI/HqvATY5ikUWI8An11tYu9EnSlHAg6d0UTqXcsWZaLEOp32
         Th83BRJbJ/+nc7kgCpS3saa2GgPvktk7ARBT9eJAWKcaDal4U3vy0He4lBFEoSxABd0P
         GjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506408; x=1737111208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUduN7cqZODx/WZErSSw2uA1hy8xWc4PRagxewZHEUo=;
        b=Npi0j/34zLagHLYB7w6ub6TZqStuSSkPxCcd2eaTQvq8qTNj80KjiecBaMSrJGKlfp
         eMWhXEVjjFchNOX/cTgC4my41L9NhfQy1cuSDEGBjG3sVd2+hjHJAhxL0hTvK61TcnWi
         L6iHj6pmyNmewUDbC84FSi8WKu5CHfzw+meb/hcdGK/O3vyzilnuS1vJ8URRhCt67wQz
         YfGrLJ8EeT95ces1276Z0jyUmAh9OkLox+O7FEQu13gA856FvXdBirZeJniqnFopuEgl
         GOObYPUR9dHDtollwiNN2Jidk9zuZfeaP6kKIqFtAoyFSP6UMDZgRbjXmDca7g0q+dOk
         gcxA==
X-Forwarded-Encrypted: i=1; AJvYcCWBp6kzs9vE8bJyUs19YZBTijq2B6fx3yRzeZ9qNsXv6jnHy3nGOWZ2vCkgJPrMt33mcvc7pA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx25Nqtj2aVts9h19QMxLKoyF6evr2fkYt+EolEjebObFs+v4MN
	3uaNnf0E42rTT81PKpFC6nINW/SWz2ko6Fn+UUxA4C9jKMSFz7bF
X-Gm-Gg: ASbGncvaYQ9n0x6bg84ReX9fuwYbZCemLqr3HwP2ZJNjnLiO4vJjYsMJlrsFcJ5oY7P
	+AjiJSNFwbwpYNEX6nUqW/VlG2qRUTX8wKeFhwjIGWP3fcYAqHv6Y/rFCfJrhKJmoGtxuEJaT2Y
	+Vni2qcxEnYUPHH04TK0kBm7lpyGin6AYOcWLSnIv2zJZ5dTgIk487Cd1xRO52xIzNyFrm7r/G3
	/tvMudJKDwaqEaTkDOj3uBmJ2gcKa/ZMe1kMKsxzaunVABMAKOt0HjTTw==
X-Google-Smtp-Source: AGHT+IEbb2zrjQUcRpFceG3h0m+QmzccmW9rBwdvM+e9BHDcwkzyX5aRGRbjkKUMhgcXHh+nuBGACw==
X-Received: by 2002:a05:6a00:1255:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72d21f4b05emr16485016b3a.8.1736506408063;
        Fri, 10 Jan 2025 02:53:28 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:27 -0800 (PST)
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
Subject: [PATCH v5 0/3] Apple DWI backlight driver
Date: Fri, 10 Jan 2025 18:52:03 +0800
Message-ID: <20250110105304.71142-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
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
nick@nick-mbp:~/Documents/m1n1$ cat e.txt
Apple DWI backlight driver

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


base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
-- 
2.47.1

