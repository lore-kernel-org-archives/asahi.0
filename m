Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC154CDE0
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 03:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725162175; cv=none; b=OqVZNwG7HJNqyYOIJMxp0UdbnWykv6GGZiSK1xxXqY3kQNcNZMbca9biJ66scAD6+koU8G+NrZVb3/2t2aIYXLqsG3m2V+jIBlJtiC2aU+XGyT1IpPn32Sn89dU0y2frqpR43P2nGZQINpQ45G2XhzAQlTbN/AEPNsgiH054e+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725162175; c=relaxed/simple;
	bh=HEoypMU/RIa6lonUS83I89WnGQCeDWA8klVeBbv9qnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WH5/0CaXkEb0ddfjuzxW58rPbgSA0HY8xsC/xwin8YEtsDtHG8UnkX4tCL/la8hknKhzgajanRo82MmSfjAYwnGg0HqCOYoGGHq51jthoaU6FuFb1RG9qGW1umYuToWdC0RCivuUh42CjBqcKJIHuynTl/RXzLjgdphjEMpx7NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPVZLWyN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPVZLWyN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-715cdc7a153so2242236b3a.0
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725162173; x=1725766973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jlw7myxYxrx+WOkTkEU/GjLvfU58jir7qbTQIyRSl8=;
        b=DPVZLWyNX8u8RAkR8KDbZC+UG+bwKhR0F2sA/fWdfqb8kJZar4UqviZGLGhwgwh4Ta
         iXhgKsacsk4m8jILUBTq4c/86RD7GvYfr9U8pGlRrJ2Qismoe1yRJ14J1zgn/c9nMaYH
         QEVPCe4BZ9MhbIn/voVchy95kt5TVCtBVmBpuWa+5In1536kdzMc2J8hcmKVsZvMy0XL
         lgid3CF6z558u4DQ1B+CaoVS64AxXc0EHQCSTgpKoB8YOWgzGvmhMtf9/MD7Fr41fpq4
         G1dugDUXVXummY8kwEHNzA8/2345dl5BFqZCxigJ9P+RweXxIxBg0mZI+ODTqmunrP66
         xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725162173; x=1725766973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Jlw7myxYxrx+WOkTkEU/GjLvfU58jir7qbTQIyRSl8=;
        b=bpEZtcxYAWWvpghZsEzQbH3vnlUyKe8QCvzEVp4Hqn291s1dlK/P1cN9HLE5vhO/gq
         Splp2Rs68eiwsSzKCnmXsN26ML2FKpUlXuvw7+phLg2a3CMoCXRHFEo923s6BUWH+3Nw
         tdSoTim7/nwp/yJFASx+vM3ztA/I1Ib2ZGXhWVn5j2wieyKkzlGMtu5K7F0L7YrBJXSj
         0mhUQPJ+sITSg9mE/x2BUM6gseLOycjE1NCHXuiHLI1OUxAbyHtOMEPySDn+jU81A9A0
         fjaNoNUFzpC4yCLO9RQ/0K7Lgg1LrL3esmevGslOqscoVt2yLl49oYcvqv+bKT8VegWn
         UlAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaRO492obfdE0GlXsWbuzl2FXJD31cOTNAD8LSlI84GQWuBXZF3MJMIXsxjguDPXFPw0a0+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuTwSklnVgEQzMFEjUfcXvFPAx2XcdLVGe9M1d+N6xKaE2OlY+
	Z11Q2psWCCImayPlF+eJ+Cu124CZ0PPiJv1Dh2KKa5KHdm8VzY4W
X-Google-Smtp-Source: AGHT+IHc5YknrxzXlFuucuStWx3gBFqQRQQwKvn1lhHqX/o6iunywxLlE/ficJuzfPbWPY8NggTDHA==
X-Received: by 2002:a05:6a00:1905:b0:712:7512:add9 with SMTP id d2e1a72fcca58-7170a85ab58mr10551336b3a.13.1725162172772;
        Sat, 31 Aug 2024 20:42:52 -0700 (PDT)
