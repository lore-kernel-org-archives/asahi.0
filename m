Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E764CB2E
	for <asahi@lists.linux.dev>; Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211957; cv=none; b=fTqgbIm6IxMVuf4XR4s1C1PNIrSwM+K+FrBf4IwmbSgP540PKKc2lDGvqAVvBPWiUf+a8u9vLDXWT9i7n3V7oJeCduw50Ndh9VDHfSOfSlYS/mE5xEeu7rhZdyZB8M7eL+otu6GNuYhdrlyvYYPjwuPtBFj9VssGyxHRGCSKVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211957; c=relaxed/simple;
	bh=Z4SzvQbg2Nn0Yo9untMHNeLq+1/xEkY3waFx9nS2fg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CD70+PDWFTZvAFaFHS0k0Do8MGCrO5drRZbMlBreMmI4UeGoEAs7trbh1GxByFNwc/8eKxuFgMJxXa89ZrzIko2t6g6ZHt0gl4dQeq3xwtegwYpSE4D+qeWtohXmLbJC5SXkhV8tdCOCOStqXMtF9u1moLqjYQuM497DyWAT14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k44dY3EK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k44dY3EK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EF4AC433A6;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712211957;
	bh=Z4SzvQbg2Nn0Yo9untMHNeLq+1/xEkY3waFx9nS2fg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k44dY3EKgLuPbcLElD31iX6/LTbRWj3Q5Pbi/9VaI6fSJQGnSM5wiH4dvXLsS1Ywd
	 nPRJ/jhdatfP/2K9IRh3ptQnOWC7IzaqieQ9JZQURLy5Ov9xj0pv/kLpIizPIfqv7h
	 hrByv2Y5fTN7bvKOqElmJ+OoT5WOi6ypoUNx5N1qM7ClvdwHoaHM1D8Z3NCJcVnPTT
	 oH2H3aUozQKZq7XbfZ41DauG+7geWBd3f8AwqkHN7MWaoP2KSelA88IFtRWNBQKfib
	 q7RkSX+WIIVohylCAEm05TjLZIytgyh3ECgwHXUT3bVhkQIlO7wj+63lA8z+FB0akx
	 XPzMdwNQAlplg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BD7CD129A;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 04 Apr 2024 08:25:52 +0200
Subject: [PATCH v4 4/6] usb: Add environment based device ignorelist
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-asahi-keyboards-v4-4-2266033feaff@jannau.net>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
In-Reply-To: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5463; i=j@jannau.net;
 h=from:subject:message-id;
 bh=F5Mqgr6BIYt/bv/GWdjY+VTDA0h3dv9SbJy1oTwzanU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjQ+98+6PxZf3ffSykpwovfaj1cfLLJOcXHN7ftQf+PTr
 ZsiLveMO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEzEbgUjw3Il518XA1Yu/bP8
 2wn/6cxu8x51a5VdX7Sr95okWz2jaRsjw1mxk9aChx7lBbrbrtj6/MdNiRWF9lKe22dPu/eao7N
 hPx8A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Add the environment variable "usb_ignorelist" to prevent USB devices
listed in it from being bound to drivers. This allows to ignore devices
which are undesirable or trigger bugs in u-boot's USB stack.
Devices emulating keyboards are one example of undesirable devices as
u-boot currently supports only a single USB keyboard device. Most
commonly, people run into this with Yubikeys, so let's ignore those in
the default environment.

Based on previous USB keyboard specific patches for the same purpose.

Link: https://lore.kernel.org/u-boot/7ab604fb-0fec-4f5e-8708-7a3a7e2cb568@denx.de/
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 common/usb.c              | 64 +++++++++++++++++++++++++++++++++++++++++++++++
 doc/usage/environment.rst | 13 ++++++++++
 include/env_default.h     | 11 ++++++++
 3 files changed, 88 insertions(+)

diff --git a/common/usb.c b/common/usb.c
index 836506dcd9..44db07742e 100644
--- a/common/usb.c
+++ b/common/usb.c
@@ -28,6 +28,7 @@
 #include <common.h>
 #include <command.h>
 #include <dm.h>
+#include <dm/device_compat.h>
 #include <log.h>
 #include <malloc.h>
 #include <memalign.h>
@@ -1084,6 +1085,48 @@ static int usb_prepare_device(struct usb_device *dev, int addr, bool do_read,
 	return 0;
 }
 
