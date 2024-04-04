Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3D535B6
	for <asahi@lists.linux.dev>; Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211957; cv=none; b=nmn5hTgc+aouAQzcpcfCsyhxB69b1K32GYiRcvUuWK9hN21/CHDhI3UAhZqeeMlNqErBo8+53pN80kICyYL17aRpJVW9m5DAcu8Xqi/mSpudgTocwDOOM/PLtxkCoxjP640BGgv4yJEdsXaLtiNQ/EE5Amh6PacwITchQc7M83c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211957; c=relaxed/simple;
	bh=220EKJrUzV/oO3xmhRzS/xreBpoyeA6NUX+he0WXNOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcecJ9gHdmbJ37XLKiiOJooSQPnatLbhZ+8SUHliYiv3mSJApFiqQGnF4Jn5g4vNnQd6atj0uSf0Oq/+5K8A19t0+6fX/igjgfpED6y0uz83ci+hm36wR+a9XyEhmNGUSp7oS4VMEWFzTILnGM58PWUfskcl8cS39eduOH/m0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXQVbUcw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXQVbUcw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47BE6C433F1;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712211957;
	bh=220EKJrUzV/oO3xmhRzS/xreBpoyeA6NUX+he0WXNOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mXQVbUcwLRtxWaFaZGVxv4QXsfqHImxIs6a5Eu6l0+u60q7HfTwighSPZVJSuZi6R
	 0NADlzwYKfWF9Mo6IEz/hXlm1PTwswt2M1aTyhrE+diVfAwAdYna1JYLXn2a8G9r+u
	 /z4s85mIeHy2a978Rqa/epQ1BnngLxfsGW8Wzom+GQGXGxKPCo4+ycNpQasGIR3UUB
	 uX/+AjSmr+En+dfpM4EmrqHWpqr3LKeEVbMbhTHqQuE2xOC/s4Sx87wVOEgycwphl0
	 9IfD3kDENYc4QyyDyWFYk5aY7sbCE7zohtGk52fFbVEyAm2OEvQadq0CKDvKgaXhWd
	 FVMB2PGK8KDTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC3CD1288;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 04 Apr 2024 08:25:49 +0200
Subject: [PATCH v4 1/6] usb: xhci: refactor xhci_set_configuration
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-asahi-keyboards-v4-1-2266033feaff@jannau.net>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
In-Reply-To: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5846; i=j@jannau.net;
 h=from:subject:message-id;
 bh=sLcpqWf1O0mOubKx/OeFG6FJtQQ1T3S30o68YjijtcA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjQ+908Gr17+6OeqfifwhkG1pq6Dpacz7VeoptFX1u9CJ
 f8eFgp3lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BuEgMwz+7lV4KFR6bI7sZNR6t
 K/C8tfi494dpD///8twU9s3n9tmzjAz3TNzV3dg877Wcq3OufdedlWSdyvJmj53azxPirCeOaTA
 AAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

In the next step endpoints for multiple interfaces are set up. Move most
of the per endpoint initialization to separate function to avoid another
identation level.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/usb/host/xhci.c | 119 +++++++++++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d13cbff9b3..534c4b973f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -475,67 +475,34 @@ static int xhci_configure_endpoints(struct usb_device *udev, bool ctx_change)
 }
 
 /**
- * Configure the endpoint, programming the device contexts.
+ * Fill endpoint contexts for interface descriptor ifdesc.
  *
- * @param udev	pointer to the USB device structure
- * Return: returns the status of the xhci_configure_endpoints
+ * @param udev		pointer to the USB device structure
+ * @param ctrl		pointer to the xhci pravte device structure
+ * @param virt_dev	pointer to the xhci virtual device structure
+ * @param ifdesc	pointer to the USB interface config descriptor
+ * Return: returns the status of xhci_init_ep_contexts_if
  */
