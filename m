Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6BE1CBEA5
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802045; cv=none; b=fjyZcz3eCgmPUbjnunDYlyh/DHYKjD9/jdJJ8Q7JmghSMNQBtT01xREuVDi2Y+/l8WWdi0QbO7MV8EVVN09ABFtF5ZyZjCwoziq4tdMvcz0Ivw2TrM+80R7TmvDmMypqNA4T9u+L0U2eWMY4D5jgbtojmWx9EQvoEOCe7ANVz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802045; c=relaxed/simple;
	bh=VZ5AMUvC0LmVrPDCncgnGWvSyVO8/wYZmtST1CyQ7ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciXbKwCN3c0BmgEicaeYxHMpHJbU7DZ1b9oi+uOkbtmgwFuivFC0FlgPObETOVbg2xNbp2LYAOOvNIlvt1xrHI7RKCHEdWWCKXMR5S2gCsyWbmMuL68Z9SeFQDF8L+JjZDNvyyCRms0m8W9lw78GsPRLB/fhGzK2dXOzq8twPHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGso+fIa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGso+fIa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-718e2855479so4158112b3a.1
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727802044; x=1728406844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgNguRTnjUZaIg7uPr+xWg/1h1wY5swm1wRQT6JqmIA=;
        b=MGso+fIa7yBrWWDcHCQKHaSpxmhAjhmIpwGYFjiRXPrPMVPt9sYqfOBk9A9DsBkrWJ
         SnEPOPhae5QOEtfct01io50cOOLSQCRIXJEujlpAm7IdQh9zT+geAgkxKhWCwHNLrTYz
         S9Q1lx0s/+tic0AJ1plebF8YAM8U9bBYrzu4kUKWGpx6aTyrnOL9HPqezP+ZBlZ8pH/0
         AwXFBsxjI3+KMqYZ8MfPT75NV6xtPNx0+WR618HUZCQGNMgWsxjH/VdtnNZEQ2og4bIv
         jD52L0HIVyzGHNZeqha3nP2RwuV5CaGbZEu5dM69Fv9sPNwuIoY2s4coChB9B9jHC0Dl
         BVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802044; x=1728406844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgNguRTnjUZaIg7uPr+xWg/1h1wY5swm1wRQT6JqmIA=;
        b=HXqLF4w1nLElqU/RdUadTs/TJ9LDrbsbxFP7nQL1EN2ouaUVe0/rjw7yRx9Bo1/kl+
         TijR8allrAfS0Fj7H0KnJWtS5k7Ftm92UiY8he5ACprj7JzQiFmVqbOYAzJPySOD756N
         UD+c3/cL9wU3jiC/Pi7z2JiXf83giQE+uSpcWkbzBbu0At8pg7YDFAOPcGgzHodS0XMM
         UDDhvVlf77u1EiLG2H1kkw9bevpCzI/DQ/s6U/YAUzqLXoa0PHGTnOq2ZXQ0kFCbVpjB
         8Np9KkkfuxtBph7goM9tOGrRFqbVrWgmMLyeERvQixD5Xr/hHbVbSnUXcUiqgAoszMI+
         nAqg==
X-Forwarded-Encrypted: i=1; AJvYcCVlI/yHt0Qy+JkrG07em2OjHDHw/4fEjWCwGQhoL1VXnEBm5CEdsDJ8sPFP0OqiDnwqg2xleA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWzYjlOnI9OjuXkFydcpxY6tWOtXN/YKYe6KhNONaaFvqM+9eZ
	+QlqpsQ97NIUUH3tmPBjkV5ojnnDJHGyhK2urpbct/+2qyU8C4Np
X-Google-Smtp-Source: AGHT+IF+p9R1d1pnL6XCGLnTwwX3rwlZj+UtFNg6vndTxf9iMVY8yDmwifeIU5ozJ1PoZ+VX4QFIvw==
X-Received: by 2002:a05:6a21:1304:b0:1d2:bbd9:4646 with SMTP id adf61e73a8af0-1d5e2dd9d54mr508335637.38.1727802043346;
        Tue, 01 Oct 2024 10:00:43 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b2651623asm8234054b3a.120.2024.10.01.10.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:00:42 -0700 (PDT)
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
Subject: [PATCH v2 2/2] watchdog: apple: Increase reset delay to 150ms
Date: Wed,  2 Oct 2024 00:59:52 +0800
Message-ID: <20241001170018.20139-3-towinchenmi@gmail.com>
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
2.46.0

