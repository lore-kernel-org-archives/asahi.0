Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009919E7D1
	for <asahi@lists.linux.dev>; Fri, 17 Jan 2025 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133371; cv=none; b=Mf7PsgeD+3TLASXWR1yHXMFgLinLTkCBSXwtmW7AXWGkcv4dEPozDMJR3RmEbJuBljFfGrvVIp7n7JmbLFwGnD5qnLTjF7Y185B/XGF0/sVQ1RfAYZxxbxNXviEyItH0O4hGn/I8SPb7ZzDJgizoguzadukO8BK/R2DNC9z5u1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133371; c=relaxed/simple;
	bh=wFgjuoyBqwQ4sQPn4mUJKjloW9Bov770FPUWOprtCX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXot4LrbWg/eZ2lCAsM8kMulKPf9J79kn+TB/Sfnk/YDy7w9qCUpMZixde75MPeC6MNmOSqdnuQ+VEOzknRmY8QyHV433/l15tMqcpvR+8ZZXGtU7EeTpXI3zGjLNWybG6tR008Ik5O1ezfKHxWoTVSvKRl96qr5c3Ug+7QePEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2BjjlAK; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2BjjlAK"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so4094235a91.3
        for <asahi@lists.linux.dev>; Fri, 17 Jan 2025 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737133369; x=1737738169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4kDojqUMiIFkZnyNMg3tExxWOhbTs+aQLMwWb7s2ao=;
        b=l2BjjlAKVTionntxGMA2vNlUQrn1GeVwwODZaPk832KG3AnSwnnfvVGzKUJ9Ogbf3K
         /7HT2bg3KuigEM1Kc+5sNy0EKz6ZAqavtHqNhaqQyRlPb3kJsKfXmLgUXHMRWonKqbnV
         hEZULrKTZGoeW4kFTMkVB3X5jr55ze1+cRLJ/ukqXWXq/afUU232cdLZpZiPVfgetPmZ
         sst8P3Uh2gCW669hJjlRVnv3zr00GX61iJ3MZQeUV6pCj0kczCV0RXmszAjsTc1tMVVZ
         D5bLAFa+6NQbqjcp60dYbZZtcKEHKmtLxXfKZs5fGLxmAD7LpOwqRkf/gZD5vVg4fCCL
         zRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133369; x=1737738169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4kDojqUMiIFkZnyNMg3tExxWOhbTs+aQLMwWb7s2ao=;
        b=C7MrAr+dNi2QKgyjqPWjEzodjH3YVmFk5k+Q88SgO+e41EvzPhySilqEmMfh2okhan
         wXvwBfgbjIPvHzGErwD/S7BbBNQCsWwOd0/Et8i7MFnVcmPO3dEgeibMMHi3jBvcmQFm
         7fUOqJsogMtWsluSZ/ghF92Pog83Asf8BLqZzAlRcN2li6SwFIyiBSNetYNVv1YWlNj9
         S5+JvKrPWZHbLrghvkbk4qW0qtncvjI6CITAGLA00x0Pwd3uMnT3BmI5oa4MYC9Ynex5
         i05O2RT0p3o520PHURYW1a49cAPLsfYrQqPzLOYrNTTOuQd4NgWCRfnc+a+OkTUC7tci
         FHig==
X-Forwarded-Encrypted: i=1; AJvYcCVGl7bH+sSRIdHZ7vwyxcbfTab03TxukCAuWEvHtYm+WkjBuYjYWws9wq9YFYuxHkqU0hikXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW8wyhwiP9y+5JSOCTSbJ9qRHzCHdXpbYuys1GLJsmk9KjYYYY
	xqYHtAgjT9tkpYDkNICWJNpBj4QyqYZiHJFhqzmPAVDg8Mn9y8TT
X-Gm-Gg: ASbGncu5sfPSMwSuI+zU/ITlXt3l9NmrfTJCtQfwrBeRvDqtuCZ8cMhwsJTOoF2+BGp
	wRZAmDBSatF8qAgYpAiRGCEWK0AJks4QKzBEFY+625TzwNft0/KQPQAfRYWy66pJWfa1AIcInpu
	q6FOCgvso23GtZi2xuLZwopzK6nFnBuSqjSHiFsIgMFPf6qJ6icBlXwJnEekc1ruNGSyp+gur1q
	olKpSmy340I4tnFwrPn8VuacxH1/fQ+wrpTG1tjedaJib263KgDtsyWoQ==
X-Google-Smtp-Source: AGHT+IFSKYz5MJBYL73PaQgH4rfTufNnsapr7Rut4pl5xrZYZx9FoXciCNIkw1AxE63eVLgrgYPDDw==
X-Received: by 2002:a17:90b:2f50:b0:2ee:fdf3:38ea with SMTP id 98e67ed59e1d1-2f782d32c45mr4034054a91.23.1737133369113;
        Fri, 17 Jan 2025 09:02:49 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f72c1ccf46sm5544422a91.22.2025.01.17.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:02:48 -0800 (PST)
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
Subject: [PATCH] irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured to fire FIQ
Date: Sat, 18 Jan 2025 01:02:27 +0800
Message-ID: <20250117170227.45243-1-towinchenmi@gmail.com>
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
 drivers/irqchip/irq-apple-aic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index da5250f0155c..c3d435103d6d 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -577,7 +577,8 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
 	}
 
-	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
+	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) &
+	    (FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
 		int irq;
 		if (cpumask_test_cpu(smp_processor_id(),
 				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))

base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.48.1

