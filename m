Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03B9463;
	Wed, 26 Nov 2025 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191813; cv=none; b=eA61QrVWDalHoVo4e0zCbk4uJwYbgPHlGzIlw/Og9Hb5XANhhoBngFDrp5sdICu5K0cN9dAQiULyu1zVrC4dmIKqAbs4OY/csedKC75VJntSCsqY9oULj/aGQIRw01nIlEb/deko5BsMwpcoYDdePWbGP+NJ1VcCTr2ZgNjzQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191813; c=relaxed/simple;
	bh=6FSXv6lvj8Cxw9bAiqE0JGXXnCopMs910raX/aEiueY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vr1Mlv+GS0cWEVcz+97whRVk9sWHKI/1L21VH2tPEIt7C2aRLniMrHR/1GDVX3lBD054sA9Fh+dXu0YpefWk4Nv2g3uYjDUaXQaQQD9tnaFd/7HUygeVV05kKo2lWQ372hY5QeQBGiWpU2z6V44SQ+AKBi6nNDtfU/jnOXQG8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWO3HjYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWO3HjYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA15FC4CEF7;
	Wed, 26 Nov 2025 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764191813;
	bh=6FSXv6lvj8Cxw9bAiqE0JGXXnCopMs910raX/aEiueY=;
	h=From:To:Cc:Subject:Date:From;
	b=uWO3HjYDThOYfpBqwCtm91Yweuelw481K2wJe9VK1m6sVqnffr5zIpgjGG4v9fgrO
	 kOrwjAd9Igw0VIi6uBggtNY5tutVTD+S4n5xw53rJ+hLK0W3CqyboSK9rAzb8iPO4e
	 c+2CJl5TFMrzbaPVEOSDW+WILmlv0tL0Wqv5UFoiQqgLYtzYasDIOvucKcQuZn86lr
	 hhqJByiQ1s89fbrPRgL+kA20E2KUjjVvabCUobhN4F77ZggEOA23JHnFWnQKSGg36v
	 4exweOY9ZaZN6L44+ODCcQ+NfdXUv0duQTZhe9V0Vu5xwu9NJhYIvm8ZxY0srkGEj+
	 8aeIA6Uh1M0aA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC driver changes for v6.19
Date: Wed, 26 Nov 2025 22:16:32 +0100
Message-ID: <20251126211634.8864-1-sven@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please pull the following changes for Apple SoC drivers. These have been in
-next for a few weeks as usual and details are in the signed tag.


Thanks,


Sven


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-6.19

for you to fetch changes up to f95f3bceade25914cca30c871187b2d33db23f34:

  soc: apple: sart: drop device reference after lookup (2025-10-13 18:32:53 +0200)

----------------------------------------------------------------
Apple SoC driver updates for 6.18

Two small fixes:
- mailbox: Stop leaking a reference to the mbox platform device during
  lookup
- sart: drop device reference after lookup since it's no longer used
  afterwards

Signed-off-by: Sven Peter <sven@kernel.org>
-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS3vz815OHsEaWy0u9EEX0kKnUe6QUCaSdsTAAKCRBEEX0kKnUe
6Q3TAP9LzbLNHLFbDgCQXRRU5Qb5RxakNQ6o6eoyJP2I4C16SwEA0PChp6r/yH7I
US56W3mTG3vlJKag472fLyDmZITkFw0=
=9YPH
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Johan Hovold (2):
      soc: apple: mailbox: fix device leak on lookup
      soc: apple: sart: drop device reference after lookup

 drivers/soc/apple/mailbox.c | 15 +++++++++++----
 drivers/soc/apple/sart.c    | 13 ++-----------
 2 files changed, 13 insertions(+), 15 deletions(-)
