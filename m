Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E85811A
	for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726249564; cv=none; b=b5iU2dv91DnBMuRgWt7d10AOhHxy/FxCQldpEhbfBdAn/DDI1zKKLFbLDHOtYyR3syb3zmHvfucKO7JvXagXeXNH3AmtAzNPxs6gwuJ0tnkJY02eAS1PsvOaioAgKTn3b44mAs7LMmhEHp1VfIWDnlaCHToV5a48TdA+cjb75jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726249564; c=relaxed/simple;
	bh=k2Sg5pN7dYYgJRnp2XsRdLyqdDWdF3HWxsDL5TVPvEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwCZp+1xUJS/SpXYBClyxPCL6I4BnnGCguAcL9WyR8ZHkvZDSekSQZSbGQ5px2qN8roxBfVaX8qoBrkJsTyxEsgQ1jEu3aKEzR+UAs2GqJk507owAN0jlwKerhDKRlxqNfoOPrqpkOc6NzeEvUt7UT3JBmM4jWo4LymEFjM4s7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7MnYYxI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7MnYYxI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-207115e3056so23833615ad.2
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 10:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726249562; x=1726854362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMmVvlnDTI/iTSI2Zh5vhwF1oFsJYU1HFV/JLiFZUNw=;
        b=h7MnYYxI4DJGDTXeLxtHey7hXdKMSmSvY5yPWMe0hLPj1hAr7EndvzfvKZ1nLFkKdl
         9xDeTpDNWW10sc7MoXCSgTqIX71rzK8qfNwBIEnC68G76urV/eu0iSK3mz3p9ZUwuVU2
         9KsCEuzAqLoVH4/ZdRN0ZOabPq7nOfc1amziQAeo+vC0f8HDxnJuDQ49Kjm+9CqCnsIW
         M5Pyq0NqnIMWu8TV9vXzJCiMHZvk+ex2RDLBCP182CkZA64vMgt/qxB++wBCkbjriWbA
         jCMWTc2JwJVJEGuwEOVQ8VeumptWKHGcsTSqxzK6xasW0lPpJmxpBLJXsFYGumPk2beT
         GmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726249562; x=1726854362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMmVvlnDTI/iTSI2Zh5vhwF1oFsJYU1HFV/JLiFZUNw=;
        b=dj+wH8+NXfdBCFvW4c6dYbVre5OZZmWccUiYuupitMI4yMo+WfBOfraSm3vLtg2DDF
         mTjJM+EVxH5uoh/0n78WkuNC0bjjlklpoervcEk4he5TBtFvtls6RhMs0lHxbUnzv8Kv
         QSGufhwAON9ijjCx7yTHr/OR8xuTdQvsQW0Tixoz06XYuImUwf8mPcVrwkzhbFs0elU/
         vmSvwI5rbEr4uFs5eQ0mwpQInM9ccOFeMycUSQcFydES7+8/Yw7nMlAq2Jk9R+rf+cKS
         FDOJ3rHNdhaLji6pSXZGREKre2AvQq8bysAVDYLR0D0/S0XD+HYoxXfTlqwdTZqT+37K
         uTjw==
X-Forwarded-Encrypted: i=1; AJvYcCVgy1mU7p8qsIqgHyBXUCQnlE6jKyYcz+zSDEi/g3P6TEjsFCVBhP3y0U4L3es6JpZDj9DH7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9JvdjsRsdkqNVixVqqs5FU1Zsg7LNoGJlJ9N7bYANu0+lydFv
	SxZ8Zk/A92b4EwTYs2jfYoQsjlOcPxlij58YBE9xuzRuupQe2NXg
X-Google-Smtp-Source: AGHT+IGQ8EysGx88b1xm+qR1UoKo/PQr2FXhFG58fEJbseDMvs0OFF/hkxWoZMnNYF7N3WdCAQ4J9g==
X-Received: by 2002:a17:902:b48f:b0:1fc:57b7:995c with SMTP id d9443c01a7336-2076e36cc53mr87095525ad.7.1726249561902;
        Fri, 13 Sep 2024 10:46:01 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2076afdd667sm30300465ad.140.2024.09.13.10.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:46:01 -0700 (PDT)
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
Subject: [PATCH] watchdog: apple: Increase reset delay to 150ms
Date: Sat, 14 Sep 2024 01:45:05 +0800
Message-ID: <20240913174540.45551-1-towinchenmi@gmail.com>
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

base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
-- 
2.46.0

