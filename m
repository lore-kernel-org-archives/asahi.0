Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF887C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:25:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A84703FA55;
	Tue, 14 Feb 2023 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1676366726; bh=314UXgDCtZ3kdOtQKtcZP693f9fhR2R2wD0sbLyzkhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lco/4bv0VJVUCAnF9xE3jz8FuKarnLH1edAh1p0tcmFLHFMk6KGmsXMl0TgVbDyYg
	 oq5X2/MbP4gcJkDao3/m+Lvxh0CuWK57XSfIWkRC34RvLOQAnbFDJn6BMU9/Wew/xd
	 N/36AhvTJLMqzK+ipcHM675a868IfLTwwx3V89nrxNVevcTZwixyHilkypBYqCi1iS
	 zlQnLDD7pPqP6+jm/hOOxkLjrEVZJSXoDshItFaiSLIIS28o66bESCblikIEMJ7V/g
	 aHyc1HM4bDB0gCP5FnEhrW7ylgw+IbBYycpkQ0xYCNlrn9aZeoM6ZaNWXD4AQpmfDT
	 PQUTKCwb59YKw==
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
	Hector Martin <marcan@marcan.st>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH 01/10] brcmfmac: chip: Only disable D11 cores; handle an arbitrary number
Date: Tue, 14 Feb 2023 18:24:14 +0900
Message-Id: <20230214092423.15175-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230214091651.10178-1-marcan@marcan.st>
References: <20230214091651.10178-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At least on BCM4387, the D11 cores are held in reset on cold startup and
firmware expects to release reset itself. Just assert reset here and let
firmware deassert it. Premature deassertion results in the firmware
failing to initialize properly some of the time, with strange AXI bus
errors.

Also, BCM4387 has 3 cores, up from 2. The logic for handling that is in
brcmf_chip_ai_resetcore(), but since we aren't using that any more, just
handle it here.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/chip.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c
index 8073f31be27d..a6239051404b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c
@@ -1292,15 +1292,18 @@ static bool brcmf_chip_cm3_set_active(struct brcmf_chip_priv *chip)
 static inline void
 brcmf_chip_cr4_set_passive(struct brcmf_chip_priv *chip)
 {
+	int i;
 	struct brcmf_core *core;
 
 	brcmf_chip_disable_arm(chip, BCMA_CORE_ARM_CR4);
 
-	core = brcmf_chip_get_core(&chip->pub, BCMA_CORE_80211);
-	brcmf_chip_resetcore(core, D11_BCMA_IOCTL_PHYRESET |
-				   D11_BCMA_IOCTL_PHYCLOCKEN,
-			     D11_BCMA_IOCTL_PHYCLOCKEN,
-			     D11_BCMA_IOCTL_PHYCLOCKEN);
+	/* Disable the cores only and let the firmware enable them.
+	 * Releasing reset ourselves breaks BCM4387 in weird ways.
+	 */
+	for (i = 0; (core = brcmf_chip_get_d11core(&chip->pub, i)); i++)
+		brcmf_chip_coredisable(core, D11_BCMA_IOCTL_PHYRESET |
+				       D11_BCMA_IOCTL_PHYCLOCKEN,
+				       D11_BCMA_IOCTL_PHYCLOCKEN);
 }
 
 static bool brcmf_chip_cr4_set_active(struct brcmf_chip_priv *chip, u32 rstvec)
-- 
2.35.1

