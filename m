Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB8208A9
	for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 11:17:17 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1455347e87.1
        for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 04:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694690236; x=1695295036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i01ZwhFKlrFFwp2TeTntBDNdPU8fSl314WlanHljcec=;
        b=E8cdl8pYeSIQDKmx9MiRhxhv6exUKKt4S850J0gnVnc9KZOX7n+PMF4yokmVW4tf/M
         RmEjT3MwTLWgxrQlIm8P8untaD1LseEz80vbdbQxRT4QJSBGG2gTHrpa4Vcr49B8dAF8
         ZfxYo5LwZTXInQx3ctz5DLWWhO0pj70lknHzDqFzux2QZ4yJ+mNeYOmNFNUnLw7JouOw
         EmzSccfnY/r5vQYin/cRwqrICAcXDnCDD14WJ7SqqpVMPG41RtGkQ9V2BlSqw+xoqLLA
         PQwrFnsIev/9R2SwR7/2wP0/YX3vxO1UaBNlD9P7DvLEoM8eefiZtL4My3wMm9r4Nhj3
         LutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694690236; x=1695295036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i01ZwhFKlrFFwp2TeTntBDNdPU8fSl314WlanHljcec=;
        b=bqvec1et/Nq50GBDOdDUjnBDtq+5UOhcwOlUS0YZuHhDP/1Da124C3qOmhHwv3IWNF
         SmfsxtRa7is7Y2DKDHEw+wOx7E+imxCK3iAVHWQkqdyyxPWUjzG3FfSVnjzWfhRJrVk+
         shn9aCeaBVmQzZS7rcjMYUoiiHefBMp8yfF/fESG+yoH6VLO9HljQX6Oth26Gsb56ML3
         DMJJ0gNQu0x7w2DInrH2Obj9qPgF4I7OCYFfDtTjkQ8Isc9+LHpGc0tipTp4u7bBvr//
         12wWoHgqxXh/u9dwT6+DgygTxrMttUvrchmTbSvuQAPgFewDdo8SapgW6w1BjcHTtXPp
         g2ZQ==
X-Gm-Message-State: AOJu0Yymbey6GHa8UeoYZHmueBkS1bCbQ9XaKypGXhj5jLOUVjFHbKLz
	epWIeR/2PpWFcgtg4xmmgsSyQA==
X-Google-Smtp-Source: AGHT+IGDjoyTHtzNmJttlaj3jNDjN0HhiwRNEyZ8rwnvs9ZEjBQwpDBAiyBTONV+SlXcQ/a1Fasksw==
X-Received: by 2002:a05:6512:312c:b0:4fe:7dcc:3dc1 with SMTP id p12-20020a056512312c00b004fe7dcc3dc1mr4103999lfd.44.1694690236028;
        Thu, 14 Sep 2023 04:17:16 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id a28-20020ac2521c000000b005008cd93961sm233024lfl.192.2023.09.14.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:17:15 -0700 (PDT)
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
Subject: [PATCH 04/17] pmdomain: apple: Move Kconfig option to the pmdomain subsystem
Date: Thu, 14 Sep 2023 13:17:12 +0200
Message-Id: <20230914111712.586522-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
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
index 07d2f8165abe..55a9ca191849 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -3,5 +3,6 @@ menu "Power Domains Support"
 
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

