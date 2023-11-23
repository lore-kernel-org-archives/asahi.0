Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01C224E1
	for <asahi@lists.linux.dev>; Thu, 23 Nov 2023 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="XxkZfjLN"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 77D794195A;
	Thu, 23 Nov 2023 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1700735170; bh=AQUS7y0k1D4MxuZLfUGrxD0KkPeCCI69rVkyOJ2dp5w=;
	h=Date:To:Cc:From:Subject;
	b=XxkZfjLN/KFIvWV/cnzEOI8m85rzPVQOovz/fF44BuflyZK6BuHYiHxlfddFyTjO4
	 B2V1TesljHfkniG0zJXmhOC7a4YLM0QE9iThvzZ9PSh8RoCbRYTUM7w1xrB5sZ8tFU
	 smgFa2bmXc5BcLdcSVUL97vkZXFaWzvOqyC7s7Mqlo9aHhNRT+WM7NJoTimAyAFMbi
	 sRKqgjFuAWM1Nk6gb4CdaH8IVktyJCzWRY2AWXKRTRCCQotXFjCM+Ct9681zCB2rgP
	 +cAVr6v+IVrmhMMaXZ8fQ2myhf8ewN2jCOqS17Qcj8TsELs1OVI1iShWXn5yI0Y8ZK
	 jMv4lrxjWD8ow==
Message-ID: <6e64472e-c55d-4499-9a61-da59cfd28021@marcan.st>
Date: Thu, 23 Nov 2023 19:26:07 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: soc@kernel.org
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC mailbox updates for 6.8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi SoC folks,

Please merge these Apple mailbox changes for 6.8.

This moves the mailbox driver out of the mailbox framework and into SoC.
This was long discussed months back and has been cooking in linux-next
for a while, so it's time to get it merged.

Rebased on v6.7-rc1 with only some trivial Kbuild/Makefile conflicts.

- Hector

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-mailbox-6.8

for you to fetch changes up to 4dae8c047a70307d83d912afbda2e2c94de155b6:

  soc: apple: mailbox: Add explicit include of platform_device.h (2023-11-23 19:10:47 +0900)

----------------------------------------------------------------
Apple SoC mailbox updates for 6.8

This moves the mailbox driver out of the mailbox subsystem and into SoC,
next to its only consumer (RTKit). It has been cooking in linux-next for
a long while, so it's time to pull it in.

----------------------------------------------------------------
Hector Martin (5):
      soc: apple: rtkit: Get rid of apple_rtkit_send_message_wait
      soc: apple: mailbox: Add ASC/M3 mailbox driver
      soc: apple: rtkit: Port to the internal mailbox driver
      mailbox: apple: Delete driver
      soc: apple: mailbox: Rename config symbol to APPLE_MAILBOX

Rob Herring (1):
      soc: apple: mailbox: Add explicit include of platform_device.h

 MAINTAINERS                        |   2 -
 drivers/mailbox/Kconfig            |  12 -
 drivers/mailbox/Makefile           |   2 -
 drivers/mailbox/apple-mailbox.c    | 441 -------------------------------------
 drivers/soc/apple/Kconfig          |  15 +-
 drivers/soc/apple/Makefile         |   4 +
 drivers/soc/apple/mailbox.c        | 437 ++++++++++++++++++++++++++++++++++++
 drivers/soc/apple/mailbox.h        |  48 ++++
 drivers/soc/apple/rtkit-internal.h |   8 +-
 drivers/soc/apple/rtkit.c          | 133 +++--------
 include/linux/apple-mailbox.h      |  19 --
 include/linux/soc/apple/rtkit.h    |  18 --
 12 files changed, 533 insertions(+), 606 deletions(-)
 delete mode 100644 drivers/mailbox/apple-mailbox.c
 create mode 100644 drivers/soc/apple/mailbox.c
 create mode 100644 drivers/soc/apple/mailbox.h
 delete mode 100644 include/linux/apple-mailbox.h
