Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B043AAF46
	for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560021; cv=none; b=KXfKfzEj/gDcJ7HZRIgcL+8L6a68EX7S0/H+3WpywFBJwlRcEiH+QC9/XY3DRbYE9lTEypBAUSerzIbz84woDUHEnrG+UTTIsJ543tGgc4FMQdtW/y6hWJ3vtaOOtwcGxoLG2EUJ84/7lCANyxU/kIPcQhkuCaWa4IJ6BgWov70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560021; c=relaxed/simple;
	bh=G5npMlrFjOUjpVZGNazAfzz0eB67gPJfe4NVy6Mo/0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp3gRNVsCmwnA4xGoAXzExXQXHGfGLOMBgYygvepm5n7330g4+L9+iAhkXMnvWhilj+w1yrCsCl5y2V9JrQxdBz3J6FRVXqApgsZTC0PAl6w0ujs592MpsOeFR9v5ov0xM0J2v6Y9jb/k0fic3TtvK8f9pCazyhDVhr4cGv9kUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDMaAf6H; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDMaAf6H"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2705981b3a.1
        for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560018; x=1788164818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPN5BIwUDTeW7sBnIZ7PXhoHkYcvuxUpMJtfpBrosOg=;
        b=QDMaAf6HQGm6Q5lBzh45cw0T73+xkM5G5sraRfRh+RVbliRNtlaBqwm8+mHf07bSdX
         6U2TWL/vwxtmhLieY+Y2sIg0Be5LHCzatKjfDEV2jnr2Nux0IYkDz3cPSmmaCcplaRKT
         yYqVbA8Pj6aaYTivIOBbgcd27JJD560NFzkj7WxkRpq6ateXOGsH4xUr+DwYgVmZs962
         rhdF7EUcktOoBUu41A4Fgyksy1Pi0GbA7QpSCfOq5JfeVPmtoBsiwi7sbdpLGOGRZIr+
         wBnOi+VMCkS0VbUcs+5+wO2yh6TrEucWD/Oc+NzQdLqiIUcgePY9NAIXbfOx9ijQSQKX
         1MlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560018; x=1788164818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPN5BIwUDTeW7sBnIZ7PXhoHkYcvuxUpMJtfpBrosOg=;
        b=VwivYqvrYkGSAz1+YzbNc7za2pW+4BXLd5LXB16A94gusiH8ECtO8JbpNtbW2vVScG
         EsRvoP0JE1eqYFBd1Y9uLANJEqT3x1S9mkxDiHzfA121PH4ARULavWjHAyBiK1hGhsnM
         bkBpWjb7TCjwuD9CKITPx1t3VHgFVlRikiRH44xAiOu9YwsUHHiDxQMzrnSwO6UWUClJ
         p7L3ok9QIushr1Y98Za/O9zSsYFjjUl4UW2L0YGVXLNVPyNyL9uENwn9PfIFeSwaP6us
         Z33b+llJpGgEDK56cjax7clHiguLlIFNamq0NPLa87RMySMaW1CoccLPbrnaETQKD/+A
         r1dw==
X-Forwarded-Encrypted: i=1; AHgh+RodbZ+OfuN4QpFlacj+x2rEAg1aVlR2fievEhLKLb9lbR1tZAsHSbwdSt9eMrHtG/4eaXrk2w==@lists.linux.dev
X-Gm-Message-State: AFuF++loQFA4T2l3mKeT7xymCvANyvFubEkBQUC1uCMeM8Yg57euBLFD
	C3fdfLGs6nY1iotbgD+dfzinRDd7EFIk69iaA6o7ygref4Q7HYlnsnmd
X-Gm-Gg: AR+sD10CCcScwriLBoL2b6kI+pSImFoOrxtiWXhShzyq6sNr2YaJA9asrhD1DkNSoMH
	6/8Ir8J1dexOXEOk4Uwy4o97HIoG91Zt3IyhjQFRzsT5Qjl4PD7xoujJvMnXTUSaOIlRzwTbZEx
	PhyrfkFrre7gYO8q6eeOGNIhwUT1B1Ab4aFctQAJoTeFyES9XoIh5HhDeaweP9HXNJ5QpveJLnZ
	T81lwXm6VrsQ0OU4h4jXF8e26eY3heb3fjkQNQUPgbyL7cA8FcYFe5R2BfLV6j1IcXEVGreOsVh
	NoS2V53eItLEzIH35rFfvLaAbjx7iEZyT06ebrlOmL6Rvk6PE5dD05zEfAjCPhfdd4DSXPVb8cr
	Qlwc9AyveNR/jikuTVqvxcAYGzUzo43Xaq/t7TWCMrLu9xphw22Jfl6Vax6I7QNubHmPmWNTwOt
	idiapCkldJbmSxXD4qNlwRwFwUC82jvylUIGdWT/hh6o9B5lIKVKA5ryFOl9YG1wDwPb2mjWwkJ
	KVnqFL6VjfeegwYTg+jqc5v4JRxU9vjcqAKtFWfQDKEtIAXw3Tv3j3qY26gaXhtdYEGon0omHvQ
	/VpdqBEumFgdcajjsAy0+O/0nsa7sKk35Sc3KsiLht/ubshwJmiuxKFyNZUSmK6xOpNMzVb8bgI
	AHhk/yc/kL/sfxKl54b3JAA8rEhPK5qB3pGZ8osDmqx8GMHw=
