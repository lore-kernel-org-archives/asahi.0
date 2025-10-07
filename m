Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0ED2D5C97
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843509; cv=none; b=oW6GmSh51LQhS/6pTgp2ve9jGKT9fwgy60iZOJrGJTgr1Ku7MBBwJ0dDX8a3nA25HF8sWAToHWUiNvInc7R2/Kgy+KHaLmM67BVhpjrymThwN/nlL4LSxfOGOjozTMwOOIP03g//xX1CzkApdv+jAj9id3Kd7L0uSmL8PwOEthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843509; c=relaxed/simple;
	bh=ng/p5D85fQbLWgCo/VzPcztWqRtbLIIRQ31vWWSLO5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHyb66Ryxm5yNTfHLvG0qt6ANHiXD+qmDjjwEeLIx2C7xOYveihEEFQGt8if1fSwVZUCSdT0KWm89BJJf2vdGuG3D+YVTSISOnBHeXH5f+iKlcguhG6BgfGxgcsEB7rJAtY3SZPrlV8uqf3mR8yx9Xhmj84zC7ziKMHSEFzJpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bvtgfvx7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bvtgfvx7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26d0fbe238bso44686905ad.3
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759843507; x=1760448307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=Bvtgfvx7F4cES3Wy7Z3AEnCIFvbpQYjI46O8obnalGz8kJetKiTkEl+AYl/DjaFmuq
         91L70i193b0/+Rc2qqSZu/YyYODXezreDs+V7Fjwr8j8sLrGbLak320N1nwgugh45//V
         OGKVilxkSWyqBkowU53PZbqLaEoR2Kt4/JHYW5Nshshfx+GqKjhZOZ7VFX+LtWS3DNe6
         KoclO8T8vZ8xf8Ht/qk9awRNafZUC3AiC+yINS/ThrZVHnFcTZC5C6iDdbt00IZmq1Tt
         D8mKwLfvmEm2TIqdABbK/DjQe/NNFZAVEeuXll35vPUCrpg7H1Z80zepy62xqZ20CPxA
         jaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759843507; x=1760448307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fG/8r6Zh74ocis4PYV5dxG4SwOJqWmE0/JuYdwpI5Bw=;
        b=j5QmE8q75JjzLKy1oBgKyvYMYsvyJUYF3zUflHKLR01NHnlNP5G+tlNowrTs1JTe9S
         xnnDV4Zo6v6zW6kfW0I2NSVrsQwDA8A52OumUZyIvVfFfopJI1V+08JZxCxD1dscCMWX
         Z53Bcj39C0uHPfYSyRL4WJnHAvy8IsG3ZMCgClybxy+rHGKUoLUz3NQSVMpyJT8pYtg1
         OPo0sje2eWN7+1xXLDHfskN4GEVh8rp2Darl/eOikFpQZcdg0MwkVEh7BUYckSrFOmbr
         2uoNDB9p/5tdkhQUHLELmOt5SNHFoTVXfpAkTkp5ehusr+AIlw90vQ013EOdG3LjgHZa
         xeEw==
X-Forwarded-Encrypted: i=1; AJvYcCWXQsD3MQvvxrPDp4YFiEpT/kENIf1NW/FwNBsd0H+olq+nR1gAqIlJtVFEUbWVJfeF2g3BFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDG1YsIEp7XGKErGLdRk83FqjK+LIvMWlGxb4LIC67xV/KF6fk
	AbSnW8hprCp/Xcxkr1ayLmav9Tt9rvypgCF4xuqZb2X9n8NuhAiTgGA=
X-Gm-Gg: ASbGncsA/ncE5IleftWQX1XrpK8rdUiv5uNWfYNg9y5Oasl61gmNXos8GX+1F0cAHhk
	T9DvthtEhCHnTPK5+Ez4hlhhYLaImNOY7vwPL2GKMmcYWARDDX3RZanlAd45sSnUT/yjuZqw0s7
	+PPBk1PRdrU1yDqUdJTxJh6M4bs/VvO8nbhYDYyGn8liBYjTsqeMF9URkqfWjRY4PlrJb9EKCGP
	N9Q4ndsOvYIfsUlPzfAFrn2NUBMjeG90z4ygDwhkgbspQPB+Cxq41luOsrZPeuyFehOXSbdyscg
	5tTBpv83VpFVm4XjXFN8girNUKn3mKvSFT4itqcltxF+c099iZ26jU3us5nf1D08KIeOhdgtUz5
	pMtOQqKGWRkYcpbwyswnLqGIICAPZXj7BOsMsm5Y2trYDAkLKPc9yEEtymTSkH60QGFpoNBdKpl
	zsHIhQBAGWZ05rzbSuVkM=
X-Google-Smtp-Source: AGHT+IEzTWHDadnlhRp/S58ULeXoWMCkCiR+8Dg1mH5fcmjnNA/DLN1UQw7CdyUCQ1szY5TdffBgmg==
X-Received: by 2002:a17:903:f8b:b0:26b:5346:5857 with SMTP id d9443c01a7336-28e9a5a8788mr206165375ad.24.1759843507414;
        Tue, 07 Oct 2025 06:25:07 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([182.65.86.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm166409045ad.94.2025.10.07.06.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:25:07 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Lee Jones <lee@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] mfd/macsmc: make SMC write buffers const
Date: Tue,  7 Oct 2025 18:35:10 +0530
Message-ID: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
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

