Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31432F3C04
	for <asahi@lists.linux.dev>; Fri, 26 Sep 2025 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758884116; cv=none; b=TBv7PnzOXtGPCujSDphRvoFz8mn2DHptX90lbyLCYHvAVh19kB8sch+DRtcHyAkcxW6e2is5Q7Yq2uJcnzB/QYrDFPA6TkBg9rVr7hLdi4CGUDNI5IJReqChDTdTe8Y2ePrhQvZzJv8RQN7AGrr4JNS+rbRNxsChmR1Qr6lV5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758884116; c=relaxed/simple;
	bh=ng/p5D85fQbLWgCo/VzPcztWqRtbLIIRQ31vWWSLO5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4Q3+j+tCaczkKCx0zTFAgs57Vjrn68h38L2+Smr3OtCnN+Ri3fJb8YiS6DewxIA56amc/gNPS1Z4S6TRuCk+3JcqxaU+dD3HCD8ecZD4huFYlrO5RzFaK4hlJ6wLVw5Tir/yGfzJzcS1Kk7yv6kysSFJpci2D1g8XI9Mru9H5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK9/Xpqa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK9/Xpqa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1887562b3a.1
        for <asahi@lists.linux.dev>; Fri, 26 Sep 2025 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758884114; x=1759488914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=RK9/XpqaJk7EzVDwaZEJ/myOUeKzFlgyHZXzf9Vl2HKfrWy1J5RM194vLs5w2ipAZx
         ClQmb9KV9pM9KaEF4iz5w//y03kK+azPNlf2ldvbuYia1RbfnZTkbnlOEXx3CjTsNxti
         juXH10N65a44RuA9AmoblpBh9ZQYdY/C8OWdTvqtPk+leW6La8eFMT23tEwM/7trx29o
         k8xExSFlsOpTh68In4GKh48fvK8PvEx53yEvOxJS5dJFtjGwWNh4V/LSzyzlqkQwKDFn
         dY+gkkkJR43sUEEn5yACHLlSdyKSR5amknuo2KRONat+x29pbrUJRCL3hG5oPx+8BATf
         8jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758884114; x=1759488914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=UvXUEi1hHdH2+vtDesBf8DttfLnEAcAMwTBzxN+0Pcdbp1cgXZod+7UB5HszsOCrLL
         X7+xlNVwXxAbjuJFL1eBvfmeFqKBcq8rnXQdpFvYXfJ+AChwrKJwOUUnCrTVN3Nh2Ebm
         U+XEMFfygokEJvpiL0cfCphOuEXStBBdoEE7VmKEhIEvE+987VjV88vdDmfJEdVDUDew
         10OqsQsPuUry52TqjfohMXkce9D1s/VrqxKcs8A04kizjpPhUNMTsALvcTo9KOpQDDte
         cScYAHKEijCxmXRvTeY3cIaIjD5kSJA4nGef8NFOfRwaUCbF2SBTUymlOal7QNw4w3n3
         4Fzg==
X-Forwarded-Encrypted: i=1; AJvYcCVtPoMBYhDZhT3GpH0watTBG0p1wHPOY4oDZ+Y9DfXLIC5Qv6SwD+bhAcx7ZSNqhx2hRMM5Eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJKfsIr7mVH6dYVMKz5fGRei++VVejOK04Z+amMnQnnwNA5tZP
	A03fWt8evGhXdVj9XOkThyFCkVzXvG46AEKNlsqewwmXz7wNbtyljOk=
X-Gm-Gg: ASbGnctoAiEKepoF/udDq7sezA6WxU1C+A9boadFX6Eo4+VfNrjtBl248XocE1nrVJ0
	h7+SrY03aiAg176kSA7sWZeiNe56VBUrcM5OuzMeW/vvXJEDd8rZaTLnH+TteMHa9TcCxn86XTu
	KY2tSwZ4HwCBGeHT6nyLpTQTrYQnZe4w0Vnjf9JqOiBYbTZvhpV7RtCZNHYJpbLfqHXikspo0+Y
	UX8rDQPsgfKe4E2S0Mjj0MgZ6hfcEqgp8spjY9eVZGxJQG3mDIDP3OsX0mN2G6sStXkZK9kBW+w
	ZIPVel0K5Rb6R+fM0jEA3fYWp5HZvjVxmzjddJxsePeLhbJ9RB90yh+vPcWtsx7Q4Np6xdDt0MO
	AMLPkQFxAEOyJdFm3IVixIS1yJdzmEOcWNODrGgjaqIrsVJOOw0IMImTQKanXA+u3Nr9y2davgw
	==
X-Google-Smtp-Source: AGHT+IHoR6X2imZeXiOqh27AKoNYEtTfZrOufz/4X8jbeOqzZcdMNwoD0bok6WOIEC6F/UDhsBRR6g==
X-Received: by 2002:a05:6a00:8d0:b0:776:19f6:5d2f with SMTP id d2e1a72fcca58-78100fd3661mr6495280b3a.11.1758884113839;
        Fri, 26 Sep 2025 03:55:13 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([122.167.144.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06b0dsm4062536b3a.82.2025.09.26.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 03:55:13 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: atharvatiwarilinuxdev@gmail.com,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd/macsmc: make SMC write buffers const
Date: Fri, 26 Sep 2025 16:24:59 +0530
Message-ID: <20250926105505.33499-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark the write buffer arguments in apple_smc_write(), apple_smc_rw(),
and apple_smc_write_atomic() as const. These functions do not modify
the data provided by the caller, so the parameters should be const
qualified.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/mfd/macsmc.c       | 6 +++---
 include/linux/mfd/macsmc.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8..0f8ed400b986 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -173,7 +173,7 @@ int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 }
 EXPORT_SYMBOL(apple_smc_read);
 
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+int apple_smc_write(struct apple_smc *smc, smc_key key, const void *buf, size_t size)
 {
 	guard(mutex)(&smc->mutex);
 
@@ -181,7 +181,7 @@ int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size)
 }
 EXPORT_SYMBOL(apple_smc_write);
 
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+int apple_smc_rw(struct apple_smc *smc, smc_key key, const void *wbuf, size_t wsize,
 		 void *rbuf, size_t rsize)
 {
 	guard(mutex)(&smc->mutex);
@@ -239,7 +239,7 @@ int apple_smc_enter_atomic(struct apple_smc *smc)
 }
 EXPORT_SYMBOL(apple_smc_enter_atomic);
 
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size)
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf, size_t size)
 {
 	guard(spinlock_irqsave)(&smc->lock);
 	u8 result;
diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..3c5467854e28 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -149,7 +149,7 @@ int apple_smc_read(struct apple_smc *smc, smc_key key, void *buf, size_t size);
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_write(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write(struct apple_smc *smc, smc_key key, const void *buf, size_t size);
 
 /**
  * apple_smc_enter_atomic - Enter atomic mode to be able to use apple_smc_write_atomic
@@ -176,7 +176,7 @@ int apple_smc_enter_atomic(struct apple_smc *smc);
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t size);
+int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, const void *buf, size_t size);
 
 /**
  * apple_smc_rw - Write and then read using the given SMC key
@@ -189,7 +189,7 @@ int apple_smc_write_atomic(struct apple_smc *smc, smc_key key, void *buf, size_t
  *
  * Return: Zero on success, negative errno on error
  */
-int apple_smc_rw(struct apple_smc *smc, smc_key key, void *wbuf, size_t wsize,
+int apple_smc_rw(struct apple_smc *smc, smc_key key, const void *wbuf, size_t wsize,
 		 void *rbuf, size_t rsize);
 
 /**
-- 
2.43.0

