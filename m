Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A83AC1A
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500318; cv=none; b=lE/EM1uL1tKURCOcgan2fXuC1FTR4R1qWo57279a4dBCXEc6gf1QgCfqz6smr5nlhgdW26rTLPaK80/kQH9dSE7QHZnMbI2bva+/+D92F+DrZ1x3yehBciteTLBm/RvRppm1i3A/XI1DYcvGjSakWIZCYp4NmNt1Lkm0ICKmqgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500318; c=relaxed/simple;
	bh=k2TtkX+pdzAy2Y6EqTPgl2Lc45ZfW3qYeR+/pgHaXpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmvSGqdIxlOTI38TGuHsgMUAWXNO4aNwbjfHW5mk8WDVENhwUwaE+DMafCttl0mdMEW9LE7wRdoaC6MbWDZmN728XXzLwt8WxAR+KayIZl99VN3Ad5l5kpR8gqWX0q0AkHZvT0eem+b2uHMa77Til7j2xI4BmuPgRTEaOWPNuDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYNR6xHq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYNR6xHq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E8DC433B1;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708500316;
	bh=k2TtkX+pdzAy2Y6EqTPgl2Lc45ZfW3qYeR+/pgHaXpo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eYNR6xHqykY6JIXz2l1tzJHPzwMjg0R2Fbxp2uqENCascW8uW2OO81KwpFNjF5IXN
	 xAgMl68W7sTJPMOaVRVBz+BzTZUF+vQzjzgnYCsObcA0wkSUkauHLTjMjqcvZV79Jk
	 o2nJdukkWO5g7DOg6BiWNbihORwdX0mRdZVQOX0AfIQV2jW7gKedGd6KJj8drZEchB
	 FAO17YZxSq71cW+kxPBneFNXrw0GTqEoAruaqfP6scNv4p4JeLEymWdpgVo1tvTJEd
	 IuixQJX7ifFeoQQVcpdlqFYAdcMKNIdGsLDcfOyPZNq0GSU8Zu/3bKdAvuObjMmJXx
	 WqRS/EOndgkAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9437AC48BF6;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 21 Feb 2024 08:25:06 +0100
Subject: [PATCH 6/6] usb: kbd: Add probe quirk for Apple and Keychron
 keyboards
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-asahi-keyboards-v1-6-814b2e741790@jannau.net>
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
In-Reply-To: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=j@jannau.net;
 h=from:subject:message-id; bh=3y8349yV2wtUe41ovy+jezKbAFHoTDxLrAQuuV9nDGw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtSrS6OmyH2veiK4vNPh20Fu129K4cwBK/dJ705mOyIf/
 3VxeaB1RykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlMcWNkeN23YHuGxfecadMk
 r0znjHyfqvIg/+O61rKKGQ/nNLNzWTMynPr5Tnn9Mu0Dhw/typpU8bi05NOKrVd65/anMHJJ+nk
 m8gEA
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

Signed-off-by: Janne Grunau <j@jannau.net>
---
 common/usb_kbd.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/common/usb_kbd.c b/common/usb_kbd.c
index 7aa803eb4e..b0012ce7ad 100644
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
@@ -483,6 +487,7 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 	struct usb_interface *iface;
 	struct usb_endpoint_descriptor *ep;
 	struct usb_kbd_pdata *data;
+	unsigned int quirks = 0;
 	int epNum;
 	int i;
 
@@ -525,6 +530,15 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 
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
@@ -565,6 +579,14 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
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
2.43.2

