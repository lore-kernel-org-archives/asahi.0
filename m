Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398879;
	b=uZZzbB8NwOmn1znl2gxSWNnXEVhb99Egv8PquYp/btCdoxXtvKCWj+xbbM6VgTK5bW9i
	 ngBR5R4rL3oFLX6qT4mzl7vtb7FNND2r79g2rwfhytCS3+wSbWWY/JwWLoncxzXRlBX1L
	 BvDc0uLM6K/IveEpvNiAI6lqqnVoroWa328LJzeRGZd0t8sgiIQL+WWoQp5OOLdYMWrNQ
	 WIVzoWKa3LpOr6ej6M/36VAzFB3iMg+cMUCzZtR7A4WFwS9k7WFDfcehLOIyDL9Lkr5Px
	 01H7+1BMZOusqe7zl8RoonIfZE+/Tj4b2RD/h7Plhz5ASpNMxYz8dGPAiH+yq/uC44A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398879;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mKcm1dAoYoORZVjG1XVEegV5B3AmCIUI2s6piPJ7UtQ=;
	b=dTll6xDktNZaUh8pp494VJr17186RuIZLSCNq+dez2CkmfS+MfEt/1qHnNE3aT1jcykP
	 JjzQIvRHdJMzqSnGwOFxAJkbHT2PfcY3Dd9py2nCMHTTmTT6gzMflgTufPe38aRXcH2nk
	 PVItogIkcE3OA/i26A7A03jrsCHU59DJNVXUTejhq694stfSkJKiK8+1l5OiyvzEKuGgW
	 gdHmSGlUX56t00Pl7Fto4wyeWXRNapyUR4wh106ChF/G0IrZir/JgHde9KAsitHvE0qLT
	 YSKCkMTcHAtGJuC46J0/ep7yCQOuFjkQun5ILsKN1PuEkDTN/QBgn8xdnSSt8ofHkWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=MnmTvoyC;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B621606A337;
	Wed, 11 Nov 2026 12:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B621606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=MnmTvoyC
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398875;
	bh=PsYaUokuUjE2AS3GVmh9VLEWFesqZswSzdg7BzKWSRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MnmTvoyCQcS5QT0eDt/KkUK5JtNpW/aJs2co7BWsvbU8oMdL9QW1q0Sf3L2n06Amy
	 9yEWadMkd9CaMYQYutGB9pr/5JBoRRTI5M3HV4Iqks1wnPVXrtB5sibLe+o8c1MzjC
	 Juw+9VlHN+Gotzsp+k9k81ikjYA9D+BGdVRMrSWWUNqt9eVbpsadFla6/O9KE18Izr
	 O3VmgXoxYF06iv/ooCvDHrxvsJnqNd3OgB1E7rBxT2DB4qF/kYFYWFD1ovJNznu30n
	 O4xmpH287iScUcc3iLtJ3W7jOIlFDdJghIBzgh4JlQKWxDBCRUhS876nxkFJDcZygX
	 RAkcC2QJxKceA==
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
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 1/5] wifi: brcmfmac: pcie: set the state before D0_INFORM on resume
Date: Wed, 11 Nov 2026 13:07:44 +0100
Message-ID: <20261111120748.23795-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111120748.23795-1-dev@deq.rocks>
References: <20261111120748.23795-1-dev@deq.rocks>
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

With the mailbox on the control ring, D0_INFORM goes through the ring
write path, which refuses to write while devinfo->state is DOWN.
brcmf_pcie_pm_leave_D3() sets the state only after D0_INFORM, so every
hot resume fails and falls back to remove and re-probe:

  brcmf_pcie_send_mb_data: Failed to send H2D mailbox data (-5)

Set the state before D0_INFORM and back to DOWN when the hot resume
fails.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 4de157d18ff..231a2fb89f0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2838,10 +2838,10 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
+		devinfo->state = BRCMFMAC_PCIE_STATE_UP;
 		if (brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D0_INFORM))
 			goto cleanup;
 		brcmf_dbg(PCIE, "Hot resume, continue....\n");
-		devinfo->state = BRCMFMAC_PCIE_STATE_UP;
 		brcmf_pcie_select_core(devinfo, BCMA_CORE_PCIE2);
 		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
 		brcmf_pcie_intr_enable(devinfo);
@@ -2851,6 +2851,7 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	}
 
 cleanup:
+	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;
 	brcmf_chip_detach(devinfo->ci);
 	devinfo->ci = NULL;
 	pdev = devinfo->pdev;
