Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1434BA24;
	Fri,  7 Aug 2026 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119594; cv=none; b=ogi5/RFvAitBUor/9pM6O4v3WWjG5em0Jtujxv5npHKJ5oTqWzpTv6OWgjgCYD+Jy6dK9lM8Oh00r14CYhErizxL3qDAZ/Fw5tY/pLOkiGQX0EWhLHQkSBRVGRh7k+e1tgGswQf2XQDJ2UJcNem51DM44qm30O3OuF4DxPuEspU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119594; c=relaxed/simple;
	bh=vgcmA0eOBpUZrE8nf1hpZyBcMPFzJuXOy+6I4lNoyZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnBG58/lJAHewyKMm2L0LxES/NifMaffeEy9SSuOh9qBJiJxLraevuBPPL5zVKkfMpnK6Dpczk9iIjJVPvRbXJW5zYd17s1KVL544ubv6dxouIyBjoPMIylwbp1HzZm4p4D43UdHJmrqVAQljH3Y//A6KJ+NbF3taZiSRERnl9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgVQxQPb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgVQxQPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EE81F000E9;
	Fri,  7 Aug 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119592;
	bh=jKUy6tbNyU7rIJ/Cs1K7IrSyeblfGGIQgQv6PZPPib8=;
	h=From:To:Cc:Subject:Date;
	b=MgVQxQPbaJjohvvWpFSWiw6Bso0yMXSIA/GbHHYlmH+ac0T38oT0YtJj2LXJuqBOW
	 NZoRlwSHVB9I6nwIB2V7hQ6CAJPHEBKmlAlxKVI3ugll5lB+QJHunJyvp6KVN1u0Ia
	 c40S3IASCM+5C0T1nQk/DpOxs6su9SSswLcfw33ls3KZGURvaP0ZsTcAZrDxZrSQ42
	 iTgCUkT/eLm8eTKLglQB4UzXMkGcmtU2DrbrTK2MNDYbMx+48xEGAOPtY7Q9tbblqU
	 EZqFrTkyTSKNJt81zoRaA0PJkooFrYbb0gbjIqZ64fDN1mSjwMIg57yU76VeZghvBS
	 ejaF1b5v5314Q==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC fixes for v7.2 or v7.3
Date: Fri,  7 Aug 2026 18:19:35 +0200
Message-ID: <20260807161937.6419-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Sorry for the late PR, I totally forgot about this single fix.
Feel free to pick this up for either 7.2 or 7.3, it's not urgent.


Best,


Sven


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-fixes-7.2

for you to fetch changes up to 09780b4b4bdcc7848249dfc8e44b4d55aa388024:

  arm64: dts: apple: t8122: Fix I2C resources (2026-07-05 16:26:23 +0200)

----------------------------------------------------------------
Apple SoC fixes for 7.2

Just a single commit that fixes the i2c IRQ and MMIO ranges for the M3
SoC.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Michael Reeves (1):
      arm64: dts: apple: t8122: Fix I2C resources

 arch/arm64/boot/dts/apple/t8122.dtsi | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)
