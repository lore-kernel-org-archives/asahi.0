Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38F149C6F
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351897; cv=none; b=uTMt5JLW46fpiCTxp5JV/TPUdKg0O72VUDJa/Tq4R/PRKMaoIvLtiUVXV4PHJK/Lqri0MPBruFB+7w9OJbDYVwvNokVX9hfnICAJDxgi3LE8bSYQihnGHCU2KnyYY1KLwWeIi9YlESGexyVWUfsULDklsXCQp2BOFMSQ3WOvXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351897; c=relaxed/simple;
	bh=NEwP5oOU+xmnrc/qXQvktbP4weR9cV3E4YrWW5t1/y0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t6MUc00JLs6csoKJ230xab1S+HFmJ0lL/sgWTJsRbRqvEJ9uy1DuxCS9Jk4quFjc5PV+MK5VGTdphymaAat86W17apnY0aaGf955PY2aTJUaKu/iGyNPEswkibhQERnGFOFTuZg+5yYe3qTtxRh2zVmtlgvnW1Nr0dKU2i7VI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqzLKqBV; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqzLKqBV"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b62e7221351so2340769a12.1
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351895; x=1761956695; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=;
        b=AqzLKqBVux6PBN/Wx3N211dfNagslCjv4MrynvgWVlm330s+irt8Gbx0mHqzC0++76
         h4M5OtPX2LiUD7cGlWH6Zr517/erUubcDPXYN5smUy7ZqX61/saXm+cI9bbiR7DH66JH
         rYoLyjefuSdreYqZNaG2f4oiw22SNJYDsGK/iJ5VGSp8tzJen1Ak54yRSEXq0+Tc5O6i
         N80F5/OnuMvUnJtBgDe/+VhNcN3XymDlmgMOZuzXuOJ4RbJwQdiILEAJV7RD7IWUeZrW
         l6qXEm3R29YmC3/+CXslGuhbxPWfFMOVJkBXeB5+I0gcLANMSg1xU83F0hV9B92g643m
         X3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351895; x=1761956695;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=;
        b=GFOoZVF/debRg7b5RK1B8tfft2Rjnv3xSyMPuQ8l1MQmd5HoI1ecoonAcc2T5Megz/
         fnhLK6GvCWWD9vLLbqRrAzKTFrtiJlNHECqgQZL0gTsu/yJoEw1tj8Wa8bszEHxyFjEg
         P2cvEdFu02lEvexr4vGcW2FqmtjaxAotxLf3p9rCLmxDPm1fBXkjVNr2+673WmNipHB7
         7RAJ0Vc93nxxansglaIL/XsXZ6z5KR88gMu/eBpvZ/G7qB0tuN0seiL15hx3q/B+Dc+6
         EzXgizMOs7sEpxmjSwZmtvj17j8GNAz0fMBvhOpelxr7FP05OMjr7LHe3Gq5qDIrnnPD
         7RQQ==
X-Gm-Message-State: AOJu0YxknQnVgBmAz45bqx2kAkskbCsKi0GhKRme25OV0wSdQjjf76TC
	qBIuGR3RrNjXxjHC+ePQ+s59VPpnvoDJX/Q0esEy/sm2mct8tf7sgT7d
X-Gm-Gg: ASbGnctA8G3ax/FjX9M/qh8lVrFnJOTGMHE5DiXcykdwNDM6NKk8QlPloua8RWWNbf9
	KBmrheP2ToW3JfyL5e9SrjXA4tC4ScMH2dPynJSWquetoPnXAErKHkWvKivi/tZS2kdSi+QpWAp
	yJeIfGtqCM2Di7dGRrLdlHK7J6fEbhtBbtrhAQ4r7NIO9Pp1buGqJWt7EEizJ85khYm9sXY/bTc
	JpqsrRPneA6CbgHxzebNBiv2uOiF/yaVhalamsOIvUR1MjNYmXJz2+VRg4PZ44aRZRTBs/0nnXP
	foj8S+hI9vJAD7yutiExC/Cx/c5QmjDjoJurEh1QplIgCEKZxUjeEbIWOlZOLs2wGk1tgDxyJyV
	5zIcOc5XBQ15ciljTJdvh1uq2qm3yncF1G7FjO/jR85Gw8nnvi21Datv0jJGJQ/146rfKr8V4jb
	ITX4/fNvPzbJsQZwdSn+51XMzOWHKMqWSrSX281mGXfZn5GzpRzDa6A66LL61+CWUbAhzwUmCWK
	ogtHLfqD5sXLmAp94FGHJTJ30/ZaUMbohVBWIROAvDPGDy2xr0ZTS+4QzzPEHv1
