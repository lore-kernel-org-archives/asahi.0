Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8381494AD
	for <asahi@lists.linux.dev>; Sun,  8 Sep 2024 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725786600; cv=none; b=SsXv+wCsRBQQIY148KqHFJD2Yk+bOp4tRRl3sNen7PCkDlJffYy6FB5XNleNJBP8k99PJJDhW+DSiJM15WSMiq1qshKyZTinQKOaCQxw13Bq6jFVLv/265W5MVAmgk1LfH+bqtbiNJz9aEiF1j19+TfRANA7Z3bkBjTnIJ3lApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725786600; c=relaxed/simple;
	bh=jSOpOfDN75HGeuyyYM2GrqyjGgMd6FFLDiemPseUTAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU0r3fUBnd48p9UIAZeh1W30KGmjI4Cs0BzDE7O29g6IT5ktek9G8EXY+YeknHYBmcHFICJevCfDY8NUwLiqqxwh6oMjZiF8Vi/aHqpS312cNpfhcTtAkwgK18HG8vymd4H+pqFYyp/Sk4lMDnHk1HaWsgj5YWld3gmPh5VNqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNK6GiC0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNK6GiC0"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7d4f8a1626cso2617275a12.3
        for <asahi@lists.linux.dev>; Sun, 08 Sep 2024 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725786599; x=1726391399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbxEfKH1k8/Qf9uULVt+DX4XSTY5IQ75JiyMJ31UTKo=;
        b=ZNK6GiC0u8llbzTbkZqnuK5BZEOhI6z3xq3IXB+mcQEw3en7+DP29VvRsusxW1F7wj
         Qovce1kEuklgtTdafame8feV+tbinUqRfoVLm4PDYPy3x6bVSOHVyJEqmXPrxzFDkQg8
         +TL7xu652yAPpDp17iFW4RHh+DlY05c1dQYj171L7h7iXmTTnO2X91Y0cFVAdjEtvvy5
         Dff+zoCpPbHBxlixngVdQNWghsJRmK+gt8VRMX8oOhqWx3E0WfSBdRf/yVehyJFSU0c8
         jymZqKwc2D7NCBzq6vSEz8dq9A7oBIo+lxWBPXpwK8w+Kyos4DR5JM+OfEsUzZsPCP4v
         ThmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725786599; x=1726391399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbxEfKH1k8/Qf9uULVt+DX4XSTY5IQ75JiyMJ31UTKo=;
        b=SztSI2BDvQX2AOTWCpFyuMNg556QwecCjR5g7WfT46zgSjmUC8+12QfGrvn/607dDh
         txmkH8lg4qTbYNriM58ZwWTmOgX+0KU0HlnQAQaxL5EpeLPCmh5pqN3bWxKQOCVUzHZQ
         u306sj2stI5UxSGIlowaWsMGFhTAHXtF8PcDMEhoHHCS70/EMKBf4bWU9HTjZ8oM9D9g
         GAtw9gE/x9UpFYRc1BahA3YjnNlnn2yQA8YPYZhTTcvEEWDLVumtoQORbrw4KwE5UXle
         I62y5pgstNM/z1F2ThMcOqNqhRalSfg4O08JFDpkTqAgYrZcRyvEy6ZCG7H5ebMNHKXb
         NDcA==
X-Gm-Message-State: AOJu0YzxsyrWpfN1ylspC5BSVHfBh1KeCo7Q8Vx+CNt3xfbI6YJjsBGA
	IbQAqvILwmFwIyOswO+vUZq1Q69PJCslsTVzokGuABRUNrP+p4II
X-Google-Smtp-Source: AGHT+IGD6//dNI4mvPIlr4luABmubRQ6n//3IEnexHIKQjRIoi8MgrkaWlu1RaMw3qxMGGGjDn9w4A==
X-Received: by 2002:a05:6a21:390:b0:1cf:3a4f:6710 with SMTP id adf61e73a8af0-1cf3a4f6a4dmr817960637.45.1725786598694;
        Sun, 08 Sep 2024 02:09:58 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-718e5896e10sm1821439b3a.31.2024.09.08.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 02:09:58 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 2/3] tty: serial: samsung: Fix A7-A11 serial earlycon SError
Date: Sun,  8 Sep 2024 17:05:11 +0800
Message-ID: <20240908090939.2745-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908090939.2745-1-towinchenmi@gmail.com>
References: <20240908090939.2745-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple's earlier SoCs, like A7-A11, requires 32-bit writes for the serial
port. Otherwise, a SError happens when writing to UTXH (+0x20). This only
manifested in earlycon as reg-io-width in the device tree is consulted
for normal serial writes.

Change the iotype of the port to UPIO_MEM32, to allow the serial port to
function on A7-A11 SoCs. This change does not appear to affect Apple M1 and
above.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index c4f2ac9518aa..7574d4176e76 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2536,7 +2536,7 @@ static const struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
 		.name		= "Apple S5L UART",
 		.type		= TYPE_APPLE_S5L,
 		.port_type	= PORT_8250,
-		.iotype		= UPIO_MEM,
+		.iotype		= UPIO_MEM32,
 		.fifosize	= 16,
 		.rx_fifomask	= S3C2410_UFSTAT_RXMASK,
 		.rx_fifoshift	= S3C2410_UFSTAT_RXSHIFT,
@@ -2822,6 +2822,9 @@ OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);
 static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
 						const char *opt)
 {
+	/* Apple A7-A11 requires MMIO32 register accesses. */
+	device->port.iotype = UPIO_MEM32;
+
 	/* Close enough to S3C2410 for earlycon... */
 	device->port.private_data = &s3c2410_early_console_data;
 
-- 
2.46.0