X-Received: by 2002:a05:6a20:d70f:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3cd2fea6574mr50727838637.5.1787560018294;
        Mon, 24 Aug 2026 01:26:58 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:26:57 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] soc: apple: rtkit: bound syslog copies to the shared buffer
Date: Mon, 24 Aug 2026 14:11:38 +0545
Message-ID: <5575a09569af52fa7d8d66a217ca846824ef2745.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apple_rtkit_syslog_rx_log() copies a log entry out of the
coprocessor shared-memory ring using an index and layout chosen by the
coprocessor. These values are not checked against syslog_buffer.size,
so buggy firmware can make memcpy_fromio() or memcpy() read past the
DMA mapping.

SYSLOG_INIT also accepts a zero message size. kzalloc(0) returns
ZERO_SIZE_PTR, which is non-NULL, and the later strnlen() size wraps
from zero to SIZE_MAX.

Reject zero-sized messages and make apple_rtkit_memcpy() refuse copies
that do not fit in the shared buffer. Rate limit the bounds warning so
the coprocessor cannot flood the kernel log.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 1886f7eba77d..2e62f9b3c948 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -348,14 +348,23 @@ static void apple_rtkit_free_buffer(struct apple_rtkit *rtk,
 	bfr->is_mapped = false;
 }
 
-static void apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
-			       struct apple_rtkit_shmem *bfr, size_t offset,
-			       size_t len)
-{
+static int apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
+			      struct apple_rtkit_shmem *bfr, size_t offset,
+			      size_t len)
+{
+	if (offset > bfr->size || len > bfr->size - offset) {
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: shared-memory copy out of bounds (off 0x%zx len 0x%zx size 0x%zx)\n",
+				     offset, len, bfr->size);
+		return -EINVAL;
+	}
+
 	if (bfr->iomem)
 		memcpy_fromio(dst, bfr->iomem + offset, len);
 	else
 		memcpy(dst, bfr->buffer + offset, len);
+
+	return 0;
 }
 
 static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
@@ -384,9 +393,10 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
 	 */
 	bfr = kzalloc(rtk->crashlog_buffer.size, GFP_KERNEL);
 	if (bfr) {
-		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
-				   rtk->crashlog_buffer.size);
-		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
+		if (apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
+				       rtk->crashlog_buffer.size) == 0)
+			apple_rtkit_crashlog_dump(rtk, bfr,
+						  rtk->crashlog_buffer.size);
 	} else {
 		dev_err(rtk->dev,
 			"RTKit: Couldn't allocate crashlog shadow buffer\n");
@@ -428,6 +438,11 @@ static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 	rtk->syslog_n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
 	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
+	if (rtk->syslog_msg_size == 0) {
+		dev_warn(rtk->dev, "RTKit: syslog msg_size is zero\n");
+		return;
+	}
+
 	rtk->syslog_msg_buffer = kzalloc(rtk->syslog_msg_size, GFP_KERNEL);
 
 	dev_dbg(rtk->dev,
@@ -444,10 +459,11 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 {
 	u8 idx = msg & 0xff;
 	char log_context[24];
-	size_t entry_size = 0x20 + rtk->syslog_msg_size;
+	size_t entry_size;
+	size_t offset;
 	int msglen;
 
-	if (!rtk->syslog_msg_buffer) {
+	if (!rtk->syslog_msg_buffer || rtk->syslog_msg_size == 0) {
 		dev_warn(
 			rtk->dev,
 			"RTKit: received syslog message but no syslog_msg_buffer\n");
@@ -471,11 +487,16 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 		goto done;
 	}
 
-	apple_rtkit_memcpy(rtk, log_context, &rtk->syslog_buffer,
-			   idx * entry_size + 8, sizeof(log_context));
-	apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer, &rtk->syslog_buffer,
-			   idx * entry_size + 8 + sizeof(log_context),
-			   rtk->syslog_msg_size);
+	entry_size = 0x20 + rtk->syslog_msg_size;
+	offset = (size_t)idx * entry_size + 8;
+	if (apple_rtkit_memcpy(rtk, log_context, &rtk->syslog_buffer, offset,
+			       sizeof(log_context)) < 0)
+		goto done;
+	if (apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer,
+			       &rtk->syslog_buffer,
+			       offset + sizeof(log_context),
+			       rtk->syslog_msg_size) < 0)
+		goto done;
 
 	log_context[sizeof(log_context) - 1] = 0;
 
-- 
2.51.2

