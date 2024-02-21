Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5EF3AC34
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500318; cv=none; b=W/kmCUMAnOKR7+Lt+O9xNlwHmSBmPhjj+oUy0CqvQ2K6P8zYYuStne+7M7L9mH8K/93oaRlsSsDmCEJoaqO7FQNGIVUt4QWEshQatk1p2XIkxDIgY9HtKIbU/PwCR2I1ME9YgYzdkxXK3Z0D39wzbrM8aN0mqKhNM5Z3CuvoX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500318; c=relaxed/simple;
	bh=ynOznLwaFS4HtoVUVCPAAF/KFqCJNndMCJjEjVINauk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=npDX/dv12UUoiAWCbTSwOCmV+h4GL97z9jssWj4FqccZYn1rGXq8cvS+j29TRcjq5hh6qQ3ZbTKvO636kF9N1M0p7UsUwO/PwSC0ZG2FMSunK2gK51FdNF/xGB+6wKJKFpU8EXs1JSAc/CiK09JPnfCMN4S4tUinwlea3b5p5mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUbZ3sit; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUbZ3sit"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D2BDC433C7;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708500316;
	bh=ynOznLwaFS4HtoVUVCPAAF/KFqCJNndMCJjEjVINauk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uUbZ3sit+wKLgHOe0RnLp/9TLfw08Io8ZJYy0B2zeTHRw92prwXR1ODSXmLOpKdXq
	 XCv+H8TcwqQj3styD/WOB+QFAvoGmdOIZ81DNja2MYeiiNN9gKeRhyLyj8N4Hh1wEc
	 Y5sXb9GjPYw48vXae7r7kTa2bISQtHHvuc4gdHBhBFRyQvrhYUeXLo2TraYMrd3C1P
	 Ujn2dwDNLxRelaNXtiwVr/APzFJZuuY/ypQ4xSKdwE6aABz7LIEpjleQMxxicY2rBH
	 l+pi7nTuzQaRjPlS09KHXAGNxNN7NPEgUyFVGRisegzFqsym1sxwxgo29RnrCIhLqJ
	 hOZAYxayEokmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F1CC48BC3;
	Wed, 21 Feb 2024 07:25:16 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH 0/6] USB keyboard improvements for asahi / desktop systems
Date: Wed, 21 Feb 2024 08:25:00 +0100
Message-Id: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEyl1WUC/x3MMQqAMAxA0atIZgttcBCvIg7RpjYIrTQgivTuF
 sc3/P+CchFWmLoXCl+iklOD6zvYIqWdjfhmQIuDRTcaUopiDn7WTMWrCeg9BWsRV4RWnYWD3P9
 xXmr9ADamOS9hAAAA
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2193; i=j@jannau.net;
 h=from:subject:message-id; bh=ynOznLwaFS4HtoVUVCPAAF/KFqCJNndMCJjEjVINauk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtSrSyNr/MS2lfI4dTBvXRT49uv5Ak1tv8naBic3fgq4e
 Se54iBzRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIm8PMnI0PXx3ZqjPnl3Sv5L
 c1TsuL71RfTNo8bet+Yy/52+ML+AV5bhr/jTuUXPLn9v+VYV3/zn5J/WdKF4jcu10W/5N+pW7Lu
 uzAwA
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
Hector Martin (1):
      usb: kbd: Ignore Yubikeys

Janne Grunau (5):
      usb: xhci: refactor xhci_set_configuration
      usb: xhci: Set up endpoints for the first 2 interfaces
      usb: xhci: Abort transfers with unallocated rings
      usb: kbd: support Apple Magic Keyboards (2021)
      usb: kbd: Add probe quirk for Apple and Keychron keyboards

 common/usb_kbd.c             |  80 +++++++++++++++++++++++++--
 drivers/usb/host/xhci-ring.c |   5 ++
 drivers/usb/host/xhci.c      | 126 +++++++++++++++++++++++++++----------------
 include/usb.h                |   6 +++
 4 files changed, 167 insertions(+), 50 deletions(-)
---
base-commit: 37345abb97ef0dd9c50a03b2a72617612dcae585
change-id: 20240218-asahi-keyboards-f2ddaf0022b2

Best regards,
-- 
Janne Grunau <j@jannau.net>

