Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A43B296
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500318; cv=none; b=NmcB7ww1X7QsOT9Nlz4PRehDfGMxWZlIkjwtIu3x4wWK2iMHCBOyaBGdPkJ+RbZtIB6KOlBuPTE08oUR29SzJZ2YAsCUQHFCibWZRPjXT5jfqST+1D1cgMhSTyFOzZ3EYjrVBFQ3JW4dsSXLcVTmNvaESOYXCqOM/vz8Qk+x2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500318; c=relaxed/simple;
	bh=zNo8TsV9W6bspsRP0sbff0RXSsZ/VvDRgBhJ/EE3GMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fa/jTEJtIGGRFl+BaePzZKR4zqRGEXA01h41SkIyxs+io4m5GbHp5GfIJ2BntBCpGUJSxiN8eqvAG9U7EX5+pJd7MiZcYZ+r4zxtrW0tHKOuJTYTjFRrkbSnFJ7QRx2eKOU3Q0R5eoTGPXz+x16mYOs7ZkvVqfsZZeeavLZi2f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7OlJfS/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7OlJfS/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EA4BC433A6;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708500316;
	bh=zNo8TsV9W6bspsRP0sbff0RXSsZ/VvDRgBhJ/EE3GMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P7OlJfS/kTW3J6GYMcjTCErFVYonVbgrNrWRUglr+75bzH1LqFPRYaB2V2Kf06qri
	 tu4QB0biX0x511gtPffKKWh9QSBmEVUyfvd5z2leCOGstVFbuSw2i2PFfMv9YEKuSA
	 /6G/bARQzR4/WxpTuIutYi5YpY48FRUYWC6Wgh3dEM/MOaUZHQT4UfCDxixQlYUwy8
	 R6lQFjT3PbmKanCY/DZL7uJyvA50kII3Oub3Yy+g3Z/r/QOq4ZObCYGikIXi9deL+h
	 l4OR1K4LxfXoqjRGr4IqvGCEe5FLkqBOnsiRlDEZYbSwvmSpALrRHRwD5E7ecusjQA
	 0OVaysuaLBLzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780C1C5478A;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 21 Feb 2024 08:25:04 +0100
Subject: [PATCH 4/6] usb: kbd: Ignore Yubikeys
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-asahi-keyboards-v1-4-814b2e741790@jannau.net>
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
In-Reply-To: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802; i=j@jannau.net;
 h=from:subject:message-id; bh=Skl/l5JT0ZXzNGK38C7Z1Yy3xS+vbisq7v96Lch2Hkk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtSrS6OaihRjt+uJPnx35LPEscrmrT9WJTRe2e7WEXO+t
 oBzufP1jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABMxvsrwP+a9gfZJk1krpf/N
 jFa5scCk63Ox7LLvXbK7uvIT3Of+Wc7wT5ttF/dHj/p5Gt9Fuuc/Yd2axbd02d5cl7+xUq+yDv/
 O5gIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Hector Martin <marcan@marcan.st>

We currently only support one USB keyboard device, but some devices
emulate keyboards for other purposes. Most commonly, people run into
this with Yubikeys, so let's ignore those.

Even if we end up supporting multiple keyboards in the future, it's
safer to ignore known non-keyboard devices.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 common/usb_kbd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/common/usb_kbd.c b/common/usb_kbd.c
index 4cbc9acb73..774d3555d9 100644
--- a/common/usb_kbd.c
+++ b/common/usb_kbd.c
@@ -120,6 +120,15 @@ struct usb_kbd_pdata {
 
 extern int __maybe_unused net_busy_flag;
 
+/*
+ * Since we only support one usbkbd device in the iomux,
+ * ignore common keyboard-emulating devices that aren't
+ * real keyboards.
+ */
+const uint16_t vid_blocklist[] = {
+	0x1050, /* Yubico */
+};
+
 /* The period of time between two calls of usb_kbd_testc(). */
 static unsigned long kbd_testc_tms;
 
@@ -465,6 +474,7 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 	struct usb_endpoint_descriptor *ep;
 	struct usb_kbd_pdata *data;
 	int epNum;
+	int i;
 
 	if (dev->descriptor.bNumConfigurations != 1)
 		return 0;
@@ -480,6 +490,15 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
 	if (iface->desc.bInterfaceProtocol != USB_PROT_HID_KEYBOARD)
 		return 0;
 
+	for (i = 0; i < ARRAY_SIZE(vid_blocklist); i++) {
+		if (dev->descriptor.idVendor == vid_blocklist[i]) {
+			printf("Ignoring keyboard device 0x%x:0x%x\n",
+			       dev->descriptor.idVendor,
+			       dev->descriptor.idProduct);
+			return 0;
+		}
+	}
+
 	for (epNum = 0; epNum < iface->desc.bNumEndpoints; epNum++) {
 		ep = &iface->ep_desc[epNum];
 

-- 
2.43.2

