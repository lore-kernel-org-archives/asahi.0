Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068053988FB
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849452; cv=none; b=OVx5PFtPfPcKJR8mSkSm/vVZLU3a2Lb4wrs6oeuFgiZbeaNNXy6lqOPtzMIlkFDspsDWy3SiQAp2iK86YUGmUpEy/6ShlXTypTeeRMeULZJDb4cbhvjnM+uM3l3oqgLQ5GYxJDcLGQzupRCWA3tPnHF5JgfanvbKbTQc+PICPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849452; c=relaxed/simple;
	bh=YNi+KaL09fSqJUFhYIm9Pv1YZHlYeYppyCtgEVXaTS0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCxIXx1jPMXBGj4VzQxlmbZOgPYMLbUn1bQel9+miBl9kHmX65a31dqen3DZZcUMXsWUCiUtuHYxKhxWhZLWvcI476ODUnLxmVYspWAmfJgJ/fWs3IcyGDCJDC7KcIOjRDfHrusk9X/+okgC0gLTvp4X7Rp7fudBrDY+n5rrcoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY5l2/Cs; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY5l2/Cs"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2138978a91.1
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849450; x=1784454250; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=;
        b=dY5l2/Cstq0p58SxTkEdBn+4wv4LWu2bp08dye3sq/Vlig2/3p2aav0PZDuBjZs7Xh
         d7oyx3TMHQfEZMryGKOAtmSI5bmVuXGRFmPClPGRGkgPEYONP/vrBTi29ArXxJUMv2X0
         F8IhXmiKEn2PQwOTPDOXCRdp2gwmYhcskf1vkFGHocslq85/iNzqMHLRaxfeG8lJWTJs
         Tb7zpgdvB0VVydGHGX5MNKKUdOzLJotshekdCc5Oj39aLhWXCG0h69/NbgU5hmvUtHCm
         5kn6VlWlPW6HLp6fBGM9yJXYtTo6Qv508w5gj32Z8sJXit5JfsljeCb1rDZwRgFcp5qW
         71Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849450; x=1784454250;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rPmXWzvpcr2U5us8E3wSwDjB0cnRDNPHHdHK0WpIwuA=;
        b=gN8kBh/qKHx9sEnk0HTnDR922G6B4URxlia6D/n/0/vngglzesCOCCUbOsmyMQoILp
         7SPnAgSydSaLXErrc8dIg58Dai4C6uWL1xwLEWLcAbKNeK2BpWSffXTarm5lH8qZA9c2
         gCXUUirhlCpIwSrYcQ/y++oD7tIWxe10QYXze29WEF0h3L1vsdJm2uH3dqflQAzcR8Lc
         tY9FfoptJv2LMAhMK5OMSAQ4EcPoesJbg+zUp/DdU+ykChGEep+aJkJtqwgIeUPNnUI2
         vKiCgHJbt31hWGICMM7CmYCz6UsrCv7ptJPIH2TDUpqQ818hVjZAh3hsl9gXbOlHXDhJ
         8+QQ==
X-Gm-Message-State: AOJu0Yys68u4T442tfsfpSL2llK8bREajZmXTu6okwZdeg74upCb5zDk
	X0BZH9NBPbIKEczn33uKQJJfPMJBfH6RQuuN+82WLHBSSYRKatJRldrT
X-Gm-Gg: AfdE7ckxYDA7G8vbBYeMsdOVBWaxhl8/XJq/8KbcDASZCflsj7/jLNZa2GkerkBPZYm
	+INac1jZ0u2gH/3kWFzyybRRz/VXOEHcMs6taL9si2spgxW0Gnx/MLL3fU7EHVoKXp1mbXZI+5m
	m6SCLNIuYor24S0vLnhvjbu1WY7ZUCs+VyxXVF+DHbRG9uz9vCTobAZH/InkJAhjHwPJRYW6M7q
	I89M2BmRmfJHd/GxOlwsG8PaejkJkZCZ7XqQg7ZSdSttjaoi+2e/3urpM4J6bOi/CIhoSi8dPPZ
	IiAhwEwWV0X8VR+8Vzf3xcOMPcxfs28XEu1ShjjTBn2m9Vzto9fXLTxxG/rvE8DaybiWI9k1XBI
	Jm+RcN4rKr3hXKYjZLl4GVShrlM1nSVn8Q0v2/ofi3hUMWwMFc61hLcE8VrXiVz9uxDonUk5E4E
	ozCy1QqG0uOAuIrt7XEG9h+oaabSbS9XqOUDgE8frWp6fbVO41vN/aNMh9ES1oacrbBe7yxoZ7C
	b/ICC9Wjnq4O9wGGjW/V7ZCTYFr22MdKDgHCUc/1NzSZjsOM+KV/JzfvG3ms7IK
