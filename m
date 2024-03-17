Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CFA18036
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710673633; cv=none; b=qZ1/rYYl5VTx0iMLdTB8zbkLgkRNShBwqzfWapr3VJAgsRYspV7yfUwg00WnT+BraNMKRJgI3bbEUk0ajOPcVWMCzIOOonLvcoM8qXZOqbkOr6DlRB7F9wpU/FaUDAzCE5fOoDWc97ptQafypH2K4FaSxJrKFzEb4z/C6wj/OsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710673633; c=relaxed/simple;
	bh=k5kohG2wMqRFewvlZ5qQJa93JJaqJ2wRW1DIyCer8Ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fFxkmrs14z8/cjCxGZDhl+07afAvGZYsRnEUhyoTQOrz9ADwFLramKRWUuSv1zxGuXy/n8GhblTF6D2vnnEXbdyGSxlb1vgS5jBVd+zrruxXb+La9qnN1ego3v0aRwIg89g9E1SsImO62Yz13bhpgTFae4sEVF2gUzq30GYoBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNotRPT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNotRPT1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89D38C433C7;
	Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710673632;
	bh=k5kohG2wMqRFewvlZ5qQJa93JJaqJ2wRW1DIyCer8Ck=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dNotRPT1O174SrA9PAuJUsW+dp0HDDTzPcpfmyIloqe3mNIqPeIF+2BvjzPCDHkqT
	 sHmbztEM0T0MlLRREvGw/HvkE4PP+yO1vI+YjyNyGsLk5gU5TiYj3lM3QYLX+9D9do
	 6kHj6njcSI8X3aZ5gShQZaMhY9bcRk1WrAC0LAz5RWCfJVdpTtagPL/qUHP8RKpewz
	 QCrPkepmv1LP2bcwkaylloG7gNQYeGd6cMnKhV/yyIFyXK0CtymWJuqvM9gOz1Ol7p
	 xo3eg3UC4YHPbqC9EqMl01Uj67Z4jS/67FtI2FCx5lW5DtnMzThEOimP6g5IMbeUCw
	 mzry40OyQ8HAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756DCC54E67;
	Sun, 17 Mar 2024 11:07:12 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v2 0/6] USB keyboard improvements for asahi / desktop
 systems
Date: Sun, 17 Mar 2024 12:07:02 +0100
Message-Id: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbO9mUC/2WNQQrCMBBFr1JmbSQZCq2uvId0MTFTMwqJJG2xl
 NzdWNy5fA/++xtkTsIZzs0GiRfJEkMFPDRw8xTurMRVBtTYajS9okxe1JNXGym5rEZ0jkatES1
 CXb0Sj/Lei9ehspc8xbTuB4v52l8LzV9rMUqr3rQWuWtNd9KXB4VA8zHwBEMp5QP3W8ZMrwAAA
 A==
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2755; i=j@jannau.net;
 h=from:subject:message-id; bh=k5kohG2wMqRFewvlZ5qQJa93JJaqJ2wRW1DIyCer8Ck=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtRv5+4Z53sdq2dnO/a/z8rds05S2Hd/h8iHnUtue+zbI
 LY/7qtvRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIksCmBkuLGO6dK8LSYL9HYn
 PX155dhZrtbnD+80RuUkF/nZ1bRa1jP89/XbcTN/02oeo/0FjfPmLJ76cmb6h1q3p3mP3Xn5nl/
 4zAwA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

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
      usb: Add environment based device blocklist
      usb: kbd: support Apple Magic Keyboards (2021)
      usb: kbd: Add probe quirk for Apple and Keychron keyboards

 common/usb.c                 |  56 +++++++++++++++++++
 common/usb_kbd.c             |  61 +++++++++++++++++++--
 doc/usage/environment.rst    |  12 +++++
 drivers/usb/host/xhci-ring.c |   5 ++
 drivers/usb/host/xhci.c      | 126 +++++++++++++++++++++++++++----------------
 include/env_default.h        |  11 ++++
 include/usb.h                |   6 +++
 7 files changed, 227 insertions(+), 50 deletions(-)
---
base-commit: 37345abb97ef0dd9c50a03b2a72617612dcae585
change-id: 20240218-asahi-keyboards-f2ddaf0022b2

Best regards,
-- 
Janne Grunau <j@jannau.net>

