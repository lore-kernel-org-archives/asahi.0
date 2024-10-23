Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC613BAD5
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658688; cv=none; b=NTC331VZ5cCV0f3WehMtkdnEBJWOPDjI+4KkR0DWdgyV2zQt4HD4iv0MxdreB0WQ0zECE/UWVvVdR/YABBPO+xCtSuSBfdb/cgBZCW3aZcMOEEWCR+ij8X7hPcMCNatgo6L86GXtPd+km0wa94mNDt+JxGFCjWeiU1P9goP579A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658688; c=relaxed/simple;
	bh=6tIu3ZqMjXtYcw02djGJwdqAqzHvqytzQJkGGNl+wNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXn01LNG6D8fi3GF7cX04Gu4V7K3/OAAPtUD50qb/79nGHXgw67nKI2o1OrEoye6BuhUw83Nf/KiD3HbDxO44rENbGWWm1yXgjnItCgnao7dkPsq8NyAqjdhs9VfhPJBulxddUsZkV6Q7pBtLKyFSsRRGujlNs7gGLLvN2vOhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeiPUlqm; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeiPUlqm"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea8de14848so3950805a12.2
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658685; x=1730263485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkL/DVueh0JWsEG2GTlVjjyZ3OQnuu7dKIsPA5zxpnM=;
        b=LeiPUlqmRQHlCSkhFQg9HX+n6+mkwvJYM+lrb/HMy6SJUd4IBPLLlC/WAEp2R4aY0l
         2+h5thHt1RY9xzo8oImb2fakA//8EiB5r8bbHM6dxwd2QZKmrb6GGV1YViva8ks2XxZw
         aI2wvIBSqhFGD7bvIncN82Si6XgGw6w0bnkzgZfb0+P4AphOaZNCKMqtcKk86mE9e/1x
         TAAjNW7nsmA1TRP883faDo0GGTTPAcGQUCiQyHvt4i9ANEPq6uZogpQk0U5AktJ3gOa1
         Uh/tWhcN9Xtoi6yGCcc+m11wiJBSjwEBaniQy7TrwTLtPCH3eva3DgA50tNiFKQeZi8p
         UbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658685; x=1730263485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkL/DVueh0JWsEG2GTlVjjyZ3OQnuu7dKIsPA5zxpnM=;
        b=QFc1TXwmmzpkaFW0yHjY//19EO69/H4giDxC0brxhvT/hpkL+hrntGXUz9djuoPBVW
         nFF9WYXZsCH0j94B42RpNJeJNdXRbuEVngEWLFHZmnPzLPQnxWTN0wK9FNxBwIO3Vn16
         Xx314lVftzcUQrX36xhdNbWk0jZNF1gL8Q1jyInSYef2g+Ai81BR5cTsEVPXLTtnsn3d
         Zm20Nnzf/+GfvCADJ+NgOG7ItCgabp6vDwcRxFQSwPLva+JatO2C3Dp2oh4da3XKlZve
         RWcBvtGBNPuFJqPJ9J3EAKqfQlqw8sZ7IeX2wkvKeHjufwBYhqyMfbxU8/NO6/uqpCeb
         UObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbwkw5vZIQtf5ZqQovhlVsRBLJU2eJE1M52J1QG5nzqcN0wiyCSDhdLySnT89Yq5NCXNULvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQqfFK0GhTKmedaTOQ+ekVYEn8/D3WtNL+GknaJmcMR3yz/uRL
	sOuIxfoPBZiWLcADKQRETUANZr84nqc7ppEpZs1WFLezRJapOqXc
X-Google-Smtp-Source: AGHT+IGYo1H+HOTacN4X3Ggn8BEUDotcclKqd1i28JOUHHQDA34R6HsLFTH/ioMc90R/aTCksDZzrg==
X-Received: by 2002:a05:6a21:2986:b0:1d9:237a:2d55 with SMTP id adf61e73a8af0-1d978bae0e5mr1561084637.34.1729658684656;
        Tue, 22 Oct 2024 21:44:44 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:44 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based Apple devices
Date: Wed, 23 Oct 2024 12:40:35 +0800
Message-ID: <20241023044423.18294-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds device trees for all A7-A11 SoC based iPhones, iPads,
iPod touches and Apple TVs.

The following devices has been excluded from this series:
  - All T2 devices (A10-based): bootloader does not work (yet)
  - HomePod: Not tested, and it's also a different form factor

