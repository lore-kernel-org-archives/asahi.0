Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032EA3B29D
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500318; cv=none; b=JjMToxGLe5zGW7LXSKVqhcPO+cs974ia/S6m2nfoIpaWObbffD83VdI1UjVec/OZFM1mhRCVGiGWj1gSLqSaYn7AJDzok7h8E6kbwIrgiSUjQgAkkUyBFir3nWk1U6gimvNSLNRWX/uIyA9VKgrtI5lrbke0nE01Wwrf7Aj+HLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500318; c=relaxed/simple;
	bh=Y6odlijuKiKQUClQ3ri7K4Ic1LfOLpeOocte5K/8Qu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVv5n1b+Bvq6vFyztKHAjDbfKyN5Ex1dqAjoNwiAo/cLj7h+KaNOd0NWqdsiCkeiM66w5Ao9L/rZ4D3I9ql01mooG7yWG3UshYXBzqArG3AXzSFF63Gv8euLf8bMC1zu/dzEVBFZoOfx49MbQdPM+VIfTdYC1LxVq+aFU2Tuyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IR1Yx9nQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IR1Yx9nQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 827D6C43394;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708500316;
	bh=Y6odlijuKiKQUClQ3ri7K4Ic1LfOLpeOocte5K/8Qu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IR1Yx9nQEwPDbXR+KG7CPcdksurBog7eKtzUlAKoXzWAPN7vmkH3S4i1kNxeM1ouo
	 g47gAFQmtEheUK+4hGyTZgQnKIKF/KaDfXv5583GE1G9F5+hfPcrx1P9pDPqd4wxde
	 7AYpVHOoOYKkHWWMGLbkNHaCyqsIonAfccAxEcOewHfigOPqXxDWexXO5aOBXLx9oO
	 cM20slhdLSrmPMiab0aizqNIdaNQ7zHdX+T2y5GAntDweA4qQi19MLZrE2zIhNIkOM
	 /dUX6/ijmFR7vrA/3S5GxAj/llO+T4NAB25RfNK7H2KiWI9WM1ltHq4vun5Nd97pHA
	 6NeTX2JQXF0zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDDCC5475B;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 21 Feb 2024 08:25:03 +0100
Subject: [PATCH 3/6] usb: xhci: Abort transfers with unallocated rings
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-asahi-keyboards-v1-3-814b2e741790@jannau.net>
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
In-Reply-To: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053; i=j@jannau.net;
 h=from:subject:message-id; bh=EzgLII75vJWMRf8tU350iE+qgV69Ozl8ArZ4I2u1mHc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtSrS6Mu2N81yt4jqSdY+TbFLk6HsflZifz5wsReDm79P
 N38h/odpSwMYlwMsmKKLEnaLzsYVtcoxtQ+CIOZw8oEMoSBi1MAJmI1k+EXM2ela8XO9qRDs72c
 87LV2T4YzPaoSX+99vHTlTMKJwmHMfwzu7BcKjzZN4NR5GDV/qR/b0xe2p2artIxedLpndkV7Wp
 cAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Janne Grunau <j@jannau.net>

Discovered while trying to use the second interface in the USB keyboard
driver necessary on Apple USB keyboards.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/usb/host/xhci-ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b60661fe05..4446f5f098 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -685,6 +685,9 @@ int xhci_bulk_tx(struct usb_device *udev, unsigned long pipe,
 		reset_ep(udev, ep_index);
 
 	ring = virt_dev->eps[ep_index].ring;
+	if (!ring)
+		return -1;
+
 	/*
 	 * How much data is (potentially) left before the 64KB boundary?
 	 * XHCI Spec puts restriction( TABLE 49 and 6.4.1 section of XHCI Spec)
@@ -871,6 +874,8 @@ int xhci_ctrl_tx(struct usb_device *udev, unsigned long pipe,
 	ep_index = usb_pipe_ep_index(pipe);
 
 	ep_ring = virt_dev->eps[ep_index].ring;
+	if (!ep_ring)
+		return -1;
 
 	/*
 	 * Check to see if the max packet size for the default control

-- 
2.43.2

