Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F98156237;
	Sun, 18 Jan 2026 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764648; cv=none; b=fgd361TF7ptkEzFGWGT34G1Hi/kLKf0asL+L5bqC6mvKafb1LiE9B2E4uobbH+BfuKdVOLrPzETfTFBvGfxY/4DZfzCsAVsYCvo4A2CBRlCwn2GpGD2eq2GjiyahpWdp2GR7lIL5o2qFI3HnJO1DMsYHXOHuxpxBL50eJkwZ408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764648; c=relaxed/simple;
	bh=BzS2veH6fJ73uCTG1L1aj5hyzDM/AqHNpeoD+lwQGsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfRqp1C/AgD/mpjGef4CDu35zKcXeo1xV1rYuuWEa56lEmVBBJyv7JysOYUgjHd1NPj8XYX1PuUPKKrIn56h33I/e8KgfZQVZ8PwWFmrxj2I2jL5UpZeOLeIsuwZ1Gli90UQbiyZmCjIUXIJln9VWb1drSgnj6BQsQEx9+DLpVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WynWdHoP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WynWdHoP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0818AC116D0;
	Sun, 18 Jan 2026 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768764648;
	bh=BzS2veH6fJ73uCTG1L1aj5hyzDM/AqHNpeoD+lwQGsw=;
	h=From:To:Cc:Subject:Date:From;
	b=WynWdHoP7p2clrLoqfn2zW6G75fk5Ud5WQUV7wej6s96h5Oy/iZMoWwrMXC67r0S1
	 MbXUByeZb/go+h08nO5JiIs/nZGACOr9XHIehil/X48meDRKP189+aQqNRA7I9Lpws
	 zkgMyj4z113rphAka5BrZ83XLR2ctzuIB0DGdvlRqOfWok93drdRjwqKVGEsyw8x2I
	 bEVr4/4jy7jbZR5vWc5aSetdJT5svIKGVXwJw0R/XqnkTcYAsTIAe0mMbhgCEBpQZD
	 LUOHwW2O5Tg2YCrPHvZtkF6UvUAvS1fcmcP65J4rhkVyJUGiGYe6H9s+iFFWtmVhbE
	 8s3erwVK8lKRw==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC DT changes for v6.20
Date: Sun, 18 Jan 2026 20:30:30 +0100
Message-ID: <20260118193032.64139-1-sven@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-dt-6.20

for you to fetch changes up to 1a1b4d40b8e4566b6e55ca5c588c5a1943aa2f8e:

  Merge patch series "arm64: dts: apple: Add integrated USB Type-C ports" (2026-01-13 08:03:14 +0100)

----------------------------------------------------------------
Apple SoC DT update for 6.20

- Add all required nodes and connections for USB3 support. This is
  responsible for the majority of the diffstat. The dt-bindings for the
  Type-C PHY are scheduled to be sent via the PHY tree and are already
  in next.
- Add RTC subnodes to the System Management Controller
- Add chassis-type property for all M1 and M2 machines
- Fix some minor power management issues
- Add backlight nodes for the A9X-based iPad Pro

----------------------------------------------------------------
Hector Martin (3):
      arm64: dts: apple: t8103: Mark ATC USB AON domains as always-on
      arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
      arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports

Janne Grunau (7):
      arm64: dts: apple: Add chassis-type property for all Macbooks
      arm64: dts: apple: Add chassis-type property for Apple desktop devices
      arm64: dts: apple: Add chassis-type property for Mac Pro
      arm64: dts: apple: Add chassis-type property for Apple iMacs
      arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
      arm64: dts: apple: t8103: Add ps_pmp dependency to ps_gfx
      arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports

Nick Chan (1):
      arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a

Sven Peter (2):
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node
      Merge patch series "arm64: dts: apple: Add integrated USB Type-C ports"

 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |   4 +
 arch/arm64/boot/dts/apple/s8001.dtsi           |   7 +
 arch/arm64/boot/dts/apple/t6001.dtsi           |   1 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 150 +++++++++
 arch/arm64/boot/dts/apple/t6002.dtsi           |   1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |   6 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi      | 212 +++++++++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 236 ++++++++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 272 ++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 417 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  31 ++
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 133 ++++++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi      |   6 +
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi      | 212 +++++++++++++
 arch/arm64/boot/dts/apple/t8103-j274.dts       |  13 +
 arch/arm64/boot/dts/apple/t8103-j293.dts       |  13 +
 arch/arm64/boot/dts/apple/t8103-j313.dts       |  13 +
 arch/arm64/boot/dts/apple/t8103-j456.dts       |  13 +
 arch/arm64/boot/dts/apple/t8103-j457.dts       |  13 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 134 ++++++++
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi      |   3 +
 arch/arm64/boot/dts/apple/t8103.dtsi           | 111 +++++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       |  13 +
 arch/arm64/boot/dts/apple/t8112-j415.dts       |  13 +
 arch/arm64/boot/dts/apple/t8112-j473.dts       |  32 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts       |  13 +
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 134 ++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi           | 111 +++++++
 28 files changed, 2317 insertions(+)