+static int usb_device_is_ignored(u16 id_vendor, u16 id_product)
+{
+	ulong vid, pid;
+	char *end;
+	const char *cur = env_get("usb_ignorelist");
+
+	/* parse "usb_ignorelist" strictly */
+	while (cur && cur[0] != '\0') {
+		vid = simple_strtoul(cur, &end, 0);
+		/*
+		 * If strtoul did not parse a single digit or the next char is
+		 * not ':' the ignore list is malformed.
+		 */
+		if (cur == end || end[0] != ':')
+			return -EINVAL;
+
+		cur = end + 1;
+		pid = simple_strtoul(cur, &end, 0);
+		/* Consider '*' as wildcard for the product ID */
+		if (cur == end && end[0] == '*') {
+			pid = U16_MAX + 1;
+			end++;
+		}
+		/*
+		 * The ignore list is malformed if no product ID / wildcard was
+		 * parsed or entries are not separated by ',' or terminated with
+		 * '\0'.
+		 */
+		if (cur == end || (end[0] != ',' && end[0] != '\0'))
+			return -EINVAL;
+
+		if (id_vendor == vid && (pid > U16_MAX || id_product == pid))
+			return -ENODEV;
+
+		if (end[0] == '\0')
+			break;
+		cur = end + 1;
+	}
+
+	return 0;
+}
+
 int usb_select_config(struct usb_device *dev)
 {
 	unsigned char *tmpbuf = NULL;
@@ -1099,6 +1142,27 @@ int usb_select_config(struct usb_device *dev)
 	le16_to_cpus(&dev->descriptor.idProduct);
 	le16_to_cpus(&dev->descriptor.bcdDevice);
 
+	/* ignore devices from usb_ignorelist */
+	err = usb_device_is_ignored(dev->descriptor.idVendor,
+				    dev->descriptor.idProduct);
+	if (err == -ENODEV) {
+		dev_dbg(dev->dev, "Ignoring USB device 0x%x:0x%x\n",
+			dev->descriptor.idVendor, dev->descriptor.idProduct);
+		return err;
+	} else if (err == -EINVAL) {
+		/*
+		 * Continue on "usb_ignorelist" parsing errors. The list is
+		 * parsed for each device returning the error would result in
+		 * ignoring all USB devices.
+		 * Since the parsing error is independent of the probed device
+		 * report errors with printf instead of dev_err.
+		 */
+		printf("usb_ignorelist parse error in \"%s\"\n",
+		       env_get("usb_ignorelist"));
+	} else if (err < 0) {
+		return err;
+	}
+
 	/*
 	 * Kingston DT Ultimate 32GB USB 3.0 seems to be extremely sensitive
 	 * about this first Get Descriptor request. If there are any other
diff --git a/doc/usage/environment.rst b/doc/usage/environment.rst
index ebf75fa948..7d4b448cb3 100644
--- a/doc/usage/environment.rst
+++ b/doc/usage/environment.rst
@@ -366,6 +366,19 @@ tftpwindowsize
     This means the count of blocks we can receive before
     sending ack to server.
 
+usb_ignorelist
+    Ignore USB devices to prevent binding them to an USB device driver. This can
+    be used to ignore devices are for some reason undesirable or causes crashes
+    u-boot's USB stack.
+    An example for undesired behavior is the keyboard emulation of security keys
+    like Yubikeys. U-boot currently supports only a single USB keyboard device
+    so try to probe an useful keyboard device. The default environment blocks
+    Yubico devices as common devices emulating keyboards.
+    Devices are matched by idVendor and idProduct. The variable contains a comma
+    separated list of idVendor:idProduct pairs as hexadecimal numbers joined
+    by a colon. '*' functions as a wildcard for idProduct to block all devices
+    with the specified idVendor.
+
 vlan
     When set to a value < 4095 the traffic over
     Ethernet is encapsulated/received over 802.1q
diff --git a/include/env_default.h b/include/env_default.h
index 2ca4a087d3..8ee500d170 100644
--- a/include/env_default.h
+++ b/include/env_default.h
@@ -99,6 +99,17 @@ const char default_environment[] = {
 #ifdef CONFIG_SYS_SOC
 	"soc="		CONFIG_SYS_SOC			"\0"
 #endif
+#ifdef CONFIG_USB_HOST
+	"usb_ignorelist="
+#ifdef CONFIG_USB_KEYBOARD
+	/* Ignore Yubico devices. Currently only a single USB keyboard device is
+	 * supported and the emulated HID keyboard Yubikeys present is useless
+	 * as keyboard.
+	 */
+	"0x1050:*,"
+#endif
+	"\0"
+#endif
 #ifdef CONFIG_ENV_IMPORT_FDT
 	"env_fdt_path="	CONFIG_ENV_FDT_PATH		"\0"
 #endif

-- 
2.44.0