Received: from localhost.localdomain ([49.130.72.113])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e55771ccsm4826767b3a.43.2024.08.31.20.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 20:42:52 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	konrad.dybcio@somainline.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 4/4] irqchip/apple-aic: Only access system registers on SoCs which provide them
Date: Sun,  1 Sep 2024 11:40:07 +0800
Message-ID: <20240901034143.12731-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901034143.12731-1-towinchenmi@gmail.com>
References: <20240901034143.12731-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Starting from the A11 (T8015) SoC, Apple introuced system registers for
fast IPI and UNCORE PMC control. These sysregs do not exist on earlier
A7-A10 SoCs and trying to access them results in an instant crash.

Restrict sysreg access within the AIC driver to configurations where
use_fast_ipi is true to allow AIC to function properly on A7-A10 SoCs.

Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/irqchip/irq-apple-aic.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 01a3c79054f5..a6d812afb10d 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -234,6 +234,7 @@ enum fiq_hwirq {
 	AIC_NR_FIQ
 };
 
+/* True if UNCORE/UNCORE2 and Sn_... IPI registers are present and used (A11+) */
 static DEFINE_STATIC_KEY_TRUE(use_fast_ipi);
 /* True if SYS_IMP_APL_IPI_RR_LOCAL_EL1 exists for local fast IPIs (M1+) */
 static DEFINE_STATIC_KEY_TRUE(use_local_fast_ipi);
@@ -550,14 +551,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 	 * we check for everything here, even things we don't support yet.
 	 */
 
-	if (read_sysreg_s(SYS_IMP_APL_IPI_SR_EL1) & IPI_SR_PENDING) {
-		if (static_branch_likely(&use_fast_ipi)) {
-			aic_handle_ipi(regs);
-		} else {
-			pr_err_ratelimited("Fast IPI fired. Acking.\n");
-			write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
-		}
-	}
+	if (static_branch_likely(&use_fast_ipi) &&
+	    (read_sysreg_s(SYS_IMP_APL_IPI_SR_EL1) & IPI_SR_PENDING))
+		aic_handle_ipi(regs);
 
 	if (TIMER_FIRING(read_sysreg(cntp_ctl_el0)))
 		generic_handle_domain_irq(aic_irqc->hw_domain,
@@ -592,8 +588,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 					  AIC_FIQ_HWIRQ(irq));
 	}
 
-	if (FIELD_GET(UPMCR0_IMODE, read_sysreg_s(SYS_IMP_APL_UPMCR0_EL1)) == UPMCR0_IMODE_FIQ &&
-			(read_sysreg_s(SYS_IMP_APL_UPMSR_EL1) & UPMSR_IACT)) {
+	if (static_branch_likely(&use_fast_ipi) &&
+	    (FIELD_GET(UPMCR0_IMODE, read_sysreg_s(SYS_IMP_APL_UPMCR0_EL1)) == UPMCR0_IMODE_FIQ) &&
+	    (read_sysreg_s(SYS_IMP_APL_UPMSR_EL1) & UPMSR_IACT)) {
 		/* Same story with uncore PMCs */
 		pr_err_ratelimited("Uncore PMC FIQ fired. Masking.\n");
 		sysreg_clear_set_s(SYS_IMP_APL_UPMCR0_EL1, UPMCR0_IMODE,
@@ -830,7 +827,8 @@ static int aic_init_cpu(unsigned int cpu)
 	/* Mask all hard-wired per-CPU IRQ/FIQ sources */
 
 	/* Pending Fast IPI FIQs */
-	write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
+	if (static_branch_likely(&use_fast_ipi))
+		write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
 
 	/* Timer FIQs */
 	sysreg_clear_set(cntp_ctl_el0, 0, ARCH_TIMER_CTRL_IT_MASK);
@@ -851,8 +849,9 @@ static int aic_init_cpu(unsigned int cpu)
 			   FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_OFF));
 
 	/* Uncore PMC FIQ */
-	sysreg_clear_set_s(SYS_IMP_APL_UPMCR0_EL1, UPMCR0_IMODE,
-			   FIELD_PREP(UPMCR0_IMODE, UPMCR0_IMODE_OFF));
+	if (static_branch_likely(&use_fast_ipi))
+		sysreg_clear_set_s(SYS_IMP_APL_UPMCR0_EL1, UPMCR0_IMODE,
+				   FIELD_PREP(UPMCR0_IMODE, UPMCR0_IMODE_OFF));
 
 	/* Commit all of the above */
 	isb();
-- 
2.46.0

