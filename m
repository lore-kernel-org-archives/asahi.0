Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042515187FD
	for <asahi@lists.linux.dev>; Fri, 18 Sep 2026 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750064; cv=none; b=MnjIuF4Hcgh2YMDCcXWqmksgrUnJDa7IN0zYZXNouljTShcPzgQVQABmtT/RJNMzEZ/tT53+dnDs/5GPh1mZP9i6+laWkUU2bBtEN38zj6Gbvd/mzwuCjMUpePQlCX911TyUdnplYFz9CG1B2VLTyUDkd9qIDutUtyNxqrv5clY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750064; c=relaxed/simple;
	bh=T5ePlaPWKKBlTLSmPKKBLXleGmVB5tFWU+61peT575U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcuPEpTCJMvvNXI0380HP8SvSY+oYDm58I/yjTgI1I9IW4PvZJNmt40BPXIW7bweCDHKMHOJcXoBxnxcD2xswqbJVFuP4Qs3KprWbV2GXaySBSGBgXo46qobXaii7wtIK8ZfcU4JvIcB0N7sE9XiX+Dcr2PUTej56QpNfJqvSzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiegDJY5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiegDJY5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso1960445b3a.1
        for <asahi@lists.linux.dev>; Fri, 18 Sep 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750059; x=1790354859; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=;
        b=OiegDJY5GNGm2agySMXq/y7DMX+bwdZCKnlQMbggPyJKFXL//tz+n9Wyb92Gj2bZgs
         Nli3I17X4emMn3YOujQ/013KULVLsIzabb09STnO7BxUSovWkVvkrkHK6fT43CtJVm+S
         cXP6f0xw+gq9vkS3/+twdBL1hy8aK3vr89RCGuKYBK3BNVAkv3LS3yAA7+wZ5GYMoP5F
         0GL1HM/KLiDPFoGehjKoGdtvHhppzgAExBecdoGaNGktIyvBvI6YrVk73YQG/WO/QwY4
         BZRLzUb4Z0A3mARsf2SJsXCq0iacV/7BJ128aEUNvc0O9nfwG4O7wyg9yJgVWl7rpFHa
         wkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750059; x=1790354859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXzJLAY9j5odxKClr8BsLGTEU4HkCb/vEygnN5tSKcI=;
        b=rI27EPtvgzZVY8Yf6Wj9sqweBhHl3vW869zLFsR54MAXazzxqgtOnfQN8b3+iLK4Kb
         maruzxX2HgrjkC8w7vbA9AKD2xIDro+LmeXuGq/2/mmOT0LdsKaWpDym6IQgSTdgn3Nd
         m49g1UPyq+Ou2+X0YT0SEpCQuDryHCG/1jw6f0MledmDEi0pVobhjua+NPo8Io0UzSuW
         Afy+L/Ejm1fXIE/S3u2jgf1l9GJek6so7KiDOQsNMuFkcRQSsOJ+rcKIc8d8DVKYo9zN
         +l+CqyutlbfUEZzcr7Wc0lKtSsX+wRu+zfl72gGNovANy0huB2AW0Dcs8OFb4Wx4UhPn
         6gdQ==
X-Gm-Message-State: AFuF++nbQQZFKWaqPKArks26CZeK+ikQXENlrPtJ+Vts/8aii9Uvguvm
	1ZyW0vuA5Cp6h2hgVLZLJMpoe2PD1QByLuzhCtKTT33R8GSG51qu/xDG
X-Gm-Gg: AYBFou1ch3Kb6XE6keclkgXuVbLHEzpIYeVAT43nKtSv4FFvMd8r6P41Hh30j3K0v/U
	nIwoDAsvsDKpU2PWf+fPY4lukpri3ZHx09G3Tdf9fXaqpn41ypUJ0m0bVEkyNhs5MaLTtesPv9H
	CpzdyLbt9+6Ax8/IG32xRygHVCvPPfmarTzbrOsdZwJhCcCKMUGnqqXXdQXtESzRxYT2LBGbF8O
	o1QbsAe7PuQee2QcP6o1NPwRGVQh9b7fDokS211pifiwpoqXg+QBUEBidbVRo6KNmcLwNT8mhD1
	gx7n+xNHxYT1nFwu3QJiJsDHenUGbvoysRZDl4FOU58xr2awFaaxwySl9MqbLZIpI1NCgsGUJUt
	gu7Az1sJfRhoacYnvEX8zBeYmMUJPFHqsKOTMLxFGaFQMKKUJA6i4BDwEVp/XwOUMBwkaaBlEWA
	bZKUDoXxxA9DE/ZAvnLw+MdGXzJ0UlbYnKTOs43Rd77RgxMfgoaQCExL+H3hIwvPtYJleIvFDu
X-Received: by 2002:a05:6a00:4099:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-87341085fd4mr10175647b3a.1.1789750059163;
        Fri, 18 Sep 2026 09:47:39 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:37 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 19 Sep 2026 00:47:03 +0800
