Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE76154BE2
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726044414; cv=none; b=rMAry/frSaAsxeh66KN0L95Itwi7QkbBfWszFGDUe0L280ZXCwJgXZeW9HGZaUwz5qi/Acf0ejk5vYZJKqstQA7uMOnP4LqugXYQTQVUiRFWNDSbQky+Ax3wLkN0mdhCz5uVdl5W+0WI+8mt8GMLoq95kydgFSRkHD1X+oibp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726044414; c=relaxed/simple;
	bh=PGn83Yidma26xXl4an9r0j3fqQh/M6sJ06wRtXqaK1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMWdCrKRbAXHA9CGkdhRxK/kKOEm6QlMnRYsQVywbL5ET0Mqk55CI6qwl+lJso9FxLgEgvv4Zn3OtEChf1rrTqcL9S4okqGdFOyPHHgNmOMfEkATquVvSHCIsfUwbeEORkEvzTP41bRj66TGlMM4IlH3P6Xy2eje3qihlbqVCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jW4dCNdE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jW4dCNdE"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718e56d7469so2677140b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726044412; x=1726649212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FW1/BtXf0DDZF6QM0V+QwjHQw4Ee1wCPRNp4qZ3KaCU=;
        b=jW4dCNdEXKdpn4zSNjGUbD0DmrzB2pxSHKNzqyQ7y9uh4hv6xBnoNq3wLXbvPRdrbo
         UBbT+o1yHIgEfSHOLCCToijpUrSFMBa8GzkuBDeOQzi0bCRDuTN2W+L5+vaXAhwPTJtr
         MYpKM0dhkNw9DybAyZWErvtCDJntDoq+RMzX7h/DLEoFQEsRteWNEMe4aQ9edFjf/vYw
         Z1EWJHQV0zSSghWxTUxgHXMhgVOljqfsPuuOj6Px7jX0D2lBQ/OYnC30FggchsqC7hVX
         XhMT3ho24nNrsyQdzFTeKow/teYkRKRIjsX16FIq+KOXUakxDX0DGeMKZuJEQxOUppae
         FY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726044412; x=1726649212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FW1/BtXf0DDZF6QM0V+QwjHQw4Ee1wCPRNp4qZ3KaCU=;
        b=F6ThLrVtDtR0f5D2S+BRlwj0qZ6hP5+GMOYAm2UUiYa2y4YmvjMexP1rA1jjj/2lP0
         2BmBNcECla8HD/pSwod6+x4q/rOU4djTUBEBVVKKuQuZ+PcRnP4vLqrTkJDNyg67+4Fa
         IKgRhqNMyoZ35mdVhENy8Pbku1BR2RU1lB+Z1BfgFkMOXH9Y4wZcJGlZFzO7PSs3C3sT
         ueACVTq9DltRNm8cFgjAdJpJ2LW4A+40mWpXxIInYmahdjMaeOp5x7W1mzalHdeWogLm
         6fXFDxWSLx7a70d5blI733pXX4BDZga3q4Nf9RAfTmMvmHKLIPQbVyKOgWzJ7T8PVt4p
         osaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ecLmPJpohotfLuxA0ZerqrYgGfdpWT5+ai/gvi7C+hnD7BOlcfzIbgrRffPfFTlYSVMpNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZgpYs1n//2hE3XHkm0V0/t7DkWO4Ep838OWbMj7Ls+728LTSH
	urfTRcAEZI/I/bgrjhvQ5VExKhwgQo7l3yrvEBYAqDYYHhZcSCWl
X-Google-Smtp-Source: AGHT+IH83l3xFXj0fxnNctpZP7vnaqVwdExXDpp1HdTAXfwuFzGmYyY0OGZ0uMpU84i+wk2Ul4Wxvw==
X-Received: by 2002:aa7:90d3:0:b0:718:f026:6c78 with SMTP id d2e1a72fcca58-718f0266dccmr10572628b3a.13.1726044411932;
        Wed, 11 Sep 2024 01:46:51 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71909095177sm2530125b3a.112.2024.09.11.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 01:46:51 -0700 (PDT)
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
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 00/22] Initial device trees for A7-A11 based Apple devices
Date: Wed, 11 Sep 2024 16:40:50 +0800
Message-ID: <20240911084353.28888-2-towinchenmi@gmail.com>
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

