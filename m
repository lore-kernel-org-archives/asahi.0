Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC29322DBF
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604089; cv=none; b=A6Z/i3bNPCWlBbH+EUM+hU5ATkxuN7n1ueH9J/FN0sVsKDnjF5+Zkcl8VEmUf/9nd5eaYhJM1L5zwGy4FIuRxzLJ3+cvh5gGkeDcCcqadxlbu5f0dvltgAWX7F0AknJKbo6J4ubWHS89+E4YDhdUrG3Y5uh26frM+awtcpVyyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604089; c=relaxed/simple;
	bh=7ZN9mquuvmQGhl/5cAieHoqLnblhiM9pvWAqAoyRNDU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d0WTaBK6IvoCQzjb1oUUnFNQL6uK81aZahKQty62ADKeR/lYlFfoxwGtlsHHHSey+eNnT4w/mV86QVME8ZNW+m6PJcgGEJYTV8SoROGKLjnM/ZyU1eQQ2cV4z0kIiFaQmr8Xcb+IN9ZiHuewnBW98ugFrZ7u5FIJSsK7rdvDFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E92lgGPK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E92lgGPK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2ea79219so5907035b3a.2
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604087; x=1756208887; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=;
        b=E92lgGPK95J5B4YjVFaVJe2wLTy9727dlbUtr3YimaYWeI0KNoLc9jrVEnPZNhPIS1
         S9PJVEWMwqQ0RmHui7beJ/W9xVADa2C2Zi46+QL05Gg6RxKqZcSwpjd0we6IzLRVv9+U
         JOoth27jcMGKsG6YGe8DFpIA99eeCOXbhYhVeUXU5q8oMR4ZkeBivM+RkJZwouXDAe8w
         Seosj7F0P2j6hNz2+brG5pbs52NqWR5LKNxJA7cdKwgDkS6CW24798dW5zRnY0CFynPP
         /hmU8XtWbxW99Q60wT56OPa0D6+KeY+zjU3b/uPNivixUlRkUU/yT/1txd/UZMgzGR5H
         6VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604087; x=1756208887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=;
        b=p4B+sFdIojgG592sZEE1AIz0qmQeFW+4PsYst+mnfKbqysazgh20hO78sL9rpMZGAS
         u6vl63hpOkkyYjh0PHy6cXC2vquGbvSeQjNQLD1QssJ3fFOosBkQ2ueWiZpRq8qmlbeD
         Ijv1pU0de0QW3M+q2xmHgGyHsGf6078EqYTcFf1+Olu4vYMsokdHUD7+R8xfPy/AilsE
         ieBd4B+0beTbegQ5REKyQW55vSZSNf5LeYdPhcImnIk6s2Wp5RrFu7VTW3BzKLzK3nTs
         zngWfqoOCKEVUlr5wMjchanPJo1ekAWKSUathKCbHdj/C0Np1vWZsWPi14aEwLab0QFK
         Y5tQ==
X-Gm-Message-State: AOJu0YyhtJd2HqvQm0s+GslsDViyAdpbpafJqXIGOH11cJx8M3vAN15B
	ufq7eTAymhmuzQGMG4LQdwW0VP3AEbHW4EK8brjWtYEzcq2c3XLOxNPt
X-Gm-Gg: ASbGnctRmjTUH9KaEj0cOVyxDwQy/YNKqeJfXH6EcaVa0H73eGA7sTPnbalvOeC2iWe
	MO0ZnWApCoOvT1VlEfbqFb3Y1ViLAYq1hwPveFr0d1WeW4hcGV0CNDPMXOlpCnwYsiXKRd0ZnsT
	brRKzXL7ylkJ94E7f0+47CUpHwH2nlEGxpZDulhwOawOp+Piq6upWxdVTw9qA/dlx6iSeCk2UP6
	XmIf3Qz6vSwapgmzCTi4mkFhFJM0NuNJpWPr7kfbqbXXwRH8s+BBWk+79VoOqdejuuZuq8A/3Nw
	GMEx+NW0RukFhOvFiQ9Sdihwnsvxv3hMjKA6m/wbi98FNIiUECBNBDujSJy84TtwAaaGC0JaWkD
	df1KDE8QOsGe9QAyVRyRW8Z5BfLyYp2mqcq3PpYeqOkW1CUtFk0gAS9Qk0OIfgrHMtzBYreJyCf
	mH2em1pcicGQuPuvNO2MECgdvmpzBnjGXZG3DD
X-Google-Smtp-Source: AGHT+IHTftf4N5GtR12Y+/exYwqwrBeyGH7smZ0yJma1RxTQV8AhvHtCqyA7wcE9I8tc1xaJxOtv7w==
X-Received: by 2002:a05:6a20:3943:b0:23d:ac50:333e with SMTP id adf61e73a8af0-2430d4d57b3mr3359435637.43.1755604087256;
        Tue, 19 Aug 2025 04:48:07 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/8] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 19 Aug 2025 21:47:52 +1000
Message-Id: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhkpGgC/x3MPQqAMAxA4atIZgtpRSteRRw0jZrBHxoUQXp3i
 +M3vPeCchRW6IoXIt+icuwZtiyA1nFf2EjIBoeuxtY2ZhtJNzJ6TYFvNa3HyhFaH5AgR2fkWZ5
 /2A8pfUSAoVdgAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4439;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7ZN9mquuvmQGhl/5cAieHoqLnblhiM9pvWAqAoyRNDU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvIqW5TYMuxC+++cFnu1f/ZGP9Mf0p8qr9deu7V4e
 rnMe6abHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEwkRpaR4UURzySBlincJoWh
 R9jTOSdsW5V8vn/eA7aJYZ0PeO6ohTAy/Pxw89OhxYoaU2boSRx6daOlcFV1cd+FzxpbulfdsZJ
 /zAMA
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
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (4):
      dt-bindings: hwmon: add Apple System Management Controller hwmon schema
      hwmon: Add Apple Silicon SMC hwmon driver
      arm64: dts: apple: add common hwmon sensors and fans
      arm64: dts: apple: t8103, t600x, t8112: add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  | 148 +++++
 .../bindings/mfd/apple,smc.yaml          |  54 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 MAINTAINERS                              |   5 +
 .../boot/dts/apple/hwmon-common.dtsi     |  46 ++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  27 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  21 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  43 ++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  19 +
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
 drivers/hwmon/macsmc_hwmon.c             | 858 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-hid.c          | 210 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 36 files changed, 1697 insertions(+)
---
base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

