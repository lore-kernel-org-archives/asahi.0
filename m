Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EC535AB
	for <asahi@lists.linux.dev>; Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211957; cv=none; b=NNTHlcp8Faf0sbu+gsK1pJzbl4NqLW7cOmmUeD+Mn2BFiyYUaTfxw3jKES8L+t0whsuWOazFqg5rBHK2bxaBVMKclZ0h+nIREHgnMHWFIUloTLDud4g93EpRBO5uphW1sWkbG2t0/W5dkVOT8hR55s+Atv2pVqkfL4tExzMvCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211957; c=relaxed/simple;
	bh=O9DzClDMMpyWLoi7mN9Uiqxe497Lex++FzccWUkcxh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L5J57iLk+KwEQm0rV3ZBeEO+H+oi5M9mtXMVq8L98myiuUAqWcrFx0zjZn0ctnGpNThgVInV5L958lsvNVmrUkzqkUtychebSqCVJ1DlmdHAO50bNlJOFGK5z5T4OIVnI+CyAMisutlxk651ViAt87K+nVQUl8iSED7UoXch7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+Q4jeGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+Q4jeGA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AAC8C433C7;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712211957;
	bh=O9DzClDMMpyWLoi7mN9Uiqxe497Lex++FzccWUkcxh4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=V+Q4jeGAeOAHvnPTd2YjMjDZkwkJGsPOZG4FfNPWugSwR5n7kfvpnW0hwwS3wYeYy
	 L4uoaARSdBfkSrDr+EW3JJ9DW0hTL1fNzd9cIfdORw3Y59EoLc8jk/4gFfVu5Z5/nH
	 EZ/YqQAJTZisapVHBDYB6MSc4sA5nBk2KhG+q82HAjeA7uqNHwTHz8UOSd0pYXQUdw
	 zZN/7voNi+xRFNV+fUO8QU+Zk6TjDcoYhiQnLsrn9cxQYbFgLHie6IrEMXf0bWow6p
	 ScAabGQTizMZ55+HphHa2C1kGd39Mf3AzpRWQGfMMS1oOPDiGliGqNYDvC01QgI1YT
	 q0loi52Nu9qdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25285CD1297;
	Thu,  4 Apr 2024 06:25:57 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH v4 0/6] USB keyboard improvements for asahi / desktop
 systems
Date: Thu, 04 Apr 2024 08:25:48 +0200
Message-Id: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1HDmYC/2XNQQrCMBCF4auUrI1kJqGNrryHuEibiY1CKkktl
 tK7mxZBpcv/wXwzsUTRU2LHYmKRBp98F3KoXcGa1oQrcW9zMxSoBILmJpnW8zuNdWeiTdyhtcY
 JgVgjy1ePSM6/VvF8yd361HdxXB8MsKwfC2FjDcAF16BqpEpBdRCnmwnBPPeBerZgA34BCdUWw
 AxY6VStpVau1BtA/gCIW0BmQIIorVWNIjj8AfM8vwF0cfxuMQEAAA==
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, 
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3410; i=j@jannau.net;
 h=from:subject:message-id;
 bh=O9DzClDMMpyWLoi7mN9Uiqxe497Lex++FzccWUkcxh4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjQ+908fdtdtq/mctV9ucrJgmtMpw6SkQ1Xutc+a/e07A
 oqunPXuKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJEvexkZJr32/a56wjSXde9j
 txvHprRe3nCh2UUxKq9FJXbHuqvsQBV9Bxf7XJS3Cv94a8YVU85GM2OL7tXRbm07jiuZ5+7x388
 MAA==
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
Changes in v4:
- collects "Reviewed-by:" tagDITME: describe what is new in this series revision.
- adds comment about usb_ignorelist parse errors
- Link to v3: https://lore.kernel.org/r/20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net

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

 common/usb.c                 |  64 ++++++++++++++++++++++
 common/usb_kbd.c             |  59 ++++++++++++++++++--
 doc/usage/environment.rst    |  13 +++++
 drivers/usb/host/xhci-ring.c |   5 ++
 drivers/usb/host/xhci.c      | 126 +++++++++++++++++++++++++++----------------
 include/env_default.h        |  11 ++++
 include/usb.h                |   6 +++
 7 files changed, 235 insertions(+), 49 deletions(-)
---
base-commit: 37345abb97ef0dd9c50a03b2a72617612dcae585
change-id: 20240218-asahi-keyboards-f2ddaf0022b2

Best regards,
-- 
Janne Grunau <j@jannau.net>


