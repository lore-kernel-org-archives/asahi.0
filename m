Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7122071
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 05:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726291483; cv=none; b=EjeVF5+Xyn69OW9hl0SDUtGz93AJuZqC7/zgpXHhErhj//miyAeTJKSNPUkGlJC2MN3CnJbuI7sRil6uBfuYvNmwDNleV+8lqemHkdbCrRhZWxnvndPFrzOKwBJtglV818QsiAnNubqA/milhr0B9a9k23WkQFndPJNbCx7ML+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726291483; c=relaxed/simple;
	bh=Gu+6Gkk2SC24jQo0q7/6tiEHso1qLsuw9JDR/GOiJZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CA8JLdWyEDPpdk/Dd16lfzNLtTWVyZNfibtZ6Bvx3hd+8zld0McLX5ZDK993fNJ0fi7POiNEifDZ0V7X2HVq5HJt+eP0SzgvJhtRJx9BCjYEx/n9PnWbaJVHHkCzQFiV1I0PJIJNyr1DDBFV6IIIusfINrhcsOvSGhVIkFM3+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZNyg8PW; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZNyg8PW"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7db19de6346so1778052a12.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 22:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726291481; x=1726896281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXRnsQBcaJmu4YSoFsJ1WvEppTImoFlOBStwMEdj2vM=;
        b=FZNyg8PWwVIo2TLXiNxQho8jYQFNm8O5frt5D5XTuzgUzUWlkriiTZK3fUDWoHTNOe
         PRlVS3rfyTAwZRtRQhIuGMiGWLgIQf6MUq+ONtOUo7nrjc7BeuivKSFToi+udDx9E2RR
         4dcnZOSba5yeno6Fhr+lXqFGlngYg/lSumP7fT0acFXltzpYFA2KjO2Uofk+AS99VEk2
         E48du3sjbNypMEWFf+ee8ctDFDcnyJDgi0gM7mhURzynPRWoUvY0/C9tsZ61tzOWmec0
         L1gwf7BV7f1JPsVTi/pO1xiisYBaNyN3tzFPSUYv/gPXp4qWf6IuYM+YBVfbFWomj1d+
         c6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726291481; x=1726896281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXRnsQBcaJmu4YSoFsJ1WvEppTImoFlOBStwMEdj2vM=;
        b=ouR7I1c1G8UP/6btgA3+nCZun+SBjQ8Pj4Fl9VnYi3woeNLdwP6z17Mi7IZYOD9B52
         DZRM6rnNuzbHodFs/v9vqRq9fuKg1E7zzYOgYP4NGpjKoB4Q7PFsD1yQfjHBUdFxky1/
         Cls0LFPFhMC1++7k4dG8MvDDG1NTIceXU0ZDqcUdHfiagAINEydZznhOcS3i/z2PkKnj
         DEN68VM156MYMu/L2NQLnTAcNrOKfsgQfgp0IkELyOPEyNP9fYEBou/bp5zYX4epVm3r
         N867BqFxffrawd9qdaoqEvc0bYYcJgBGDRMRcvC8ZYTg2AJGNwcAckbHkwqgZO6iSagk
         0VSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjG0Ejlrrglc0fwJofaHD4yNlgo/nIQSUueasGbejbMzFh4Eyv9yOTDD/1FgYxyfVAfXwZVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhZH6Q2RykLar6P2xyEL9HF76zWbfJq9w7a2CaE09/nzZF0Mu1
	HgCs4Sn8fNM0Doosi7nSF76K18Th88tQsXvhqfl7NPVHsGPf2DNy
X-Google-Smtp-Source: AGHT+IFCgvFyB8cq0sr0EjcRXYg+FEBP97H4wuenNrfetS52zcI3hePCFQs/i5J7SkdnSENMDY+y0g==
X-Received: by 2002:a05:6a21:4d8c:b0:1cf:2df6:453f with SMTP id adf61e73a8af0-1cf756a61d9mr14123956637.0.1726291480622;
        Fri, 13 Sep 2024 22:24:40 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71944b7b749sm391223b3a.113.2024.09.13.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 22:24:40 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 00/22] Initial device trees for A7-A11 based Apple devices
Date: Sat, 14 Sep 2024 13:17:06 +0800
Message-ID: <20240914052413.68177-1-towinchenmi@gmail.com>
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

The following devices have been excluded from this series:
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

The following is supported on A10:
- cpufreq

A10 has performance and efficiency core pairs that act as single logical
cores, and only one type of core can be active at a given time. This
results in a core that suddenly have its capacity lowered in low p-states,
so the frequencies of the low p-states must be adjusted.

Patch dependencies:
- The required AIC patches[1] has been sitting in linux-next since
next-20240906, through the tip tree.
- The important serial fixes[2] has been sitting in linux-next since
next-20240913, through the tty tree.
- The optional patch to disable 32-bit EL0 on A10(X)[3] has not received
any comments (v1 or v2).
- A trivial patch to increase the reset delay in the watchdog driver[4]
are needed on some SoCs to avoid the "Reboot Failed" message. It has
been reviewed. (The system will reset regardless of the patch)

Authorship information:
- The commits to actually add the dts files are mostly made by Konrad,
and Konrad's sign-off is added by me with permission. I also updated the
Konrad's email in the actual dts files. Konrad can confirm this.

- Everything else is entirely made by me, including the cpufreq additions
into the dts file for A10.

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

[1]: https://lore.kernel.org/asahi/20240901034143.12731-1-towinchenmi@gmail.com
[2]: https://lore.kernel.org/asahi/20240911050741.14477-1-towinchenmi@gmail.com
[3]: https://lore.kernel.org/asahi/20240909091425.16258-1-towinchenmi@gmail.com
[4]: https://lore.kernel.org/asahi/20240913174540.45551-1-towinchenmi@gmail.com

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

Nick Chan (14):
  dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
  dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
  dt-bindings: cpufreq: apple,cluster-cpufreq: Add A10 compatible
  dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
  dt-bindings: arm: apple: Add A7 devices
  dt-bindings: arm: apple: Add A8 devices
  dt-bindings: arm: apple: Add A8X devices
  dt-bindings: arm: apple: Add A9 devices
  dt-bindings: arm: apple: Add A9X devices
  dt-bindings: arm: apple: Add A10 devices
  dt-bindings: arm: apple: Add A10X devices
  dt-bindings: arm: apple: Add A11 devices
  arm64: dts: apple: t8010: Add cpufreq nodes
  arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE

 .../devicetree/bindings/arm/apple.yaml        | 160 ++++++++++-
 .../devicetree/bindings/arm/cpus.yaml         |   6 +
 .../cpufreq/apple,cluster-cpufreq.yaml        |   4 +-
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
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  13 +
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
 arch/arm64/boot/dts/apple/t8010-fast.dtsi     |  30 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  47 +++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  15 +
 arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |  50 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi          | 234 +++++++++++++++
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
 88 files changed, 3300 insertions(+), 4 deletions(-)
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
 create mode 100644 arch/arm64/boot/dts/apple/t8010-fast.dtsi
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


base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
-- 
2.46.0

