Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E8155C98
	for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248827; cv=none; b=avlRW/MmZ0g/yH/LifGkp24iVQPFEmPlCcZ3cv75dnisAKbe92zP2uzls1IC3aFLb2LM3DJd8Ng1atZdfinfS+nUcL7NlA7HhaehRUPYajt7j4yp7lp4JRMt7Nnr9LMGonsWwoigfJoldz5Nvisk6pZHI9/vr0pu4Bgep8i9vAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248827; c=relaxed/simple;
	bh=iuOoT/U8V/IjPnHJe1f8Kd0MVA0ZQh/W2g1jrrUbMFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iuFS1a9Jm9cnwy6AoS098VhUEVFY4AoBYC3WSfrx5An1EMpcfNYINGhlIg3H0vddM26ZKunzX8BmusuqH11fKYnaaKW9r+cG7shO0/8jvZLY4OXaiGQ867RazshxqCS2/tVmZBgokFl9VTcaWlSeET9DNNbeKC78njvE6thzSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDeDf2W/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDeDf2W/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71b0d1c74bbso275297b3a.0
        for <asahi@lists.linux.dev>; Wed, 25 Sep 2024 00:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727248825; x=1727853625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfnMzceNKrPajkb5ZuYEoLQYnMZTf7LW1SZIK5C34ZI=;
        b=dDeDf2W/FmtGh1Nday3agNfFsTmsrl6J+VqP+xfQQHZnaJ9m7rqW1RGYZqy3LTCvV3
         ugIR/IqB3VNUow/IUjIDG1koRAZdgK06yyo4ij+/8vHQqrbzZQyge6A7emUEDpEHXQm/
         p0AziGRnOzGqJ5aedeY6GmlWJwLiAkvyFpmTFP0bxqwLRqdUtHnyB1QLGw3u8HTIHOUM
         iOSUbaxeJTAIpaIZL4HKaSZzDW2HptSR9/9yD+OlN58NQ97Z/2PoRw1NtiIqR3h/8L7z
         3RFXFH/f3nfkGeHbQID8otlOsuovD3EAlQ4AAXIJ2nUaxYHEOFI4L1UPq2oUjERk3rer
         j4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248825; x=1727853625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfnMzceNKrPajkb5ZuYEoLQYnMZTf7LW1SZIK5C34ZI=;
        b=RUubXGoGMLaH+gblCvozDO+w3zEfP/WXsHIqOHXvXWKfW4KAvrcDwy2/PJ/HtwnYEe
         PHdH8z/r1YAHiC2FkI1KFXueYbX/pAypSavEKhxFNAm+InY2aVgNWb++/SKlpkTm7ivw
         esuJMGhSHrnoQQ3/aKQYqd4L8Z7BGGkY/7I8LqdReVvRzFHIYcvBs9y5GeMroXFzm/e/
         8EdRMEdlPH1I2TBu5CHOd5uxCYU/XuHcro3o6x4dxqIPayBfBgaMcJE7ltG9QQg1XpNW
         NzeLieqNyXHcnvQYAVCCBvlChR288NaUFJDDuYGEJRsB5rMBjbLiwr9WVhzxEvNyYA4W
         iu8w==
X-Forwarded-Encrypted: i=1; AJvYcCVdpcE5Z0j0iFRLR7Kopp7OAhjw2O8m64TqOOgClo1/HNdfOSBXCTByvmNWYtZmA5CKkHeyGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz9ZUkDR5eqcPwHMJGtUBItujTI/fFO7cWlRngBk7JmHrj1aFg
	PFQplBwLVQpBUutmDC4lcLPxGcOdNG9Wfinl93DUHKSZmrTys3pS
X-Google-Smtp-Source: AGHT+IGHCNeu5ZpJhxILkxU96qzlnPtqCBVZ8dNtc0pfCMbxna6aMi25RDYXrACdTYgy++N4Cfha1g==
X-Received: by 2002:a05:6a20:769e:b0:1d4:e640:2697 with SMTP id adf61e73a8af0-1d4e6402705mr501417637.1.1727248824728;
        Wed, 25 Sep 2024 00:20:24 -0700 (PDT)
