Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117D63B5
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="h4tXPiAQ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 2991242623;
	Sun, 29 Oct 2023 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698564235; bh=Uq2Q0TXZKuhLHnKWjzFbvuoe2HqA5AA9XPO+7vrh/Cg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h4tXPiAQtA/++ocVN/1YsA2LDwL61qyZWrUksfsTnfCiM1lWvnAnorZDyZ3zymvQQ
	 YhhsKBwumVFfKtpfkuEzRpFm6k0eo49rqzeWlSz8FoUQw73HeOTXAe4xoBSKiJO4fI
	 GFtKWE1m3gKftj8x6P1ciaxO85rcVs4mQ9SX2ZbB6Dxhd3UF2yXqfsJZj/IH9SGadN
	 n6X6ixVAjWsWUWDAWNA4sSRvU8rXyrdvFGfPuaR2mOxvzc5k+hrYZOoQIf7VtYOxE5
	 0S7lFLxpt31zVzxM95OlwM+8qnnprbp1U4WzGgIfLQ1exluM4tYm23GeAR0ib8kmUi
	 p+4YGpTmzSadQ==
From: Hector Martin <marcan@marcan.st>
Date: Sun, 29 Oct 2023 16:23:31 +0900
Subject: [PATCH 4/4] usb: storage: Implement 64-bit LBA support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-usb-fixes-3-v1-4-0153210a7f55@marcan.st>
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
In-Reply-To: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7413; i=marcan@marcan.st;
 h=from:subject:message-id; bh=Uq2Q0TXZKuhLHnKWjzFbvuoe2HqA5AA9XPO+7vrh/Cg=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlQ7jjreKdvTObysn1x4dpj/3lqDeNGKC1q7T3icOJDt4
 uinU/Kpo5SFQYyDQVZMkaXxRO+pbs/p59RVU6bDzGFlAhnCwMUpABPZXsvI8FOifNn/Asdmxf9u
 3LansqRmZq31tth0/e9Bnb2HmCvbPBn+GT+d8s/ZwFsh8CNbZ6THKvOZtzfWrs0uiJipKcc3kVW
 bGQA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

This makes things work properly on devices with >= 2 TiB
capacity. If u-boot is built without CONFIG_SYS_64BIT_LBA,
the capacity will be clamped at 2^32 - 1 sectors.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 common/usb_storage.c | 132 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 18 deletions(-)

diff --git a/common/usb_storage.c b/common/usb_storage.c
index 95507ffbce48..3035f2ee9868 100644
--- a/common/usb_storage.c
+++ b/common/usb_storage.c
@@ -66,7 +66,7 @@
 static const unsigned char us_direction[256/8] = {
 	0x28, 0x81, 0x14, 0x14, 0x20, 0x01, 0x90, 0x77,
 	0x0C, 0x20, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01,
+	0x00, 0x01, 0x00, 0x40, 0x00, 0x01, 0x00, 0x01,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 #define US_DIRECTION(x) ((us_direction[x>>3] >> (x & 7)) & 1)
@@ -1073,6 +1073,27 @@ static int usb_read_capacity(struct scsi_cmd *srb, struct us_data *ss)
 	return -1;
 }
 
