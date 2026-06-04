Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3028389118;
	Thu,  4 Jun 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568777; cv=none; b=Z/Svj0SNVdyF51zDjsFEwfOutSL0hmeEs93Gub1iZUm0PuCSiE2s+zR9MpYNqe7Ngw+MSf77Vf18dZ3qLJzjbuXkNfJnLQtBL+Vjp1Ll6GNdHuTCeZ7ZmnxSkzyWT0WuqJY8IJw0cDNKJsDracdTOYJMNEI7wIXWH45Sho8PUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568777; c=relaxed/simple;
	bh=rx9XYRZ9P6MsSQlFryH1uAKkyo0nFf5xFk05gwMgjks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UzBQR8q9MoSwmRTLIuQ7XketFV1ifWJ8UIs/M8jnN2zBYgZgjE9zqBbo2MnEgsT/52elvuqSo3+Huh5h+J2N27VpmsP30whHR6y9fyGOnJW4ib93LEe9fTFOIPSthZ0FTz78pJ4nhU5F/Jq3iXtZTeqmZ/KuqGvwh70NBjvdz58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsjDmmXu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsjDmmXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C4A1F00893;
	Thu,  4 Jun 2026 10:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780568775;
	bh=tfu9KnLGfgoGr3OfG2c4EY0cS/9adxdzuVFmvrPD2NY=;
	h=From:To:Cc:Subject:Date;
	b=OsjDmmXu3EGiqTrDmFydvjZVHEoMiUjY1LgfSfDNjor50LcXF+VgmxDc5rjTEjnWb
	 fRwJyKVo5hacT+VJYqCbsH2LoKi7GuQvqsYVLPDWHHXU2tBbp/x9ytgKHYqzfQ7yNc
	 13nCSpNr8P+UCvBy5tYsvEme/yGSXzhNYWduGuQtZPOKA5rJq7wpsjUSo8B4ifdVkU
	 Os59Gp2HoUqGBGLZlul97z8uaNfFutby329qEqVmwCEQQmbkbp5QpngcpNC0a52mTD
	 d1bMb1TwY63+cjXzqAVBRpRDHlBpTMGM5SB6x621hf2d2/YgHtvyW62ZHprlfaL5xc
	 SNbc13/9SIJ/A==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC DT changes for v7.2
Date: Thu,  4 Jun 2026 12:25:58 +0200
Message-ID: <20260604102600.3790-1-sven@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-7.2

for you to fetch changes up to c65ab4905e5874a1a489c72da4d6e78a6c9b5943:

  arm64: dts: apple: Initial t8122 (M3) device trees (2026-06-01 21:25:24 +0200)

----------------------------------------------------------------
Apple SoC DT update for 7.2

Add minimal device trees for all t8122 / base M3 based devices and some
required new compatibles to the dt-bindings. These are enough to boot
Linux on these devices to a simple serial console but future work is
required to make these machines useful for end users.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Janne Grunau (5):
      dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
      dt-bindings: arm: apple: Add M3 based devices
      arm64: dts: apple: Initial t8122 (M3) device trees

 Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    5 +
 arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
 arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++++++
 14 files changed, 1848 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j433.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j434.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j504.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j613.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-j615.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8122.dtsi