X-Received: by 2002:a17:90b:3911:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-38dc72b44c6mr5259932a91.0.1783849450298;
        Sun, 12 Jul 2026 02:44:10 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 00/12] arm64: dts: apple: Add SMC hwmon nodes
Date: Sun, 12 Jul 2026 19:43:19 +1000
Message-Id: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mj3eLcZN3i0qSU1DLdlBJdg+REE3MDMyNTI8M0JaCegqLUtMwKsHn
 RsRA+UHFWanIJyBCl2loAYoy1bXEAAAA=
X-Change-ID: 20260712-smc-subdev-dt-0ca47062521f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4957;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YNi+KaL09fSqJUFhYIm9Pv1YZHlYeYppyCtgEVXaTS0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/eKAhPs7t7/lyq706ND7fYvWe6iLJu0/t0bjtTj
 2HezxeqHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlmX8jI0HxEMYLHwVl16YH/Rd2nXkemhFX5r1Wcxe67+Ml6T88XxxkZ5hg4vev
 jrbwWlvhNxD6le3fgZ0Hu0rP+IT7/zm57sOU+JwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

Following on from the series which added SMC hwmon driver[1], this
series spins out and adds the Devicetree nodes required for the hwmon
driver to operate. These were missed back in December.

The System Management Controller on Apple Silicon devices exposes
the temperature, voltage, power and fan speed data from numerous
(potentially hundreds) of sensors scattered about the SoC and
device at large. Unfortunately there is very little rhyme or reason
to how Apple expose these using the SMC firmware's FourCC key-value
system. Some sensors are reliably common across all devices and
all SoCs, like PSTR which measures the total platform power consumption.
Others are specific to a class of device, like the fan control
keys, which are only present on devices with fans. Some are specific
to a single SoC, and others still are specific to a single device.
To complicate matters further, some SoCs are not even consistent
across devices; the application core temperature sensors for a
given SoC are read from different keys depending on the device
that SoC is in...

Trying to express all of this in every device's Devicetree is a fool's
errand. To eliminate duplication, we instead use .dtsi files to
compose a set of sensors for each device in a saner way:
    - Sensors empirically proven to exist on all SoCs for all devices
      go in hwmon-common.dtsi
    - Sensors empirically proven to exist on all devices with a given
      SoC can go in a SoC-specific hwmon-${soc}.dtsi file, much as we
      do with PMGR and GPIO currentlyo
    - Sensors empirically proven to exist on all devices of a specific
      class go in hwmon-${class}.dtsi (e.g. hwmon-laptop.dtsi)
    - Fan control endpoints are reliably common across all devices
      with fans, which will #include hwmon-fan-*.dtsi
    - Sensors specific to one device only can be expressed in that
      device's specific .dts file

This series introduces some basic sensors we know about to get the ball
rolling. As you can imagine trying to find every valid sensor on every
device and figure out what it's actually measuring is a tedious and
labour intensive process, so expect more sensors at some point in
the future.

Regards,
James

[1] https://lore.kernel.org/asahi/20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com/

---
James Calligeros (12):
      arm64: dts: apple: t8112: Add SMC hwmon node
      arm64: dts: apple: t8103: Add SMC hwmon node
      arm64: dts: apple: t600x: Add SMC hwmon node
      arm64: dts: apple: t602x: Add SMC hwmon node
      arm64: dts: apple: Add common SMC hwmon infrastructure
      arm64: dts: apple: t8103: Add common SMC hwmon sensors
      arm64: dts: apple: t8112: Add common SMC hwmon sensors
      arm64: dts: apple: t600x: Add common SMC hwmon sensors
      arm64: dts: apple: t602x: Add common SMC hwmon sensors
      arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon sensors
      arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon sensors

 arch/arm64/boot/dts/apple/hwmon-common.dtsi    | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi  | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi       | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi    | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi      | 16 ++++++++++++++++
 arch/arm64/boot/dts/apple/t6001-j375c.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6001.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi |  2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6021.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  2 ++
 arch/arm64/boot/dts/apple/t6022.dtsi           |  2 ++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t8103-j274.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts       |  3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8103.dtsi           |  5 +++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts       |  2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts       |  3 +++
 arch/arm64/boot/dts/apple/t8112.dtsi           |  5 +++++
 26 files changed, 186 insertions(+)
---
base-commit: 44696aa3a489d2baf58efa61b37833f100072bee
change-id: 20260712-smc-subdev-dt-0ca47062521f

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

