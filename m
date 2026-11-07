Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066504;
	b=KFOamL4NHAQwk5+9CA2n5PiInRd3i9sMg/6zX+mqKqtSrvP5jxWhbJ9knCxkTWw9PHfT
	 NF3eH6AWf+cu4K48MP3HC4XzxiQeKs7gAY/8BXtOBYdyCqHI7E98JTZVQrsNF/PV2bwC2
	 0dzVHZh0gXKazDxqYPLViI4kfGofoHWqgD6ijXdWLYaIur0dhmfvurJyMzsF6uDzqOL+t
	 +lauOKyL1ibCJZwBm/agYQPiT4CpZQv0nuERxT3SE6/gPB+ZTHq4TL1JRon5uCfyueOA9
	 0e9d2EeM3QSssgU/udY+hE0UtFFf8X/DTVg2nYfKwQ35rhhCPn8HLfvYS74jeoZIKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066504;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hYhOZkL/otgRvGfJdBZAujUUz33qad7UICBu6uXEBGY=;
	b=p95IJ5QV3iayImyzoGVaPufBmWxVNtZUJeBWGfchOTW+9iYEl8bTnY4H53yYfTX6Z+md
	 qAUjWmjbfbGWXIlKdgGjq/jj+8UK8g0eNZV50eqEC8ruclzmRDQXOwaOWsKilCGoZZVEM
	 U9ZLZO//CV9XgvhyeF28YZSSAR1sJPKZzD6uRqkPWEgRq1XfjbfRiUTCdGJhWjKB+8VdB
	 hXq7cN2yd7bqWGM1FFbp2ykQlin0wzTzdISuq7qHZVDr1Wp65YTTatgqvHUoWz/2qhzp5
	 Lf+l5GhbcoFByzwRmYNdGZK0n9Pq4SGU3o3pwo4LLkebc8EWpDqQpE0W6RjAFhbIrjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=hPPdqKoc;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA3606A333;
	Sat,  7 Nov 2026 15:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FA3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=hPPdqKoc
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 9aaff8ec-c42e-494a-a81b-24780cb8c769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066500;
	bh=4qCAPE7zQoMkKqxefQhrfehtD49kPtqZhPrvXyAgXKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPPdqKocPiV4UFi/TjPSFvFFPR/RRvv0hd9puVLmdL/W/cCQZ+pgbgAjI0x/v9ws1
	 YxYwCMqx8uhjGpay9CVwMLrSdmuthOtZO6zLnHnww/dd2CPIg1RIZFO8LDb7UOYZzf
	 B2OgrRXhgX/MRZoBXMhKnyxNtk7jkpzkDCnXHJU3NZOfc8gX9eL2Z5Wlfwj1DczI+W
	 AhL/3nib7UOJOsS85SNVHFayqnXLEYlyGPI7mh3dmUeU0XGDNUjLChu6joVX97oDdw
	 bIB75GMwuxc+p90eoG+j6S5Uy7gRSEQ8+CJADL1LRxv3kzP1wWFMiCIT6pZNNaKh4y
	 DmnR3E236jqsQ==
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
Subject: [PATCH 3/4] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Sat,  7 Nov 2026 16:48:09 +0100
Message-ID: <20261107154810.89780-4-dev@deq.rocks>
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
