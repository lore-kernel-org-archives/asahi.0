Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB58E1F5EA
	for <asahi@lists.linux.dev>; Mon, 30 Sep 2024 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727676454; cv=none; b=fh74Z3eYN05/js02PZspbkX1MNJpDvy3GdOtGMV5sYjXPoXYa1VuDwrko+3wDa9JFBIg409zG/W+fKng1VxBjkuJ7Gew8knX9jsoH1W1HM/wJP63R83LX7Tx8DC+mrOsGY1lSQhMllSx/PRBSYjGPCFAbrL7+Um2X66j7pzefNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727676454; c=relaxed/simple;
	bh=uPvB0xPoy+enSpJ9YrjNT7knO7PNytAdD7sOQVaxU5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4cGGA+Ki+gVRFL5dEKn45b8NpeatVEkSrGRFyeqKwQ6IKN1GBkzk/692+OflNRfF7vIJ+DD4vHs+hvLInBwdCLHUDdIrFp0GbGm9clkIHN0bMTh6tFHt0etjdCYDFDvK+xmIZv+fPKlE+YyLEOC94yHkHQAUrAnI57l/Kd6kvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVEIQKG6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVEIQKG6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71b00a97734so3468543b3a.1
        for <asahi@lists.linux.dev>; Sun, 29 Sep 2024 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727676452; x=1728281252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMwZ52rgNs2z/qva8eWDKf1Jz818c0mIJR5j/Mc97DA=;
        b=IVEIQKG6+Ksru6c6sxtsBcRl3lugXXNy8fLWEmkMYL5zjlORf4Awc8Cl6tPQD8jq8A
         gecUO58zg5TupYBAzkuGp7WzoWr23EQ9f/iB6CiCKdAyNxm5liu9N/eyUbzZaCKc5gqv
         tIcp5uCHddf22xQwd9Py2+A26ZAbtFTeE0sPCrNpo8LrJutaJ7EhLXlWHKXcObNv/ro7
         uRux7b295KNsg5i7AnD5TTWg68Ap0wATGMCtGcQ21sKfn6uAzw/aINOkTS+fu0H2zREt
         bY7zT5Qu1SKlFS+id9WaMw16HvLJHi8u1G9D6FaHM8NtuwjH4Th5JxwdIWC7E8MwtcMf
         xYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727676452; x=1728281252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMwZ52rgNs2z/qva8eWDKf1Jz818c0mIJR5j/Mc97DA=;
        b=i/n9PEd9/RQcIEfGQqFQ5RDgb6KcPnEVe/rkI0AiBocwpePjgtMGtva0MzjZRrjojM
         frFGGKWosN6DpDA8RV2GLFy2IRlHJDrucaeuTO/tnuT4UAeWSG/svw7GTRV39Wmurvbf
         ud2JBHheBS1lVS10W73vxLLgU0I5Al3J3EgSv2RG1HZs2Dgv5283eCikNtDdZcX/aGpU
         L5E6dP9rJln/dikCyotCJ8njvoienVWDsmHV/e825hRTPlI6wajIIc1bV43NILn1YYvc
         38MpudFVpV32A86rn7/VoI8Om2XVRdp54FV4wvqgHqq29h812DqTi0s+60rgsEwPftiD
         1Lpw==
X-Forwarded-Encrypted: i=1; AJvYcCXpvIUFLXPfITG16D/65UZiJnAS47EHCGqpeT3GXch/jnMLrXVwQQnIb7pbRcHpH/vUdQxy3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqKhBE2NFWpfCCTok5ZZkTfF1U6LJfodGRZVLB23mjLWWriZGx
	QDKERBNZZ7g0PxxwQzs51AaDNWuSJpKgEjUkciAIrW2+rYmQgFIa
X-Google-Smtp-Source: AGHT+IE3Cw/qK4kCNeEhAnR/8b7y5fEBPaeUkjz0+6Dgitm2s6Z0BNGPar86SjGu4uqzL46UjUAdqg==
X-Received: by 2002:a05:6a20:b70f:b0:1d4:fadf:2d14 with SMTP id adf61e73a8af0-1d4fadf3c80mr14163323637.0.1727676451567;
        Sun, 29 Sep 2024 23:07:31 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b264bb351sm5506246b3a.62.2024.09.29.23.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 23:07:31 -0700 (PDT)
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
Subject: [PATCH RESEND] watchdog: apple: Increase reset delay to 150ms
Date: Mon, 30 Sep 2024 14:06:33 +0800
Message-ID: <20240930060653.4024-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
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
index d4f739932f0b..353ecf0b04dc 100644
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
 	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
-	mdelay(50);
+	mdelay(150);
 
 	return 0;
 }

base-commit: cea5425829f77e476b03702426f6b3701299b925
-- 
2.46.0

