Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19612E56
	for <asahi@lists.linux.dev>; Fri, 22 Mar 2024 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711093638; cv=none; b=ePAjrVhxnewmJdEq7DyHpYtupUyfR/7/aydvniFz11ZlW9JKAe/19m0M863XcadP/OHewSRRp/bfYu34FYX71KDiQnJcR62QjL5XNf37t+v78Hb9+3wjDuup4aqfKSSa9re2pa7jxXrNYG+GT4KJ7fv6LjN7Lku1549BxH/1TT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711093638; c=relaxed/simple;
	bh=+tYFN6+QK3PUW/oMQcTV0dPiASQpRO0mELezzogU4Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgtBmI7WdJ+1Lg/H9xE0lUJwCtnMna42c6Cc5L38cvVOlvGWbxzX82TzW58RzJMQrq9N+dkohsxE2l3rgtetxWQ2LVzD0h0CnDxGO+Pi0cY7fRwS2G/SkW7MKmkWS8671yMYpaa0dnp8ByKt/hEwv1NMKKmFRqzu47p5GOVLOm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKTDlM0j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKTDlM0j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8969FC43394;
	Fri, 22 Mar 2024 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711093638;
	bh=+tYFN6+QK3PUW/oMQcTV0dPiASQpRO0mELezzogU4Y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EKTDlM0jETrOTVGDut2K2vyTRbghQA0fcnBdCO+VI7dyRYqSMXdyF8eZRWm/iguME
	 fdtAAc5YhNRwCDu9LzpbQMQILWyoqKZTpoWgka7NDPQnKlPRG5WdeZfy0DD6IEjEFI
	 UQ+Ji/FDGV25WL/NR7tP8ZDbKPvArPcRJ04QJk1z7qaeflhpIxdGdAFSIZfsHxLK75
	 +kQ8KcwY7E/WQ29fSnr1AsniFnT2ajNwCZSlGytlbXIZK6zJq9wwhA42Nb8+o9P0Ro
	 xxsQx1sX2tlUPZXTgPT7R6S0lppqaC4US5AgW0kHcQSd/rNWEl6WSTTGqCSXaitfnc
	 dMV4mXQUlTyOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEB5CD11DD;
	Fri, 22 Mar 2024 07:47:18 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Fri, 22 Mar 2024 08:47:06 +0100
Subject: [PATCH v3 3/6] usb: xhci: Abort transfers with unallocated rings
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-asahi-keyboards-v3-3-3106dd4c4e19@jannau.net>
References: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
In-Reply-To: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=j@jannau.net;
 h=from:subject:message-id;
 bh=4WL/oK9QHrPZzv/LO0Lx0LR9aR1vioRk0nnmNOFZrzg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtS/5i0/Z//c82PbI5FnJ5J0P+bvktTYXRH4uW3yj+SbX
 M43/fxPdpSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZjIrg0M/z39lHgOfdm0qued
 RyLfntM9h1kljY4miacsc9+wW/XsTzmGf9blPif0Wf95ztTvnz75MudElQal6c7J4uVrT78U2rh
 GghMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Discovered while trying to use the second interface in the USB keyboard
driver necessary on Apple USB keyboards.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/usb/host/xhci-ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b60661fe05..910c5f3352 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -685,6 +685,9 @@ int xhci_bulk_tx(struct usb_device *udev, unsigned long pipe,
 		reset_ep(udev, ep_index);
 
 	ring = virt_dev->eps[ep_index].ring;
+	if (!ring)
+		return -EINVAL;
+
 	/*
 	 * How much data is (potentially) left before the 64KB boundary?
 	 * XHCI Spec puts restriction( TABLE 49 and 6.4.1 section of XHCI Spec)
@@ -871,6 +874,8 @@ int xhci_ctrl_tx(struct usb_device *udev, unsigned long pipe,
 	ep_index = usb_pipe_ep_index(pipe);
 
 	ep_ring = virt_dev->eps[ep_index].ring;
+	if (!ep_ring)
+		return -EINVAL;
 
 	/*
 	 * Check to see if the max packet size for the default control

-- 
2.44.0


