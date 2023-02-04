Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1A17F
	for <asahi@lists.linux.dev>; Sat,  4 Feb 2023 10:08:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id F25524265F;
	Sat,  4 Feb 2023 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1675505291; bh=7/PAeC2Vz0jDqQAqtgjSWco24LeUmkyjQdKv1LGxieM=;
	h=Date:From:Subject:To:Cc;
	b=gvUVr5ggkxbv0NMr0OGHgkpxFvhDdOywF1QRKSjg7ZP+QkmRS+C3eLMoJRfulhnaR
	 NySTMpZxRSVBxUzkdPhZKmF0Kzn0cPMqPgP8oBqEHqapgrMK3TdA/UNzqQNbEvi6ae
	 gPovATBOnSkcJqMPNo55rET/Qz5rTLIl6Op5WhwQpoItL5Rl/yKV+fvYjdZsdlwhuA
	 HeuJ0GMg0B/d+yeLhWdglVqJCreHruhkwgNmyG8xq+cgvd3OxrBpRob8ct8kbH5Loz
	 1lNhRmvsmxjigXGCEYeasBBa16KxLr0MMXWiMT7lt0Xoo4Lsr+t5juTk8yDIPlc2Az
	 i6+EL/H43Um1w==
Message-ID: <4790bdc4-b6e2-228b-771f-023363f65fb3@marcan.st>
Date: Sat, 4 Feb 2023 19:08:07 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC RTKit/PMGR updates for 6.3
To: SoC Team <soc@kernel.org>
Content-Language: en-US
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi SoC folks,

Please merge these driver changes for 6.3.

This batch comes with mostly RTKit changes adding APIs and features
needed for upcoming drivers, plus a PMGR change that also unblocks some
upcoming changes.

-Hector

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-rtkit-pmgr-6.3

for you to fetch changes up to 22991d8d57251509b8ee5c0b3dac04506fe5ed7a:

  soc: apple: rtkit: Add register dump decoding to crashlog (2023-01-31 20:44:47 +0900)

----------------------------------------------------------------
Apple SoC RTKit/PMGR updates for 6.3.

This time around we have a PMGR change to allow IRQ-safe usage, RTKit
crash register dump decoding, and a bunch of RTKit API changes used by
upcoming drivers.

----------------------------------------------------------------
Asahi Lina (3):
      soc: apple: rtkit: Add a private pointer to apple_rtkit_shmem
      soc: apple: rtkit: Export non-devm init/free functions
      soc: apple: rtkit: Add register dump decoding to crashlog

Hector Martin (2):
      soc: apple: rtkit: Add apple_rtkit_idle() function
      soc: apple: apple-pmgr-pwrstate: Switch to IRQ-safe mode

 drivers/soc/apple/apple-pmgr-pwrstate.c | 11 ++--
 drivers/soc/apple/rtkit-crashlog.c      | 93 +++++++++++++++++++++++++++++++++
 drivers/soc/apple/rtkit.c               | 36 +++++++++++--
 include/linux/soc/apple/rtkit.h         | 26 +++++++++
 4 files changed, 157 insertions(+), 9 deletions(-)

