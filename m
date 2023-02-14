Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224CA7C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:29:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 416A841EF0;
	Tue, 14 Feb 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1676366941; bh=AdhmYWfljCcE2txv2eI6D+3+X4JkvmsCqoAX0cB3tE0=;
	h=From:To:Cc:Subject:Date;
	b=JXrDwxsXKNRBghl87ApLzK0C109ntBzTCq/sJurbi2VEtUXRZXXt6N3EeRzisuwS1
	 KEGIxkBX64ec3i8RrKhGZ+RpBouXeMcaWsubxZUrUY79474yYFhAngc/e7UTuSrG53
	 Fd0RIscSmBntBzNpxUYxKdITTZvpaQCAk9922fkkz+vZ/YiHkybmkXr+pdWXLAXv9Y
	 jlGqSosEnwX+erQhqRpNVxOnDYfJswrqYWGZxU+UrOmCZE61ZDw4aicf1OR8g7bCUa
	 1apO2k0rQZFMKr7dTog7CgWv640q1jzv7hhGwf+U4QKZPAqrAsVzS7LsZqsWDmKUVQ
	 4r4gwfgaH/Z1g==
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
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	asahi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH] brcmfmac: pcie: Add BCM4378B3 support
Date: Tue, 14 Feb 2023 18:28:38 +0900
Message-Id: <20230214092838.17869-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BCM4378B3 is a new silicon revision of BCM4378 present on the Apple M2
13" MacBook Pro "kyushu". Its PCI revision number is 5.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
Note: This applies cleanly on top of:

 [PATCH 07/10] brcmfmac: pcie: Add IDs/properties for BCM4387

Though the conflict should be trivial to resolve if it is applied first.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 7ee532ab8e85..43d666e9038f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -66,6 +66,7 @@ BRCMF_FW_DEF(4366C, "brcmfmac4366c-pcie");
 BRCMF_FW_DEF(4371, "brcmfmac4371-pcie");
 BRCMF_FW_CLM_DEF(4377B3, "brcmfmac4377b3-pcie");
 BRCMF_FW_CLM_DEF(4378B1, "brcmfmac4378b1-pcie");
+BRCMF_FW_CLM_DEF(4378B3, "brcmfmac4378b3-pcie");
 BRCMF_FW_CLM_DEF(4387C2, "brcmfmac4387c2-pcie");
 
 /* firmware config files */
@@ -101,7 +102,8 @@ static const struct brcmf_firmware_mapping brcmf_pcie_fwnames[] = {
 	BRCMF_FW_ENTRY(BRCM_CC_43666_CHIP_ID, 0xFFFFFFF0, 4366C),
 	BRCMF_FW_ENTRY(BRCM_CC_4371_CHIP_ID, 0xFFFFFFFF, 4371),
 	BRCMF_FW_ENTRY(BRCM_CC_4377_CHIP_ID, 0xFFFFFFFF, 4377B3), /* revision ID 4 */
-	BRCMF_FW_ENTRY(BRCM_CC_4378_CHIP_ID, 0xFFFFFFFF, 4378B1), /* revision ID 3 */
+	BRCMF_FW_ENTRY(BRCM_CC_4378_CHIP_ID, 0x0000000F, 4378B1), /* revision ID 3 */
+	BRCMF_FW_ENTRY(BRCM_CC_4378_CHIP_ID, 0xFFFFFFE0, 4378B3), /* revision ID 5 */
 	BRCMF_FW_ENTRY(BRCM_CC_4387_CHIP_ID, 0xFFFFFFFF, 4387C2), /* revision ID 7 */
 };
 
-- 
2.35.1

