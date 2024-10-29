Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09018D65C
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 01:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165487; cv=none; b=bKBr7bUkxPrHCtxLaLXsrM+/65U7ABZw/hMQx5kem+nZOqu4aT4w9dmr68Updq3F12ZwbmjhSrxtUIXV0Gq1xrHZ49Q9x9soxUyk7XOGUMQobjEm69IcLk+hP3exAkN0/CyywB+pP9/yZRinRJum8Vvsy9DbYMphygIqIkiJbQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165487; c=relaxed/simple;
	bh=NSHVBWbogICthgN37WJmF2hsHjd0eXsxGqoFlVCPbp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hj+ErK8NgJs9DEloaB6LE0uHagSSW1U3+XEL6ocohqU8wc/zvq//b7w1BwB5+eO0Q+hy4U4FDBWQIHsCk/DOZp6mfzMSazJCy/uR520v0iQwSx0mat/xmMC5/rgYx3l0/ZGZQ+bkk6K3Z65mzV5SU58W8xD24xcBlWQ41MQxMtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsKiZGk5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsKiZGk5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e49ef3bb9so3405163b3a.1
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 18:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165485; x=1730770285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=;
        b=jsKiZGk5IzzhRWYjDpVMO/VSEF09SN4e0rOKJyddfgfV0Yd6Hig4iNWVuNBJ+CHxQV
         gG7nRO0fVbsb64S8MA5JPdchPPEcCgeJ3ioyccXsjkTN13GKC30Ak+CzPuQXn9Ru02HU
         Dk3wf1vwTVj1I7i1AVvIXzi20JNKd3f+yKIx9UU0tROq77iR5zHFZgTF1urcPzNUQw8a
         mKHezM634PwF8y4Q0LI4VEAPzegtA4UafxwVNVyHhQvYRAFreLyvZt/HHw3GCmwqLNSX
         hxAQPP/F4PGVuRP5DBdngMKVDZR+o3iV0uAU/7tfY8TdZrGTjLX8LgNrc1fSEo4zPAMn
         xnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165485; x=1730770285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F22qCHP6afNbcrGoAQJ3oBUeXfRzjwgHNZ47hyoRqrs=;
        b=SP3gSUcBZ/vYVDzXJL/rmjnVaKWDmjDKtAuevcsL5U47xPcN1HWviSsIMjj8ifwTG3
         cAYbsUh9Ra/LtfHuETpyIySEEjs934O+gI54iuGALceFDf5vK2N1s9s5+HrmoNVVSH3F
         45iak9ti8z9jQhwTAuzTeIivYc0jFWhOWw5RX87mbk7+sSGgmkhf3YfxVTMKXuPln0RO
         wwPRKPagYGYJufE43z3hpZEIQ+53nNSXjPvAhahdsMLE6WcPNOL+JaluiDKVap3BoJ9b
         RU2S1tkPpaeU/c4zqFC5zFrEv8lgbPgG7XYpoKz+zdvJMTFMrwmd8wxmLfaZWEYkL0PV
         twHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHbLBB3U9ik5W3FQJHfwqCxUkSrpeH5kZY95nzH2po7PQsySjhJd3k2YeSR30EXWj5pwyZdw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp7vpRfY28RJNsjIoFLcVlie/d0CTh0IaHp2rD9NnsCqdPEw3N
	y57tPKhhtd9ISnIZQiRCKG5aRA6zvlwcwuE7auP+loYw68mx4KUM
X-Google-Smtp-Source: AGHT+IGyIb7Q8egCdWVoHzLFh6oz2bKRaVNI9AS0F5sLQSVgIeGhhVlP3LwlcUK0ZiaVTtFh86x4rw==
X-Received: by 2002:a05:6a00:741e:b0:71e:66e6:ca17 with SMTP id d2e1a72fcca58-720967cfbe7mr578632b3a.9.1730165484691;
        Mon, 28 Oct 2024 18:31:24 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:23 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 RESEND 2/2] watchdog: apple: Increase reset delay to 150ms
Date: Tue, 29 Oct 2024 09:29:18 +0800
Message-ID: <20241029013055.45538-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029013055.45538-1-towinchenmi@gmail.com>
References: <20241029013055.45538-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Apple A8X SoC seems to be slowest at resetting, taking up to around
125ms to reset. Wait 150ms to be safe here.

Reviewed-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 62dabf223d90..95d9e37df41c 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	/*
 	 * Flush writes and then wait for the SoC to reset. Even though the
 	 * reset is queued almost immediately experiments have shown that it
-	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
-	 * 50ms here to be safe.
+	 * can take up to ~120-125ms until the SoC is actually reset. Just
+	 * wait 150ms here to be safe.
 	 */
 	(void)readl(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	mdelay(50);
+	mdelay(150);
 
 	return 0;
 }
-- 
2.47.0

