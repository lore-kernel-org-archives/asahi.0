Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37D610A
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="lW1VzEmm"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A90E74269A;
	Sun, 29 Oct 2023 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698564232; bh=TpsxNrDW0HrJ70F67VPZJy96cl/6rgw7jwc+LLGyYkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lW1VzEmmKg5fCJ3b2U4zl6mQDkIvj5pzK4/g9fX6Na5frw+zDlC7vjlFWZ36Czgyi
	 E/Y9BbHgqm9J22sUW5rPQW1nFdSe//rSkc9mH37Hy5d849/crcRuaZlZQzOx1YK6cx
	 mtkKouYJ6so1WZtj79yAJem8GfR1HaSIUBHytZD5DQtq4zuakQVmD8R6G4vnt4a9Ls
	 b/qJmiceE87f+QiNWVLp401y9J9+AieKHXX0tTd6StQsI+OjHQNqQWFT2BMJRtmVtY
	 5aavuF7htLjGe6KDgkt+45fkTz0ppjD1jToterVeplwkcEW1S3NlfgTfIHNCOPDjgG
	 8YuJrOpm5Mdag==
From: Hector Martin <marcan@marcan.st>
Date: Sun, 29 Oct 2023 16:23:30 +0900
Subject: [PATCH 3/4] usb: storage: Use the correct CBW lengths
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-usb-fixes-3-v1-3-0153210a7f55@marcan.st>
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
In-Reply-To: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3952; i=marcan@marcan.st;
 h=from:subject:message-id; bh=TpsxNrDW0HrJ70F67VPZJy96cl/6rgw7jwc+LLGyYkw=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlQ7jtr1u/53b9qererLofWw4tH2utNvVLa8eze/c8OCX
 TVrOo93dZSyMIhxMMiKKbI0nug91e05/Zy6asp0mDmsTCBDGLg4BWAiRV4M/12nlx7S+RozvVzv
 +fHwhdkTy7/vf7FL8+eXoKjKIx7Hxf4zMvyYU53Lc2H6zAXegqc/uZvy3dcxd/j/Mvjft4yjP2R
 X+XIDAA==
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

USB UFI uses fixed 12-byte commands (as does RBC, which is not
supported), but SCSI does not have this limitation. Use the correct
command block lengths depending on the subclass.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 common/usb_storage.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/common/usb_storage.c b/common/usb_storage.c
index 729ddbc75a48..95507ffbce48 100644
--- a/common/usb_storage.c
+++ b/common/usb_storage.c
@@ -107,6 +107,7 @@ struct us_data {
 	trans_reset	transport_reset;	/* reset routine */
 	trans_cmnd	transport;		/* transport routine */
 	unsigned short	max_xfer_blk;		/* maximum transfer blocks */
+	bool		cmd12;			/* use 12-byte commands (RBC/UFI) */
 };
 
 #if !CONFIG_IS_ENABLED(BLK)
@@ -349,7 +350,7 @@ static void usb_show_srb(struct scsi_cmd *pccb)
 {
 	int i;
 	printf("SRB: len %d datalen 0x%lX\n ", pccb->cmdlen, pccb->datalen);
-	for (i = 0; i < 12; i++)
+	for (i = 0; i < pccb->cmdlen; i++)
 		printf("%02X ", pccb->cmd[i]);
 	printf("\n");
 }
@@ -888,7 +889,7 @@ do_retry:
 	psrb->cmd[4] = 18;
 	psrb->datalen = 18;
 	psrb->pdata = &srb->sense_buf[0];
-	psrb->cmdlen = 12;
+	psrb->cmdlen = us->cmd12 ? 12 : 6;
 	/* issue the command */
 	result = usb_stor_CB_comdat(psrb, us);
 	debug("auto request returned %d\n", result);
@@ -989,7 +990,7 @@ static int usb_inquiry(struct scsi_cmd *srb, struct us_data *ss)
 		srb->cmd[1] = srb->lun << 5;
 		srb->cmd[4] = 36;
 		srb->datalen = 36;
-		srb->cmdlen = 12;
+		srb->cmdlen = ss->cmd12 ? 12 : 6;
 		i = ss->transport(srb, ss);
 		debug("inquiry returns %d\n", i);
 		if (i == 0)
@@ -1014,7 +1015,7 @@ static int usb_request_sense(struct scsi_cmd *srb, struct us_data *ss)
 	srb->cmd[4] = 18;
 	srb->datalen = 18;
 	srb->pdata = &srb->sense_buf[0];
-	srb->cmdlen = 12;
+	srb->cmdlen = ss->cmd12 ? 12 : 6;
 	ss->transport(srb, ss);
 	debug("Request Sense returned %02X %02X %02X\n",
 	      srb->sense_buf[2], srb->sense_buf[12],
@@ -1032,7 +1033,7 @@ static int usb_test_unit_ready(struct scsi_cmd *srb, struct us_data *ss)
 		srb->cmd[0] = SCSI_TST_U_RDY;
 		srb->cmd[1] = srb->lun << 5;
 		srb->datalen = 0;
-		srb->cmdlen = 12;
+		srb->cmdlen = ss->cmd12 ? 12 : 6;
 		if (ss->transport(srb, ss) == USB_STOR_TRANSPORT_GOOD) {
 			ss->flags |= USB_READY;
 			return 0;
@@ -1064,7 +1065,7 @@ static int usb_read_capacity(struct scsi_cmd *srb, struct us_data *ss)
 		srb->cmd[0] = SCSI_RD_CAPAC;
 		srb->cmd[1] = srb->lun << 5;
 		srb->datalen = 8;
-		srb->cmdlen = 12;
+		srb->cmdlen = ss->cmd12 ? 12 : 10;
 		if (ss->transport(srb, ss) == USB_STOR_TRANSPORT_GOOD)
 			return 0;
 	} while (retry--);
@@ -1084,7 +1085,7 @@ static int usb_read_10(struct scsi_cmd *srb, struct us_data *ss,
 	srb->cmd[5] = ((unsigned char) (start)) & 0xff;
 	srb->cmd[7] = ((unsigned char) (blocks >> 8)) & 0xff;
 	srb->cmd[8] = (unsigned char) blocks & 0xff;
-	srb->cmdlen = 12;
+	srb->cmdlen = ss->cmd12 ? 12 : 10;
 	debug("read10: start %lx blocks %x\n", start, blocks);
 	return ss->transport(srb, ss);
 }
@@ -1101,7 +1102,7 @@ static int usb_write_10(struct scsi_cmd *srb, struct us_data *ss,
 	srb->cmd[5] = ((unsigned char) (start)) & 0xff;
 	srb->cmd[7] = ((unsigned char) (blocks >> 8)) & 0xff;
 	srb->cmd[8] = (unsigned char) blocks & 0xff;
-	srb->cmdlen = 12;
+	srb->cmdlen = ss->cmd12 ? 12 : 10;
 	debug("write10: start %lx blocks %x\n", start, blocks);
 	return ss->transport(srb, ss);
 }
@@ -1407,6 +1408,11 @@ int usb_storage_probe(struct usb_device *dev, unsigned int ifnum,
 		printf("Sorry, protocol %d not yet supported.\n", ss->subclass);
 		return 0;
 	}
+
+	/* UFI uses 12-byte commands (like RBC, unlike SCSI) */
+	if (ss->subclass == US_SC_UFI)
+		ss->cmd12 = true;
+
 	if (ss->ep_int) {
 		/* we had found an interrupt endpoint, prepare irq pipe
 		 * set up the IRQ pipe and handler

-- 
2.41.0

