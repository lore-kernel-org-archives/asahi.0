Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77AD111A9
	for <asahi@lists.linux.dev>; Fri, 22 Mar 2024 07:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711093638; cv=none; b=pD/syA6MGT8G4ML8o3boTWvUqDLPULTzs0GArlaFi2JZQanZ0hUzfuyA5KqyPDcrpTORXKKAOdIG6HQdp7IyEmCFXmP6df4BjdTxi6riGKHbux3tBNPffTIWK66VRvRK6Qbskew6ulVnK+y7reVjh5pRqOrHnM9U76WU79ZEN08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711093638; c=relaxed/simple;
	bh=svsswazAvj+ohqZ8/5rv0sVrY14pCNTj2K2lFULM2ww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gO88ThOa/hmWdzvV07fkkz51Cj8TjNKmKfAQOYNrHgVNV1f4OHJE19n+mnszeaMmXiCsLILc5+F/CHgRbmQfsybjFlFgkCYCzOC2B4emGSc5aEwsPbsBwOJG4OCBgqL6WwTkIi1tXWFnTII0rXC9azdCqjtpAy8MRhi11TyF5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNsSM6E0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNsSM6E0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64742C433F1;
	Fri, 22 Mar 2024 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711093638;
	bh=svsswazAvj+ohqZ8/5rv0sVrY14pCNTj2K2lFULM2ww=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HNsSM6E0SCrK1YKjX178vAQHXKc/mznfiFxCllKHB6SlFOO72z0GQr9xUmDK1jJYl
	 KXB4PdM3SjxmyZW21fbfQPnJmtMnaNUA9RLz3Paq3okpwh16q2EztLGWYInp470GCf
	 z6FVwMYId3issIlGHeQR2a1gLfyH2YL9WSBfJQsUnwT5B5XpeXId7RlXJkkNNbQwjr
	 k8iVK3fy2R3px2ns8XLo5pcSLAWTVBKu7ML5xt6LDGG4YCODjbn2z4lfeC/Y3NQwex
	 HlGmf1FeOA+YhDkfNNnh4A1r5ckFuY8Yngf/VQV0u5OFWIKOHPq0zFWCUh22INqe1u
	 LJ0Uwy1DvKC6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC59CD11BF;
	Fri, 22 Mar 2024 07:47:18 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v3 0/6] USB keyboard improvements for asahi / desktop
 systems
Date: Fri, 22 Mar 2024 08:47:03 +0100
Message-Id: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHc3/WUC/2XN0QrCIBTG8VcJrzM8R2nWVe8RXWgemwUudElj7
 N1zI4jY5f+D8zsjy5QCZXbcjCxRCTl0sYbcbti1NfFGPLjaDAUqgaC5yaYN/EGD7UxymXt0zng
 hEC2yevVM5MN7Ec+X2m3IfZeG5UGBef1aCCurABdcg7JIjYLmIE53E6N57SL1bMYK/gAJzRrAC
 jjpldVSK7/Xf8A0TR+TSoeZ8AAAAA==
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3162; i=j@jannau.net;
 h=from:subject:message-id;
 bh=svsswazAvj+ohqZ8/5rv0sVrY14pCNTj2K2lFULM2ww=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtS/5s0GXLeOHONl9AkVi+e94ZIb1qUnw8xQJcd6pPNuw
 2m2gtiOUhYGMS4GWTFFliTtlx0Mq2sUY2ofhMHMYWUCGcLAxSkAE1k/j+F/aOvs/lX7Azi86tZf
 8Niw2ThkL4PFspgZyutZWKZsWlP1iZGhQfvoXoEzdv6zvH+u2zM9J7ixPv+W8zH+iI7iE4F5wZu
 5AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

Apple USB Keyboards from 2021 need quirks to be useable. The boot HID
keyboard protocol is unfortunately not described in the first interface
descriptor but the second. This needs several changes. The USB keyboard
driver has to look at all (2) interface descriptors during probing.
Since I didn't want to rebuild the USB driver probe code the Apple
keyboards are bound to the keyboard driver via USB vendor and product
IDs.
To make the keyboards useable on Apple silicon devices the xhci driver
needs to initializes rings for the endpoints of the first two interface
descriptors. If this is causes concerns regarding regressions or memory
use the USB_MAX_ACTIVE_INTERFACES define could be turned into a CONFIG
option.
Even after this changes the keyboards still do not probe successfully
since they apparently do not behave HID standard compliant. They only
generate reports on key events. This leads the final check whether the
keyboard is operational to fail unless the user presses keys during the
probe. Skip this check for known keyboards.
Keychron seems to emulate Apple keyboards (some models even "re-use"
Apple's USB vendor ID) so apply this quirk as well.

Some devices like Yubikeys emulate a keyboard. since u-boot only binds a
single keyboard block this kind of devices from the USB keyboard driver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v3:
- collected "Reviewed-by:" tags
- rename usb_blocklist to usb_ignorelist
- use BIT macro for USB KBD quirk bit
- refactor usb_device_is_blocked() to use 0 / negated errors as return
  value, sed -e 's/block/ignore/', simplify it and add comments
- rewritten usb_ignorelist documentation
- Link to v2: https://lore.kernel.org/r/20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net

Changes in v2:
- rewritten commit message for "[PATCH 2/6] usb: xhci: Set up endpoints for the first 2 interfaces"
- Replaced the usb keyboard Yubikey block with an env based USB device blocklist
- Use "-EINVAL" as return value in "[PATCH 3/6] usb: xhci: Abort transfers with unallocated rings"
- added "Reviewed-by:" tags
- Link to v1: https://lore.kernel.org/r/20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net

---
Janne Grunau (6):
      usb: xhci: refactor xhci_set_configuration
      usb: xhci: Set up endpoints for the first 2 interfaces
      usb: xhci: Abort transfers with unallocated rings
      usb: Add environment based device ignorelist
      usb: kbd: support Apple Magic Keyboards (2021)
      usb: kbd: Add probe quirk for Apple and Keychron keyboards

 common/usb.c                 |  57 ++++++++++++++++++++
 common/usb_kbd.c             |  59 ++++++++++++++++++--
 doc/usage/environment.rst    |  13 +++++
 drivers/usb/host/xhci-ring.c |   5 ++
 drivers/usb/host/xhci.c      | 126 +++++++++++++++++++++++++++----------------
 include/env_default.h        |  11 ++++
 include/usb.h                |   6 +++
 7 files changed, 228 insertions(+), 49 deletions(-)
---
base-commit: 37345abb97ef0dd9c50a03b2a72617612dcae585
change-id: 20240218-asahi-keyboards-f2ddaf0022b2

Best regards,
-- 
Janne Grunau <j@jannau.net>


