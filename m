Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA94DA19
	for <asahi@lists.linux.dev>; Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211958; cv=none; b=Qr2TKwGCHD80sArt/FvuNPlU7TZ7obvgp8b7J4EQrMyyY2JuYQoEzGIqTOHkvEiWfozI1UpkFBgJ1bzNTppovbrl5yGelkUwANkQ40pMK5U6uYH1QNlkmX3BSYgDb97iwr/Imd2+sP+57ea5pWowi7s3N53PRdJU5odQgbs0apE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211958; c=relaxed/simple;
	bh=xpx0/NNe83yCRC+vVlcvHAc/0Ae5UbUFLTbDMDNGRlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=an0Caz650axRxjO9N4Qe/DSE0TO7ccQRQckJ5HY7MbiktJFlBSRin8YuJcXOsiMOTKtpwOaQkTpe8M/ZMIrkmTmqjZJhBV/7jkvJURZ+OKBsfUOEDr3tuVIw1QkFFhJviZ4p4NZEMwH3nR6czXTmaT2TvpOkZP6Oy0ecf3Vsz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAdtcDdb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAdtcDdb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B338C433B1;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712211957;
	bh=xpx0/NNe83yCRC+vVlcvHAc/0Ae5UbUFLTbDMDNGRlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uAdtcDdbypBHcmR0sQZzmbnTfSEq7tIII1zACc7uH2b3ypr6fCXagjlISgQ5fFHMG
	 EkhFAwp7zXvQRSpKZ7ZMWG6rB4qRm2Nz2C6m5GEs5le7IntuVwXC7+ttdpZw+8zdkL
	 Me9no+ubFYwoyIL5gE45QK87QlJCRT2r1/viLYOoEgkOUf6SSXfaZvUsqNt83IcqJq
	 99Xhvnz2Gp+rv/gHmdGlKGbrZS4KuSveN1iaQKmEROGo+ZgMSRcX1xX8T6X7+Vua9T
	 zIbWAWJ35XRlPcuv3yUynDYMCEA8yBtY1Iu7HgBImk7tH7vqzCrjczauu81cavnK0H
	 fuxonNSyf5wpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8355ECD1284;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 04 Apr 2024 08:25:54 +0200
Subject: [PATCH v4 6/6] usb: kbd: Add probe quirk for Apple and Keychron
 keyboards
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-asahi-keyboards-v4-6-2266033feaff@jannau.net>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
In-Reply-To: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=j@jannau.net;
 h=from:subject:message-id;
 bh=bgC5VMp6aw6U5Uhn14jI61Gw7z5YE8JE2SujySRwwJE=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjQ+98/uJ2eL+qZYXv4c3f/fa4eku3jLhOZ1T997R72XY
 ihtCVnaUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCLVcxgZTkocmFEnzvYwjlE+
 o28a/90H4rc3B0cUtX6c71kRfyRpHSPDRdUHLu48C+ZkbLzuyfn6hfU5w/yMB9a7Uo/OXTpJ2bG
 cFwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Those keyboards do not return the current device state. Polling will
timeout unless there are key presses. This is not a problem during
operation but the initial device state query during probing will fail.
Skip this step in usb_kbd_probe_dev() to make these devices useable.
Not all Apple keyboards behave like this. A keyboard with USB
vendor/product ID 05ac:0221 is reported to work with the current code.
Unfortunately some Keychron keyboards "re-use" Apple's vendor ID and
show the same behavior (Keychron C2, 05ac:024f for example).

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 common/usb_kbd.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/common/usb_kbd.c b/common/usb_kbd.c
index b2361bbf18..820f591fc5 100644
--- a/common/usb_kbd.c
+++ b/common/usb_kbd.c
@@ -31,6 +31,10 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021	0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021		0x029f
 
+#define USB_VENDOR_ID_KEYCHRON	0x3434
+
+#define USB_HID_QUIRK_POLL_NO_REPORT_IDLE	BIT(0)
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


