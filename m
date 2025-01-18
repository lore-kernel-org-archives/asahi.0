Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA9C273F9
	for <asahi@lists.linux.dev>; Sat, 18 Jan 2025 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737218181; cv=none; b=rzJEhueV3gS1bQ7Fu0zgY8dBKBf2B0tt93U9ooWH6ObxITYdmnkBKFno69Pkode9hEPoGzgf0LSDskb7gLT9AuiXjgnZFdDZjiF5xV8UZaNRJeiejzg1nFYCdj7UqHl1lz0WpeRdNgANIUBf6uIVZkF96O7tte4Ya23ZSXN1XWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737218181; c=relaxed/simple;
	bh=eh1SfXx9U8ZBjcOmI+c31uIuIYkcVWt69AWwx4rbptc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrqCUZEtiep+Su/K4mMUUoxMWm0EEVUa0QlC1FisHfCLVRGzgYTBge6jVmX8zGyjPI3o+96FhjFcdx+soU5YCe6DpmkQ1dAent80jXSHCLh6cms780hdhaOieWikF7mKu5vKmoSFwlaYYjAN4CHYvnBaG9AQOpKJVgZCq1jW0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwokpD66; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwokpD66"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so4140809a91.3
        for <asahi@lists.linux.dev>; Sat, 18 Jan 2025 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737218179; x=1737822979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBcCkYZGqUKu3cSA3W2Zh/4n8iTPp48ifQZWMJrBSVA=;
        b=HwokpD66Eaebo4a8yMhBBqP5B9rXFbGWP6SQ9FV+Y4GiHL7FQ5h/muA68MQFHyeE69
         16lS4/1NFl90GB82CH3upNSkIdCgxnlrpWZp9RbbHHFaExpdAGQ+3A4Ly5w61NVBhaQf
         0UE4zo5DNOgjNCMWC/RKzcs86EmLAH0LkI/lRyghKNvWdxoSKMMkDz6NhcMi65m1i8Bw
         q8CPSwiSCf0kgt8jRbcRIJTcxzw16SXun8mh5hzJWQM2q5jbASTPHOkSdG7oTEu4Zwb+
         QnJAF5stL4UJP0KhBwY6neNsUVH8KVQNyOU7C/KOzzvMPvzN85zUpfwFGN5gTTcsd3hd
         2+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737218179; x=1737822979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBcCkYZGqUKu3cSA3W2Zh/4n8iTPp48ifQZWMJrBSVA=;
        b=TQD7MCXdKFCV1exNm8xYCXT8U0m/GU/SKKs/CXk/7iJswF8Qip6lDN/M+Br/U8Y46j
         pIBuH/g6VP7l8Vc1q29003F59VFBqmPhUc+PP0P43CdoYQSfP1BXGJ9058/r5ipTMUnJ
         W9U6HNd1fkRcUYylS7ZapFBNRDAQTwJ7TOGUqU4/vg6dHvDQqxs/Jh2cv5JRqQ1ryM06
         tnufX3k5H2eaOfCa7ApQgb85M6wcu/Aiy59Lsu1+ubm2nJm9ioCJ1izXRy+XrFiYRtUx
         8yPQXdZr+RACIoK0Gh1NibJH0hnEjnrq3gRSevEvgXLq0QtYoQdYs6bGcF3YYmybmr+g
         PqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6NL11JrLV7Y9Xf9L4oeEKqot4D1+oJ3RgasVWjpNRqPJhe5TK25aSL1yA0nV1MFDOqoL1/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy09Z5u05drl9laGeh4uj1ehLTS4BXVZZUX05Tx0jv/G4ayhZe4
	DBHWxhni4tBzMXlWUttlfeg3dRlL9lD94X83iSYHnqjtYsNJyU5P
X-Gm-Gg: ASbGnctxWQZI+2lZRUPddQhVSEpLPY5WgfSCDyA/7saiR/u8d+4WDHZj8CS4jnQi8X0
	yLPRi0NcZWocMd8AZgyEtbMsPtxptMJKVoI8+F8dP/6FfnXfqtG7LwttHxw1MXrhplcd15/t8jW
	obX16CmmOxNumwBetD4j8ku11LTkQeLHLBtCBRw7f4XRtrE7VpyzJ6l/gJuSlEgZKy6oRZYcrPr
	PK5thhiN7fQX/jpI4znwxfZx4D1Db+5vTmpUTHXCdIPLJZ1iEnE3Ra4rfBxKeKFKRtzM4w=
X-Google-Smtp-Source: AGHT+IFIC6xQyN0czHlq14fUPCGSYmLyGoA8mjgv2tG6wO4ESEzTfyUD4RwRKSlW4dbm9htceT7Hgw==
X-Received: by 2002:a17:90b:270c:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2f782d2c9a1mr8501141a91.23.1737218179378;
        Sat, 18 Jan 2025 08:36:19 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bae59sm8156962a91.30.2025.01.18.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 08:36:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured to fire FIQ
Date: Sun, 19 Jan 2025 00:31:42 +0800
Message-ID: <20250118163554.16733-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPU PMU in Apple SoCs can be configured to fire its interrupt in one
of several ways, and since Apple A11 one of the method is FIQ. Only handle
the PMC interrupt as a FIQ when the CPU PMU has been configured to fire
FIQs.

Cc: stable@vger.kernel.org
Fixes: c7708816c944 ("irqchip/apple-aic: Wire PMU interrupts")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---

Changes in v2:
Fix the conditional to have the intented behavior of evaluating to true
only when both PMCR0_IMODE is PMCR0_IMODE_FIQ and PMCR0_IACT is set by
reverting the conditional to how it is before c7708816c944.

Link to v1: https://lore.kernel.org/asahi/20250117170227.45243-1-towinchenmi@gmail.com/T

- Nick Chan


 drivers/irqchip/irq-apple-aic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index da5250f0155c..2b1684c60e3c 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -577,7 +577,8 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
 	}
 
-	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
+	if ((read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & (PMCR0_IMODE | PMCR0_IACT)) ==
+			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
 		int irq;
 		if (cpumask_test_cpu(smp_processor_id(),
 				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))

base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.48.1

