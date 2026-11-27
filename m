Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800966;
	b=UQfW8pO0es8HsmjWiyCZPaCNBHnS284om1nTHvY917NbdAiwGNZHb11//riboZAL7wwo
	 4QxQZ0F5CLnmDkcv8ISCJOPPbUdTv/mLCFly6VdFN+2T3KpYc1cYc9Ed4w510ihZ32NLh
	 QoN6R7Oy4LkFTZiyz73/FAG2qXJyHBzdtZwql3GhiU664X3vEzzPzVx3HTb/8Nw/hxumN
	 wdSzWYl8Dg0mVdhERxIAWNa8axuPcGTVmOnmBGbzhGux6C6T0Wor1to290Wlt+dlKJrFD
	 EZSfDx0AayilQ7rhZMC5ZBtFc+cx8G4RCmGHBwW7cOuSviwuCSZ58755E6Tjlfjn7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800966;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GUySmqfMLE9wm4JUG4oeEO23d2umvrzqKPsHvu1jeWc=;
	b=hKbVg5ZwmM+rnI1tPYDUe72cLCVJjDiqKSfdt8q1qvHsJ+rDmTx9lwdmlXpUygYy1RYX
	 QBkbjqk2+4es+RYVA1Wu1pogKrHFLe2yuVPXl8Ao/LywWn1pzTx1V/Oq6uGZVylt7iUhI
	 54wRnvwgaYD2bheSoqSAWXwwEHIGn4JN/91TEKdgII4ycUspWF+FatsuGVQ7Fsb2d+5CW
	 2LyQNrJElujZFNo/+GiC3Pfp6hbE7t4+yVDrPtcqLUh0D7+M+bcja9GHo0siwNQbnQybl
	 RHZ2rFlo9zP+B2zlo5FmOBcjH65TTuUmZoAguF32jsXN2MULL0fWyPlnxTq7p3FQxtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IoN3ufBF;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DAE606A33E;
	Fri, 27 Nov 2026 17:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DAE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=IoN3ufBF
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800964;
	bh=xbFogpTo10Nxw4ZICdjJ5rlqffoyRrSmEJpftWjtOBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IoN3ufBFAv/wwY7d3gnBO+xdWQA6Cr4z1L7m599CJLe08qfmS42RDx5y9P0rkgj5w
	 6eCcFOhm9aJ0bnsx2Tr6UMEQAcG37hE7LB3ratGWTDu1XxvJhvu9wHL6B6JZxPvkrP
	 pz8MrzGHkvKADLO+xE9Eh45GbxPy2LZnB4mlTmZ8AfnhqlT6Nev2LN+kvmbbCpByBE
	 Q6LGwyhNndBcO+5WnXN3EfeVpfDpNPCNylPDDqrhdKRkR8XnN/JQsReaAYwRo46+4E
	 m57+TgmgOiQ3jDsojRg28BbGSDGG7x+gJDUtli0Mu3wcrpXS5yZcH1MwZu5Jv93SHr
	 A6dOQl3Qi5URw==
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
Subject: [PATCH wireless-next v3 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Fri, 27 Nov 2026 18:35:47 +0100
Message-ID: <20261127173549.29335-4-dev@deq.rocks>
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

After ACPI S3 the BCM4364 and BCM4377 of the T2 Macs come back without
their firmware, but the interrupt mask can read back nonzero, so
brcmf_pcie_pm_leave_D3() takes the hot resume path and every command
times out afterwards.

On these chips, when the platform firmware handled the resume and WoWL
is off, go straight to the existing remove and re-probe path. Other
chips keep the hot resume path.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 4aed21061dd..ea51ef6189d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/pci.h>
+#include <linux/suspend.h>
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -3107,6 +3108,17 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	devinfo = bus->bus_priv.pcie->devinfo;
 	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
 
+	/*
+	 * Without WoWL the BCM4364 and BCM4377 of the T2 Macs are powered off
+	 * when the platform firmware handles the system sleep, as with ACPI
+	 * S3, and come back without their firmware. Their registers can still
+	 * read back nonzero, so probe them again.
+	 */
+	if (pm_resume_via_firmware() && !devinfo->wowl_enabled &&
+	    (devinfo->ci->chip == BRCM_CC_4364_CHIP_ID ||
+	     devinfo->ci->chip == BRCM_CC_4377_CHIP_ID))
+		goto cleanup;
+
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
-- 
2.56.0

