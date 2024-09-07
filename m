Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB8E155316
	for <asahi@lists.linux.dev>; Sat,  7 Sep 2024 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725707695; cv=none; b=jwesO5LaEnfTqzjnsr4XtaDgLwMx598DEMR62UKMJ+HpVltkyYzRZgqp6sAIie3oeE3Mo7Ycj3SCK89A+jMXCzCubh3KCxhLP1OIiQ3Rro4xlIpnIKi+Dgv20cV7kiF2bSL1QjqfaX/4xlU/D9Ati8fT1nsrtpKvm92sNRB+omM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725707695; c=relaxed/simple;
	bh=yQn4IrX2y1gGE9tp496wGGts2OgOvzhAvr+Mlat6+5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMeVB9K+BaiQLmyS03noMwvK+TZqrrxytoOYJDJufCGv9VZ62hEvXMRyOzwYgdnja+rXO6z4OJmA4pcTZNhA2t5ymbhm7xrT8H/hwyanz7dfniZlC1H058KloGlmZMqpEHktoPzFvEcRrIVbmx7yahbb/C+RB+q37ZO/POoSUCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM+7V2dD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM+7V2dD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20696938f86so26490305ad.3
        for <asahi@lists.linux.dev>; Sat, 07 Sep 2024 04:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725707694; x=1726312494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3+BuB4FjLqD9bjbDGs2bz07cEq00t/CZQx8ir7y0gU=;
        b=AM+7V2dDi/zwOOKpH8GFhXTm1Rrkum6nnpFCBbRtQ7zjVXnyn4HT3fgKfIXiwV9okX
         t2l79WuZOhRJHpk/i4QUeDRj/XazB94vIa2slr0Epz7QDN0AnHzyKuaWufL28AbvqqZo
         HVgzlDL4nhg8r4CHsA7hl4GzjPAe4SPtL5NEjdwLdLpkT898plux4+Yan6914sxBpgwb
         6l1ri84iB7wOvDuHwDfqpYwQ3l6u0Zj48DN58Qk8XgNCgtFeObMDJs7BJKfPlchAVaAf
         xFWxuTgRu+8PptSHnGENpoMn4V3WphsXMavNtY/vEU4ubhHywwkiPOBwai6SQMEsq4s5
         Fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725707694; x=1726312494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3+BuB4FjLqD9bjbDGs2bz07cEq00t/CZQx8ir7y0gU=;
        b=kfYA4qUndNs2nwnMEMBuWZS6bxZQ56o/fFTlRZC2QIrEt0CSfNUJEsjIBkXe/qyDSl
         anviDbceMV+++Azv+oabnolVswex8Tb+BI3AdJaktTrOeitRQEo73XpZhEh1NRPmxZyr
         AVNOD1ffqZq05M3X1k2pd3TTWHbjPExBA+y50yWOB5HfrQlyt/LOXfnjXGKilg/cuG4p
         ut4D5aIo0vz0O0GNkY2W57zbW1wSNqVwZje24Ogs2WIzZHQuYbztqP6PcN52RqvqnkAZ
         PPJD5u2gKLxbdvVzho4pO7Iv/52fzuTfrEVItuUSBLE7jzmgZUl02lYXCxkHeDwZyV7z
         05aw==
X-Gm-Message-State: AOJu0YyTFUaSeWBhBzm/gCVF109Jy0xbIN5uDDDXEuE8lf3C8I4rKB2B
	zvEqRK4IiVP2MzNN6CIPe5j1TIAcwsOagnvoef6U6GjfcSlFiXga
X-Google-Smtp-Source: AGHT+IG+d/Ja+M6I/KKbLW1L9kR7tYcT+FpvaTcOzSQ8w/aHxuNDIEwCeGvjU3MYj7ZC8/xGYSOn0A==
X-Received: by 2002:a17:902:ccce:b0:205:8bad:171c with SMTP id d9443c01a7336-206f04e1a7bmr65926405ad.12.1725707693732;
        Sat, 07 Sep 2024 04:14:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20710e1addbsm7186955ad.58.2024.09.07.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 04:14:53 -0700 (PDT)
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
Subject: [PATCH 1/2] tty: serial: samsung: Fix A7-A11 serial earlycon SError
Date: Sat,  7 Sep 2024 19:06:44 +0800
Message-ID: <20240907111431.2970-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240907111431.2970-1-towinchenmi@gmail.com>
References: <20240907111431.2970-1-towinchenmi@gmail.com>
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

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index c4f2ac9518aa..27b8a50bd3e7 100644
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
@@ -2825,8 +2825,10 @@ static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
 	/* Close enough to S3C2410 for earlycon... */
 	device->port.private_data = &s3c2410_early_console_data;
 
+	/* ... however, we need to change the port iotype */
+	device->port.iotype = UPIO_MEM32;
 #ifdef CONFIG_ARM64
-	/* ... but we need to override the existing fixmap entry as nGnRnE */
+	/* ... and also override the existing fixmap entry as nGnRnE */
 	__set_fixmap(FIX_EARLYCON_MEM_BASE, device->port.mapbase,
 		     __pgprot(PROT_DEVICE_nGnRnE));
 #endif
-- 
2.46.0