To pass `make dtbs_check`, please install the latest dtschema from the main
branch, for the `television` chassis type.

This series supports the following on all devices:
- SMP (spin-table)
- UART
- simple-framebuffer
- watchdog
- timer
- pinctrl
- AIC interrupts

The following is supported on A7-A10:
- Buttons and switches (with pinctrl)
The buttons on A11 based devices like the iPhone X is a subdevice of the
not yet supported SMC.

Patch dependencies:
- A patch to increase the reset delay in the watchdog driver[1] are 
needed on some SoCs to avoid the "Reboot Failed" message. (The
system will reset regardless of the patch)

Authorship information:
- The commits to actually add the dts files are mostly made by Konrad,
and Konrad's sign-off is added by me with permission. I also updated the
Konrad's email in the actual dts files. Konrad can confirm this.

- Everything else is entirely made by me.

Changes since v5:
 - Changed how device trees are split. {soc}.dtsi now only contain on-SoC
   parts, and parts common to all devices using a soc is in
   {soc}-common.dtsi. For A9 devices the common .dtsi is
   "s800-0-3-common.dtsi". For A8 devices additonally there is
   "t7000-handheld.dtsi" to group iPhones, iPad and iPod touches from
   Apple TVs.
 - For other SoCs, either all devices are handheld or there are only one
   type of handheld devices using it, so no handheld .dtsi is needed.
 - This is closer to how the existing device trees are split, and will
   allow nodes likes power manager and battery to be added more easily.
 - Fixed Apple TV HD serial debug console. It is serial6, not serial0.

Changes since v4:
  - Removed incorrect commit message about the order of CPU cores
    in the commit adding Apple A7-A11 CPU cores.
  - Update tags on commit added A8X device tree files, requested by
    Markuss.

Changes since v3:
  - Properly seperate A10X dt-binding additions and dts additions.
  - Apple CPU cores, including the existing ones are now ordered
    alphabetically.

Changes since v2:
  - Removed A10 cpufreq. The loader may be missing some initialization
    code that just happened to be performed by some versions of the
    firmware as well, given the inconsistent behavior on different
    devices. It is also possible that the driver needs to be modified,
    I do not know and this needs more research first.

  - Removed Ivaylo's tags on commit to add A8X device trees, seems he
    does not want those anymore[2].
  - Added Ivaylo's tags on commit to add A8 device tree, I have missed
    the tag. See [3] for source of those tags.
  - Added Conor's missing A-b on the commit to add A7 machine bindings.

Changes since v1:
  - Added /chassis-type property
  - Added opp-microvolt in A10 cpufreq for documentation purposes
  - Home button is now assigned KEY_HOMEPAGE
  - Fixed t8010-n112.dts and do not remove it from Makefile in later
    commits... (iPod touch 7)

In order to be consistent with the Apple ARM Machines bindings,
the order of dt-bindings did not change from v1.

The sort order logic here is having SoC type families in release
order, and SoCs within each family in release order:
    
- t8xxx/t700x/s5l8960x (Apple HxxP/G series, "phone"/"tablet" chips)
   - s5l8960x (Apple H6/A7)
   - t7000 (Apple H7P/A8)
   - t7001 (Apple H7G/A8X)
   - s8000/3 (Apple H8P/A9)
   - s8001 (Apple H8G/A9X)
   - t8010 (Apple H9P/A10)
   - t8011 (Apple H9G/A10X)
   - t8015 (Apple H10/A11)
   - t8103 (Apple H13G/M1)
   - t8112 (Apple H14G/M2)
- t6xxx (Apple HxxJ series, "desktop" chips)
   - t6000 (Apple H13J(S)/M1 Pro)
   - t6001 (Apple H13J(C)/M1 Max)
   - t6002 (Apple H13J(D)/M1 Ultra)

At this moment, it is expected that most hardware blocks will be 100%
compatible between A-series and AX-series SoCs, though to a less extent
than compatibility between desktop chips of the same generation.

v1: https://lore.kernel.org/asahi/20240911084353.28888-2-towinchenmi@gmail.com
v2: https://lore.kernel.org/asahi/20240914052413.68177-1-towinchenmi@gmail.com
v3: https://lore.kernel.org/asahi/20240915080733.3565-1-towinchenmi@gmail.com
v4: https://lore.kernel.org/asahi/20240919161443.10340-1-towinchenmi@gmail.com
v5: https://lore.kernel.org/asahi/20240925071939.6107-1-towinchenmi@gmail.com

