Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F4B67E;
	Sun, 18 Jan 2026 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764714; cv=none; b=JZ8Oe7XSAoF20UTc6E+XUC+xVPix0s6aCX9eFsdY6Sv+gN2qCG9V4H+L1cMft1/VmvbcQGx7pN4/vNpC6mjSHcShWvBAh6j4W9xja27SHw/4CgZSwpqJ1EpbDQPibmb6wXx/vN1EQWTa2jUGnbTzfEMtEP8xoP4L49PNoTpIDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764714; c=relaxed/simple;
	bh=ZJedKhor0hFbcWQnMqk/6K7m0yqpBrQQok7RTBYTaoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hd/RGp1NECwT4k92LlXVQzGOgGca0Qu4l8lKHXSkR43HSnhuKSHno7OEBW/MOTW2ckNROT1Jcr4Kbmwb0ma0FG5qVws+xzE72GRyo43X9crDWT4Ub5WMPV9/ulWtqwPP+lWOv92fXMZegPvzJKswRhVHbBjIgoZWI0O97MVDV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axsolNav; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axsolNav"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF80C116D0;
	Sun, 18 Jan 2026 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768764713;
	bh=ZJedKhor0hFbcWQnMqk/6K7m0yqpBrQQok7RTBYTaoU=;
	h=From:To:Cc:Subject:Date:From;
	b=axsolNavCdqf9ppVhMPvMGnZmspNCyHIZhWXJCUp1/mcE8rOyxfjTIVPwX+gxRPoK
	 bPq8tiYdHv8Ud631oNMTkQZ6e/T4nZyC5a578GyfenG5iyajIRF8UhS6na898wSMIO
	 mDPC5fJbD3Spbv4Gq9tuFmmemmEVbHkO3G37//ZhYFhAe3GuJwINtcTOnsHTs8LrNe
	 GZOQhixHE93qlvurUiEces+qMqq5wl2G3cY8n3Q0EAfYAYWNtJWaEasvQECjq63Qfz
	 jwPTAwnFO82OrRqIBmwKHu+Ei2Y/NbePvyts1Is4MwtyzJfChBNlHMwjDt/3534tld
	 5ZJ07YL9DbPDg==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC defconfig changes for v6.20
Date: Sun, 18 Jan 2026 20:31:26 +0100
Message-ID: <20260118193134.64343-1-sven@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-defconfig-6.20

for you to fetch changes up to 8c7a1d258d88b5d8e5b78f86d59cfac8eb361a61:

  arm64: defconfig: Enable Apple Silicon drivers (2026-01-08 21:19:14 +0100)

----------------------------------------------------------------
Apple SoC defconfig update for 6.20

- Enable most drivers required for Apple Silicon as module inside
  defconfig
- Enable the power-domain driver when ARCH_APPLE and PM is selected
  since it's critical for booting these systems

----------------------------------------------------------------
Janne Grunau (1):
      arm64: select APPLE_PMGR_PWRSTATE for ARCH_APPLE

Sven Peter (1):
      arm64: defconfig: Enable Apple Silicon drivers

 arch/arm64/Kconfig.platforms |  1 +
 arch/arm64/configs/defconfig | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
