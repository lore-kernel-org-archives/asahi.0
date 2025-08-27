Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6BD221265
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293773; cv=none; b=o2ZPVmPdGZCS7YKHFASDpKPP61K7J/oKUcNeNTKPf59UrWor8M60hPsIgNYHE109j7YOiInvyT8lfJxRNdFUOikhEmb/sro4R2vT12Q7T8Lq6QjUWclTYnqeU3lfwu0JINv7YN1xf/3UOe8kle+xwCqTPxU2GT0ptSBrQUAPrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293773; c=relaxed/simple;
	bh=BRAiQU0QVsPGvQQPoR9GAHwaWmPsrjb1BHI7yNFZ8XM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sqOiqnVZuFSNqXUnJawrXRHJdQikLfFLJ3efAWrS1Vw4IbaB5RiSbuEc16t+2DAqD3gWc8wczwIEyz9ctdKD6BDM7CgYQdcR5JfvwjZdjO0sWrH43o4zXrCnKwS2H7JBJIeRnbQ58dV3W0+oa43HeAqlMl3hZZF9VXTPgpSgYlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+QmbGDn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+QmbGDn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24457f581aeso51271615ad.0
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293771; x=1756898571; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=;
        b=G+QmbGDndhSBBGWgX6nmwlEM3zp2ixkVNi39XT6gJoPxJfEKq7RswpP3UhXeFdg/aF
         Hbqi0bH/6H7vHyRZYPBI13jp+IhT8P2Rdh+hmS9s+ZmGr3ePXqtr3+eKkyxjwrA9+mOM
         wii+8eEZKU9HmckFvtXTBrxiUDxGaVK9W5EilRc/NM18ZrcosAf1gXK6hZB0nr2Ve4T2
         ebcAQjzc6vdWAK1UijWYr2nY/4vncuXJKV/yIV6q009FtyUjg4POwxawdzJHwOzGJ+6v
         JKsLsIMbzZbIWwmEDtDeWgYdab813F3nbwpjL7HOisb6yb6/EUfujJ72nAeqLyx1CaRW
         0XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293771; x=1756898571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=;
        b=FRiqBMTnnsB1shSIQOWiaRiNcUMThNY4zyovKI5UQsvIS+fvJJit3oJ3i/2ZTxmgMY
         IEOhyoa3coXCe4jOfFrwEtmyeJY9phPha48YCsXLmlHouJQgab6zSCP4BEZo5XMTymj8
         jo+xEIau8kY3Pioq7d9RV2MldTR1wzs2qgekZlZ9frxApvNsSAaON1zFR/R0xNjKkjI7
         MVDfMS4eZNVlx/J0SDETWJPb/jCBGLLBQ5bARxLWmDzwGfOhIeVRzOZmAKEM+eI/ahvG
         tj99jqGI0XEZFjfdrEWAYlgR+FujdF/+8QS/77NZECbPCTZjAOoiAPG2atJFAGojmYgc
         IlFw==
X-Gm-Message-State: AOJu0YxjjlxrDp4dEAD+xZUiEMhDiai+pvX8JEGUKfcNU1oAyxAfCsgS
	nVemzTCNS7h59EkPETdnOKTtL27bHsf2Rskt67HM9ZEBxEjGfBJyGyqK
X-Gm-Gg: ASbGncu3a1Z225N1+6rV4V8M8Ylt587n4H3KNv3O4/in4vSthGpuVuR095enesaGlgr
	rJh48CNi9kPJHc+xC5nJjfxf2skuHJwS8xPzmKNmzQHfb4iN0R2oqxcSPkt+Eyqdrk2Xq4i4QMw
	NiuKZEBCRcjy8DfrXsm0e/+Mzwoht1OV1SqbYAmKG/Y/Zi2bhMgn1P6Mug8tmBdawzSwfTyXLTJ
	A25ijhfYnYwU4d3K9MAspBTPoMHx7TbcvY20faH3BHpQfnyvQQpMDqAQn3oBi9DyKvNOW1CGkYR
	DYQo/NMRTA6F0R5I5fqLZwCEpZ1STf36hlkp/ZqaCCM/pu1snbpl8m7KCabrs5yQgq9pPnL3mCt
	0T2saPFg9d3S9ufglJACJVRD0N2IK8v/r7JnpLLgp+PJU+LcqIkegw8gQRw5/VZkrfpvIOkbHS1
	aPxf9/6fzxWJ2ZnJQM
