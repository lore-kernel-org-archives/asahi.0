Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B1618CC0B
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 17:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802043; cv=none; b=DjSSYoRqM5o7HzulL0CMrEyYA9cSt/a2SY0uSX5/i9mtWXe3FiUcBSlHNQoMglegvl5BKgb30QF3dtH9oFu/ifLO/oLnDj/M+sXNJ1HBENukYSuQ2idLkaxv3wD6qx/UWwNWbPSsFdYakdw9eF5gyc6CGSB7CNSgmHna9eGvOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802043; c=relaxed/simple;
	bh=XqLd+pXvyaQyau2YcXhMbU1ix+Q4b7XOj3ImJVBv4XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BOAD9hpkEVsumCwv9gFMlgLkAR6Vq2Cu9+7UAOQv0mYcjXIEalIWxrow6tLZdmpCrqHrOVYeVQk1pXCdF96GMnv+Mo/5QfHdTT4Lx29aQYcuN4Q5XPr6KyywLFE7zOBR20uUqIMvEE5PQrvGwmyccioOmDT6etJqwywxbqZPHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlSSKmL6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlSSKmL6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-718d606726cso4142668b3a.3
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727802041; x=1728406841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK0basgN0caXy6pJhRrEiTQEkdwQudaB+HfTNGByWoo=;
        b=nlSSKmL6HUuk4MXNaUQqG2dZxE+zj3C3JJQ6AvepuUtE7uMUZrpfWfYuFkhW71eDNc
         gn+VGPHMYAj9t4DWDV5qcKy5HJc17DET3qpnhtgurrPvzGpancUx5jVAaz1s70rFtyc2
         psZlLqpGM8ZXBk+WvTXQrojHQ1XYSOTd+k46LrR4IEQLiTXQ2MTvyJWsubsa+LMfxk9A
         hJkHN310eLzBaGWlXrtUHFBs8ybnyHafY8H/CItNvPm+fBrOAwoz9soceBmqvKWW5hG5
         HfFVczTE5wCxY94k+YyP7i0EL7JyYmuv4/uHtB437jMaNoHxTgwTwwXWkp+wES+Q3qje
         b1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802041; x=1728406841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZK0basgN0caXy6pJhRrEiTQEkdwQudaB+HfTNGByWoo=;
        b=WSB6dTxzFArQvhO8sOwvVf9BUg0BwygHtKILkL6vMos92mjb0WM+b/eVNUgUThO4SO
         xHZTvbKTuwopcEwF9coJ/ThFmjxTWn2KW0/g387tuIQWcnRgbBvMMxnk7b9uh9O8wq0O
         QrTs1+X5qr4hD0VAGslqkfOxSKgS5uy0/Q+tPpWkupJNWxlK7/wQRYyMNi7M08mXyRY1
         GQn+oxjRYsDZuoz6PxSKkmmwQWIfKR28X/snwnS93sFVsb84BaGUtYVl8wbfryNXsCtK
         C4Iscy55M4VCBkuLzvgpKUaJ+xlpH8EyjESoVLN3xrmCUnL3MAOOKqbEiqZhlSAPLXXx
         TRVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiny/Ih+6Ka+yQRWmfbC5JwdTML876jPRUOEBpDaRFRaY2RJjp2qwRJTfEOB3JV4TP6C2zNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWxqQpc70weVGEPfzh2os/zIh5DLwyVl3tG83x5AWoY82A0AUZ
	7HMx6pjmelpoeUfqk0NjW1tZGzj81/TVFNfnP+Q6jiNUF8CWWEJ7s/T1epMQ
X-Google-Smtp-Source: AGHT+IGSi2gxdtKct+45b4m5zF0ZBj7/3pYWbnN++bcS5SKmJSk64eiCV8YmteZG9KCnAGLvlJKFMg==
X-Received: by 2002:a05:6a00:3997:b0:718:dd89:a1db with SMTP id d2e1a72fcca58-71dc5d6f588mr412601b3a.28.1727802040771;
        Tue, 01 Oct 2024 10:00:40 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b2651623asm8234054b3a.120.2024.10.01.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:00:40 -0700 (PDT)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
Date: Wed,  2 Oct 2024 00:59:51 +0800
Message-ID: <20241001170018.20139-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001170018.20139-1-towinchenmi@gmail.com>
References: <20241001170018.20139-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although there is an existing code comment about flushing the writes,
writes were not actually being flushed.

Actually flush the writes by changing readl_relaxed() to readl().

Fixes: 4ed224aeaf661 ("watchdog: Add Apple SoC watchdog driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index d4f739932f0b..62dabf223d90 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -130,7 +130,7 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
 	 * 50ms here to be safe.
 	 */
-	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	(void)readl(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
 	mdelay(50);
 
 	return 0;
-- 
2.46.0

