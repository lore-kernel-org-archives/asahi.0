Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69B17AD8E
	for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466830; cv=none; b=bDT6HI6V5BZhAVwH5ti7+ZUm4HKUNotstKj7dNl7oivnTw9rCqWnwpPvYkTsv1rFCxWeRV2la7WKzFOAYxWwxzDBBiyBeNXe02DXVXoYxxwk8dVu4/uU52bLmDrle6J4ObT8yNOMjKPot2TwkD5OtBAanvwYEo+/lO0EY62kfjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466830; c=relaxed/simple;
	bh=wszhNZ4MU9ddNHRZ14s0fd0fyOXux/wMrPcWH5LuASo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fhptvEq1YkXZ1xLH9nRQVUKPo+/ypKZ3186Xp8lbWJT7GRBVi1Tu5y5cNCPqdNDIyX451nVHyCG2cbtJFHxO1j34Zf9Kc63eBfr9Dbp3sQbr3QG5P1iMtfa+PsryCFYMI9rsN1vE/3IDif2WLmof/UGOWEHUrTasclVWgbchpP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/caDXfU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/caDXfU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4D22C113CC;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713466829;
	bh=wszhNZ4MU9ddNHRZ14s0fd0fyOXux/wMrPcWH5LuASo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s/caDXfUw0cCsG/LfZ6wi0j0Gv/HVlxAz8uEGr2raLQd8BWZksFGhYP4bbqI0DQsU
	 nIiq8RqAWWyuFFFtyLDVboqKIIQoowLf+uH9ruQ4YnmMa1OlPLxJvq1zPSXjFX9Rtm
	 +dUkQpVjnTQuwzQnx5ZHZSNu1oBS2YJLkSRfqa8X2LKVo7yNLbcUv507XqHZo60zGZ
	 LnX981bOLn9/mtVJYagSvGlojWfWJFYtnl96c9P5rJycO9ui7Hf5/4/FJobJy+hePy
	 2aTXksjTr+zEyxjwnJqYU0vAqoq17WaJEDaN2QZKMPbF36UFh3nNr42Le9FLBttPmc
	 k1tgpVewZ0apA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DCDC4345F;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v2 0/5] configs: apple: Switch to standard boot + small
 adjustments
Date: Thu, 18 Apr 2024 21:00:24 +0200
Message-Id: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhtIWYC/3XMQQ7CIBCF4as0sxYD2Ghx1XuYxgAd2jEGCNRG0
 3B3sXuX/0vet0HGRJjh2myQcKVMwdeQhwbsrP2EjMbaILls+UlcmI7xiXcbvKOJqU44OyouO6O
 gXmJCR++duw21Z8pLSJ9dX8Vv/QOtgnEmTHeWxoqWa9U/tPf6dfS4wFBK+QIaqNVNqQAAAA==
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, 
 Hector Martin <marcan@marcan.st>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=j@jannau.net;
 h=from:subject:message-id;
 bh=wszhNZ4MU9ddNHRZ14s0fd0fyOXux/wMrPcWH5LuASo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjTF3NPdi/s+Tp3ip9P+1DI5a0PW+fa3czZtVSk49cziq
 4nwbuf4jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPR/8bIMCd0p0CaYGmD2zdJ
 HjH2N6eZrwvUZl2bNq+k7L2okbDxeYb/MReaj1b7zt54LvJ/XXcw/xem5T/ezb83fV5fu3qe5lc
 eXgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

This series contains a few misc config changes for Apple silicon
systems:
- switch from the deprecated distro boot scripts to standard boot
- allows EFI console resizing based on the video console size
- enables 16x32 bitmap fonts as Apple devices come with high DPI
  displays
- enables 64-bit LBA addressing

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- added Reviewed-by: tags
- switched to BOOTSTD_FULL to enable efi_bootmgr and make interactive
  use easier
- override BOOTCOMMAND to not list the bootflows
- rebased onto v2024.04
- Link to v1: https://lore.kernel.org/r/20240317-apple_config-v1-0-1b862bc140a9@jannau.net

---
Hector Martin (1):
      apple_m1_defconfig: Turn on CONFIG_SYS_64BIT_LBA

Janne Grunau (4):
      configs: apple: Use "vidconsole,serial" as stdout/stderr
      configs: apple: Enable CMD_SELECT_FONT and FONT_16X32
      arm: apple: Switch to standard boot
      arm: apple: Do not list bootflows on boot

 arch/arm/Kconfig           |  2 +-
 configs/apple_m1_defconfig |  4 ++++
 include/configs/apple.h    | 24 ++++--------------------
 3 files changed, 9 insertions(+), 21 deletions(-)
---
base-commit: 25049ad560826f7dc1c4740883b0016014a59789
change-id: 20240317-apple_config-981fcd9028b9

Best regards,
-- 
Janne Grunau <j@jannau.net>


