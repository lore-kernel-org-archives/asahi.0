Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BFD82C60
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165484; cv=none; b=lXP9tCcDAtVhpwUcEPp3GJwR2BrFXtfkgjs7gKTJMmPQ+f0rLN7Bt5Ll/eLO4NmxQ+ZDyl9N2imGOMoWbmrBLJsPOzpAT4K/T3NPksW9L48DPIsyCMgeyqehen06jo/r2xvWpLfnSWkoI+P/26qooCR+oTMte3ft/LL0lh2tX5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165484; c=relaxed/simple;
	bh=VqoKn0i085NYBXXwHkUOwL2fkvCdHCGrJiPFJ/U3NUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mK6nfm0luWfM5JZbKdTk8RdD3fOdJKNz3TE/uUdIDQ+74UVqVmbvWGMAMopVRnNpNGAGhD9tDNWjhKylMDlvuo8GMWf/XhN24H0fn37DDi1FkP7Dc8+Qz7m79g7txF4apOH8uymFHZvRqnVH8x6LKZLZXm+Oj7Oa2rMbzPRBQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRMvzdAt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRMvzdAt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7eda47b7343so3135407a12.0
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165481; x=1730770281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=;
        b=gRMvzdAtgOA6QP3dHcuAW9dcRIBi7Jyt/OcbwaYiDXKWy+Vg69xbIUqpONXYFJhDCp
         6Qwj+hefhYALHCZUIj9jPXyR+kuYqf3N/Obi+wTy8E5NrzgvpOH3g/HjBzsdDribFA3+
         swW2Jg/hv/ZyIExSDYEhaKSIeAEDMN1jC+0A7v0ZvL978k+KQFHFhpndYNRSXOOU3AVD
         cSgAquKC3YG6xRRKPUFRUzyRh6UHQ02rm/r20ckGWDofau44ioLiaxBbw4bEo0EWJ3nk
         LuuqCKeYN1FtZv1ifPESDllt6+B+CT8kg1ceDnNXhccs3R+BU8AkL6cA11XDDzgWGktm
         0e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165481; x=1730770281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=;
        b=jXUKwEwJgXqAAmR26Ll/gLXc2s/ZQflL+JdG4Vk4hahzWsIyIdZtfHjEnwjGE3Xi8Q
         n2qqw7Saxi3yEk7udyNOOo/KvCfNK1vwyyMh6kO9HlViqFdI7C7lNA2cIcU3/CNIQKez
         efMjZ+RW+dcO25cCYOoW/RBrnLE/3T/LW3pkD6C4J9nRUipQ5SaWbv7YAWBzlsbavOA4
         ErcB8apyyvYwjh0pkEb4Ih+vxWAuH1O9KnbG8eJFXdbpwE6kq/WiMd/J77EOy2jq1wrv
         R+ooEm5eHXTm0/Ag1ddPvjPgIAsaBVqfC6VfphCEjW7FpncqQdbDL483bR52rQuQSqtH
         T1rA==
X-Forwarded-Encrypted: i=1; AJvYcCVRHMTik3MPjd5JBZjfj89Pblb8myQom04Y0y/UFHie1w5/w3EnceFoXE7Xcxko7B/KzpkIVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ONawdFAG6hHlVjgZmLo2L4Eck78dy0BRaOd1TmKqjQ/QVVuA
	PhLJdflMldiPOvuAWjbp8JoN2k/iDFZ1sqGYwDl96pLq9sxMXN+7orl7RQTd
X-Google-Smtp-Source: AGHT+IFsJ8/5pQAcma2IcNhwC+EoCEWeaDrvUbuERmpkGhRfDc2AJixjHb6s+XFCiJXWVYDvFRJCIg==
X-Received: by 2002:a05:6a20:c6ce:b0:1d8:d302:16a7 with SMTP id adf61e73a8af0-1d9a83ab53emr11772805637.3.1730165481451;
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
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
Subject: [PATCH v2 RESEND 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
Date: Tue, 29 Oct 2024 09:29:17 +0800
Message-ID: <20241029013055.45538-2-towinchenmi@gmail.com>
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

Although there is an existing code comment about flushing the writes,
writes were not actually being flushed.

Actually flush the writes by changing readl_relaxed() to readl().

Fixes: 4ed224aeaf661 ("watchdog: Add Apple SoC watchdog driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Guenter Roeck  <linux@roeck-us.net>
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
2.47.0

