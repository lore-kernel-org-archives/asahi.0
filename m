Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC3B20F8
	for <asahi@lists.linux.dev>; Tue, 31 Jan 2023 11:30:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id E8E6041A36;
	Tue, 31 Jan 2023 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1675164615; bh=5gnsaR4FOCkWyPrei8p2FxTptYOhZoOOen1N58kwQSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q/RZ2cdRDe3TsB/aQJ5VzDPNFsFaSH6KMIbBxhm/8hf0gGeJMTZAf7UdKNFQsE/fz
	 BsMtDecgp1UzaAIRdRqO9emk/lmSEr4Sn3CFj+Z/9eVe/HgE0ZjNW9G9K9e9eflnjE
	 q7cib2jY/rUlFN+0+kM1/3lwZLk/smZOMOfUwD4wtSNA9W8QVwGq0uKdTEtnxczwK0
	 snJEUWbWm+1AtbITcpXT6X8n25k0MNRzM1NGBgHkjrYux4jKjyhRFJNF6DwwqQ9eWB
	 14F7LTJwQ24mJsRkyyS1NlWK1cH6lFaTpDMcjNqbh+gH3TvvBxUdBIjvgHz3MximC3
	 BfaIUaBXFkFbA==
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
	Aditya Garg <gargaditya08@live.com>,
	asahi@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH v2 1/5] brcmfmac: Drop all the RAW device IDs
Date: Tue, 31 Jan 2023 20:28:36 +0900
Message-Id: <20230131112840.14017-2-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230131112840.14017-1-marcan@marcan.st>
References: <20230131112840.14017-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These device IDs are only supposed to be visible internally, in devices
without a proper OTP. They should never be seen in devices in the wild,
so drop them to avoid confusion.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c       | 4 ----
 drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index ae57a9a3ab05..93f961d484c3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2589,17 +2589,14 @@ static const struct dev_pm_ops brcmf_pciedrvr_pm = {
 static const struct pci_device_id brcmf_pcie_devid_table[] = {
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4350_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE_SUB(0x4355, BRCM_PCIE_VENDOR_ID_BROADCOM, 0x4355, WCC),
-	BRCMF_PCIE_DEVICE(BRCM_PCIE_4354_RAW_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4356_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43567_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43570_DEVICE_ID, WCC),
-	BRCMF_PCIE_DEVICE(BRCM_PCIE_43570_RAW_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4358_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4359_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_2G_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_5G_DEVICE_ID, WCC),
-	BRCMF_PCIE_DEVICE(BRCM_PCIE_43602_RAW_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4364_DEVICE_ID, BCA),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4365_DEVICE_ID, BCA),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4365_2G_DEVICE_ID, BCA),
@@ -2611,7 +2608,6 @@ static const struct pci_device_id brcmf_pcie_devid_table[] = {
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4371_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(BRCM_PCIE_4378_DEVICE_ID, WCC),
 	BRCMF_PCIE_DEVICE(CY_PCIE_89459_DEVICE_ID, CYW),
-	BRCMF_PCIE_DEVICE(CY_PCIE_89459_RAW_DEVICE_ID, CYW),
 	{ /* end: all zeroes */ }
 };
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
index f4939cf62767..a211a72fca42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
+++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
@@ -71,17 +71,14 @@
 /* PCIE Device IDs */
 #define BRCM_PCIE_4350_DEVICE_ID	0x43a3
 #define BRCM_PCIE_4354_DEVICE_ID	0x43df
-#define BRCM_PCIE_4354_RAW_DEVICE_ID	0x4354
 #define BRCM_PCIE_4356_DEVICE_ID	0x43ec
 #define BRCM_PCIE_43567_DEVICE_ID	0x43d3
 #define BRCM_PCIE_43570_DEVICE_ID	0x43d9
-#define BRCM_PCIE_43570_RAW_DEVICE_ID	0xaa31
 #define BRCM_PCIE_4358_DEVICE_ID	0x43e9
 #define BRCM_PCIE_4359_DEVICE_ID	0x43ef
 #define BRCM_PCIE_43602_DEVICE_ID	0x43ba
 #define BRCM_PCIE_43602_2G_DEVICE_ID	0x43bb
 #define BRCM_PCIE_43602_5G_DEVICE_ID	0x43bc
-#define BRCM_PCIE_43602_RAW_DEVICE_ID	43602
 #define BRCM_PCIE_4364_DEVICE_ID	0x4464
 #define BRCM_PCIE_4365_DEVICE_ID	0x43ca
 #define BRCM_PCIE_4365_2G_DEVICE_ID	0x43cb
@@ -92,7 +89,6 @@
 #define BRCM_PCIE_4371_DEVICE_ID	0x440d
 #define BRCM_PCIE_4378_DEVICE_ID	0x4425
 #define CY_PCIE_89459_DEVICE_ID         0x4415
-#define CY_PCIE_89459_RAW_DEVICE_ID     0x4355
 
 /* brcmsmac IDs */
 #define BCM4313_D11N2G_ID	0x4727	/* 4313 802.11n 2.4G device */
-- 
2.35.1

