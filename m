Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699EE7EA
	for <asahi@lists.linux.dev>; Wed,  4 Jan 2023 10:03:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A8FBE3FB17;
	Wed,  4 Jan 2023 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1672826629; bh=5PQ213c6dksFSTAkHkcUxrdlo98cuY3Drgsr26/bTj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lK7eaitnWXWoiGRhBlPxiaKClZ+BhrwK7hMX4+Oe+MTqDxXgrdDcSOIcExpPr9vLY
	 vuVj1ChBbhEYH4ApXWFy4OV6XrNyH+I7/9KmtDCTEE5zLec8s5T9lrHeLyLFOI/DxV
	 VYLHzY5DyjHCtdzcYUhY8MqIm42YU85Bu12i50aIgvDYrXGB8K5lI+AMeGuMnKBHc3
	 mQp9+pjSygkgxKPh9+ZE8UWPqniez2IZy8lm1PEnMZk+rP54FWEljet2LN3LLbSaDX
	 rFprDRgN4uIhnxxRqKA3eTEWH6A32OBFx4Ks92lBq6KBaWjCEFSY6Nc0PMzY2qCNXh
	 ChZVhMGu0o4Ew==
From: Hector Martin <marcan@marcan.st>
To: Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Alexander Prutskov <alep@cypress.com>,
	Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
	Wright Feng <wright.feng@cypress.com>,
	Ian Lin <ian.lin@infineon.com>,
	Soontak Lee <soontak.lee@cypress.com>,
	Joseph chuang <jiac@cypress.com>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH v1 2/4] brcmfmac: pcie: Add IDs/properties for BCM4355
Date: Wed,  4 Jan 2023 19:01:14 +0900
Message-Id: <20230104100116.729-3-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104100116.729-1-marcan@marcan.st>
References: <20230104100116.729-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This chip is present on at least these Apple T2 Macs:

* hawaii: MacBook Air 13" (Late 2018)
* hawaii: MacBook Air 13" (True Tone, 2019)

Users report seeing PCI revision ID 12 for this chip, which Arend
reports should be revision C2, but Apple has the firmware tagged as
revision C1. Assume the right cutoff point for firmware versions is
revision ID 11 then, and leave older revisions using the non-versioned
firmware filename (Apple only uses C1 firmware builds).

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 +++++++++-
 .../wireless/broadcom/brcm80211/include/brcm_hw_ids.h  |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 3264be485e20..bb4faea0f0b6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -52,6 +52,7 @@ BRCMF_FW_DEF(43602, "brcmfmac43602-pcie");
 BRCMF_FW_DEF(4350, "brcmfmac4350-pcie");
 BRCMF_FW_DEF(4350C, "brcmfmac4350c2-pcie");
 BRCMF_FW_CLM_DEF(4355, "brcmfmac4355-pcie");
+BRCMF_FW_CLM_DEF(4355C1, "brcmfmac4355c1-pcie");
 BRCMF_FW_CLM_DEF(4356, "brcmfmac4356-pcie");
 BRCMF_FW_CLM_DEF(43570, "brcmfmac43570-pcie");
 BRCMF_FW_DEF(4358, "brcmfmac4358-pcie");
@@ -78,7 +79,8 @@ static const struct brcmf_firmware_mapping brcmf_pcie_fwnames[] = {
 	BRCMF_FW_ENTRY(BRCM_CC_4350_CHIP_ID, 0x000000FF, 4350C),
 	BRCMF_FW_ENTRY(BRCM_CC_4350_CHIP_ID, 0xFFFFFF00, 4350),
 	BRCMF_FW_ENTRY(BRCM_CC_43525_CHIP_ID, 0xFFFFFFF0, 4365C),
-	BRCMF_FW_ENTRY(BRCM_CC_4355_CHIP_ID, 0xFFFFFFFF, 4355),
+	BRCMF_FW_ENTRY(BRCM_CC_4355_CHIP_ID, 0x000007FF, 4355),
+	BRCMF_FW_ENTRY(BRCM_CC_4355_CHIP_ID, 0xFFFFF800, 4355C1), /* rev ID 12/C2 seen */
 	BRCMF_FW_ENTRY(BRCM_CC_4356_CHIP_ID, 0xFFFFFFFF, 4356),
 	BRCMF_FW_ENTRY(BRCM_CC_43567_CHIP_ID, 0xFFFFFFFF, 43570),
 	BRCMF_FW_ENTRY(BRCM_CC_43569_CHIP_ID, 0xFFFFFFFF, 43570),
@@ -1994,6 +1996,11 @@ static int brcmf_pcie_read_otp(struct brcmf_pciedev_info *devinfo)
 	int ret;
 
 	switch (devinfo->ci->chip) {
+	case BRCM_CC_4355_CHIP_ID:
+		coreid = BCMA_CORE_CHIPCOMMON;
+		base = 0x8c0;
+		words = 0xb2;
+		break;
 	case BRCM_CC_4378_CHIP_ID:
 		coreid = BCMA_CORE_GCI;
 		base = 0x1120;
@@ -2591,6 +2598,7 @@ static const struct pci_device_id brcmf_pcie_devid_table[] = {
 	BRCMF_PCIE_DEVICE_SUB(0x4355, BRCM_PCIE_VENDOR_ID_BROADCOM, 0x4355, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4354_RAW_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4355_RAW_DEVICE_ID, WCC),
+	BRCMF_PCIE_DEVICE(BRCM_PCIE_4355_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4356_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43567_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43570_DEVICE_ID, WCC),
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
index cacc43db86eb..a722c37d7399 100644
--- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
@@ -73,6 +73,7 @@
 #define BRCM_PCIE_4354_DEVICE_ID	0x43df
 #define BRCM_PCIE_4354_RAW_DEVICE_ID	0x4354
 #define BRCM_PCIE_4355_RAW_DEVICE_ID	0x4355
+#define BRCM_PCIE_4355_DEVICE_ID	0x43dc
 #define BRCM_PCIE_4356_DEVICE_ID	0x43ec
 #define BRCM_PCIE_43567_DEVICE_ID	0x43d3
 #define BRCM_PCIE_43570_DEVICE_ID	0x43d9
-- 
2.35.1

