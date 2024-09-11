Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414653E15
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 05:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031304; cv=none; b=e8udh15JBxYP4lU/uEL7ZBkumYmUBAkWoeoOcubzbJZHFBcK82ZnoICLU1VmzZStELRa2HHBsEZnRTmbwMX+3Ay3OiyIH+3jdxx3yYRxIrpzNXpI2LMMkbG8xowgt10CwoetPCHNKyLrJSeGDx0e0Rb0fXh1Lea4oMkrH1zxq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031304; c=relaxed/simple;
	bh=yAN6mfqDrB8wTcQSVZ6SkaptmYA6iy10wKQKp7nojho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCxCaShkrDon8+oFACMirlfzzFBS0ZeAWr78hzrrr/F7fNKsiX9UeidcrDbvJzuH9AwAL5ZWQedRnVyMMh6S0L6awnAgQoZEVWD3aHHl2NHzxt1PANFUyTzZ3elkhlGnW6Oo+Hrx4SaTeGQVc3o4XScaoHsiGrk9wFhyoody+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOQlQamQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOQlQamQ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7d82b0ebd51so1275744a12.2
        for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 22:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726031302; x=1726636102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUu8ETTOYOnQU9rQCJ5bMvfZihZxeyBk0Nys8vKoQ38=;
        b=eOQlQamQY51AK3QN2xWM0pHk2ie8TevBwkmgay7JKEttAtEwwIqEqZCby+Uf0ZNuhG
         gYBLvqzyFzOyQm1myv9DvuOQ6pWup/A+J9Z0ITr2fLa8ubJN1mAKtuDlhWgzdrU+2lMr
         8+V3L+PBvl40YFaMCxlhCE3dUxKJ6mWRTBEyw/2eyx/41bMZqJ6Z4OWaVlRky/Yz7pWH
         ADXHR260+kxm9NEtCVGV3lgW12Xun5xxGq25Yv0B3SIztMmF9GTs/zZf+gr3z09p/N3Y
         ixcrGHziLhC+QF0ta6uZaN3487CXgRd3VT1Y82cqMz9DYxWJ4wvDB5hbFkPzO10P0YVj
         jikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726031302; x=1726636102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUu8ETTOYOnQU9rQCJ5bMvfZihZxeyBk0Nys8vKoQ38=;
        b=KDo0UG/VnCm0NcB41r++tyk+aRnbcQ3PshHKaczAhQ1BRz0bJQolU7PFCkxV3dcpYP
         JHAR7MRyXj7TgDxEm8Pk9sJ9lHqbf3RrggWjEGbeDvDZIqOyJqRjwqf1JcFOPaqOTYfL
         uOxIfJxQDXzwD3PybdvhsMfi7d+/Gzjk0+11WiyyeaopaODlmfNWKgwZ+aKw/SolyoIt
         cppumM08gcdOKIedD6sq8pREjw33gyk3ITz7KyC29BwNqxVUh74CYhi1VSR/NW7b2C8S
         Ms3mhPtj5BNwihXaEivlh+oazrdddiBr1GzP5YrCWZRzS5ExbqSfjJmUjAKQQKvEQp6E
         8oAw==
X-Gm-Message-State: AOJu0YxAeTZRLMKMnE+ANCFEL8oLjQoOLaU8njCQXBstmdw+2ldSNfDm
	Qgeuwzqbo3aulPPlgcaUXwtsUQ/fRKKzS+40Pbv9BTg5/K4eq03m
X-Google-Smtp-Source: AGHT+IGbpbWzUpVCDPwwRhWDczI/mlb80vmo2kZf89H+XcRDjaXGPqgXIeKnJo9Lb0iVj7TrdDfXxQ==
X-Received: by 2002:a05:6a20:d808:b0:1cf:3677:1c63 with SMTP id adf61e73a8af0-1cf5e114dd1mr4966993637.25.1726031301955;
        Tue, 10 Sep 2024 22:08:21 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-719090d11e6sm2156984b3a.205.2024.09.10.22.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 22:08:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Nick Chan <towinchenmi@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v5 1/3] tty: serial: samsung: Use bit manipulation macros for APPLE_S5L_*
Date: Wed, 11 Sep 2024 13:02:11 +0800
Message-ID: <20240911050741.14477-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911050741.14477-1-towinchenmi@gmail.com>
References: <20240911050741.14477-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New entries using BIT() will be added soon, so change the existing ones to
use bit manipulation macros including BIT() and GENMASK() for
consistency.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Janne Grunau <j@jannau.net>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 include/linux/serial_s3c.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 1672cf0810ef..2a934e20ca4b 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -249,9 +249,9 @@
 #define APPLE_S5L_UCON_RXTO_ENA		9
 #define APPLE_S5L_UCON_RXTHRESH_ENA	12
 #define APPLE_S5L_UCON_TXTHRESH_ENA	13
-#define APPLE_S5L_UCON_RXTO_ENA_MSK	(1 << APPLE_S5L_UCON_RXTO_ENA)
-#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_RXTHRESH_ENA)
-#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_TXTHRESH_ENA)
+#define APPLE_S5L_UCON_RXTO_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_ENA)
+#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
+#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
 
 #define APPLE_S5L_UCON_DEFAULT		(S3C2410_UCON_TXIRQMODE | \
 					 S3C2410_UCON_RXIRQMODE | \
@@ -260,10 +260,10 @@
 					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
 					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)
 
-#define APPLE_S5L_UTRSTAT_RXTHRESH	(1<<4)
-#define APPLE_S5L_UTRSTAT_TXTHRESH	(1<<5)
-#define APPLE_S5L_UTRSTAT_RXTO		(1<<9)
-#define APPLE_S5L_UTRSTAT_ALL_FLAGS	(0x3f0)
+#define APPLE_S5L_UTRSTAT_RXTHRESH	BIT(4)
+#define APPLE_S5L_UTRSTAT_TXTHRESH	BIT(5)
+#define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
+#define APPLE_S5L_UTRSTAT_ALL_FLAGS	GENMASK(9, 4)
 
 #ifndef __ASSEMBLY__
 
-- 
2.46.0

