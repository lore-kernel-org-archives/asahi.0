Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D2C1804E
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710673633; cv=none; b=MiHeS7QWLnoJ70dS8w3FvO+/9a9GmHfYVKT29VnaArB3aSvLLngxHUvOM5TLwAIXzeNfCOrlG8o3yuLTvmgeVkrjKKjnCz/mHUSejjv2/ynDcgGc1w9KMHyt4gcTiA/xB0F+B5Ti4ZFzxX2arrFguE877R5Jo3MeL5ateW3wc5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710673633; c=relaxed/simple;
	bh=rYXV0k7EBckYZTsVZcUhRN+UEMaEXk+zOV9pKXRAWW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SP+5JMIwmZaYxrVPKCk1JUqZ26g7ZSnYUR4Bfh3jwIaMHKhVl9ewUii1d3zcdLoZOvPdTw7K9mAKB07hBrrYwL4GeeDa/biVb8YMejkqK2cnaClF66R4DWnDH4NYZy75OfZaLgvyPjFUp0TWl4ayjo7KmpCjdplhLxkLrDCww5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEwxsICP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEwxsICP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1906C433F1;
	Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710673632;
	bh=rYXV0k7EBckYZTsVZcUhRN+UEMaEXk+zOV9pKXRAWW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XEwxsICPqaLmbTo2yGqIAOdJEFqRfmftd3UT76gvSWkGrlOzpfwgf0K50yIfVBZTO
	 WsZDlGC+uIh5M4YDsSSoOob6jRqqbQuVMuqqBtg0FFJfauBbvQ7n3XKYjqyQfUO3Xi
	 w0Z6ccCAucedio0y8osMawnrNtsw0c5rCx17rtdKb5F5Iu0YI3AaPQJJFZ8XTdRSDk
	 um5FrZCbdX4hfJ6X1bhIe4Q4W5yfUpnY9jLlDXF08VvlFblTRxEDkHeOXL61ohrAi+
	 j1xfPDtD57W8a+uD7xCEiME31pAh4eTLbfYSmWeEy14ew81Pn5z1rbz91aAOasz1M8
	 jeis4V/2CJJHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93559C54E71;
	Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sun, 17 Mar 2024 12:07:04 +0100
Subject: [PATCH v2 2/6] usb: xhci: Set up endpoints for the first 2
 interfaces
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-asahi-keyboards-v2-2-d3f4b8384f68@jannau.net>
References: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
In-Reply-To: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3546; i=j@jannau.net;
 h=from:subject:message-id; bh=jCJdN1l13rXok34wJeFoF4KbGic4w4dcopGqoogzJGU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtRv5+79v5DUmrBp5ZHfVos4PrL4fHh4VFjn7UObx7bsx
 U26Opt/dpSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZhIwk+G/5ET01cvXDn1xtWK
 3VMW//D57F0vlSisG7w6uPV6zcqFRt8YGZbdb7rMFqNaKmRy0DR/pVffm5VCGRfru0JyZyWGuSh
 +5gMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Janne Grunau <j@jannau.net>

The xhci driver currently only does the necessary initialization for
endpoints found in the first interface descriptor. Apple USB keyboards
(released 2021) use the second interface descriptor for the HID keyboard
boot protocol. To allow USB drivers to use endpoints from other
interface descriptors the xhci driver needs to ensure these endpoints
are initialized as well.
Use USB_MAX_ACTIVE_INTERFACES to control how many interface descriptors
are considered during endpoint initialisation.
For now define it to 2 as that is sufficient for supporting the Apple
keyboards.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/usb/host/xhci.c | 31 +++++++++++++++++++------------
 include/usb.h           |  6 ++++++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 534c4b973f..741e186ee0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -606,24 +606,28 @@ static int xhci_set_configuration(struct usb_device *udev)
 	int slot_id = udev->slot_id;
 	struct xhci_virt_device *virt_dev = ctrl->devs[slot_id];
 	struct usb_interface *ifdesc;
+	unsigned int ifnum;
+	unsigned int max_ifnum = min((unsigned int)USB_MAX_ACTIVE_INTERFACES,
+				     (unsigned int)udev->config.no_of_if);
 
 	out_ctx = virt_dev->out_ctx;
 	in_ctx = virt_dev->in_ctx;
 
-	num_of_ep = udev->config.if_desc[0].no_of_ep;
-	ifdesc = &udev->config.if_desc[0];
-
 	ctrl_ctx = xhci_get_input_control_ctx(in_ctx);
 	/* Initialize the input context control */
 	ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG);
 	ctrl_ctx->drop_flags = 0;
 
-	/* EP_FLAG gives values 1 & 4 for EP1OUT and EP2IN */
-	for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
-		ep_flag = xhci_get_ep_index(&ifdesc->ep_desc[cur_ep]);
-		ctrl_ctx->add_flags |= cpu_to_le32(1 << (ep_flag + 1));
-		if (max_ep_flag < ep_flag)
-			max_ep_flag = ep_flag;
+	for (ifnum = 0; ifnum < max_ifnum; ifnum++) {
+		ifdesc = &udev->config.if_desc[ifnum];
+		num_of_ep = ifdesc->no_of_ep;
+		/* EP_FLAG gives values 1 & 4 for EP1OUT and EP2IN */
+		for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
+			ep_flag = xhci_get_ep_index(&ifdesc->ep_desc[cur_ep]);
+			ctrl_ctx->add_flags |= cpu_to_le32(1 << (ep_flag + 1));
+			if (max_ep_flag < ep_flag)
+				max_ep_flag = ep_flag;
+		}
 	}
 
 	xhci_inval_cache((uintptr_t)out_ctx->bytes, out_ctx->size);
@@ -637,9 +641,12 @@ static int xhci_set_configuration(struct usb_device *udev)
 	xhci_endpoint_copy(ctrl, in_ctx, out_ctx, 0);
 
 	/* filling up ep contexts */
-	err = xhci_init_ep_contexts_if(udev, ctrl, virt_dev, ifdesc);
-	if (err < 0)
-		return err;
+	for (ifnum = 0; ifnum < max_ifnum; ifnum++) {
+		ifdesc = &udev->config.if_desc[ifnum];
+		err = xhci_init_ep_contexts_if(udev, ctrl, virt_dev, ifdesc);
+		if (err < 0)
+			return err;
+	}
 
 	return xhci_configure_endpoints(udev, false);
 }
diff --git a/include/usb.h b/include/usb.h
index 09e3f0cb30..3aafdc8bfd 100644
--- a/include/usb.h
+++ b/include/usb.h
@@ -49,6 +49,12 @@ extern bool usb_started; /* flag for the started/stopped USB status */
  */
 #define USB_TIMEOUT_MS(pipe) (usb_pipebulk(pipe) ? 5000 : 1000)
 
+/*
+ * The xhcd hcd driver prepares only a limited number interfaces / endpoints.
+ * Define this limit so that drivers do not exceed it.
+ */
+#define USB_MAX_ACTIVE_INTERFACES	2
+
 /* device request (setup) */
 struct devrequest {
 	__u8	requesttype;

-- 
2.44.0

