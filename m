Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE2610A
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="Umxfp6D0"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3522942699;
	Sun, 29 Oct 2023 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698564230; bh=bt6y6CWrjSAPD0G4xLyed8Kbjb3zQzHM0aMxFOd4kjs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Umxfp6D0RkuQoJ5Y9sUwn8B+2sxbqw0fBbyKVCqe4Lnr2rKzYNDwhpnE6KoPPqTdM
	 5VHQfXuZZEXUhTvyyEDZ3R8xTUZ6MZHXbmCBtNxUpvbXiGImK3tGqQm9FyTcrpSc8T
	 yAWRF9C6LyWxG6MLycBMabh+qZglEn9IC8+UPtqklhLV6DppYOqBt1sY7DnJMeMY5S
	 DP9uTK2O3TpHhW6F8BxFUGSfrD7M2xchdQnnxJe45mvLE/Cfkh7//fIeEtq7/sF6aq
	 7aQTV6v8b9GZ22wjkfJeGl8vzXfROOxvfHY5/jCqc9ShbR3ASiR48AE69/yhNc4wnc
	 9XFFXxN4qgcOg==
From: Hector Martin <marcan@marcan.st>
Date: Sun, 29 Oct 2023 16:23:29 +0900
Subject: [PATCH 2/4] usb: storage: Increase read/write timeout
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-usb-fixes-3-v1-2-0153210a7f55@marcan.st>
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
In-Reply-To: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=marcan@marcan.st;
 h=from:subject:message-id; bh=bt6y6CWrjSAPD0G4xLyed8Kbjb3zQzHM0aMxFOd4kjs=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlQ7jpqaJ4KdZZPS1y1rX6TLoSV1u7rv3lqHpu1Fne6eN
 z6+DlXuKGVhEONgkBVTZGk80Xuq23P6OXXVlOkwc1iZQIYwcHEKwEQ2fmf4X8/wreyHk6pfdeHL
 tVKNG/ZKJB7S3RnkaLa+Ki3n8yaHQob/Hsda+15P4BXb/moWY+aPzCn9zx8Zbls0r2tdbnll9nZ
 uRgA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

Some USB devices (like hard disks) can take a long time to initially
respond to read/write requests. Explicitly specify a much longer timeout
than normal.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 common/usb_storage.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/common/usb_storage.c b/common/usb_storage.c
index c9e2d7343ce2..729ddbc75a48 100644
--- a/common/usb_storage.c
+++ b/common/usb_storage.c
@@ -53,6 +53,12 @@
 #undef BBB_COMDAT_TRACE
 #undef BBB_XPORT_TRACE
 
+/*
+ * Timeout for read/write transfers. This needs to be able to handle very slow
+ * devices, such as hard disks that are spinning up.
+ */
+#define US_XFER_TIMEOUT 15000
+
 #include <scsi.h>
 /* direction table -- this indicates the direction of the data
  * transfer for each command code -- a 1 indicates input
@@ -394,7 +400,7 @@ static int us_one_transfer(struct us_data *us, int pipe, char *buf, int length)
 			      11 - maxtry);
 			result = usb_bulk_msg(us->pusb_dev, pipe, buf,
 					      this_xfer, &partial,
-					      USB_CNTL_TIMEOUT * 5);
+					      US_XFER_TIMEOUT);
 			debug("bulk_msg returned %d xferred %d/%d\n",
 			      result, partial, this_xfer);
 			if (us->pusb_dev->status != 0) {
@@ -743,7 +749,7 @@ static int usb_stor_BBB_transport(struct scsi_cmd *srb, struct us_data *us)
 		pipe = pipeout;
 
 	result = usb_bulk_msg(us->pusb_dev, pipe, srb->pdata, srb->datalen,
-			      &data_actlen, USB_CNTL_TIMEOUT * 5);
+			      &data_actlen, US_XFER_TIMEOUT);
 	/* special handling of STALL in DATA phase */
 	if ((result < 0) && (us->pusb_dev->status & USB_ST_STALLED)) {
 		debug("DATA:stall\n");

-- 
2.41.0

