Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1324B3C02
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 08:01:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 6A1EC4262F;
	Tue, 14 Feb 2023 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1676361697; bh=LulywthSgoMY00ciMXgI8pcvl/7Qitv9bYFn/FgF6PQ=;
	h=From:To:Cc:Subject:Date;
	b=AWRsTTF3+iGzsWXu17baKH3m5EzkQMdg/dFeHRKwed3zbqu/SqjC9QyPuo2D4aRyK
	 O12+cLq/8xgBc25us+dltD9mtkUPIEhNyM/qCgM4yFMSS/pIpvesaEeI7az/wLgCPl
	 kHFJf+0wI4eLTdUwS/QigUUbRTgVRtjrlo9gLCjf3cGv6Tb2Igli500PMROPkukrAH
	 vn+ret+pep8fCWogjKUabyp51SaKdpc8tkAH4l8hVEpHujYYO4SqVkkg50agOn99dC
	 RqD7W6XuBoTUlYSLOtejM5qrkGme47AyHcpEcR9YfxzY2UjNhTkQD26JOwhI6j6FsY
	 ZADQXS7v5ERNw==
From: Hector Martin <marcan@marcan.st>
To: Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Linus Walleij <linus.walleij@linaro.org>,
	asahi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH 0/2] Apple T2 platform support
Date: Tue, 14 Feb 2023 17:00:32 +0900
Message-Id: <20230214080034.3828-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This short series adds the missing bits to support Apple T2 platforms.

There are two quirks: these devices have firmware that requires the
host to provide a blob of randomness as a seed (presumably because the
chipsets lack a proper RNG), and the module/antenna information that
is used for Apple firmware selection and comes from the Device Tree
on ARM64 systems (already upstream) needs to come from ACPI on these
instead.

Changes since the megaseries from a ~year ago: made the ACPI code bail
if there is no module-instance, so we don't try to get the antenna
info at all in that case (as suggested by Arend). Made the randomness
conditional on an Apple OTP being present, since it's not known to be
needed on non-Apple firmware.

Hector Martin (2):
  brcmfmac: acpi: Add support for fetching Apple ACPI properties
  brcmfmac: pcie: Provide a buffer of random bytes to the device

 .../broadcom/brcm80211/brcmfmac/Makefile      |  2 +
 .../broadcom/brcm80211/brcmfmac/acpi.c        | 51 +++++++++++++++++++
 .../broadcom/brcm80211/brcmfmac/common.c      |  1 +
 .../broadcom/brcm80211/brcmfmac/common.h      |  9 ++++
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 32 ++++++++++++
 5 files changed, 95 insertions(+)
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/acpi.c

-- 
2.35.1

