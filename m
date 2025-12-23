Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE83C314B8E
	for <asahi@lists.linux.dev>; Tue, 23 Dec 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499261; cv=none; b=axlcwsoIIgrFKXjK9PR80q9r5ju+5Ja/nMF7IOiiwVq7mnV27Es44dW0GuNDl10Ps0s4QMxOOpAjHiPx36wVwWnP9/+lBVcU1bP6I+s4OkUzvQrXZELwuML0JBVktgz1EHfcgDq7X/V5lATxVb/oC+NIYGkTyAtL2aIqKKF7NMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499261; c=relaxed/simple;
	bh=tTm+zqXwen50SB01rU9h2NYFDbVkJ0agw2KXYp566Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7qHzCZ/E9n9og+mKloxd1ThXjwzc23X9igSqYZhInAGGiQjJs2AkT/lazIzLsDq0ARKjK7Zmlgcz0gXdZYVfPLXcSDffCglkWmnIVdJNY8ykatHWKwqDo4RPicWCuD7vToxyHbud2ETL2kOmvti31CUs072hcwK/T6fGISiBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQSkp6Ic; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQSkp6Ic"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0ac29fca1so44618665ad.2
        for <asahi@lists.linux.dev>; Tue, 23 Dec 2025 06:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499259; x=1767104059; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93Pf6X13SUCkXiU5R7ykDf2LAtr96ckHMpNWb3vo6Bg=;
        b=KQSkp6Ic+6L4KrI7NWraSdSNr7aC5KgUkipvWH6pfNpKwOlW1G1hsEJLCNQzvKidB6
         U+b/qdlhqPAvaW+tG3g6KXBGwXzfxnsheFbS5QXDBaJgeFDdVGWmQ5bffDleeYLhbFOD
         Aylk3VsULAwa3YyZQGhRbVcA4lIwxv/ZTyMPdg5XIUBbuBMecW5eqbdV22h/T6ceBkkk
         R43XsWz6CgpzZ2ktMYxtTWiHsC+pAt6XmbMu2QnAEmPbeEPZ4par0kBVTIGOEXEmEJip
         +E41y6pbr5EcYa+5BWSOM3T2O2oelWuYvYx273mFNUC0rOo2bO9UgW07OaYeV1klZOnM
         xAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499259; x=1767104059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=93Pf6X13SUCkXiU5R7ykDf2LAtr96ckHMpNWb3vo6Bg=;
        b=i+34WSCWKXAP5CTGNpasL4RafkFI2dIVDFT2mmjf0+wK9FdzZE/qkRc1+z2h1Lssf0
         6POq9+N4yeUNqj+ygHYvmPmZrWE54ZteMtGmTORqzQaAp3FN7idHwVZNjl4oHhggQlJT
         joaa454v1hVS0uNdX0ItBoQDKBO2Dgyml0gDf+wvDCGeZr9BcBn6Obr8oh+DRMTAEt5h
         cu5FkFeqHfpzOIoN9nhwRNS+MMy7pWeujfhJ2mds1WQGihDlQlG9n5hSBeF1/+77Avid
         iy7IIbq5SajaDqw2VxA4KDE5cPRHpi8/5e/lUYsew6RZOo7bS/Ea0bSQ1w+JLYRDnegc
         34pw==
X-Gm-Message-State: AOJu0Yyv/RsU7EoHSer1DS+8Sq2Ti5K9k29tvaYMEnqpDGGAnfGLzV9d
	mrLH0tgD3bqngb9lVfDEGQquotOmoXbxI2OhBTfbuHGdz86XZneX6YkY
X-Gm-Gg: AY/fxX7uANO1NrmqCyD2vBHehiJho2FzE31BQx7VYdG/hY1wKY0XgrYTprqkPcNKnQt
	wKxcuj5I+duQIKdgk2l1uc61ljbFJrfXJjbvISmbv4cIreyUlHOPo+Ndrn0GVGY+vlAEF5kSs+l
	lRGwHGHAStp1SFeAGiT/vLbfFaq3SV8vuyMAk3MxLIvNtwkCCBrGewXNZ5wt6nro5XGRAoGUUzP
	/h30EaDHceqhzmcrCP7wN9+LAz5ZGE52qLr8gh8AyZLLpU0dchh+8w0oi6Ol4L1dDs2smfIXPOh
	gQT+xf7h79IRpdb0yOLjo5VkihX4SYE5GQGwIlL+XsUjvozti1GTfYi3+Se2p6/t80+0HzoJ2BL
	AgNRStcJyQ1MtBU0d+QFTw6B3OAwiEf6NJD4dLFBQMlS7/mMMSEoHEawHrnqS6XkuOUXnCdwMPv
	XVE98PoqsGMTBG
X-Google-Smtp-Source: AGHT+IFxxP4o8t9oxgJnfMD7Rvph5B8jqUM/0u1lCIkIRDfEj0VekGFpThdkzLHanj3mcLJ2UNhZtw==
X-Received: by 2002:a17:903:19cf:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a2f2202f9fmr180596745ad.2.1766499258811;
        Tue, 23 Dec 2025 06:14:18 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 23 Dec 2025 22:13:43 +0800