+#ifdef CONFIG_SYS_64BIT_LBA
+static int usb_read_capacity64(struct scsi_cmd *srb, struct us_data *ss)
+{
+	int retry;
+	/* XXX retries */
+	retry = 3;
+	do {
+		memset(&srb->cmd[0], 0, 16);
+		srb->cmd[0] = SCSI_SRV_ACTION_IN;
+		srb->cmd[1] = (srb->lun << 5) | SCSI_SAI_RD_CAPAC16;
+		srb->cmd[13] = 32; /* Allocation length */
+		srb->datalen = 32;
+		srb->cmdlen = 16;
+		if (ss->transport(srb, ss) == USB_STOR_TRANSPORT_GOOD)
+			return 0;
+	} while (retry--);
+
+	return -1;
+}
+#endif
+
 static int usb_read_10(struct scsi_cmd *srb, struct us_data *ss,
 		       unsigned long start, unsigned short blocks)
 {
@@ -1107,6 +1128,49 @@ static int usb_write_10(struct scsi_cmd *srb, struct us_data *ss,
 	return ss->transport(srb, ss);
 }
 
+#ifdef CONFIG_SYS_64BIT_LBA
+static int usb_read_16(struct scsi_cmd *srb, struct us_data *ss,
+		       uint64_t start, unsigned short blocks)
+{
+	memset(&srb->cmd[0], 0, 16);
+	srb->cmd[0] = SCSI_READ16;
+	srb->cmd[1] = srb->lun << 5;
+	srb->cmd[2] = ((unsigned char) (start >> 56)) & 0xff;
+	srb->cmd[3] = ((unsigned char) (start >> 48)) & 0xff;
+	srb->cmd[4] = ((unsigned char) (start >> 40)) & 0xff;
+	srb->cmd[5] = ((unsigned char) (start >> 32)) & 0xff;
+	srb->cmd[6] = ((unsigned char) (start >> 24)) & 0xff;
+	srb->cmd[7] = ((unsigned char) (start >> 16)) & 0xff;
+	srb->cmd[8] = ((unsigned char) (start >> 8)) & 0xff;
+	srb->cmd[9] = ((unsigned char) (start)) & 0xff;
+	srb->cmd[12] = ((unsigned char) (blocks >> 8)) & 0xff;
+	srb->cmd[13] = (unsigned char) blocks & 0xff;
+	srb->cmdlen = 16;
+	debug("read16: start %llx blocks %x\n", (long long)start, blocks);
+	return ss->transport(srb, ss);
+}
+
+static int usb_write_16(struct scsi_cmd *srb, struct us_data *ss,
+			uint64_t start, unsigned short blocks)
+{
+	memset(&srb->cmd[0], 0, 16);
+	srb->cmd[0] = SCSI_WRITE16;
+	srb->cmd[1] = srb->lun << 5;
+	srb->cmd[2] = ((unsigned char) (start >> 56)) & 0xff;
+	srb->cmd[3] = ((unsigned char) (start >> 48)) & 0xff;
+	srb->cmd[4] = ((unsigned char) (start >> 40)) & 0xff;
+	srb->cmd[5] = ((unsigned char) (start >> 32)) & 0xff;
+	srb->cmd[6] = ((unsigned char) (start >> 24)) & 0xff;
+	srb->cmd[7] = ((unsigned char) (start >> 16)) & 0xff;
+	srb->cmd[8] = ((unsigned char) (start >> 8)) & 0xff;
+	srb->cmd[9] = ((unsigned char) (start)) & 0xff;
+	srb->cmd[12] = ((unsigned char) (blocks >> 8)) & 0xff;
+	srb->cmd[13] = (unsigned char) blocks & 0xff;
+	srb->cmdlen = 16;
+	debug("write16: start %llx blocks %x\n", (long long)start, blocks);
+	return ss->transport(srb, ss);
+}
+#endif
 
 #ifdef CONFIG_USB_BIN_FIXUP
 /*
@@ -1145,6 +1209,7 @@ static unsigned long usb_stor_read(struct blk_desc *block_dev, lbaint_t blknr,
 	struct usb_device *udev;
 	struct us_data *ss;
 	int retry;
+	int ret;
 	struct scsi_cmd *srb = &usb_ccb;
 #if CONFIG_IS_ENABLED(BLK)
 	struct blk_desc *block_dev;
@@ -1190,7 +1255,13 @@ retry_it:
 			usb_show_progress();
 		srb->datalen = block_dev->blksz * smallblks;
 		srb->pdata = (unsigned char *)buf_addr;
-		if (usb_read_10(srb, ss, start, smallblks)) {
+#ifdef CONFIG_SYS_64BIT_LBA
+		if (block_dev->lba > ((lbaint_t)0x100000000))
+			ret = usb_read_16(srb, ss, start, smallblks);
+		else
+#endif
+		ret = usb_read_10(srb, ss, start, smallblks);
+		if (ret) {
 			debug("Read ERROR\n");
 			ss->flags &= ~USB_READY;
 			usb_request_sense(srb, ss);
@@ -1228,6 +1299,7 @@ static unsigned long usb_stor_write(struct blk_desc *block_dev, lbaint_t blknr,
 	struct usb_device *udev;
 	struct us_data *ss;
 	int retry;
+	int ret;
 	struct scsi_cmd *srb = &usb_ccb;
 #if CONFIG_IS_ENABLED(BLK)
 	struct blk_desc *block_dev;
@@ -1277,7 +1349,13 @@ retry_it:
 			usb_show_progress();
 		srb->datalen = block_dev->blksz * smallblks;
 		srb->pdata = (unsigned char *)buf_addr;
-		if (usb_write_10(srb, ss, start, smallblks)) {
+#ifdef CONFIG_SYS_64BIT_LBA
+		if (block_dev->lba > ((lbaint_t)0x100000000))
+			ret = usb_write_16(srb, ss, start, smallblks);
+		else
+#endif
+		ret = usb_write_10(srb, ss, start, smallblks);
+		if (ret) {
 			debug("Write ERROR\n");
 			ss->flags &= ~USB_READY;
 			usb_request_sense(srb, ss);
@@ -1434,9 +1512,10 @@ int usb_stor_get_info(struct usb_device *dev, struct us_data *ss,
 		      struct blk_desc *dev_desc)
 {
 	unsigned char perq, modi;
-	ALLOC_CACHE_ALIGN_BUFFER(u32, cap, 2);
+	ALLOC_CACHE_ALIGN_BUFFER(u32, cap, 8);
 	ALLOC_CACHE_ALIGN_BUFFER(u8, usb_stor_buf, 36);
-	u32 capacity, blksz;
+	lbaint_t capacity;
+	u32 blksz;
 	struct scsi_cmd *pccb = &usb_ccb;
 
 	pccb->pdata = usb_stor_buf;
@@ -1487,26 +1566,43 @@ int usb_stor_get_info(struct usb_device *dev, struct us_data *ss,
 		return 0;
 	}
 	pccb->pdata = (unsigned char *)cap;
-	memset(pccb->pdata, 0, 8);
+	memset(pccb->pdata, 0, 32);
 	if (usb_read_capacity(pccb, ss) != 0) {
 		printf("READ_CAP ERROR\n");
 		ss->flags &= ~USB_READY;
-		cap[0] = 2880;
-		cap[1] = 0x200;
+		capacity = 2880;
+		blksz = 512;
+	} else {
+		debug("Read Capacity returns: 0x%08x, 0x%08x\n",
+		      cap[0], cap[1]);
+		capacity = ((lbaint_t)be32_to_cpu(cap[0])) + 1;
+		blksz = be32_to_cpu(cap[1]);
 	}
-	debug("Read Capacity returns: 0x%08x, 0x%08x\n", cap[0], cap[1]);
-#if 0
-	if (cap[0] > (0x200000 * 10)) /* greater than 10 GByte */
-		cap[0] >>= 16;
 
-	cap[0] = cpu_to_be32(cap[0]);
-	cap[1] = cpu_to_be32(cap[1]);
+#ifdef CONFIG_SYS_64BIT_LBA
+	if (capacity == 0x100000000) {
+		if (usb_read_capacity64(pccb, ss) != 0) {
+			puts("READ_CAP64 ERROR\n");
+		} else {
+			debug("Read Capacity 64 returns: 0x%08x, 0x%08x, 0x%08x\n",
+			      cap[0], cap[1], cap[2]);
+			capacity = be64_to_cpu(*(uint64_t *)cap) + 1;
+			blksz = be32_to_cpu(cap[2]);
+		}
+	}
+#else
+	/*
+	 * READ CAPACITY will return 0xffffffff when limited,
+	 * which wraps to 0 with the +1 above
+	 */
+	if (!capacity) {
+		puts("LBA exceeds 32 bits but 64-bit LBA is disabled.\n");
+		capacity = ~0;
+	}
 #endif
 
-	capacity = be32_to_cpu(cap[0]) + 1;
-	blksz = be32_to_cpu(cap[1]);
-
-	debug("Capacity = 0x%08x, blocksz = 0x%08x\n", capacity, blksz);
+	debug("Capacity = 0x%llx, blocksz = 0x%08x\n",
+	      (long long)capacity, blksz);
 	dev_desc->lba = capacity;
 	dev_desc->blksz = blksz;
 	dev_desc->log2blksz = LOG2(dev_desc->blksz);

-- 
2.41.0

