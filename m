Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800964;
	b=ZoTwOcB5NEl7yVXQpj2fabRV/cYAM4kOWOCS0TnCq1W4jDm2xF4pPaTHGdmrb/TgWKBt
	 s1HgT2WQNRr3ahVkTnY1pmHRPC8Ca5pSDcJiIWx7vL/rFP01Ch6IRWuJThrYJQY5Uc8x0
	 xTeyRZxRfsx/s0tGCwj+OeM4jqy0Lh3E10ws/j5yaNn0VKuBKqbUc9nhYNrz3wNPxQ9ro
	 EYjFNCC8n41f0p5yxOEGCT9MmQoS6ycRrY0H3vcDZR2i2e3dbLRCbyexA6ZDEsd1PtISI
	 E0ej9KF6PsMhUSbGa4FGuwF1gMaDTwJEEeinereaLBRxPYfIjKGz/vp4nKkdhhVaFVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800964;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GGXLrcHwtjfg7nFF/d1oWkP2Gn2/r+OMtvC8gDebuCo=;
	b=4GJqNcEi652TXTmywYsd9os1EQPpKmC3ooSj/KQ4yeKhvSlYA3F36qhAIesZDThURaNG
	 N25VT3gVBG2S1QQP+qiI0OmWhqbsi7M/xfTbd4fEwqLPHTL2WtiOKWdmgVmMSpw3/HYX3
	 t7aYN9IHp3wtSjh5NuryvHfABYdFBJb0gJDJuDBFxunSyJrYUBRs2++ku3130db47Xefe
	 0cWH/DJRwBG7SJLqNW3zB+BYhEDt2DYEeKDMea8y+Wdy694ZmpFQvfx+QigWLyZ4JDBMO
	 xDqPUqVbXD0sWyob/G83Nu/DPuQnF/0RICyAXsi/Iue942frbpcaIWYtgBYkUkd2OKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=P+PXVpgt;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7D6606A31C;
	Fri, 27 Nov 2026 17:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F7D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=P+PXVpgt
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800962;
	bh=KhlqSqqmyXZv5BvfKEOBSfdHt+DiH3tG23w4Z8iW6/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+PXVpgtzeNuwom7Q+XXruKMJP10MjVIcc2y2ztneoZEzG+GauiBsZqSxH34mF5Wj
	 +WWNiQhqb1FJswbXYH4iGCvtJZsQa3obP/M9TQlKpQL1zMty1t4e2mOYKOMi0jNYkZ
	 rL96VoWHG5Us7UmjT9rBRkFKrKtUCBmo11FR6LR/Oa/JJDae/HE9kw2BQTl0TcXcHh
	 znwMJiaG5BgDGBmsuPnaqkCqQGUqOjgyWfvBgIkh9atq55lFcfOWfNwY9D5y54U0KM
	 sX20V5jcfKy+1jlsVolZLSUBIBPa03S8ZuY/GWuImEdNIn53APHNfDQawKcgCWAjkb
	 erZmH5SxOhqGA==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Soeren Coremans <sorencoremans@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 2/5] wifi: brcmfmac: pcie: skip the host ready doorbell at init on the BCM4364
Date: Fri, 27 Nov 2026 18:35:46 +0100
Message-ID: <20261127173549.29335-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127173549.29335-1-dev@deq.rocks>
References: <20261127173549.29335-1-dev@deq.rocks>
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

The BCM4364 loads without host ready in the host capabilities, or with
it but without the doorbell at init. The BCM4377 does not answer
without host ready in the host capabilities, so the capability has to
stay, and it runs with the doorbell at init. Skip the doorbell at init
on the BCM4364 when host ready is a capability.

Fixes: a83a99d063a0 ("wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware")
Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 6f329eca2cd..4aed21061dd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -330,6 +330,7 @@ struct brcmf_pcie_shared_info {
 	dma_addr_t ringupd_dmahandle;
 	u8 version;
 	bool mb_via_ctl;
+	bool hostrdy;
 };
 
 #define BRCMF_OTP_MAX_PARAM_LEN 16
@@ -1648,7 +1649,13 @@ static int brcmf_pcie_preinit(struct device *dev)
 	brcmf_dbg(PCIE, "Enter\n");
 
 	brcmf_pcie_intr_enable(buspub->devinfo);
-	brcmf_pcie_hostready(buspub->devinfo);
+	/*
+	 * With host ready in the host capabilities, the BCM4364 firmware halts
+	 * on this doorbell.
+	 */
+	if (!buspub->devinfo->shared.hostrdy ||
+	    buspub->devinfo->ci->chip != BRCM_CC_4364_CHIP_ID)
+		brcmf_pcie_hostready(buspub->devinfo);
 
 	return 0;
 }
@@ -1855,8 +1862,10 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
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
-- 
2.56.0