Received: from localhost.localdomain ([49.130.52.78])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e6b7c732bdsm2155662a12.63.2024.09.25.00.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:20:24 -0700 (PDT)
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
Subject: [PATCH v5 00/20] Initial device trees for A7-A11 based Apple devices
Date: Wed, 25 Sep 2024 15:17:58 +0800
Message-ID: <20240925071939.6107-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
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
- The required AIC patches[1] has been sitting in linux-next since
next-20240906, through the tip tree.
- The important serial fixes[2] has been sitting in linux-next since
next-20240913, through the tty tree.
- A trivial patch to increase the reset delay in the watchdog driver[3]
are needed on some SoCs to avoid the "Reboot Failed" message. It has
been reviewed. (The system will reset regardless of the patch)

Authorship information:
- The commits to actually add the dts files are mostly made by Konrad,
and Konrad's sign-off is added by me with permission. I also updated the
Konrad's email in the actual dts files. Konrad can confirm this.

- Everything else is entirely made by me.

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
    does not want those anymore[4].
  - Added Ivaylo's tags on commit to add A8 device tree, I have missed
    the tag. See [5] for source of those tags.
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

[1]: https://lore.kernel.org/asahi/20240901034143.12731-1-towinchenmi@gmail.com
[2]: https://lore.kernel.org/asahi/20240911050741.14477-1-towinchenmi@gmail.com
[3]: https://lore.kernel.org/asahi/20240913174540.45551-1-towinchenmi@gmail.com
[4]: https://lore.kernel.org/asahi/34c748fe-89d2-d3a5-599d-52972c10f688@gmail.com
[5]: https://github.com/konradybcio/linux-apple/commits/apple/v5.19-rc1

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

 .../devicetree/bindings/arm/apple.yaml        | 160 ++++++++++-
 .../devicetree/bindings/arm/cpus.yaml         |   8 +-
 .../bindings/pinctrl/apple,pinctrl.yaml       |   5 +
 .../bindings/watchdog/apple,wdt.yaml          |   5 +
 arch/arm64/Kconfig.platforms                  |   4 +-
 arch/arm64/boot/dts/apple/Makefile            |  53 ++++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  54 ++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  54 ++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  54 ++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 146 ++++++++++
 arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 +
 arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 +
 arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 +
 arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 +
 arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 +
 arch/arm64/boot/dts/apple/s8000.dtsi          | 178 ++++++++++++
 arch/arm64/boot/dts/apple/s8001-j127.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-j128.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-pro.dtsi      |  47 +++
 arch/arm64/boot/dts/apple/s8001.dtsi          | 167 +++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 +
 arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003.dtsi          |  19 ++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  52 ++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  46 +++
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |  52 ++++
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |  52 ++++
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |  19 ++
 arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  53 ++++
 arch/arm64/boot/dts/apple/t7000-n102.dts      |  50 ++++
 arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000.dtsi          | 146 ++++++++++
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |  46 +++
 arch/arm64/boot/dts/apple/t7001-j81.dts       |  14 +
 arch/arm64/boot/dts/apple/t7001-j82.dts       |  14 +
 arch/arm64/boot/dts/apple/t7001.dtsi          | 154 ++++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |  47 +++
 arch/arm64/boot/dts/apple/t8010-d10.dts       |  14 +
 arch/arm64/boot/dts/apple/t8010-d101.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-d11.dts       |  14 +
 arch/arm64/boot/dts/apple/t8010-d111.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  47 +++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  15 +
 arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |  50 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi          | 167 +++++++++++
 arch/arm64/boot/dts/apple/t8011-j105a.dts     |  15 +
 arch/arm64/boot/dts/apple/t8011-j120.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-j121.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-j207.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-j208.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |  47 +++
 arch/arm64/boot/dts/apple/t8011.dtsi          | 175 ++++++++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi        |  16 ++
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi    |   9 +
 arch/arm64/boot/dts/apple/t8015-d20.dts       |  14 +
 arch/arm64/boot/dts/apple/t8015-d201.dts      |  14 +
 arch/arm64/boot/dts/apple/t8015-d21.dts       |  14 +
 arch/arm64/boot/dts/apple/t8015-d211.dts      |  14 +
 arch/arm64/boot/dts/apple/t8015-d22.dts       |  14 +
 arch/arm64/boot/dts/apple/t8015-d221.dts      |  14 +
 arch/arm64/boot/dts/apple/t8015-x.dtsi        |  16 ++
 arch/arm64/boot/dts/apple/t8015.dtsi          | 268 ++++++++++++++++++
 86 files changed, 3202 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
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
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
 create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
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
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi


base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
-- 
2.46.0