[1]: https://lore.kernel.org/asahi/20241001170018.20139-1-towinchenmi@gmail.com
[2]: https://lore.kernel.org/asahi/34c748fe-89d2-d3a5-599d-52972c10f688@gmail.com
[3]: https://github.com/konradybcio/linux-apple/commits/apple/v5.19-rc1

Nick Chan
---

Konrad Dybcio (8):
  arm64: dts: apple: Add A7 devices
  arm64: dts: apple: Add A8 devices
  arm64: dts: apple: Add A8X devices
  arm64: dts: apple: Add A9 devices
  arm64: dts: apple: Add A9X devices
  arm64: dts: apple: Add A10 devices
  arm64: dts: apple: Add A10X devices
  arm64: dts: apple: Add A11 devices

Nick Chan (12):
  dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
  dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
  dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
  dt-bindings: arm: apple: Add A7 devices
  dt-bindings: arm: apple: Add A8 devices
  dt-bindings: arm: apple: Add A8X devices
  dt-bindings: arm: apple: Add A9 devices
  dt-bindings: arm: apple: Add A9X devices
  dt-bindings: arm: apple: Add A10 devices
  dt-bindings: arm: apple: Add A10X devices
  dt-bindings: arm: apple: Add A11 devices
  arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE

 .../devicetree/bindings/arm/apple.yaml        | 160 +++++++++++-
 .../devicetree/bindings/arm/cpus.yaml         |   8 +-
 .../bindings/pinctrl/apple,pinctrl.yaml       |   5 +
 .../bindings/watchdog/apple,wdt.yaml          |   5 +
 arch/arm64/Kconfig.platforms                  |   4 +-
 arch/arm64/boot/dts/apple/Makefile            |  53 ++++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  51 ++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  51 ++++
 .../arm64/boot/dts/apple/s5l8960x-common.dtsi |  48 ++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  51 ++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 ++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 113 +++++++++
 .../arm64/boot/dts/apple/s800-0-3-common.dtsi |  48 ++++
 arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          | 144 +++++++++++
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |  48 ++++
 arch/arm64/boot/dts/apple/s8001-j127.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-j128.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |  14 ++
 arch/arm64/boot/dts/apple/s8001-pro.dtsi      |  44 ++++
 arch/arm64/boot/dts/apple/s8001.dtsi          | 133 ++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 ++
 arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 ++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  21 ++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  49 ++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  43 ++++
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |  49 ++++
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |  50 ++++
 arch/arm64/boot/dts/apple/t7000-common.dtsi   |  36 +++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi |  27 ++
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |  31 +++
 arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  51 ++++
 arch/arm64/boot/dts/apple/t7000-n102.dts      |  48 ++++
 arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 125 ++++++++++
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |  74 ++++++
 arch/arm64/boot/dts/apple/t7001-j81.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7001-j82.dts       |  14 ++
 arch/arm64/boot/dts/apple/t7001.dtsi          | 123 +++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |  43 ++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi   |  48 ++++
 arch/arm64/boot/dts/apple/t8010-d10.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8010-d101.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-d11.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8010-d111.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  44 ++++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  14 ++
 arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8010-n112.dts      |  47 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi          | 133 ++++++++++
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |  46 ++++
 arch/arm64/boot/dts/apple/t8011-j105a.dts     |  16 ++
 arch/arm64/boot/dts/apple/t8011-j120.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-j121.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-j207.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-j208.dts      |  16 ++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |  42 ++++
 arch/arm64/boot/dts/apple/t8011.dtsi          | 141 +++++++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi        |  13 +
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi    |   9 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |  48 ++++
 arch/arm64/boot/dts/apple/t8015-d20.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8015-d201.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8015-d21.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8015-d211.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8015-d22.dts       |  14 ++
 arch/arm64/boot/dts/apple/t8015-d221.dts      |  14 ++
 arch/arm64/boot/dts/apple/t8015-x.dtsi        |  13 +
 arch/arm64/boot/dts/apple/t8015.dtsi          | 234 ++++++++++++++++++
 94 files changed, 3298 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j127.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j128.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j99a.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pro.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j71t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-j72t.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n66m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n69.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003-n71m.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8003.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-6s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800x-se.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-handheld.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j42d.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j96.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-j97.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-mini4.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n102.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n56.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000-n61.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7000.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
 create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi


base-commit: 7436324ebd147598f940dde1335b7979dbccc339
-- 
2.47.0

