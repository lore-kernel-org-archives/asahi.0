Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328D231A3B;
	Sun, 25 Jan 2026 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769377810; cv=none; b=LY/5sEWvDoO3yRxKONv3kuJdG5z++uwbQeToxlnFG3IyUuIUrYG+xnNv8TQAtkpdMecdlUY0sJW2k4NZOIKIa/oOmenE7AlIhC1svLzsfXHNZyd8BwydP/Q2OeJtK5cyCixInKBL07KihE1m6Fa7U4xPZZ8Vur9O+VL+o7zkWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769377810; c=relaxed/simple;
	bh=K+L+r3Aw3bizzNvK17w9PWhseeifQb6ZXxs8qMco0Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6tj0d3GAKt4YMYK4Dy09iAld0KnX9LUrr2++sYdhrjj8jIxhkW0FDfdSyjy9g0DWMpM29JJpDwZuZ0Tdmy8fjSGRpwuOo/xYAsr/k11ao3UuuhhpmTxSfy75l7GgiGspEIUehWSQPoi+qt0jCm+Wqtnak/qAeALyvz/2ErZdGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc5ol6QS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc5ol6QS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A4AC16AAE;
	Sun, 25 Jan 2026 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769377809;
	bh=K+L+r3Aw3bizzNvK17w9PWhseeifQb6ZXxs8qMco0Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=Pc5ol6QS5FS2sJxAgeVJ1uqY+8nhzF/wpHUqCom3NdmLPrsbJArLfcMSG370vJv4G
	 WuoMZhBUHxLuUgvrHfErYelopvPBHQ7Qpf0nBgZVLi8Sa0y6J/bUIZ9qNkGJTIHUpa
	 EyQGKH0RmXe6/R5GfxyAr5SzXx+dndNFXqPoKJT3VRFPHnwGNjLH+Lwk6sCKYP/6UY
	 zPmwn4N8JJlob+gRqLXnENNeLUwOs4rA3LR9tEQxyf+eM4Pjgq1RxKLSHhenljlI5d
	 1q0576LNq99YQa8onoh3wLCAz8YBZHk/bJPL8xHmg34BAppABnw9fYWvJwAQHHuLuT
	 ZfwUnCqExBX0w==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC driver changes for v6.20
Date: Sun, 25 Jan 2026 22:49:56 +0100
Message-ID: <20260125214957.3367-1-sven@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-6.20

for you to fetch changes up to ba99035bf16ef0d4a7f6acd56fc9292c0bd0d42e:

  soc: apple: rtkit: Add function to poweroff (2026-01-18 20:32:57 +0100)

----------------------------------------------------------------
Apple SoC driver updates for 6.20

- Add a poweroff function to the RTKit library which will be required
  for the first USB4/Thunderbolt series I hope to submit next cycle.

----------------------------------------------------------------
Sven Peter (1):
      soc: apple: rtkit: Add function to poweroff

 drivers/soc/apple/rtkit.c       | 16 ++++++++++++++++
 include/linux/soc/apple/rtkit.h |  7 +++++++
 2 files changed, 23 insertions(+)
