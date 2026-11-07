Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066506;
	b=mp+kFcYBRK05P+av5KXoUlmKm/s7phKWXIGTyH5Syo1x7cUfP2lFkJfXUCuOhzSumLbP
	 IyUjh8C6TzHwHO87aNdczRMBuVeRFOVyKa9b0Axz5Xc8GlAOd80fM4MnPLwThkKHsLeZW
	 eqTv5tjVuRsJtCR0HTrmBOL9EKZCO7sZ/Op8XTS8jD5Jih3nx0di5x+3BZs6wi4BijjFu
	 7goKswSDH4hPOCM/N/nOmmY8DfkpR9YpdK64h5Ab10OUCuoyNfMY1lgmUzsUn+oVZVGUV
	 6LfDPaqeYjngRJy0RfKGay2mCDO0W4IrOv/nyQDAdLR4rvTSyEAZCEwsK9jS7Y0blhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066506;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pFashoEnDZZuvWll98ek06OLO0B0ikHasWYuJ9bJ260=;
	b=zWqKqVfz74pfeaQuuac/eFwlmwszqZY0EqaxN0aAYgWAI4J81no3psah+8BkCHqxuOa4
	 YMOS+huULN+20W2rflTp05FPjYC22ynNvSpjdizFls3m3+TI5fN+jj0MDlywP1uZ+G3tF
	 VvcTQCP3Oguq1mrTyBGVjNKotywItFdxay3AU9uKYU0dvLJju4mHFAySsMIzJevCxMGho
	 rPo1FvhgWYubpHRGLeVgsRD1XjVbHS6N9/fvkMm0f4W2VsNaXX71qdAwzDJ/9/rlJHHTz
	 sOdzw3xawJG0YEhoHrs+VxlG1xln3TunrHveH3XPAktmXYbmm6e8iNUPoS8Lfhy/H6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=NpWty6gz;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA26606D83B;
	Sat,  7 Nov 2026 15:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA26606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=NpWty6gz
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: d7acbc30-2f80-4115-9ebf-12c0f04c23f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066497;
	bh=Ms21SKXT3u4FNhh3d8KIC89/cHPf4RgidjPrBUptLKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NpWty6gzI/O0QNTDolNEpGXaCQxDbq3SkaiLFKmyR4lJS8dZXbjmpbtqrhJBLjzPP
	 3FAychZIUq2FvwkktYD5cxHFYHWIzyphaqFqe08QM37KMBFZebDFyVOByRg2Q7/KV0
	 byEHD3KpVi9JTYc3Du3rzXXAFdsb8kHYhPz4r5joVbaB3UR6gOa1rlkPdY/YgOsH+/
	 i6Qhe3A4zXbCpfWZSgMUE+n2IX/HNx5Gkt0iurj38Sij+RBo9Eq0lH+NfW7GTwQ4l1
	 5fWrRstKNv8cxRgL5YKR6V3G0NmPU/FsJi8DYuMevpzPsZX3Svgx8sPirCnvLaK9V0
	 X4SlDaVWwvDxA==
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Michael Reeves <michael.reeves077@gmail.com>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 2/4] wifi: brcmfmac: pcie: skip the host ready doorbell at init once it is a capability
Date: Sat,  7 Nov 2026 16:48:08 +0100
Message-ID: <20261107154810.89780-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-1-dev@deq.rocks>
References: <20261107154810.89780-1-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With host ready in the host capabilities, the BCM4364 firmware halts on
the doorbell that brcmf_pcie_preinit() rings, before it answers the
first ioctl. The B3 of the MacBookPro16,1 does so on every load, the B2
of the MacBookPro15,1 on some:

  brcmf_pcie_handle_mb_data D2H_MB_DATA: FW HALT
  brcmf_attach: dongle is not responding: err=-5

The BCM4377 stays silent without the capability, so it stays. Once host
ready is a capability the firmware takes the doorbell as the exit from
D3, where Broadcom's DHD driver rings it, after D0_INFORM. Ring it at
init only when host ready is not a capability.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 231a2fb89f0..fc0f23477eb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -325,6 +325,7 @@ struct brcmf_pcie_shared_info {
 	dma_addr_t ringupd_dmahandle;
 	u8 version;
 	bool mb_via_ctl;
+	bool hostrdy;
 };
 
 #define BRCMF_OTP_MAX_PARAM_LEN 16
@@ -1599,7 +1600,13 @@ static int brcmf_pcie_preinit(struct device *dev)
 	brcmf_dbg(PCIE, "Enter\n");
 
 	brcmf_pcie_intr_enable(buspub->devinfo);
-	brcmf_pcie_hostready(buspub->devinfo);
+	/*
+	 * Once the host capabilities enable host ready, the firmware takes the
+	 * doorbell as the exit from D3 only. The BCM4364 firmware halts on it
+	 * here.
+	 */
+	if (!buspub->devinfo->shared.hostrdy)
+		brcmf_pcie_hostready(buspub->devinfo);
 
 	return 0;
 }
@@ -1806,8 +1813,10 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
 			!(shared->flags & BRCMF_PCIE_SHARED_USE_MAILBOX);
 
 		host_cap = shared->version;
-		if (shared->flags & BRCMF_PCIE_SHARED_HOSTRDY_DB1)
+		if (shared->flags & BRCMF_PCIE_SHARED_HOSTRDY_DB1) {
 			host_cap |= BRCMF_HOSTCAP_H2D_ENABLE_HOSTRDY;
+			shared->hostrdy = true;
+		}
 		if (shared->flags & BRCMF_PCIE_SHARED_DAR)
 			host_cap |= BRCMF_HOSTCAP_H2D_DAR;
 		host_cap |= BRCMF_HOSTCAP_DS_NO_OOB_DW;
