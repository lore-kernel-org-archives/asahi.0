Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E7314F138
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083876; cv=none; b=rn72rl3ltIS3nJmGG1QXI3Z+8tiIfXb3sofFBSCXDBH8nIBBjVUDqf4FC1Am1+k6kHCu6+fyRqvOZGV0ieDNfmPpYQdd408jTHFEpZ1EQD0Za3jfv8UykUoJkxOxlduk929OcqlAJC6BxHqOsaaNwEYHBaH7dchMRjsSI0h2sJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083876; c=relaxed/simple;
	bh=i1wHNYB9L1TbZMmb7JXpPz2IK/BYlwoGeSiZU2nrtps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zzd3cvhq3YWNomtikLcqvct9FLH16rR/FT259YRMbmabtj4N+7vU8b4DZ1AbzQ2reFDSKryVfkrZI7Bjw4Ku2ZIgQff5fy5yIpfhetT98anQpjqWi93NN0hEtoadC+Jn10T6JQlaFmjWg5oZZRzpnybW8pxRgprGnxsmEIUG0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chAadwOf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chAadwOf"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71433096e89so2138504b3a.3
        for <asahi@lists.linux.dev>; Fri, 30 Aug 2024 22:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725083874; x=1725688674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c61KzTihCjzePgzXbL4oR36fnoTGJU/hUcEWcyWz+t4=;
        b=chAadwOfD82kOHkZ/4/w04v3rMWJJAo7hPEGhyqVUGTV/IDn+PqnWGeawbZX7qx/Ge
         x5laZ0ot814S/mwI/55hrtWyPCsUCtIILke+43Pyx7HZSLSPemNU+aJlwda/1V5rHq2c
         NQWsdYD7si8BrkFYncIobDaFhCxkMlz6vJZ15JTtaoGJ8PD/P9ocHS440Ie6ey2n44Bn
         VJOqGHP89byNckCMv9AD9ccBn5j9KVYgs+4Wc/TsF+Z11Pq7wU/zL7w+7oJNkvC4b9oI
         x4XkOIAOoe0cUPNzPPLWC8Y9G8BpQqiv/YyDM5x9hBk0656o1H5GC5kCOYYWZEkbRYrq
         Yw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725083874; x=1725688674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c61KzTihCjzePgzXbL4oR36fnoTGJU/hUcEWcyWz+t4=;
        b=nU7ciOMOUEvIRVNTn9AFPTnMx0bWzoCPvBjago2moo+GX86FBGJrWfeO0WG1Jt+pJz
         k7fKaEjctOaM9H2CpKCBLXbM/HYG19YWzzSxEtyCF07v01UOAZTZLAbgiRiQ0hlPdYEX
         IDdeo4RFPlYzfSgHJMzvzy8PCN+q9aZ1razYcVxj/amxILg+39TrVgRIlrZ+ifqtzQGa
         4CWuIIrkHx0LrlNS4SqmBLr6/jQMkI4Nxk94tFV9dZDRYjW25Ks+pegEV3sY/OqeiMJA
         qZnsI+ItAkGBoBmXMYrcs9d5DltgDPjPeZvH6wG9c1/alEBwLvdRP0ZKwKmjagFryMtC
         6mCw==
X-Forwarded-Encrypted: i=1; AJvYcCXWh/mb2aykVlmxDLLPZeiExiZNvR5Hlxgn8NHiP3Qd0oyVre6MyQdymJgHhmkMmi4zx8Apfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6oTxXpAaecBP3jKbbgQG58ffOgXBKq0KJvDnTg7MbWFgP8JJv
	P27SC8Iw1Znqa/0+m6Q5v1QNoedGH+oPctui6HIcXBxvOUeN8WsA
X-Google-Smtp-Source: AGHT+IEYvysVPYow9FSPEgYtUv10qvcbs0XqkpUYakMhxEFHJy0yARyeKD5B3eznnVOi1c96X+YK3w==
X-Received: by 2002:a05:6a20:d487:b0:1c4:bbb8:4d02 with SMTP id adf61e73a8af0-1cece5d12cemr2073712637.37.1725083874173;
        Fri, 30 Aug 2024 22:57:54 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2053aa8cb4asm12027045ad.271.2024.08.30.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 22:57:53 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	konrad.dybcio@somainline.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 4/4] irqchip/apple-aic: Only access system registers on SoCs which provide them
Date: Sat, 31 Aug 2024 13:48:20 +0800
Message-ID: <20240831055605.3542-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831055605.3542-1-towinchenmi@gmail.com>
References: <20240831055605.3542-1-towinchenmi@gmail.com>
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
As part of the restriction, the IPI-always-ack path in aic_handle_fiq()
has been removed. If the code path were to be reached, the system is
fast IPI capable and one of the fast IPI compatibles should be used
instead.

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

