Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686D241679
	for <asahi@lists.linux.dev>; Thu,  9 Oct 2025 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760035070; cv=none; b=lgk+vF6PT2EmbWbTmVbxBhECPM5Eg6sZMm/z+I5rKjviEssLh7ySoIfgo+t4F/EMdI2HAk+8XXBCsa76saovwhaHeUAefEohTE0sYf/6Tk6yxzI9VJUAQbbuuTD3brLkJKF3ggZUnHlEhjedw8ZyQmV5gCQ3I4+UkrUNqsliOfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760035070; c=relaxed/simple;
	bh=PDh+AfzjhV3uXacrn4srFE3snwuuql5OJ6C9U1sJEIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XiWvwZo7QFsTCyHD/Bg7QPIrB/rtFA5x/rhDSDQO4UqqFD7IMKf7MtJWY5qK60fgtmnwHTyb9u1jlZxaQ+RiU6sAjHlQAg+hbrwn6ivf3+kHMzJW5qhBfwZtfzZ1UUELbXK3EsW6JQ6fzdoYlAyrbfMYmiMhIUF0Pccn6nNnbLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XriMf0nF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XriMf0nF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so1273556b3a.2
        for <asahi@lists.linux.dev>; Thu, 09 Oct 2025 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760035068; x=1760639868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=;
        b=XriMf0nFzUyzsdfixLQUCIwFLRlvkWcfOleDpuaI+lVIik1CJJoOKfwNd8QF2YyDi9
         Ofy4SeT8U3cH2jjOTvH6OjzgFWFVbK35VM1JaRzb/IiNU2w62mJoBvDIBxfsAp/dumcd
         mvezEDQ2LGgKM68SJcnOxWglO9PNhOVOYkCOK76BLTN31NQdbXibx3W5l5bHmjhO2oku
         DxvcDp4tAK3ZlvfTpMCN2+VzFpLzRDyG/PxzJbEWB/Wy3dv5UavIlOZZGfbNijVq5UmJ
         CZYxWMTZq5GDVqturgFyTSEz6SMYb0RA5YBVKMIDwRUlivc88FvfFJTXNqOk9ogMGRxf
         aH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760035068; x=1760639868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLBmvaasF2LSEi3ZR2o1HrWy9QPsvaaeIfrmaMHo1Zw=;
        b=Hs92HQ8KDG/DjRSXluMafSy/GVXryMLHH6T850XSrplcLQw+4A8u63ngE5aUXaJK21
         mAlDbh3R9n5Eh6ajVQPKg4YqROcaKUmZP4YOqTz2Qd3rn2oDV1wex/JgQVZVmoHz6MQW
         O4Gja/SBnYpfLsgrWgCKrvkBKUf7pmMUPBFbBbHeIvkVIDkacFcUVLryOqgzOm7qbYFx
         OYwnTE1xAWnBbRIsM0cg9OJf/yK09S/JWXdxyBm2/wThyixh/7m1mjaVgCKtEdxUCVQp
         JLXjzlSv2rOmWqdEtIQobhjkFgAcg8mjIugai7KMiFOJ6NWvEQbtG1xQ/22eWeRzRKcG
         xEwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ioEr3gWcwo+jPpBdIxmETJSSopXRR3PwZsK9pocU8VP/1vLHZMWsE4Xgz9LPWjGWf5na0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyds1opuB4FjA6lIxmyuUrzAZ5znNg5wMjMOsmKCgY2ucDtGzbU
	M9ocuPI6aTuDWn2M3T7ofh3S/0Ml8lOauX0k6LOy2wPg3eDKLreYIus=
X-Gm-Gg: ASbGnctDa6Uy7O1qPC2uRU78NwPS8hDpmuRnQ/M2iwPncb8B3kpJbBOTAe3uFzJLgz3
	Qlfo6N0r3GUp50b+3iAszFRlzJkzZFSOcIsVcZB0MO/i+hqmYHtr5RSGV1B2ic1UU7F2vNgbch3
	Qr4qzeOhRecnRuzVQWCmxNLugMqQ61tOL8vdqO3PNz8umfiGyAXZbOPC/GpPbqlPRczDtaWquQZ
	+wkBf3ELpz3XPnDfxb5gRbaykS/OfOeFvE/UyHI1lFhaKarwDrZ0U00J5pZLOIxHY6N3e/RaiIk
	B8DKRpvcgbEZ6zdW/6pPUrB51ZDhPF0bAckHvWXAYcLbivZ4ZkrfJ14KdPzAgnNSBLeiDuJl6XD
	aJTaB5oLvDrF8XQOvpYlFvsgWhpeX6xXNa6Dfk6Z7WI3/Zm0ZE33moFhNrbd0N6KWma9ZB6hByM
	vwfZWfEhcTpw==
X-Google-Smtp-Source: AGHT+IHufRCD1gspY8glmM8lax7BUG8ynHHaY9o6yM1T8DIIM/vktiuj0NUkBXjxADybbCWs5+RgFg==
X-Received: by 2002:a05:6a00:1894:b0:776:130f:e1a1 with SMTP id d2e1a72fcca58-79385709579mr9273576b3a.5.1760035067817;
        Thu, 09 Oct 2025 11:37:47 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.78.199.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0c3a38sm411630b3a.41.2025.10.09.11.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:37:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: atharvatiwarilinuxdev@gmail.com,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sebastian Reichel <sre@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] macsmc: check for missing SMC to avoid crash
Date: Fri, 10 Oct 2025 00:07:32 +0530
Message-ID: <20251009183735.1288-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users might manually install these drivers
without the core SMC device, causing
a NULL deref. Add a guard and return -ENODEV.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpio/gpio-macsmc.c          | 3 +++
 drivers/power/reset/macsmc-reboot.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
index 30ef258e7655..7048b45953bb 100644
--- a/drivers/gpio/gpio-macsmc.c
+++ b/drivers/gpio/gpio-macsmc.c
@@ -238,6 +238,9 @@ static int macsmc_gpio_probe(struct platform_device *pdev)
 	smc_key key;
 	int ret;
 
+	if (!smc)
+		return -ENODEV;
+
 	smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
 	if (!smcgp)
 		return -ENOMEM;
diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index e9702acdd366..739f94e4ed7e 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -205,6 +205,9 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 	struct macsmc_reboot *reboot;
 	int ret, i;
 
+	if (!smc)
+		return -ENODEV;
+
 	reboot = devm_kzalloc(&pdev->dev, sizeof(*reboot), GFP_KERNEL);
 	if (!reboot)
 		return -ENOMEM;
-- 
2.43.0