X-Google-Smtp-Source: AGHT+IG8oGxBZCHK7kqo4q+7nyIf3av5yZr0y5kmaXr9sDJtxDyllc6PpENotDwXnMi5ChfG0lIiwg==
X-Received: by 2002:a17:902:e843:b0:264:ee2:c40f with SMTP id d9443c01a7336-290cb46c41cmr333345805ad.52.1761351894738;
        Fri, 24 Oct 2025 17:24:54 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:24:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Sat, 25 Oct 2025 10:24:31 +1000
Message-Id: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8Y/GgC/2XM0QqCMBTG8VeJXbc425zTrnqP6ELPjjpIDVejE
 N+9KRSil98Hv//IPA2OPDsfRjZQcN71XRzJ8cCwKbqauLNxMwlSQyZS3hboW+T+VVoKnmcGlEQ
 QxgKyiB4DVe69BK+3uBvnn/3wWfpBzO8vlW9TQXDg2tgqRUW6Evmlbgt3P2HfsjkV5IpLs+Myc
 iRNeW51gjLbcvXnAmDPVeTWWFVW1hQEcs2nafoC3zuNRCoBAAA=
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7029;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=NEwP5oOU+xmnrc/qXQvktbP4weR9cV3E4YrWW5t1/y0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM6+NW/U/xjeuFezwPXetcrQbzdNpr85Z3RXXNTDQ
 eWbcp9kx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKqvcDL84bp1cj7LobIHoszM/3TLRFmLdQT1nV9Ze58J2CKyQsD4PcP/zEM3tCd
 bFrI83/Kjv4tn5Sq3wwcqfu+u8E+RLNz8QOAPLwA=
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
add an input subdevice to handle them.

Since there are no real dependencies between the components of this series,
it should be fine for each subsystem to take the relevant patches through
their trees. The mfd one-liners should be taken in order to avoid trivial
conflicts.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

---
Changes in v4:
- Added Rob's R-b to hwmon Devicetree schema
- Added missing include to hwmon driver
- Dropped superfluous dev_info() from hwmon probe
- Added Guenter's A-b to hwmon driver
- Renamed INPUT_MACSMC_INPUT to INPUT_MACSMC
- Dropped leftover mention of HID in input driver
- Reinstated input driver MODULE_ALIAS
- Trigger a hard wakeup on power button/lid switch when coming out of
  s2idle
- Suppress KEY_POWER event on wakeup to prevent an immediate shutdown
  when waking up
- Squashed hwmon Devicetree commits into one
- Link to v3: https://lore.kernel.org/r/20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com

Changes in v3:
- Renamed macsmc-hid to macsmc-input
- Switched to pm_wakeup_event in macsmc-input
- macsmc-input now configures its capabilities before registering the device
- Renamed macsmc_hwmon to macsmc-hwmon
- Dropped module aliases in macsmc-input and macsmc_hwmon
- Introduced new SMC FourCC macro to silence GCC errors
- Condensed hwmon binding using $defs
- Made label property optional for hwmon sensors
- Fixed incorrect hwmon is_visible implementation
- Dropped 64-bit math from SMC float ops
- Fixed incorrect use of error numbers in hwmon driver
- Replaced a number of non-fatal dev_errs with dev_dbgs in hwmon driver
- Added hwmon driver documentation
- Added hwmon subdevice directly to the DT SMC node
- Included "common" hwmon sensors in SoC .dtsi files
- Fixed typo in hwmon-common.dtsi
- Added Neal's R-b to series
- Added required nodes to t602x Devicetrees
- Link to v2: https://lore.kernel.org/r/20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com

Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-input: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: Add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: Add hwmon SMC subdevice

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  |  86 +++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 Documentation/hwmon/macsmc-hwmon.rst     |  71 +++
 MAINTAINERS                              |   6 +
 .../boot/dts/apple/hwmon-common.dtsi     |  33 +
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  22 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  17 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  33 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  15 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 arch/arm64/boot/dts/apple/t6001.dtsi     |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  10 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   3 +
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |  11 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |  11 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc-hwmon.c             | 851 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 208 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1673 insertions(+)
---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

