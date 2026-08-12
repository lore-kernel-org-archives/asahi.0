Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5E474267
	for <asahi@lists.linux.dev>; Wed, 12 Aug 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548882; cv=none; b=c5eamQG9weOjThlFypjT2iz20mMVu4WIitbrPVBLwDp6zy+mM4OcV9qYOgx66D9rlFLCT2qgK2+Q0nMCNKMReDXJMrI0Q4FIxIwgRddcfe6/qMb3ecn54/V/D9wnYU0/Ywf3NEWGyKo+W3AKo3hNCGYLnYCjLdyHDNQMM/ge1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548882; c=relaxed/simple;
	bh=x0XfJfYYmm0lZckHiSTrULL19u0GEKu1sJMJbH7EwyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REM3o6X0C7vlJi3an0PT15j8JIB9eLjJIVEQmpUWJAGsftr581yycI4Qb0UzMXbf2FI7nD1Rwg67T4anuKs4mpW1YHzyi63FCd94+ozG+vFVT2/JYEoKY+DtY7EYxnduh8PDNOmSF5uy6Pn1cexk5DiUD3HCD6ja/kGJjROqE4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnN3r6mh; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnN3r6mh"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1400171a91.0
        for <asahi@lists.linux.dev>; Wed, 12 Aug 2026 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786548873; x=1787153673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=EnN3r6mhyPQStWqrv9xnpRGD4MFdePHVSOgMtmC9KHX0i2GFb+A8zkdtgIrV9dLzYT
         cqo+qVUSJngVsE98LxZQbS04cfSUiq9WaEE2opeX51BsFtbMUanFo1nPqLQKjxFi1F3j
         Bjv2Xc7eFXnITeg61EjXZo6G9T5D7kHRuvPbVmij5buIHOPTYnGlVvAz3xYqxkZuwkm8
         J2MQUhtiToMs/mjNgP9IRzc5fRy5V35vTmyz6usSh0HiUOxfCUaVAUxWLaDHsd2zh/2w
         ld5vRz/IpxKvIhd1ST3d6cWhld6WCTJAc8cjZMU07ihXv77rok8jgihgyqpRXbwPy3ux
         6d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548873; x=1787153673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=p/BqE6F0QCusQwBIr0RLgul4Uqgs5xGCo3yZOmFnCaiGlMzYtYqWZmW5yCITPHqMEE
         ZypVf+Cx9ks2y6QaI/i0AqRBDpQRYD0JpS+RVL4HDreij7QSMjTzGetwscYXMg6UvcGy
         rFKF9RsQKYB2Sd6kNHBOwBlaVqrIGRc022mdZH/yOX/rFmdAdeD3x/Je2Y/brjP0KVlK
         YGK8cSrn69KhqojONMFIKL2zoqMSi4QHTTs9+4t4UdgEtEyw9cTtn8ge4VG9qcR8GIss
         W9XiviJ23vDMTGfPZxHua+O6K+zqVX6yEO3gbuPG0kz2Sr/BG7NwspE7n7/eH/U4O/hP
         Yomg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0aEgQ0ODPA/PV4WRPqlFaezKAU2sDxwwbKSYdFQupzogvU83awsPMmnRaiEPyO7aS9ZyiuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOYmSLCnjG0UoOp1HKJi2hofpLTCWTfEGPBYxfogxqUCqK8Gw/
	w/gpHk+B9zJMo5eZl5OMhoAEQsarGy0JCJzO208qgrgcTKmt+ymdEq0=
X-Gm-Gg: AR+sD13MOXLj06UjBSFztGTaLx3mEpCdAlmZcH3m82Lp/wFa/pxRGgBuhJVm+UXkUub
	r7F9QwAnvYQj/N6kbtHAGybZUaX/UocKOSc9kLGPPNqed4t0j1DiS+BQKCJMNMHgYFfWXSyjQtU
	RsFovCRMaGdFFUz2EjOYDj32wgS/yaq7HRMnuPQSo2OYNY12sE7BDF0adIkVQaIp0ra3Hx4ChjL
	xdvhdKBXIMrWYyL/GrJqGrFeM3KlBkodArCWUGfDpDGWuFRWxE/vF9knIfWOz6lNsKTbnXcyIoz
	kini3fzhA1Pw4K9aTaZ4s8ZqVLK0e7YlXjb0t3KziLpxGgor+zMYRn9LRo4ndDZyVuWNmcP7WhX
	Su6eW+/fNm6lwcHMClvU+qbdUiao1f2ARL5e0c7/PmdgGIE7CPOj4sMAduk7Iubmi8q2yWlI8Jh
	2yC1cwcevVhZvLiFNrrH9fW8lOM9OPIWua88BFUDM5x9MaS/eERWE8+nagRijz3lXkmzISNjplj
	wFqynEyVT/DgrrRQnXmThpBHiCiLntC4eE=
