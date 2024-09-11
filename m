Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859455A117
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031316; cv=none; b=KW5f0YwJpFxFcocjHeM5FAVdHsNIJN4LQRmsd5zgaL8HJTreMwdJ2O5jNoOvhKXcXjuXJuD9MZd2miA7E5r//9Min7wkJAk+FsPI3UsM7wHwnnkJBOLksHEjs9cers5BS6sPkdfQCuJ0C5hikZmrB1ciEnsR6Krz1VxsKuTIyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031316; c=relaxed/simple;
	bh=VbxyHgLijtvMODTxWu3V6V7t7MJUjo0WXZgNPC4BS5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+jQH72On+OgPWWfB2Tn0rk55/tD6VGMOu5cPnt4n/K9ceFFNdw6QWe89yylMfdQW+KN4+pRh5zHLGUoW3NpkTebme0JUAnTUWBBYOFkP8J8VC/EMPypKzELfRfrDMB1CtvWVShMbZC2R/pMMRFV7MHQWWHu1gJw13YuNxFI48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBuEcGQZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBuEcGQZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718d606726cso3514385b3a.3
        for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 22:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726031314; x=1726636114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvwvg02SfR9k2vRdgG/Bv8ENZ6rOieWsuZ6MKBRYnn4=;
        b=iBuEcGQZPLFryjQseFiQITUIYVHKW0hDjId1VENecLSYllakg6/s+gB7RJd8e5ZcAn
         pvfKSFSOJGe6+8SkWC+y1gDMmb43K0CNJ18fXA8A4BfkozHs2ywBcVoU8kGB2MUou0SI
         wC23agmk0JtZmhdr5Kjx3dg6qEC1WZRnXqAVizV3baRPCyg/a9G1zu8GrIQ8X8Z0NxnY
         bULmYRHne2fHKyf6EZBy2+3INctggC4DZBkcWN7vuSJFJZxQuJty2GDNVu8pymbg8v+3
         E9H8RrhlAmSHf1e54bEb2UiXShKf6QxGHOKFFkAE+5S4Tr7CmvqwjfQfdH9zKFPeWoi4
         7yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726031314; x=1726636114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvwvg02SfR9k2vRdgG/Bv8ENZ6rOieWsuZ6MKBRYnn4=;
        b=EGrMseC8lHLp6hWkshXkcEevgQQWbdfQoAEwQU536wKKG59HWXrFlFULrgRM0H6TDk
         KytWzEHYqVzbiAfjEq6UG2aywR/KkeFnj/KHP/lFRULlM07C8GwHC1A5wY4i7A4qQYll
         4hnUInfjLSwsJIyc/lR060RD6wYhT6XBSCF275syIKqupygMUm5XwPXiPqZDXgVf8SOI
         2+S62wgaoHnQcjyc1jVbAdlJtQ5KSPkfyRC8QrfxWxXtwNhdE+/h0MaVsuVxi811VHup
         VOoNRWpMTzQ/Azn7l56usNIdHYtWiKHyIU8CC+Psqcm9Jd41K1VaCgjDIp0GDK3AIz66
         5rhQ==
X-Gm-Message-State: AOJu0YwjgqokNqySFZKPkr8OGnQlRiGJ15ZWQXFKK6RFkaOBgvWbBuOu
	YAJxtqUYuubmAkMaK0zAKry3zJEKnhzZCnNo4rvrlWufEdcAvJ5y7UWTeBpYXrE=
X-Google-Smtp-Source: AGHT+IFSx1pD+FrsMRBNSUqJhlhYmY2n61Rn3DDVI6qu0M2QdurlC7Tp70mR5VSk+EzWYPbRcaWNmg==
X-Received: by 2002:a05:6a21:3946:b0:1cf:3885:b9d8 with SMTP id adf61e73a8af0-1cf5e0ffd16mr4694941637.27.1726031313731;
        Tue, 10 Sep 2024 22:08:33 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-719090d11e6sm2156984b3a.205.2024.09.10.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 22:08:33 -0700 (PDT)
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
	Nick Chan <towinchenmi@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v5 3/3] tty: serial: samsung: Fix serial rx on Apple A7-A9
Date: Wed, 11 Sep 2024 13:02:13 +0800
Message-ID: <20240911050741.14477-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911050741.14477-1-towinchenmi@gmail.com>
References: <20240911050741.14477-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple's older A7-A9 SoCs seems to use bit 3 in UTRSTAT as RXTO, which is
enabled by bit 11 in UCON.

Access these bits in addition to the original RXTO and RXTO enable bits,
to allow serial rx to function on A7-A9 SoCs. This change does not
appear to affect the A10 SoC and up.

Tested-by: Janne Grunau <j@jannau.net>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 17 ++++++++++++-----
 include/linux/serial_s3c.h       | 18 +++++++++++-------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 3fdec06322ac..0d184ee2f9ce 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -550,6 +550,7 @@ static void s3c24xx_serial_stop_rx(struct uart_port *port)
 		case TYPE_APPLE_S5L:
 			s3c24xx_clear_bit(port, APPLE_S5L_UCON_RXTHRESH_ENA, S3C2410_UCON);
 			s3c24xx_clear_bit(port, APPLE_S5L_UCON_RXTO_ENA, S3C2410_UCON);
