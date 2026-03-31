Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538F439478E
	for <asahi@lists.linux.dev>; Tue, 31 Mar 2026 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942094; cv=none; b=Hz+37EZyL5MpSFA2NA6aUPckrwCQoEh8LvPTuHlNQLOsz8hLh67GmYc709EwuH+DIc9jSHSJb4pR/IMb4d57tnfG8pSYgk2e3BXjab6ra9CdXG/1odcs9+62vyzeTrgPkyZHbCBJOMI0E+IHZs0P1AVyuQ9HIbFoGtgsxdobm7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942094; c=relaxed/simple;
	bh=QIKSHEpzy7xp8e41e6qhEj8ttJPAZ5d8hKL8gb5pl7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6+jYkZlule/uwUuyvPM1OT5YstzAzaBYDnO4jSnb8aicg57Ij9nOkZ8FB9khImf2zRaWnRvGyHMFjNjyxgMml0OoTRdFFul4qRSQBOBYH3l86PsabdHbIriWSv5IY4YigUvKeF1dyMoU+/sRJSBE0En5Mc41w4HG6puufVsvZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxV3qV5Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxV3qV5Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so63907695e9.3
        for <asahi@lists.linux.dev>; Tue, 31 Mar 2026 00:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774942092; x=1775546892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8cjngpEHQRn8jA1+OGy7uBShTFIXviPt0CW7b9FjnNg=;
        b=LxV3qV5Y9V1Vh+bUbBghcREcTckbwGa3sCLcszpwz4CNOvsLDSye+MwmrOUS7xAmJ1
         WGgfGE5AEwL9WrfsjkpGieya+Twrj1O1Lv7+q9XE21vA2qXxq2Z7qsvcLyWlStZvof64
         3J4gC8DYG7myTd/a02QAICbq+yRKYc9g7V0t+tz/BP0O/z+6bFafbjm3D3xLlayAtANq
         cEDAIGcZWfaPDIQrGl15h2kID35gv8yyO5JRBCWiGK3IBbUHqzZWfCjdD8b5TDyqrKsR
         5adB2UUossuMW3X8hQw+kTtCXrCxwSaTVfKXWb10OPDBFaoPUTXe1N4CuT1/Vy5bmovj
         4Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774942092; x=1775546892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cjngpEHQRn8jA1+OGy7uBShTFIXviPt0CW7b9FjnNg=;
        b=ROU2bYtE48thHjcFGx7/m6myU4Dq5iejC+qiPpUgAUj8BcxiCuHGFK8OFNHyrNj/Fv
         4A3ViDZ8ri9HSVFuYoQKKl9C2LK9bA8xMb7i36sGCsvtbu8J6xSJZwXiafK4XwEweR/d
         q38HLnQJYA4p+ZGHjNzVBMawfrCktIVp5yUzXwPFyZ6Fqtoh3oBf+1GaMlN0S9I5DTTx
         xdJy3jRHkTjjGq6ag56w7y2y9Uo2g0dhvMRCwmHX264WWeJivEcPrbvFz8JGW6BzEndF
         pKZV4kSyC+ZAif2eQr76UoHup3AsZcNA8FkpZsXBxFXAA6BZ1YHf/LEGCekV0MQXI9un
         4AKA==
X-Gm-Message-State: AOJu0Yz/z2H+1sCeZJJZ0J8WKLkzPzohAXTzU1ZY200Hx5WzroIsnpHz
	osuBseGfFOybmwyvRAVZFqcGzHBXPJBdHkEY32yyI8au2Krh1G7o724R
X-Gm-Gg: ATEYQzz9D6F6d92pXHghaqdr4YqmZWzIi2X41yFSQ6AuAt0Z+SuiJyP8hUnfnA63pyu
	zRXHvgqXe+LXclHJYY2jBdF7uR89YXBoeU7CVQFT5RmhgJKVByN0yhDas6eLcT3VaOM/pcxBCkF
	ZgogAT0zj5baCFDDR9XeuVtkxqG40tzeZsCQnsgOooXFjmlbvD1M0urHxV99wCV6VLzznh6/XOm
	fPCfJvEbLjYw1gsSGagjQkUBiMiK+cYPqs+oP4Dnwtrt2qFhbhPYLz/cnTnYMMwg6S2gDh/f5Dt
	QTlsoPz4tle9V80c73/1hq9ONnU53dLbWDb6DE85CQlZpgBbdV8Nb/rG+gQ2qgU4JuiQq+ZdYHB
	OdZLtFAUheikvW+T3325L9m+hrCkume0XM65onVqRPvp3K5FqK6b1BMuYZoU3P9674XGEMVM56g
	3rrzwvmy4lDzckyVUUdEyHQcO7eolZbg==
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-48727d45881mr266166975e9.4.1774942091245;
        Tue, 31 Mar 2026 00:28:11 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e95c:5e00:f8c1:fa51:743d:7994])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e82e262sm15700275e9.10.2026.03.31.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:28:10 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] soc: apple: cleanup dead code in Kconfig
Date: Tue, 31 Mar 2026 08:28:08 +0100
Message-ID: <20260331072808.37198-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is already an 'if ARCH_APPLE || COMPILE_TEST' condition wrapping
these config options, making the 'depends on' statement for each a
duplicate dependency (dead code).

I propose leaving the outer 'if ARCH_APPLE || COMPILE_TEST...endif' and
removing the individual 'depends on' statement from each option.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/soc/apple/Kconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
index d0ff32182a2b..e04a60722e0b 100644
--- a/drivers/soc/apple/Kconfig
+++ b/drivers/soc/apple/Kconfig
@@ -7,7 +7,7 @@ menu "Apple SoC drivers"
 config APPLE_MAILBOX
 	tristate "Apple SoC mailboxes"
 	depends on PM
-	depends on ARCH_APPLE || (64BIT && COMPILE_TEST)
+	depends on 64BIT
 	help
 	  Apple SoCs have various co-processors required for certain
 	  peripherals to work (NVMe, display controller, etc.). This
@@ -19,7 +19,6 @@ config APPLE_MAILBOX
 config APPLE_RTKIT
 	tristate "Apple RTKit co-processor IPC protocol"
 	depends on APPLE_MAILBOX
-	depends on ARCH_APPLE || COMPILE_TEST
 	help
 	  Apple SoCs such as the M1 come with various co-processors running
 	  their proprietary RTKit operating system. This option enables support
@@ -30,7 +29,6 @@ config APPLE_RTKIT
 
 config APPLE_SART
 	tristate "Apple SART DMA address filter"
-	depends on ARCH_APPLE || COMPILE_TEST
 	help
 	  Apple SART is a simple DMA address filter used on Apple SoCs such
 	  as the M1. It is usually required for the NVMe coprocessor which does
@@ -40,8 +38,7 @@ config APPLE_SART
 
 config APPLE_TUNABLE
 	tristate
-	depends on ARCH_APPLE || COMPILE_TEST
 
 endmenu
 
-endif
+endif # ARCH_APPLE || COMPILE_TEST
-- 
2.51.2