Subject: [PATCH 2/3] soc: apple: rtkit: Add protocol version 10 support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-rtkit-v10-v1-2-12b4783d6403@gmail.com>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
In-Reply-To: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2685; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=tTm+zqXwen50SB01rU9h2NYFDbVkJ0agw2KXYp566Rw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqO00cm9gv6KSqRnEOw+U36x5MViiExoXK7ex
 +D6c8eT/xeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjtAAKCRABygi3psUI
 JJ+HEACIk6GTMOs0PDPBjmRg01FJtNN9rcdzL8dCpXfy5X/I1/6GLZI+H2rJMZU7lNdCazplt4v
 aGYE6aL+d1xpwKsEFGGR2nKfu2No0WRAsBJeFXcjQRYbMuKTBWwg6Q5MTdMXnZ/HVzXZSd2rURj
 IWQ7KxszSNG23lX8pzC5Dd1RbnY6C2bfaYShPzmOShThArTTR0kmVGgJIMphlQYS+n6rlCgqES/
 fnu6LF7mC23G1HcAKInIuh2mg5dbDu8pvg0N8g9qIvEVIoXbsasBxWA5RUAXt1aYjskiyJTbZEV
 BQ9l6FBzjaY/wmIBV72/d0SGXsRCTUOcy08cP2P0tT+CwGeMUZ0iJ9jqQAazSce15j3lsTvVlcq
 SwN7tGJKJs2GcDds+HWCSD9hCVLhzCkKzWYgoz5+ahmRe9DZqbVpD09IT48CYKAU1/2X25h20Bk
 sr5G9nu76yqXVj4JhrfB7dmYsMIOGsOtfmn+lA1vPI0hQajvTePtqtJIyB1gjoUf9C5DgyImncu
 onMIVq6Ysc25U5Iuot9o3EckNK0mPnen76ldjS1ckH28YC+FkqktlYWmEdDKQB7xnhesI7EqvJL
 YODj3XltpvKFNr3q6RsBKclhQEOXrwYgnjna6BTJej+dluDTQ11ZmiiMMy0JaGPzXBptqldbg25
 88uroAOXqqLp2yg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for protocol version 10 used from iOS 11-13. In
protocol version 10, epmap is always completed within a single
message, and app endpoints start at 0x6 instead of 0x20.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-internal.h |  1 +
 drivers/soc/apple/rtkit.c          | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
index 52ef7a202120eb8a56c149179389741ec0f5e358..5f91dea8b7a178b368783d74f8c5786ea2965fa7 100644
--- a/drivers/soc/apple/rtkit-internal.h
+++ b/drivers/soc/apple/rtkit-internal.h
@@ -19,6 +19,7 @@
 #include <linux/workqueue.h>
 #include "mailbox.h"
 
+#define APPLE_RTKIT_APP_ENDPOINT_START_V10 0x6
 #define APPLE_RTKIT_APP_ENDPOINT_START_V11 0x20
 #define APPLE_RTKIT_MAX_ENDPOINTS 0x100
 
diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 716d6a3e6eefd82d919467e39d68245c5c0d137c..376d1d30fd1e2176357c1daa24c76300c7c70f85 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -71,7 +71,7 @@ enum {
 #define APPLE_RTKIT_OSLOG_SIZE GENMASK_ULL(55, 36)
 #define APPLE_RTKIT_OSLOG_IOVA GENMASK_ULL(35, 0)
 
-#define APPLE_RTKIT_MIN_SUPPORTED_VERSION 11
+#define APPLE_RTKIT_MIN_SUPPORTED_VERSION 10
 #define APPLE_RTKIT_MAX_SUPPORTED_VERSION 12
 
 struct apple_rtkit_rx_work {
@@ -140,7 +140,10 @@ static void apple_rtkit_management_rx_hello(struct apple_rtkit *rtk, u64 msg)
 		 want_ver);
 	rtk->version = want_ver;
 
-	rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V11;
+	if (rtk->version < 11)
+		rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V10;
+	else
+		rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V11;
 
 	reply = FIELD_PREP(APPLE_RTKIT_MGMT_HELLO_MINVER, want_ver);
 	reply |= FIELD_PREP(APPLE_RTKIT_MGMT_HELLO_MAXVER, want_ver);
@@ -171,14 +174,16 @@ static void apple_rtkit_management_rx_epmap(struct apple_rtkit *rtk, u64 msg)
 	}
 
 	reply = FIELD_PREP(APPLE_RTKIT_MGMT_EPMAP_BASE, base);
-	if (msg & APPLE_RTKIT_MGMT_EPMAP_LAST)
-		reply |= APPLE_RTKIT_MGMT_EPMAP_LAST;
-	else
-		reply |= APPLE_RTKIT_MGMT_EPMAP_REPLY_MORE;
+	if (rtk->version > 10) {
+		if (msg & APPLE_RTKIT_MGMT_EPMAP_LAST)
+			reply |= APPLE_RTKIT_MGMT_EPMAP_LAST;
+		else
+			reply |= APPLE_RTKIT_MGMT_EPMAP_REPLY_MORE;
+	}
 
 	apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_EPMAP_REPLY, reply);
 
-	if (!(msg & APPLE_RTKIT_MGMT_EPMAP_LAST))
+	if (rtk->version > 10 && !(msg & APPLE_RTKIT_MGMT_EPMAP_LAST))
 		return;
 
 	for_each_set_bit(ep, rtk->endpoints, rtk->app_ep_start) {

-- 
2.52.0

