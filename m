Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3E19067A
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929533; cv=none; b=tYbS5W2F3Hnj6KxdrBp+D8uOQWoIz7d0GC9y0jYCmFMiI5ZFCJZ6ud5KlB5vOFgJ7nt8DsjOCnmOJl4ciKIbil/FQmdrE0xB571Tixv+cMtzleniQ0GxIOBcqO6RxfvkbyQ3vQHKnNrolCxaTdbwPa77Df/PPVfPGWrwYA8fpco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929533; c=relaxed/simple;
	bh=YNsEAs5CokucoiIhAZcn3ok3wIhCSgF0riXfmwuVRHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koLeji3hbK6d5GYWl7Jl+4NTs2SRVHzan50lOaEbmKSQqRQ+baYQSnWUZbOPfF3I3Puy2uPsB2INIUaiCo1+hlbhvJhNE7jd9f/nGKiwM06hJo3vf1tVZE6p2A+wLEZxKautwiw9zm6ttJKI/rIz+CjmVaz/Yat6xKAJH2+dFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVVkgiKJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVVkgiKJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7141feed424so448044b3a.2
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724929531; x=1725534331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eGSx27JcX0pDUTDyQY+9iXqRUjb43ZGaILimNXE8xk=;
        b=QVVkgiKJ8s+O59r/t8X94fPaccHFJYm4HCvrzb4YI4GsIXqzSSGKZlUMrd7sYFGkNa
         QYgNcNjIO2N3NQUYwUsy7ex6t132pfUc1ti/fLI/KNop0e8UN4NvgnKmdoUxMJHuKbha
         YlJzTgV7MPleazOzBLXOaqiL6fY59nwS7DORa6XuQhjiGarXiXM6HTdTOhh67ty7lZ3A
         Oar1j7Op3+Ka8Ulvbgc7c2Ztzs+6EjTCugQ2AL5d3yAkMV9/JZNdg7hIhm5kA6eoMZGp
         NxpwaYnmd0yuxxdiMr/p5pG3qtz2AuZI3+NGGXmWWBAqSBc3E1iXj2u6Pp4ZJc8I7FiY
         C9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929531; x=1725534331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eGSx27JcX0pDUTDyQY+9iXqRUjb43ZGaILimNXE8xk=;
        b=FHrI3VOzFjIQF0cHlujXdmB8+FQPBS/9JMNOj0f8u6In4IjkE7S42B4RfUc+2Dix1I
         Q7nV4GK+IVlC2YYQXKssxwxvkhR4Ie3ByR8QcrO2zSAZZkMXiJ5ZCUBs5LWB99/tL7F4
         dc/AZNtnXv4ix66Xchza6Ho8bwT8OWOnAX++fGvvDmeA4f+A64gyuktPFQxfye4rFOuK
         HIt004KWuKQGJoNdNmrs3Ly9NujZWrtxyEYJ9+YCFvffe0tmtzwgtYytygwWCT7ocVvm
         JIo2DvW5NMxDz4HufyYAzoxETfgKNbwMrEu8cCV5MqegZN0KS7hR7v4HtpTKiShOGqPY
         TgDg==
X-Forwarded-Encrypted: i=1; AJvYcCXgzluicgPdqtH7fEuOtHg3La015SZO/pns3EOrcx/jC4NtxZtbDaCq6XkIiPxxfEQF3NiCKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6hT0QbDRxkSkRRoJ6egFtoT39Jd8Pca8z1MPUOrUpfAgQQ8I9
	IUTOXFlA+ntrFMbm8xyjOfIx+W0diOi32B37JYAX62804V09u0PV
X-Google-Smtp-Source: AGHT+IGpRch0t0zQ2dsUBSE7fPI0Pg93inIyw/ybrn3xmOWgd/6H5CjnHko+G2tx5xUtsaBGE5M2bQ==
X-Received: by 2002:a05:6a00:23d6:b0:706:b10c:548a with SMTP id d2e1a72fcca58-715dfc8b955mr2267911b3a.22.1724929530925;
        Thu, 29 Aug 2024 04:05:30 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e5576cc7sm906671b3a.32.2024.08.29.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:05:30 -0700 (PDT)
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
	Nick Chan <towinchenmi@gmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH RESEND 2/3] irqchip/apple-aic: Only access IPI sysregs when use_fast_ipi is true
Date: Thu, 29 Aug 2024 19:02:16 +0800
Message-ID: <20240829110436.46052-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829110436.46052-1-towinchenmi@gmail.com>
References: <20240829110436.46052-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting from the A11 (T8015) SoC, Apple introuced system registers for
fast IPI and UNCORE PMC control. These sysregs do not exist on earlier
A7-A10 SoCs and trying to access them results in an instant crash.

Restrict sysreg access within the AIC driver to configurations where
use_fast_ipi is true to allow AIC to function properly on A7-A10 SoCs.

While at it, remove the IPI-always-ack path on aic_handle_fiq. If we are
able to reach there, we are on an IPI-capable system and should be using
one of the IPI-capable compatibles, anyway.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/irqchip/irq-apple-aic.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 5c534d9fd2b0..626aaeafa96c 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -234,6 +234,7 @@ enum fiq_hwirq {
 	AIC_NR_FIQ
 };
 
+/* True if UNCORE/UNCORE2 and Sn_... IPI registers are present and used (A11+) */
 static DEFINE_STATIC_KEY_TRUE(use_fast_ipi);
 
 struct aic_info {
@@ -532,13 +533,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 	 * we check for everything here, even things we don't support yet.
 	 */
 
-	if (read_sysreg_s(SYS_IMP_APL_IPI_SR_EL1) & IPI_SR_PENDING) {
-		if (static_branch_likely(&use_fast_ipi)) {
-			aic_handle_ipi(regs);
-		} else {
-			pr_err_ratelimited("Fast IPI fired. Acking.\n");
-			write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
-		}
+	if (static_branch_likely(&use_fast_ipi) &&
+	    (read_sysreg_s(SYS_IMP_APL_IPI_SR_EL1) & IPI_SR_PENDING)) {
+		aic_handle_ipi(regs);
 	}
 
 	if (TIMER_FIRING(read_sysreg(cntp_ctl_el0)))
@@ -574,8 +571,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
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
@@ -811,7 +809,8 @@ static int aic_init_cpu(unsigned int cpu)
 	/* Mask all hard-wired per-CPU IRQ/FIQ sources */
 
 	/* Pending Fast IPI FIQs */
-	write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
+	if (static_branch_likely(&use_fast_ipi))
+		write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
 
 	/* Timer FIQs */
 	sysreg_clear_set(cntp_ctl_el0, 0, ARCH_TIMER_CTRL_IT_MASK);
@@ -832,8 +831,9 @@ static int aic_init_cpu(unsigned int cpu)
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

