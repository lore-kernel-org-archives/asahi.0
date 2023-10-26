Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452223FB1F
	for <asahi@lists.linux.dev>; Thu, 26 Oct 2023 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="N/koKxmt"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id E7657421F5;
	Thu, 26 Oct 2023 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698362214; bh=OBRBVmNOT4/VqCOILeRuAL3+gYDvJKIt3Emd4T+Gxcg=;
	h=From:Subject:Date:To:Cc;
	b=N/koKxmtuPZKQIBcySNbPjFDEDTDvFlzLJwRJ3JPmff0+8hD6PX07jdDEK/1xjTga
	 21jpTw78lDwxG2thGYP7vn23QQDkaM/xsjvlD8P9/6xlNH/5nJ8Oi1ula5EOYO9zOk
	 zGRdGQyA9ZQ701LkXV9vdWUchnbGeWKA2cYJdBTKp/bJwQPSYUsBbG1sygONVoaLDa
	 rPGYiWQzdPQTigMHkoMwRLRWYtaDqc36BYeTjQOllFzkwKOVksfdbopezXonS9ldFB
	 N0yXVovJbhsp77odYFiFUlGgP36/wEWmuy0Sd+w1+lGhoJii3lRQoVL0Qay5GYjamb
	 pEXxLb8PP4ZMg==
From: Hector Martin <marcan@marcan.st>
Subject: [PATCH 0/8] USB fixes: xHCI error handling
Date: Fri, 27 Oct 2023 08:16:43 +0900
Message-Id: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFvzOmUC/x3LMQqAMAxA0auUzAaadlC8ijjYGjVLlQZFKL27x
 fHx+QWUs7DCaApkfkTlTA3UGYjHknZGWZvBWefJuh5vDbjJy4qEgw9b7C15Sw7acWX+UxumudY
 PdfDP910AAAA=
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=marcan@marcan.st;
 h=from:subject:message-id; bh=OBRBVmNOT4/VqCOILeRuAL3+gYDvJKIt3Emd4T+Gxcg=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlSrz/HXbx6KPvKuwu9yZO6mH18zY2s1teSmTg1VKZzes
 r7gzLzXHaUsDGIcDLJiiiyNJ3pPdXtOP6eumjIdZg4rE8gQBi5OAZiIymZGhmOraie2aWb2RCx4
 K7BFV119vo3v0+g2xvicI+snKu+T7GH4p7OlrbMgnGuFS+zvuNltO17ueveT22bxqoQJZw/wFjV
 qMAIA
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

This series is the first of a few bundles of USB fixes we have been
carrying downstream on the Asahi U-Boot branch for a few months.

Most importantly, this related set of patches makes xHCI error/stall
recovery more robust (or work at all in some cases). There are also a
couple patches fixing other xHCI bugs and adding better debug logs.

I believe this should fix this Fedora bug too:

https://bugzilla.redhat.com/show_bug.cgi?id=2244305

Signed-off-by: Hector Martin <marcan@marcan.st>
---
Hector Martin (8):
      usb: xhci: Guard all calls to xhci_wait_for_event
      usb: xhci: Better error handling in abort_td()
      usb: xhci: Allow context state errors when halting an endpoint
      usb: xhci: Recover from halted non-control endpoints
      usb: xhci: Fail on attempt to queue TRBs to a halted endpoint
      usb: xhci: Do not panic on event timeouts
      usb: xhci: Fix DMA address calculation in queue_trb
      usb: xhci: Add more debugging

 drivers/usb/host/xhci-ring.c | 100 +++++++++++++++++++++++++++++++++++--------
 drivers/usb/host/xhci.c      |   9 ++++
 include/usb/xhci.h           |   2 +
 3 files changed, 92 insertions(+), 19 deletions(-)
---
base-commit: fb428b61819444b9337075f49c72f326f5d12085
change-id: 20231027-usb-fixes-1-83bfc7013012

Best regards,
-- 
Hector Martin <marcan@marcan.st>