Subject: [PATCH 1/2] soc: apple: rtkit-crashlog: rename 'Crg8' section from
 regs to aarch64
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-rtkit-armv7-crashlog-v1-1-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4600; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T5ePlaPWKKBlTLSmPKKBLXleGmVB5tFWU+61peT575U=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWskADcmCOtokPCqj1yGNH6q8CXYa2yckF60P
 9FNoYp3liiJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rJAAKCRABygi3psUI
 JE/OD/9Fop6CLfJ+FGs1WPvP0YASFDiEJBUsmpWiWlsK1im1oxn7BYgcc2POZWxDKIp79qhz6YL
 U/CXIDQrU7agwe/cHOJRGXCBW5VgfUkxkgIfIX3DTg5UPPZ1c5uXTYE8l4HRm+/WRXLsRVS6f/Y
 27Oog1lG/01iZtYCsrtTV3AA82LxWldSykRyuVvPdqTCZdZjR9SYS2mWU7lsAvyU1KRjFab/vaB
 qthXOQSIihlpyVv3c5b8pLOnx0boPZ1zR36FgEpYJuS5DfxuqLBFTEaCalWpjdZo+m+Y38lHM3y
 ol08sA27qnwsK3EjduTpllJjDb/YzodiMlBUsAAj2U7UYoUPff0v2G8N+BInwTs1jkTuhZtFaZi
 Fef9+cjD0m0hT+IjC4mE4zpqRZl+1aT6RS6xXZo3HMbwgdVPwIQmrcBnFpozNvwYxP+fiaPKpiF
 Bs06tSqQ/PETttfAjFgKt59qxkx2K6TlK1O0EgLibTytDnwmY+YzrPUhBRkNlr0d0iGeO5oSKlc
 eTjNHjH5B9M3lRJdE2HVwIKc6zM1mZJqvCYzl7aQDkmsIGn0phgpHiQgb2PW+7JojlzfZGxy2NV
 g6SAHeu8NWlULXW6X36e2WWTGZtBxCMHXGpHDYA8b69OzeNQlpCMPIK7NJ81RkmsgFklgUIQtiQ
 0+TOUrIY/+70KIg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

This section contains AArch64 CPU state of the IOP when the exception
occurred, including register information. Rename this section to be clear
about the CPU architecture as support for crashlog section with AArch32
CPU state will be added.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-crashlog.c | 43 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 8319e365110b..6a8273e81e61 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -13,7 +13,7 @@
 #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
 #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
 #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
-#define APPLE_RTKIT_CRASHLOG_REGS FOURCC('C', 'r', 'g', '8')
+#define APPLE_RTKIT_CRASHLOG_AARCH64 FOURCC('C', 'r', 'g', '8')
 
 /* For COMPILE_TEST on non-ARM64 architectures */
 #ifndef PSR_MODE_EL0t
@@ -42,7 +42,7 @@ struct apple_rtkit_crashlog_mbox_entry {
 };
 static_assert(sizeof(struct apple_rtkit_crashlog_mbox_entry) == 0x18);
 
-struct apple_rtkit_crashlog_regs {
+struct apple_rtkit_crashlog_aarch64 {
 	u32 unk_0;
 	u32 unk_4;
 	u64 regs[31];
@@ -58,7 +58,7 @@ struct apple_rtkit_crashlog_regs {
 	u64 esr;
 	u64 unk_Z;
 } __packed;
-static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
+static_assert(sizeof(struct apple_rtkit_crashlog_aarch64) == 0x350);
 
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 					  size_t size)
@@ -123,21 +123,22 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 	}
 }
 
-static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
-					   size_t size)
+static void apple_rtkit_crashlog_dump_aarch64(struct apple_rtkit *rtk, u8 *bfr,
+					      size_t size)
 {
-	struct apple_rtkit_crashlog_regs *regs;
+	struct apple_rtkit_crashlog_aarch64 *state;
 	const char *el;
 	int i;
 
-	if (size < sizeof(*regs)) {
-		dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%zx", size);
+	if (size < sizeof(*state)) {
+		dev_warn(rtk->dev, "RTKit: AArch64 section too small: 0x%zx",
+			 size);
 		return;
 	}
 
-	regs = (struct apple_rtkit_crashlog_regs *)bfr;
+	state = (struct apple_rtkit_crashlog_aarch64 *)bfr;
 
-	switch (regs->psr & PSR_MODE_MASK) {
+	switch (state->psr & PSR_MODE_MASK) {
 	case PSR_MODE_EL0t:
 		el = "EL0t";
 		break;
@@ -160,11 +161,11 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 
 	dev_warn(rtk->dev, "RTKit: Exception dump:");
 	dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
-	dev_warn(rtk->dev, "  PSR    = 0x%llx", regs->psr);
-	dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs->pc);
-	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs->esr);
-	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs->far);
-	dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs->sp);
+	dev_warn(rtk->dev, "  PSR    = 0x%llx", state->psr);
+	dev_warn(rtk->dev, "  PC     = 0x%llx\n", state->pc);
+	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", state->esr);
+	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", state->far);
+	dev_warn(rtk->dev, "  SP     = 0x%llx\n", state->sp);
 	dev_warn(rtk->dev, "\n");
 
 	for (i = 0; i < 31; i += 4) {
@@ -172,12 +173,12 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
 					 i, i + 3,
-					 regs->regs[i], regs->regs[i + 1],
-					 regs->regs[i + 2], regs->regs[i + 3]);
+					 state->regs[i], state->regs[i + 1],
+					 state->regs[i + 2], state->regs[i + 3]);
 		else
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
-					 regs->regs[i], regs->regs[i + 1], regs->regs[i + 2]);
+					 state->regs[i], state->regs[i + 1], state->regs[i + 2]);
 	}
 
 	dev_warn(rtk->dev, "\n");
@@ -229,9 +230,9 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 			apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
 						       section_size);
 			break;
-		case APPLE_RTKIT_CRASHLOG_REGS:
-			apple_rtkit_crashlog_dump_regs(rtk, bfr + offset + 16,
-						       section_size);
+		case APPLE_RTKIT_CRASHLOG_AARCH64:
+			apple_rtkit_crashlog_dump_aarch64(rtk, bfr + offset + 16,
+							  section_size);
 			break;
 		default:
 			dev_warn(rtk->dev,

-- 
2.55.0

