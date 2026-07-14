Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FF2C2349
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010505; cv=none; b=iENJGBAs4USUo+9Xg/EmUc66eXLKi3meRBIA8KCcS9WIpPo+B6gqW3FmXrFYsHmzYDQrac4raeQ7+sqxm9cbCLcynFWw/YU1U8aZ3s5IBJaW7RiikjofIyxl48cTOzAb8YMHjlA5WeyagZW0QeZ03sptaRaPJzdWMcve9EqjL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010505; c=relaxed/simple;
	bh=M0eRETR/rM4kRQsJzoAQ0bq/TtjH3de46IG5ZXvH01A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MXdOXrvRpEOJr/4StOCmehRSIKM7QxVuW/j/5L1cCKh81GzdD7wTeNWKrVzo7Jqir7Y8u/JdQEDOjZct/R967dvdXI6uBDqJ+32tRAhmkIabFA4K1TmjuJI1JF7cf0HraGjGBgMbGzjECfWDmcYiSuslQ4AOIg3d1TwpTJntFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT9x0iVC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT9x0iVC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so34947265ad.0
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010502; x=1784615302; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=;
        b=KT9x0iVC+1NJCupsDGoBVMU1zCRQcLMgFvXkM1WXjnAP19ACCyjSq5KLRO1MEAG7YC
         6XVcHIqZdANJ1MVBAUVX2/c9CsV8/CnD9dJh3Qa3FEjSDJXHxQmdOr+acHEL7hDCQIdE
         nMH9jIIDjLopxbWHl95NqRqj06S9CqJsAbNpMrAoh8bCCYEg4iXY0wnT1XFa4WOzLfrV
         M1M4kcy6ZY+HZ+65vwivUKRHdKI2dItmnpnpdQpmykeQQR88XtH0hd2FfyQMrVHmDw0r
         jVsJRx8JUF/NK1E9dUIU2/YmyhqhFVz1gIBPcRwCyMAM4gM342HLqQU4+TVwy9O2jlTL
         RbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010502; x=1784615302;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KN+zGCwqnRr77YLBHNGCvv6ivP6Fw2MCgfq05HPwV4M=;
        b=rrRWgWnub+5AkLNrGRAOU9aIabff+D8hc+RCT/Sdu+ftDVavfdo52fpJu8M6EEbXFP
         ceDvwCVaFHduxJOt2ScPtYFObyW6m5NcHOmiBZmL8oLLTNQ3tyms88N74VdFY0U6jUfp
         R0YLJmK+cFm+0uEQLL6no9i+0LoE3wJpoQm1mjtpDsamogma9+HhQ1JBhyBo9ywDsHbp
         Z7APEo2GlzNXTUlYpmIvNHDP/+cdOOukQG+TkS+tVZiVOFuNfPfZ7EuO/YYoVGbxd5ZL
         yCcVc0t81INVPWSUS+FYonh6qd6VGlKwxt41guf9NMYpKuw/pFIMC4QxEwHEzwQs/Ie8
         LX/g==
X-Gm-Message-State: AOJu0YzLWOU9LzL6iHHlvyd1PvlIwZtkUtGXXP1ZF9JrjvSHuJuIOzXW
	Tvnp90kdh5hHug6FwA5INd4kd9+QvMNnvBAlzpMnBJh356EeQ8QYQd/bhvC4zA==
X-Gm-Gg: AfdE7ckKvBflVpr8i6IIJYPx5icsmXJ0pnTDxSLOK9RP28TfylC1EZRUi3XowGcrzeH
	PhFIZ1OFD4YSWrAyuYoqBxVQ+u6z0Y/CasiOIMWdLmcgqSJPMLLwQhfJNZDchHVltEjzL9s3qlJ
	x941CXWcivt/u3p0KEp3OmHwwrGh++VkwRbq/xPfJs6gF43OdEbV6WM0EprqHpISJV25TpVIcjB
	crq+geQ6oDxpMkV+g655hB3RO7w4zHhdkhGHtuM9jtVMBbcbRkOB2XHN8OshMmjohNoN/zLmKLN
	EsRO5UaioheGV0Z9jfbLmEH2q/1js+mE11sczgs2RUGuwwfLLZN8h96PXuEl+AGOXs8aDNivXt1
	u0BRWXjOMJsYeQ0L40kMFvNRVGcbrqgCGJ5JjBabDl9NSnEF0NMTNKRaXfOVpiw0ufSMvxwvptP
	VUIDQRRU1MpBR6GvFrAHvfZol0RIl66Vq3Kf2kKM7EOquNgUvkl1tMp0ftG6ls852Y/u7URACJJ
	P0DRyRsIyDxBH5vURntMbbo19Lb6g2SVLlBiUZA19GlS08itMvIZIp/Dsqnw8m8
X-Received: by 2002:a17:902:f605:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ce9eab85f7mr116798135ad.13.1784010502236;
        Mon, 13 Jul 2026 23:28:22 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:21 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/12] arm64: dts: apple: Add SMC hwmon nodes
Date: Tue, 14 Jul 2026 16:28:07 +1000
Message-Id: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jHTKm3iyv8wLLAdYIw80mKjI
 fy7BdcuT3LuuQtEDsIRLsUCgZNEGYcM+lCA6+qhZRSfGTRpQ1ZpjL3D+Lp7TuhnJFefLRldatV
 A3kyBG3nvvVv14yw/2M1bZDM6ifMYPvthUpv3r50UElprTkTGl9bZa9vX8jy6sYdqXdcvU+5WB
 7wAAAA=
X-Change-ID: 20260712-smc-subdev-dt-0ca47062521f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5470;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=M0eRETR/rM4kRQsJzoAQ0bq/TtjH3de46IG5ZXvH01A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1/7wfGyQCeixe5ykE2YjmPf+GPu3ZPHj13K8VsQ8n
 VD3VPhBx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKoZ2Bn++2jMU27IMtfi+56cPKHKJdSc+em3U+Z1Mx3kN6jf/yezleGf6bfj39b
 lNC+/vtttxaaV9x+xf75jfCMuXti+ZEWzhcsENgA=
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
Changes in v2:
- Fix M2 series Mac Studio fan includes
- Link to v1: https://patch.msgid.link/20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

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

