Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0867C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:19:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DA0AC41EF0;
	Tue, 14 Feb 2023 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1676366344; bh=E9W07H0pU9Jie9tGq5Ks2FwjxVlRsSqR36Tm5FJo4VI=;
	h=From:To:Cc:Subject:Date;
	b=OXDduyGoGZ9dQZ8eoE5aO/TuBUcQ13uIPZ4nIvBxNDaN+oLHLnuYFgvULLtF8Dbrx
	 IO5sH+PBSfNl9ASWwnGfxQsI/lfFiH6iDVbjPrvt0eiPMjGeAOXFokULy7ZIUmuK24
	 EQB146Xre4N2gJu/1emFCU+JXIb+Eij6hRpTpuzTaLbkzGMoneKkPaEQMmDWYNVujs
	 aFxGseg3NC/JI/JA5PmUiJoHM2u545nT7ccMBSrMy4FVqoYawTmRhYXmp6Mh+gHoBA
	 w6ArlWN5Q2npLuoOvUpjcuAm0nhaPZraKORwRM1fUPjTuBCNNe18JA19SN98p6srGV
	 /mFQbWR8A0kxQ==
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
Subject: [PATCH 00/10] BCM4387 / Apple M1 platform support
Date: Tue, 14 Feb 2023 18:16:51 +0900
Message-Id: <20230214091651.10178-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds the missing bits to support the BCM4387 found in newer
Apple Silicon platforms and its Apple firmware.

* Patches 1-2 add support for hardware oddities of these chips.
* Patches 3-6 add support for firmware oddities of these chips.
* Patch 7 adds the IDs themselves
* Patches 8-10 add support for Apple oddities (also applicable to other
  chips already upstreamed, but which are still missing this
  functionality).

These patches were already reviewed last year as part of v2 of the
`brcmfmac: Support Apple T2 and M1 platforms` series. This version
just incorporates a few bits of review feedback from that last round,
plus rebasing. In particular, I checked that the patches do not
introduce any cfg80211.c endiannness warnings with make C=2.

Hector Martin (10):
  brcmfmac: chip: Only disable D11 cores; handle an arbitrary number
  brcmfmac: chip: Handle 1024-unit sizes for TCM blocks
  brcmfmac: cfg80211: Add support for scan params v2
  brcmfmac: feature: Add support for setting feats based on WLC version
  brcmfmac: cfg80211: Add support for PMKID_V3 operations
  brcmfmac: cfg80211: Pass the PMK in binary instead of hex
  brcmfmac: pcie: Add IDs/properties for BCM4387
  brcmfmac: common: Add support for downloading TxCap blobs
  brcmfmac: pcie: Load and provide TxCap blobs
  brcmfmac: common: Add support for external calibration blobs

 .../broadcom/brcm80211/brcmfmac/bus.h         |   1 +
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 310 ++++++++++++------
 .../broadcom/brcm80211/brcmfmac/chip.c        |  25 +-
 .../broadcom/brcm80211/brcmfmac/common.c      | 117 +++++--
 .../broadcom/brcm80211/brcmfmac/common.h      |   2 +
 .../broadcom/brcm80211/brcmfmac/feature.c     |  49 +++
 .../broadcom/brcm80211/brcmfmac/feature.h     |   6 +-
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 157 ++++++++-
 .../wireless/broadcom/brcm80211/brcmfmac/of.c |   7 +
 .../broadcom/brcm80211/brcmfmac/pcie.c        |  21 ++
 .../broadcom/brcm80211/include/brcm_hw_ids.h  |   2 +
 11 files changed, 567 insertions(+), 130 deletions(-)

-- 
2.35.1

