Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78A1804E
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710673633; cv=none; b=FTnVxTFNrLQfUDkRgOLpmgts4YocpyqdTH2pPIwaXP0S580VC1SFA+8Xgt9OBOOzxrvXI8c74giXpxm4+Q3D+u6jRHn41JpOwHzsyGbBEjvnzwRkaVjPLkTDjycnIYBDrWhwqO0QPntHCG2SgjeUQr4Gkqxr7qfu5d0Mny83bEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710673633; c=relaxed/simple;
	bh=VXYwGnRLqhoX4nTsg0/f/e8c2ou9866eyHRC+YjoqLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pczPMTxy2aDRdi08HdR2NxAp7x2SL1tW+usFGPT4osfi85S7NH7d7g/VU4fT1QZzhe5SCW9yPwFZ8r6pesSSR6jPByCdNTlDR2poOAGXVNLKfWGuqd/foNIrwAj1uzl6IxOMu1ZFwZP3JSZZOQ2EmvHdxkIW5loxHU+8Xk+dghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWW94RTL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWW94RTL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4190C433B1;
	Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710673632;
	bh=VXYwGnRLqhoX4nTsg0/f/e8c2ou9866eyHRC+YjoqLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TWW94RTLKKZa0nXPbWas2BD9PfJF4XI5+uz2xTuk1G8jhrxhlSzqVsCMCYLJXmLCy
	 uQCGvoU6AfhYAQeT3VVR5Nv1FtjGpvPyrLN/1TxtNXVM4rXzcDJ4ISIgXWxE6g9sID
	 ny4PGz41OMljtuwhCOnUylNcGqYYLZeSSANY9rJQtLo17XLwMKnpSJr2/R91JLeLoG
	 fj4IAcGifxuphmd8HrYmCjrG2zZ+XBD1emHeMm7kL/hGPm3zJrQA7rO0nQT28alMQT
	 BZBZ+LtyoiuXY/dH5dVK9bTcLTp6gPoN/NXrL1jPbTwKDLtqdYc6xIxgs3SlNTY2MP
	 QPfTsAXhWxO/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD290C54E71;
	Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sun, 17 Mar 2024 12:07:08 +0100
Subject: [PATCH v2 6/6] usb: kbd: Add probe quirk for Apple and Keychron
 keyboards
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-asahi-keyboards-v2-6-d3f4b8384f68@jannau.net>
References: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
In-Reply-To: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616; i=j@jannau.net;
 h=from:subject:message-id; bh=3QwUEWP3L6KlsCns2lL89QxfbDuChlSL5HehKX5qToc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtRv5+5pt7Pe+dFwRc5z80x+jsZjHfsP/s/pqy9VSeV/2
 Dln2t+kjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPxl2b4w8nuM19sh4RHH7NB
 YCLnCmXpG34uCb3dBcEfDv0NPMG0l+F/af5CHv6SiNklKnyp13+fPb95odRLv3d23dcuLaptlqt
 nAgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Janne Grunau <j@jannau.net>

Those keyboards do not return the current device state. Polling will
timeout unless there are key presses. This is not a problem during
operation but the inital device state query during probing will fail.
Skip this step in usb_kbd_probe_dev() to make these devices useable.
Not all Apple keyboards behave like this. A keyboard with USB
vendor/product ID 05ac:0221 is reported to work with the current code.
Unfortunately some Keychron keyboards "re-use" Apple's vendor ID and
show the same behavior (Keychron C2, 05ac:024f for example).

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 common/usb_kbd.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/common/usb_kbd.c b/common/usb_kbd.c
index 8cc3345075..43c7668671 100644
--- a/common/usb_kbd.c
+++ b/common/usb_kbd.c
@@ -31,6 +31,10 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021	0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021		0x029f
 
+#define USB_VENDOR_ID_KEYCHRON	0x3434
+
+#define USB_HID_QUIRK_POLL_NO_REPORT_IDLE	(1 << 0)
+
 /*
  * If overwrite_console returns 1, the stdin, stderr and stdout
  * are switched to the serial port, else the settings in the
@@ -474,6 +478,7 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 	struct usb_interface *iface;
 	struct usb_endpoint_descriptor *ep;
 	struct usb_kbd_pdata *data;
+	unsigned int quirks = 0;
 	int epNum;
 
 	if (dev->descriptor.bNumConfigurations != 1)
@@ -506,6 +511,15 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 
 	debug("USB KBD: found interrupt EP: 0x%x\n", ep->bEndpointAddress);
 
+	switch (dev->descriptor.idVendor) {
+	case USB_VENDOR_ID_APPLE:
+	case USB_VENDOR_ID_KEYCHRON:
+		quirks |= USB_HID_QUIRK_POLL_NO_REPORT_IDLE;
+		break;
+	default:
+		break;
+	}
+
 	data = malloc(sizeof(struct usb_kbd_pdata));
 	if (!data) {
 		printf("USB KBD: Error allocating private data\n");
@@ -546,6 +560,14 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 	usb_set_idle(dev, iface->desc.bInterfaceNumber, 0, 0);
 #endif
 
+	/*
+	 * Apple and Keychron keyboards do not report the device state. Reports
+	 * are only returned during key presses.
+	 */
+	if (quirks & USB_HID_QUIRK_POLL_NO_REPORT_IDLE) {
+		debug("USB KBD: quirk: skip testing device state\n");
+		return 1;
+	}
 	debug("USB KBD: enable interrupt pipe...\n");
 #ifdef CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE
 	data->intq = create_int_queue(dev, data->intpipe, 1,

-- 
2.44.0