X-Received: by 2002:a17:90a:d64f:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-393011eea08mr7525677a91.7.1786548872437;
        Wed, 12 Aug 2026 08:34:32 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31dba3e9791sm7160804eec.0.2026.08.12.08.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:34:32 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <andre@negmaster.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sebastian Reichel <sre@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND v7] thunderbolt: Add device links for Apple T2 NHI
Date: Wed, 12 Aug 2026 11:34:07 -0400
Message-ID: <20260812153411.1159-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812153411.1159-1-atharvatiwarilinuxdev@gmail.com>
References: <20260812153411.1159-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ice Lake Thunderbolt NHI That are only on T2 Macs. The NHI and its
associated PCIe Root Ports all sit directly on the Root Complex
with no upstream port. Identify the tunneled PCIe Root Ports by
their PCI IDs and create device links back to the NHI so that
PCIe tunnels can be re-established after sleep.

And on other Thunderbolt NHI's, like Titan Ridge, the default method
is used to add device links.

Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Andre Eikmeyer <andre@negmaster.com>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v7:
- Used pci_lock_rescan_remove to prevent race conditons.
- Fixed patch format.

Changes in v6:
- Used for_each_pci_bridge in Icelake section
- Removed has_apple_t2_chip as its not required now

Changes in v5:
- Used Icelake root PCI IDs for detection of root ports instead of TRP

Changes in v4:
- Limited TRP check to T2 Icelake systems only
- Optimized has_apple_t2_chip check
- Included pci.h to drivers/thunderbolt/tb.c
- Used __free(pci_dev_put) to avoid label

Changes in v3:
- Fix build errors with non-x86 machines
- Used __initconst for apple_t2_devices
- Removed UEFI_QUIRK_SKIP_CERT as its unused now
- Used IS_ENABLED(CONFIG_ACPI) in tb_apple_add_links for the T2 part
- Removed !bid check to remove warning with -Waddress

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v6:
https://lore.kernel.org/all/20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com/

Link to v5:
https://lore.kernel.org/all/20260727211807.1223-1-atharvatiwarilinuxdev@gmail.com/

Link to v4:
https://lore.kernel.org/all/20260724164641.2239-1-atharvatiwarilinuxdev@gmail.com/

Link to v3:
https://lore.kernel.org/all/20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

 drivers/thunderbolt/tb.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..2534c6378000 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_data/x86/apple.h>
 
@@ -3305,16 +3306,62 @@ static const struct tb_cm_ops tb_cm_ops = {
 static bool tb_apple_add_links(struct tb_nhi *nhi)
 {
 	struct pci_dev *upstream, *pdev;
-	bool ret;
+	bool ret = false;
 
 	if (!x86_apple_machine)
 		return false;
 
+	/* Identify the tunneled PCIe Root Ports by their PCI IDs
+	 * on Macs with Icelake NHI's
+	 * and create device links so that
+	 * PCIe tunnels can be re-established after sleep.
+	 */
+	if (nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI0 ||
+		nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI1) {
+		const struct device_link *link;
+
+		pci_lock_rescan_remove();
+
+		for_each_pci_bridge(pdev, nhi->pdev->bus) {
+			if (!pci_is_pcie(pdev) || pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+				continue;
+
+			switch (pdev->device) {
+			/* Ice Lake Thunderbolt 3 PCIe Root Ports */
+			case 0x8a1d:
+			case 0x8a1f:
+			case 0x8a21:
+			case 0x8a23:
+				break;
+			default:
+				continue;
+			}
+
+			link = device_link_add(&pdev->dev, &nhi->pdev->dev,
+					DL_FLAG_AUTOREMOVE_SUPPLIER |
+					DL_FLAG_PM_RUNTIME);
+			if (link) {
+				dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+					dev_name(&pdev->dev));
+				ret = true;
+			} else {
+				dev_warn(&nhi->pdev->dev,
+					"device link creation from %s failed\n",
+					dev_name(&pdev->dev));
+			}
+		}
+
+		pci_unlock_rescan_remove();
+		return ret;
+	}
+
 	switch (nhi->pdev->device) {
 	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		break;
 	default:
 		return false;
-- 
2.43.0

