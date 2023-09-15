Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2426AD7
	for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 09:21:20 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2bfb12b24e5so30071551fa.0
        for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769678; x=1695374478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIvhidofVsmyJzzhpGisC+BAHcAy8W3Roljgbbr6x7o=;
        b=pXXPPu+/D8jCFmFDqo5HgHOtiB9gowe5sH5ufZcPy9nTlGchaeKKKimg3T8h4v1eOb
         vYj9oCBtO3ZPOCwCZkaNZ7L0LtszOQd1aFMWcrW6jzlkb9tk/GEnE1nrttsswqk187kA
         R7nTQ85H9BlU/PvzR7Nqa+ZnranQ4k5Nauim62rY5cIPR2IxlpRqFx8j+m5+d659WU3K
         HqGBgKqpxdMCyMwvw/SIxGvEr7NURTBRllQL2j8LUt2ovmxj4KVBUjR9gvKU/R1PkCzr
         29UT0gXtqhvC+KjFmWTm5yxmBGOr6ww3txVEcAm3I1p//ZA0gsDVCzUvRpSzv+SlJOxV
         zg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769678; x=1695374478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIvhidofVsmyJzzhpGisC+BAHcAy8W3Roljgbbr6x7o=;
        b=opkZAYAVtQAQ7W2vI27SPXaz80AF1JE6WEEUMq4WEIoDNyNtGrfV9v61fVVArRwaqO
         0x/7JpHw5O9eTGncIinLuYkm+7apESQNPXszTM7SSSOwOk3GpN5sjfzePutSf87XyTub
         NyXKLZQrf23lQd6fsg6uztZSzNzMqPwWwezU0BUFnbLOy/YrN0UIkqT69nXDxviVIrZ8
         b6lNeth9SvZd3KXUdvlD6isrCFZ6VRSJZCd/9cifdf+i/UDtgAwqMsFYV14Dj9gucOvb
         FMFKzhnCfUbat3i7I3eIJ+iF8I6kLbIBDJ5786g/w/cjyZXAm+z6LgC7V4TXHci/QTmD
         fAOw==
X-Gm-Message-State: AOJu0YxybykWlxUkrBPIYcIZcRj5Q4OHPvLmXeTz2QTnD8LLr66R2pKx
	R8vsj2Jqyptw+ZR66cSGMhPPXA==
X-Google-Smtp-Source: AGHT+IHAQ1iI+KB4DwlX9IrPYGMVQNjUB4liAC9r/LpWZWzZwOnLogKuDYvJOCgw36npmE6DOTZBbQ==
X-Received: by 2002:a2e:7010:0:b0:2bc:c750:d9be with SMTP id l16-20020a2e7010000000b002bcc750d9bemr1141692ljc.29.1694769678814;
        Fri, 15 Sep 2023 02:21:18 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e7408000000b002b9ec22d9fasm639376ljc.29.2023.09.15.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:21:18 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev
Subject: [PATCH v2 04/17] pmdomain: apple: Move Kconfig option to the pmdomain subsystem
Date: Fri, 15 Sep 2023 11:19:50 +0200
Message-Id: <20230915092003.658361-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915092003.658361-1-ulf.hansson@linaro.org>
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig option belongs closer to the corresponding implementation,
hence let's move it from the soc subsystem to the pmdomain subsystem.

Cc: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: <asahi@lists.linux.dev>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig       |  1 +
 drivers/pmdomain/apple/Kconfig | 18 ++++++++++++++++++
 drivers/soc/apple/Kconfig      | 13 -------------
 3 files changed, 19 insertions(+), 13 deletions(-)
 create mode 100644 drivers/pmdomain/apple/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 03c8991ad0fd..482d9e970e14 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -3,5 +3,6 @@ menu "PM Domains"
 
 source "drivers/pmdomain/actions/Kconfig"
 source "drivers/pmdomain/amlogic/Kconfig"
+source "drivers/pmdomain/apple/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
new file mode 100644
index 000000000000..12237cbcfaa9
--- /dev/null
+++ b/drivers/pmdomain/apple/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_APPLE || COMPILE_TEST
+
+config APPLE_PMGR_PWRSTATE
+	bool "Apple SoC PMGR power state control"
+	depends on PM
+	select REGMAP
+	select MFD_SYSCON
+	select PM_GENERIC_DOMAINS
+	select RESET_CONTROLLER
+	default ARCH_APPLE
+	help
+	  The PMGR block in Apple SoCs provides high-level power state
+	  controls for SoC devices. This driver manages them through the
+	  generic power domain framework, and also provides reset support.
+
+endif
diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index a1596fefacff..eff486a77337 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -4,19 +4,6 @@ if ARCH_APPLE || COMPILE_TEST
 
 menu "Apple SoC drivers"
 
-config APPLE_PMGR_PWRSTATE
-	bool "Apple SoC PMGR power state control"
-	depends on PM
-	select REGMAP
-	select MFD_SYSCON
-	select PM_GENERIC_DOMAINS
-	select RESET_CONTROLLER
-	default ARCH_APPLE
-	help
-	  The PMGR block in Apple SoCs provides high-level power state
-	  controls for SoC devices. This driver manages them through the
-	  generic power domain framework, and also provides reset support.
-
 config APPLE_RTKIT
 	tristate "Apple RTKit co-processor IPC protocol"
 	depends on MAILBOX
-- 
2.34.1

