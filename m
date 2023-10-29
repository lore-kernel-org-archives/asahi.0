Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D606610A
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="xP7nC02N"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3EF5F42623;
	Sun, 29 Oct 2023 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698564225; bh=WKrBsxERVPbuUaeN4PlsI71Eh62TLmWZJ6p+CvD8wj4=;
	h=From:Subject:Date:To:Cc;
	b=xP7nC02Nq2yA+Dqt3TVcjUbbyPqO5bL6VsjpqhaInhDRSyS9mlUL14XqS+eT/JSdK
	 RPYd/kpG9jrHfI8+Ihk88St8admCy0SjNEV17StcuuLARb9l4iwo8jxGsGk9PTLNaa
	 ntCQMYrOFlmuS7TAzELeOpxJ1ur0SCLj7RIJZR5KrnpcqAOxjWTw9LfCars5CBZQ+6
	 rQWCCRF5f2nMIRAwLeFqKjf2JVcvICUsr/pQFCFJXJHQmz3f8LML903THLbCLrfnaa
	 rmVRrnJtNkPdDcOTfb80oPWrieZjzAurD1npGv8m99Kk2dAF1cqeOe+Xc/G9jj9R80
	 a4dw+rclW8dLg==
From: Hector Martin <marcan@marcan.st>
Subject: [PATCH 0/4] USB fixes: Mass Storage bugs & 64bit support
Date: Sun, 29 Oct 2023 16:23:27 +0900
Message-Id: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8IPmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDAyNL3dLiJN20zIrUYl1j3WRzozQLI8ukRDPDJCWgjoKiVLAUUEN0bG0
 tALpxUftdAAAA
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=marcan@marcan.st;
 h=from:subject:message-id; bh=WKrBsxERVPbuUaeN4PlsI71Eh62TLmWZJ6p+CvD8wj4=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlQ7jupt9/R59YtSeMw2u+84+637/Y3/oo8SFCUXqJjns
 XyLblHrKGVhEONgkBVTZGk80Xuq23P6OXXVlOkwc1iZQIYwcHEKwEQUmxgZXv/p8N1RdZH1ye8f
 HkerrlTpXO+f1Sn8aUrF1W3e7FF3VzAyTD5c9zbTYEYZ7zL3r7erfb/P6n3wZb3KUzamumqB983
 c3AA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

This series fixes some bugs in the USBMS driver and adds 64-bit LBA
support. This is required to make USB HDDs >=4TB work.

Note that the increased timeout won't actually work right now, due to
broken handling in the underlying USB infrastructure. That will be fixed
in a follow-up series, which depends on [1] being applied first. The
USBMS part is logically stand-alone and can be applied in parallel
before that.

[1] https://lore.kernel.org/u-boot/20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st/

Signed-off-by: Hector Martin <marcan@marcan.st>
---
Hector Martin (4):
      scsi: Fix a bunch of SCSI definitions.
      usb: storage: Increase read/write timeout
      usb: storage: Use the correct CBW lengths
      usb: storage: Implement 64-bit LBA support

 common/usb_storage.c | 164 ++++++++++++++++++++++++++++++++++++++++++---------
 drivers/ata/ahci.c   |   9 ++-
 drivers/scsi/scsi.c  |   4 +-
 include/scsi.h       |   8 ++-
 4 files changed, 150 insertions(+), 35 deletions(-)
---
base-commit: 8ad1c9c26f7740806a162818b790d4a72f515b7e
change-id: 20231029-usb-fixes-3-c72f829ba61b

Best regards,
-- 
Hector Martin <marcan@marcan.st>

