Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398882;
	b=uwNLBVw6Tz+T+T1I5sQ8wkngGzrxvRbXN59EqrrpyNfStvIf5RrZf/RAElBffFKEdL02
	 d0cyXar4U72qrvgcDtcZ/3nViiZvz6bMfXADTY1yMwrVgv1y1BtnPWIRf49h92SlajUQh
	 oSy6kh4/cL7fTmDfJ+4NVO7k9JCbp79Tmts7mIcZIUdLGztw3ryshJNiYnwvwMunyxeqU
	 dddMrMQOtHGtXQIViAY44NiTS+y7Bqd4bLPJAkugd403Fi2TPCytkxItkU9TLcEMCnLdK
	 Q5l68wDsw/lx1/HSmLtCw+ifF11G7SjE2wNWeAoUK0GMoY4BPUXl+6iStLqnYNU0+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398882;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hYhOZkL/otgRvGfJdBZAujUUz33qad7UICBu6uXEBGY=;
	b=sia/PZirjZQ4oyT6h0Ob/XnvCHaKn5+VDhes1/GMiFsmTvwvXan9fixipWyA8cKBtXJm
	 laQNK8IFMtv3Na0QMA+1p3/NXv6grh06I1oTjBTAsRXnjYe928C9PyInNLskYmHH4Gk5y
	 1OuCPtIOrENBK6f7sBzsmcd3IIERu/lKJmgFPEJiz1WXGoRRfvdcGn1VldrxFr+Co+0yl
	 TcXN1/LfTi7WyOxqyC2rrOF+tc5mcwFhvcTBYF1oIWtE3leMrJ72ejqwTgSjNAQutvuSq
	 FrbubKeqy/eyWH1t9WHBsm9CxUISMM7K0GjieWVi1QAZmJ/G1KEI5oEAsiJ0DQbJRWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b="LeEDn/mA";
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9F606A8A6;
	Wed, 11 Nov 2026 12:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D9F606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=LeEDn/mA
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398880;
	bh=4qCAPE7zQoMkKqxefQhrfehtD49kPtqZhPrvXyAgXKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LeEDn/mAlJNX8bB2+79D/R7xeJkgVoorRs6le2z0G2S/VpI6H0grgWlitxN3YejQ3
	 MVDUnBa228VRBlPMK5ABXSRG4EvlyHvCDrammXRkMakaidNeJX++AO/vdXy3Icnv3Y
	 yGicdrXrF/hKrFrO9DRCiXdc25xw8e6XJQ0Xwjg9chxdFOD/PQ7m6upCkpUQP/4NaX
	 xntxp/4RJX6Yipy3dQdgfQTk7CW3ygUGQcBNH02ajGMYm0AZZIzDU8FfiBvSBlWI8d
	 RvxxJFSqjkzRA0u56D85PzxvN8/ogGWiS8l7WwMA429F+zOfPGbiwzYWOL/pc3gARd
	 p+Yjhjp/QlZOQ==
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
Subject: [PATCH v2 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Wed, 11 Nov 2026 13:07:46 +0100
Message-ID: <20261111120748.23795-4-dev@deq.rocks>
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

After ACPI S3 the chip comes back without its firmware, but the
interrupt mask can read back nonzero, so brcmf_pcie_pm_leave_D3()
takes the hot resume path and every command times out afterwards.
Seen on the BCM4377 and BCM4364 of the T2 Macs.

When the platform firmware handled the resume and WoWL is off, go
straight to the existing remove and re-probe path.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index fc0f23477eb..faa1e16ed4f 100644
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
@@ -2844,6 +2845,15 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	devinfo = bus->bus_priv.pcie->devinfo;
 	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
 
+	/*
+	 * Without WoWL the device is powered off when the platform firmware
+	 * handles the system sleep, as with ACPI S3, and comes back without
+	 * its firmware. Its registers can still read back nonzero, so probe
+	 * it again.
+	 */
+	if (pm_resume_via_firmware() && !devinfo->wowl_enabled)
+		goto cleanup;
+
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