This series supports the following on all devices:
- SMP (spin-table)
- UART
- simple-framebuffer
- watchdog
- timer
- pinctrl
- AIC interrupts

The following is supported on A7-A10:
- gpio-keys
The buttons on A11 based devices like the iPhone X is a SMC subdevice,
and cannot be supported in this way.

The following is supported on A10:
- cpufreq

A10(X) has performance and efficiency core pairs that act as single logical
cores, and only one type of core can be active at a given time. This results
in a core that suddenly have its capacity lowered in low p-states,
so the frequencies of the low p-states must be adjusted.

Patch dependencies:
- The required AIC patches[1] has been sitting in linux-next since
next-20240906, through the tip tree.
- The important serial fixes[2] will go through the samsung tree and should
be in good shape though those have not been merged.
- The optional patch to disable 32-bit EL0 on A10(X)[3] has not received
any comments (v1 or v2).

Authorship information:
- The commits to actually add the dts files are mostly made by Konard,
and Konard's sign-off is added by me with permission. I also updated the
Konrad's email in the actual dts files. Konrad can confirm this.

- Everything else is entirely made by me, including the cpufreq additions
into the dts file for A10.

[1]: https://lore.kernel.org/asahi/20240901034143.12731-1-towinchenmi@gmail.com
[2]: https://lore.kernel.org/asahi/20240911050741.14477-1-towinchenmi@gmail.com
[3]: https://lore.kernel.org/asahi/20240909091425.16258-1-towinchenmi@gmail.com

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
 arch/arm64/boot/dts/apple/Makefile            |  52 ++++
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  52 ++++
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  52 ++++
 arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  52 ++++
 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  13 +
 arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 147 ++++++++++
 arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 +
 arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 +
 arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 +
 arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 +
 arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 +
 arch/arm64/boot/dts/apple/s8000.dtsi          | 179 ++++++++++++
 arch/arm64/boot/dts/apple/s8001-j127.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-j128.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |  14 +
 arch/arm64/boot/dts/apple/s8001-pro.dtsi      |  45 +++
 arch/arm64/boot/dts/apple/s8001.dtsi          | 167 +++++++++++
 arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 +
 arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 +
 arch/arm64/boot/dts/apple/s8003.dtsi          |  19 ++
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  50 ++++
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  44 +++
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |  50 ++++
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |  50 ++++
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |  18 ++
 arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  51 ++++
 arch/arm64/boot/dts/apple/t7000-n102.dts      |  49 ++++
 arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 +
 arch/arm64/boot/dts/apple/t7000.dtsi          | 147 ++++++++++
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |  44 +++
 arch/arm64/boot/dts/apple/t7001-j81.dts       |  14 +
 arch/arm64/boot/dts/apple/t7001-j82.dts       |  14 +
 arch/arm64/boot/dts/apple/t7001.dtsi          | 154 ++++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |  45 +++
 arch/arm64/boot/dts/apple/t8010-d10.dts       |  14 +
 arch/arm64/boot/dts/apple/t8010-d101.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-d11.dts       |  14 +
 arch/arm64/boot/dts/apple/t8010-d111.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-fast.dtsi     |  27 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  45 +++
 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  15 +
 arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |  48 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi          | 227 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-j105a.dts     |  14 +
 arch/arm64/boot/dts/apple/t8011-j120.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-j121.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-j207.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-j208.dts      |  14 +
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |  45 +++
 arch/arm64/boot/dts/apple/t8011.dtsi          | 175 ++++++++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi        |  12 +
 arch/arm64/boot/dts/apple/t8015-8plus.dtsi    |   9 +
 arch/arm64/boot/dts/apple/t8015-d20.dts       |  14 +
 arch/arm64/boot/dts/apple/t8015-d201.dts      |  14 +
 arch/arm64/boot/dts/apple/t8015-d21.dts       |  14 +
 arch/arm64/boot/dts/apple/t8015-d211.dts      |  14 +
 arch/arm64/boot/dts/apple/t8015-d22.dts       |  14 +
 arch/arm64/boot/dts/apple/t8015-d221.dts      |  14 +
 arch/arm64/boot/dts/apple/t8015-x.dtsi        |  15 +
 arch/arm64/boot/dts/apple/t8015.dtsi          | 269 ++++++++++++++++++
 88 files changed, 3257 insertions(+), 4 deletions(-)
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


base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
-- 
2.46.0