X-Google-Smtp-Source: AGHT+IElvLvJjhBIATwNxcehv3S3PxbMPKCGvTN/sn1Ljet+JleEGuW/z9D2QKJBapZe81dScV+ejg==
X-Received: by 2002:a17:903:380b:b0:240:6ae4:3695 with SMTP id d9443c01a7336-2462ee0cf11mr236066195ad.4.1756293771130;
        Wed, 27 Aug 2025 04:22:51 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:22:50 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Wed, 27 Aug 2025 21:22:34 +1000
Message-Id: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvqrmgC/13MywrCMBCF4VcpszaSpPTmyveQLupk2g6YVjIal
 JJ3NxbcuPwPnG8DocAkcCo2CBRZeF1y2EMBOA/LRIpdbrDaVro1tfIDikclz6ujKKptdGlRm8Z
 phHy6Bxr5tYOXPvfM8ljDe/ej+a4/qvunolFaVY0bayypGk13nvzAtyOuHvqU0gdx1TXurAAAA
 A==
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5218;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BRAiQU0QVsPGvQQPoR9GAHwaWmPsrjb1BHI7yNFZ8XM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXtXPmfh44oNsI75FYa69a2LmLVpXs22bxyzjG1XfX
 vBIevP6dJSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjARz0eMDH9D9etqFb/Pq/9+
 9NDe/Y7aZluOHnPIYq75E8T69+PBij2MDFukv3kcfiUwLW+ZnY/gx7Ctp0O5mFr+Zn3w470/Rbn
 mDisA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series adds support for the remaining SMC subdevices. These are the
RTC, hwmon, and HID devices. They are being submitted together as the RTC
and hwmon drivers both require changes to the SMC DT schema.

The RTC driver is responsible for getting and setting the system clock,
and requires an NVMEM cell. This series replaces Sven's original RTC driver
submission [1].

The hwmon function is an interesting one. While each Apple Silicon device
exposes pretty similar sets of sensors, these all seem to be paired to
different SMC keys in the firmware interface. This is true even when the
sensors are on the SoC. For example, an M1 MacBook Pro will use different
keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
necessitates describing which keys correspond to which sensors for each
device individually, and populating the hwmon structs at runtime. We do
this with a node in the device tree. This series includes only the keys
for sensors which we know to be common to all devices. The SMC is also
responsible for monitoring and controlling fan speeds on systems with fans,
which we expose via the hwmon driver.

The SMC also handles the hardware power button and lid switch. Power
button presses and lid opening/closing are emitted as HID events, so we
add a HID subdevice to handle them.

Note that this series is based on a branch with three additional commits
applied to add the parent SMC nodes to the relevant Devicetrees. This
was done to silence build errors. The series applies cleanly to 6.17-rc1.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Addressed Guenter's initial feedback on the hwmon driver
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC HID subdevice
      arm64: dts: apple: Add common hwmon sensors and fans
      arm64: dts: apple: t8103, t600x, t8112: Add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 ++++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 MAINTAINERS                              |   5 +
 .../boot/dts/apple/hwmon-common.dtsi     |  37 ++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  24 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  19 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  35 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  17 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |   6 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   4 +
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |   6 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |   6 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc_hwmon.c             | 848 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-hid.c          | 209 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 36 files changed, 1637 insertions(+)
---
base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

