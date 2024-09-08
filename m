Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A412B17C
	for <asahi@lists.linux.dev>; Sun,  8 Sep 2024 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725782378; cv=none; b=JBL+AklPTNpFublkcQ69noBIlIWsLeZyafnLbsoi7YqZE8vR7W5rNpBDlRm3sYRXlcZYVmz8WcGGLmoZBQPlCldRz+JLpHMGVM9bK0oiDDWcea55j3104vZ4MBvqIPxPmLsFWgcjH5OKouep8zbLgz4w4PxXg9axdOldNElmyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725782378; c=relaxed/simple;
	bh=VWXmO1RyWUyhWh2dn59RYX/QZ88zhjH3WSnJNNQVVnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyn6YNChsk5AspZvWUg17fkGWQaKGoweZ0LDj/vfGm2GeNO+p0C+zIYuEBSaJRXBpDAf0ToxlU/7b93kHbteRi3tz/XXA0iaBf1xKuYDNlIUEbej03tSsvITcbb6z6Ur3UD77sQN2Aazs+vWeytp99+Mx2PfWbbNkoT//jHY0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zcd5yIGb; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zcd5yIGb"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e0379a8d96so685385b6e.3
        for <asahi@lists.linux.dev>; Sun, 08 Sep 2024 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725782376; x=1726387176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSAWxbt/KB3N4v3rcDblPZmbY76AbUJCwly8u6qq48k=;
        b=Zcd5yIGbrLjLKzmcwHOVOQWyZ1prUQ92Eupr+axahlegDm9sZNwqgX+TyeBPWTmcVz
         mPsGmZ6A7pA5axOHauwGyiVA+B50aFfcTdSkZlnlQyHW4YLxZVMw8asYNSWEiZnUKSox
         BI7PcCJzdUPpmX4m6sV0YVmlDAWtT+lKhXVseCqqhOzS+G1WIbtLEfgupq8yAavBQk0d
         j9fQI9ZXiPbX66xcjD+OOoXZcLzD4xXO9gopDZ1HXb+DMUMTMFGxzhnDYPN03vMmiBZF
         JEsZEfky1CUkcysq1f09dSbgdnG09K2CHVfc6f6wtSGjq4hqDSkm9b9DKEhcdjoYwHHQ
         lguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725782376; x=1726387176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSAWxbt/KB3N4v3rcDblPZmbY76AbUJCwly8u6qq48k=;
        b=PCN28ZQPEt3LCeHscCF4eo2U9hrLTdG5wJ8iD2Ea8HbfOx4SH5LV4RHNg+BH2t9tnu
         occHnG7hc72gHU+M9u59YtVdYGbBCJeCVYawSyDQsqkgWW62348nmm8mBjkumGcw6vM2
         yfXAe65fGZcKOOfPnNJ/hUSj2MwIJiRM6iu9fKOQoUiwAb7Y2BRQ1n/eJ5jR75lPz34f
         gnChJn81t0KyFEng72p2SH9G0Wt8L/YDojU6zzarZotZBYeH1+OngOv0+T0zRGkPvcKX
         aDW031OgBUPFbqTLIS/1JXUUdYwii7QU22vCbiaj5mz4vkpFoJGaBRjPRmRAjnXrKWjy
         2Ocg==
X-Gm-Message-State: AOJu0Ywj3AuzWBIjrEX2DhpdBa5jqMUOyejy6Ngmc8W7/x0+GRPOyIEf
	h8RSONRD5SX1ygg5sURQwCpglygEQQHqbypxGK1r2SQa7enpXxdD
X-Google-Smtp-Source: AGHT+IF4X47dLoffOVVo0BcLEvCjOamHYwwrqOfcrpE78LRYitbuMjUJoZKkxWLK9tq8v1Y0uVOraw==
X-Received: by 2002:a05:6808:4483:b0:3e0:4044:7199 with SMTP id 5614622812f47-3e0404472b2mr1298829b6e.16.1725782375953;
        Sun, 08 Sep 2024 00:59:35 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7d8255dc1c6sm2012690a12.68.2024.09.08.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 00:59:35 -0700 (PDT)
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
Subject: [PATCH 1/3] tty: serial: samsung: Use BIT() macro for APPLE_S5L_*
Date: Sun,  8 Sep 2024 15:50:48 +0800
Message-ID: <20240908075904.12133-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908075904.12133-1-towinchenmi@gmail.com>
References: <20240908075904.12133-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New entries using BIT() will be added soon, so change the existing ones
for consistency.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 include/linux/serial_s3c.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 1672cf0810ef..1e8686695487 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -249,9 +249,9 @@
 #define APPLE_S5L_UCON_RXTO_ENA		9
 #define APPLE_S5L_UCON_RXTHRESH_ENA	12
 #define APPLE_S5L_UCON_TXTHRESH_ENA	13
-#define APPLE_S5L_UCON_RXTO_ENA_MSK	(1 << APPLE_S5L_UCON_RXTO_ENA)
-#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_RXTHRESH_ENA)
-#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_TXTHRESH_ENA)
+#define APPLE_S5L_UCON_RXTO_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_ENA)
+#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
+#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
 
 #define APPLE_S5L_UCON_DEFAULT		(S3C2410_UCON_TXIRQMODE | \
 					 S3C2410_UCON_RXIRQMODE | \
@@ -260,9 +260,9 @@
 					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
 					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)
 
-#define APPLE_S5L_UTRSTAT_RXTHRESH	(1<<4)
-#define APPLE_S5L_UTRSTAT_TXTHRESH	(1<<5)
-#define APPLE_S5L_UTRSTAT_RXTO		(1<<9)
+#define APPLE_S5L_UTRSTAT_RXTHRESH	BIT(4)
+#define APPLE_S5L_UTRSTAT_TXTHRESH	BIT(5)
+#define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
 #define APPLE_S5L_UTRSTAT_ALL_FLAGS	(0x3f0)
 
 #ifndef __ASSEMBLY__
-- 
2.46.0