+			s3c24xx_clear_bit(port, APPLE_S5L_UCON_RXTO_LEGACY_ENA, S3C2410_UCON);
 			break;
 		default:
 			disable_irq_nosync(ourport->rx_irq);
@@ -963,9 +964,11 @@ static irqreturn_t apple_serial_handle_irq(int irq, void *id)
 	u32 pend = rd_regl(port, S3C2410_UTRSTAT);
 	irqreturn_t ret = IRQ_NONE;
 
-	if (pend & (APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO)) {
+	if (pend & (APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO |
+		APPLE_S5L_UTRSTAT_RXTO_LEGACY)) {
 		wr_regl(port, S3C2410_UTRSTAT,
-			APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO);
+			APPLE_S5L_UTRSTAT_RXTHRESH | APPLE_S5L_UTRSTAT_RXTO |
+			APPLE_S5L_UTRSTAT_RXTO_LEGACY);
 		ret = s3c24xx_serial_rx_irq(ourport);
 	}
 	if (pend & APPLE_S5L_UTRSTAT_TXTHRESH) {
@@ -1190,7 +1193,8 @@ static void apple_s5l_serial_shutdown(struct uart_port *port)
 	ucon = rd_regl(port, S3C2410_UCON);
 	ucon &= ~(APPLE_S5L_UCON_TXTHRESH_ENA_MSK |
 		  APPLE_S5L_UCON_RXTHRESH_ENA_MSK |
-		  APPLE_S5L_UCON_RXTO_ENA_MSK);
+		  APPLE_S5L_UCON_RXTO_ENA_MSK |
+		  APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK);
 	wr_regl(port, S3C2410_UCON, ucon);
 
 	wr_regl(port, S3C2410_UTRSTAT, APPLE_S5L_UTRSTAT_ALL_FLAGS);
@@ -1287,6 +1291,7 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	/* Enable Rx Interrupt */
 	s3c24xx_set_bit(port, APPLE_S5L_UCON_RXTHRESH_ENA, S3C2410_UCON);
 	s3c24xx_set_bit(port, APPLE_S5L_UCON_RXTO_ENA, S3C2410_UCON);
+	s3c24xx_set_bit(port, APPLE_S5L_UCON_RXTO_LEGACY_ENA, S3C2410_UCON);
 
 	return ret;
 }
@@ -2143,13 +2148,15 @@ static int s3c24xx_serial_resume_noirq(struct device *dev)
 
 			ucon &= ~(APPLE_S5L_UCON_TXTHRESH_ENA_MSK |
 				  APPLE_S5L_UCON_RXTHRESH_ENA_MSK |
-				  APPLE_S5L_UCON_RXTO_ENA_MSK);
+				  APPLE_S5L_UCON_RXTO_ENA_MSK |
+				  APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK);
 
 			if (ourport->tx_enabled)
 				ucon |= APPLE_S5L_UCON_TXTHRESH_ENA_MSK;
 			if (ourport->rx_enabled)
 				ucon |= APPLE_S5L_UCON_RXTHRESH_ENA_MSK |
-					APPLE_S5L_UCON_RXTO_ENA_MSK;
+					APPLE_S5L_UCON_RXTO_ENA_MSK |
+					APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK;
 
 			wr_regl(port, S3C2410_UCON, ucon);
 
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 2a934e20ca4b..102aa33d956c 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -246,24 +246,28 @@
 				 S5PV210_UFCON_TXTRIG4 |	\
 				 S5PV210_UFCON_RXTRIG4)
 
-#define APPLE_S5L_UCON_RXTO_ENA		9
-#define APPLE_S5L_UCON_RXTHRESH_ENA	12
-#define APPLE_S5L_UCON_TXTHRESH_ENA	13
-#define APPLE_S5L_UCON_RXTO_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_ENA)
-#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
-#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
+#define APPLE_S5L_UCON_RXTO_ENA			9
+#define APPLE_S5L_UCON_RXTO_LEGACY_ENA		11
+#define APPLE_S5L_UCON_RXTHRESH_ENA		12
+#define APPLE_S5L_UCON_TXTHRESH_ENA		13
+#define APPLE_S5L_UCON_RXTO_ENA_MSK		BIT(APPLE_S5L_UCON_RXTO_ENA)
+#define APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_LEGACY_ENA)
+#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
+#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
 
 #define APPLE_S5L_UCON_DEFAULT		(S3C2410_UCON_TXIRQMODE | \
 					 S3C2410_UCON_RXIRQMODE | \
 					 S3C2410_UCON_RXFIFO_TOI)
 #define APPLE_S5L_UCON_MASK		(APPLE_S5L_UCON_RXTO_ENA_MSK | \
+					 APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK | \
 					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
 					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)
 
+#define APPLE_S5L_UTRSTAT_RXTO_LEGACY	BIT(3)
 #define APPLE_S5L_UTRSTAT_RXTHRESH	BIT(4)
 #define APPLE_S5L_UTRSTAT_TXTHRESH	BIT(5)
 #define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
-#define APPLE_S5L_UTRSTAT_ALL_FLAGS	GENMASK(9, 4)
+#define APPLE_S5L_UTRSTAT_ALL_FLAGS	GENMASK(9, 3)
 
 #ifndef __ASSEMBLY__
 
-- 
2.46.0