-static int xhci_set_configuration(struct usb_device *udev)
+static int xhci_init_ep_contexts_if(struct usb_device *udev,
+				    struct xhci_ctrl *ctrl,
+				    struct xhci_virt_device *virt_dev,
+				    struct usb_interface *ifdesc
+	)
 {
-	struct xhci_container_ctx *in_ctx;
-	struct xhci_container_ctx *out_ctx;
-	struct xhci_input_control_ctx *ctrl_ctx;
-	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_ep_ctx *ep_ctx[MAX_EP_CTX_NUM];
 	int cur_ep;
-	int max_ep_flag = 0;
 	int ep_index;
 	unsigned int dir;
 	unsigned int ep_type;
-	struct xhci_ctrl *ctrl = xhci_get_ctrl(udev);
-	int num_of_ep;
-	int ep_flag = 0;
 	u64 trb_64 = 0;
-	int slot_id = udev->slot_id;
-	struct xhci_virt_device *virt_dev = ctrl->devs[slot_id];
-	struct usb_interface *ifdesc;
 	u32 max_esit_payload;
 	unsigned int interval;
 	unsigned int mult;
 	unsigned int max_burst;
 	unsigned int avg_trb_len;
 	unsigned int err_count = 0;
+	int num_of_ep = ifdesc->no_of_ep;
 
-	out_ctx = virt_dev->out_ctx;
-	in_ctx = virt_dev->in_ctx;
-
-	num_of_ep = udev->config.if_desc[0].no_of_ep;
-	ifdesc = &udev->config.if_desc[0];
-
-	ctrl_ctx = xhci_get_input_control_ctx(in_ctx);
-	/* Initialize the input context control */
-	ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG);
-	ctrl_ctx->drop_flags = 0;
-
-	/* EP_FLAG gives values 1 & 4 for EP1OUT and EP2IN */
-	for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
-		ep_flag = xhci_get_ep_index(&ifdesc->ep_desc[cur_ep]);
-		ctrl_ctx->add_flags |= cpu_to_le32(1 << (ep_flag + 1));
-		if (max_ep_flag < ep_flag)
-			max_ep_flag = ep_flag;
-	}
-
-	xhci_inval_cache((uintptr_t)out_ctx->bytes, out_ctx->size);
-
-	/* slot context */
-	xhci_slot_copy(ctrl, in_ctx, out_ctx);
-	slot_ctx = xhci_get_slot_ctx(ctrl, in_ctx);
-	slot_ctx->dev_info &= ~(cpu_to_le32(LAST_CTX_MASK));
-	slot_ctx->dev_info |= cpu_to_le32(LAST_CTX(max_ep_flag + 1) | 0);
-
-	xhci_endpoint_copy(ctrl, in_ctx, out_ctx, 0);
-
-	/* filling up ep contexts */
 	for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
 		struct usb_endpoint_descriptor *endpt_desc = NULL;
 		struct usb_ss_ep_comp_descriptor *ss_ep_comp_desc = NULL;
@@ -561,7 +528,8 @@ static int xhci_set_configuration(struct usb_device *udev)
 		avg_trb_len = max_esit_payload;
 
 		ep_index = xhci_get_ep_index(endpt_desc);
-		ep_ctx[ep_index] = xhci_get_ep_ctx(ctrl, in_ctx, ep_index);
+		ep_ctx[ep_index] = xhci_get_ep_ctx(ctrl, virt_dev->in_ctx,
+						   ep_index);
 
 		/* Allocate the ep rings */
 		virt_dev->eps[ep_index].ring = xhci_ring_alloc(ctrl, 1, true);
@@ -614,6 +582,65 @@ static int xhci_set_configuration(struct usb_device *udev)
 		}
 	}
 
+	return 0;
+}
+
+/**
+ * Configure the endpoint, programming the device contexts.
+ *
+ * @param udev	pointer to the USB device structure
+ * Return: returns the status of the xhci_configure_endpoints
+ */
+static int xhci_set_configuration(struct usb_device *udev)
+{
+	struct xhci_container_ctx *out_ctx;
+	struct xhci_container_ctx *in_ctx;
+	struct xhci_input_control_ctx *ctrl_ctx;
+	struct xhci_slot_ctx *slot_ctx;
+	int err;
+	int cur_ep;
+	int max_ep_flag = 0;
+	struct xhci_ctrl *ctrl = xhci_get_ctrl(udev);
+	int num_of_ep;
+	int ep_flag = 0;
+	int slot_id = udev->slot_id;
+	struct xhci_virt_device *virt_dev = ctrl->devs[slot_id];
+	struct usb_interface *ifdesc;
+
+	out_ctx = virt_dev->out_ctx;
+	in_ctx = virt_dev->in_ctx;
+
+	num_of_ep = udev->config.if_desc[0].no_of_ep;
+	ifdesc = &udev->config.if_desc[0];
+
+	ctrl_ctx = xhci_get_input_control_ctx(in_ctx);
+	/* Initialize the input context control */
+	ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG);
+	ctrl_ctx->drop_flags = 0;
+
+	/* EP_FLAG gives values 1 & 4 for EP1OUT and EP2IN */
+	for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
+		ep_flag = xhci_get_ep_index(&ifdesc->ep_desc[cur_ep]);
+		ctrl_ctx->add_flags |= cpu_to_le32(1 << (ep_flag + 1));
+		if (max_ep_flag < ep_flag)
+			max_ep_flag = ep_flag;
+	}
+
+	xhci_inval_cache((uintptr_t)out_ctx->bytes, out_ctx->size);
+
+	/* slot context */
+	xhci_slot_copy(ctrl, in_ctx, out_ctx);
+	slot_ctx = xhci_get_slot_ctx(ctrl, in_ctx);
+	slot_ctx->dev_info &= ~(cpu_to_le32(LAST_CTX_MASK));
+	slot_ctx->dev_info |= cpu_to_le32(LAST_CTX(max_ep_flag + 1) | 0);
+
+	xhci_endpoint_copy(ctrl, in_ctx, out_ctx, 0);
+
+	/* filling up ep contexts */
+	err = xhci_init_ep_contexts_if(udev, ctrl, virt_dev, ifdesc);
+	if (err < 0)
+		return err;
+
 	return xhci_configure_endpoints(udev, false);
 }
 

-- 
2.44.0


