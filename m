Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025B1610A
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="R/Q+BBuK"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DFF124265F;
	Sun, 29 Oct 2023 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698563354; bh=Iwu3rI3ZJ3sVIfoju2RrDVttz8JqA55b6HTohOu/b1o=;
	h=From:Subject:Date:To:Cc;
	b=R/Q+BBuKRsvBujhWJ6p/8CfSowZ1UMadxqZCiu0kHRGEkhER/CyXCrLC97eYx+FHK
	 dHMpsaVVE5oofLfnxH8f4uuWnEgmhDvgO/Ae+AURubgG00qQXaRPvWW+DevjJl/uIu
	 vqXxLLTgDJkLoibiNymroYmzmYHORbXRSFUrjZUeba5i/kVe2wCDDF4NjHq5DBVvgA
	 6Xx0J3GyAcOYLkSnOutbzkhiIUxWoSIFm8/BR2lFnPuk11q6uVMPqmGvcwMwqFKn49
	 eXONXUu4jIDqVtewRiMtaOJEnFRzDwDku2g0NXh7tGPol+JgwLrbWxDwolGZT6wiIl
	 quNypxxR/RnbQ==
From: Hector Martin <marcan@marcan.st>
Subject: [PATCH 0/2] USB fixes: Add missing timeout, ignore YubiKeys
Date: Sun, 29 Oct 2023 16:09:07 +0900
Message-Id: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMFPmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDAyNL3dLiJN20zIrUYl0jXUtzMxMLsxRDMwPjZCWgjoKiVLAUUEN0bG0
 tAAjleV9dAAAA
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=marcan@marcan.st;
 h=from:subject:message-id; bh=Iwu3rI3ZJ3sVIfoju2RrDVttz8JqA55b6HTohOu/b1o=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlQ7VnG+IsmFLXKySy/d9e0/J9m35ahjwbTjfo99pjvbs
 x3SX3Wuo5SFQYyDQVZMkaXxRO+pbs/p59RVU6bDzGFlAhnCwMUpABPp+MLIcP7P4ZPs65V0g5Ua
 uqa8lOWclqecVzvxmi1ffNukivLjpQz/EzdMVDuw2mny1v16frmRrxM9GhXnzryWtbZdQo7D+GA
 pCwA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

This mini series fixes one bug, but in the process makes YubiKeys work,
which then regresses people who have one *and* a USB keyboard, since we
only support a single keyboard device.

Therefore patch #1 makes U-Boot ignore YubiKeys, so #2 does not
regress things.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
Hector Martin (2):
      usb: kbd: Ignore Yubikeys
      usb: hub: Add missing reset recovery delay

 common/usb_hub.c |  7 +++++++
 common/usb_kbd.c | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+)
---
base-commit: 8ad1c9c26f7740806a162818b790d4a72f515b7e
change-id: 20231029-usb-fixes-2-976486d1603c

Best regards,
-- 
Hector Martin <marcan@marcan.st>

