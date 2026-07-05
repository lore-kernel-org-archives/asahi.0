Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994A52BDC1C
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783245782; cv=none; b=FzxniynZTbp2d/pZ/AiWsXsR8AOCzgofcKa3Cw1KRKMfuzDhlC65pm4FGwW08z3Y1l6ZSLDQ3JOBWD5UYwD2NDHGIRax+Hdgk84Du9mMh9ZSsKQValCyzZNrTcBGxCbp8dQLho+AzW9N8E/aQerJtlYLRJ9Z603MY5cVBFiRUG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783245782; c=relaxed/simple;
	bh=K02Th6inCKSEP4u4m+H4dEgdQ0X2Fzyjpr0Ue9hnCMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JN8r4EKoAeO1U2DBKmUARlzfhDJvORYo6wPvn9AuSpfBEHr/KS3RVvAyw651/jJ3Xi1L1ZP0EUYl4C0IohNfvPAGyj/JhbSv9FpjPotKQYV8pSBaJrdXU/lEP50ULccjO/BeMraqyiTO8mE13mCyFB6iYQz0HVqFM3WkVJLneM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=LousD6wR; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="LousD6wR"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783245778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pDEKBMzxtfd1t81QTTS0mKCc2r/kk0TOgUYvyF3Wozc=;
	b=LousD6wRMzVFqXUzpSNpjGwmxGow/0r4SwEOGd89WzTH7MEVTiqY6CctryUwoTb1n10xdB
	PcZC4s9mXiw0eLEAZ/JTzl6u34OWqrqgF542TaB8yx3M0kfCJTtdTdD/eTfllx4kq4HkvS
	z0UzMgrnqkRbIcshgWq6rmrzpWzCkd0=
Date: Sun, 05 Jul 2026 12:02:36 +0200
Subject: [PATCH] arch: arm64: add early_param idle=<wfi|yield|nop>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIALsrSmoC/yXMUQqDMBCE4avIPjewDdVAr1L6sE1HXalWNlYE8
 e6m+vgNzL9SgikS3YuVDLMm/Q4Z10tBsZWhgdN3Nnn2FQcunVhf3fL4gRvFpHfRhzoyAoRLyrf
 RUOtyJB/P0+n36hCnf4e2bQe9JnZCdAAAAA==
X-Change-ID: 20260705-arm64-idle-param-c27fc0e7ea05
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>

Overriding the idle mechanism might be useful for debugging, performance
testing and on platforms where the WFI instruction misbehaves, such as
Apple Silicon SoCs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Thanks to Will Daecon for suggesting this path, since, when treating the WFI
misbehavior as an erratum, we had difficulties telling when the alternatives
should be applied. This solution is more flexible and leaves it up to
bootloader to add the appropriate idle= parameter as a workaround.
---
 Documentation/admin-guide/kernel-parameters.txt | 23 ++++++++++++++++++
 arch/arm64/kernel/idle.c                        | 31 +++++++++++++++++++++++--
 arch/arm64/kernel/idle.h                        | 11 +++++++++
 arch/arm64/lib/delay.c                          |  7 +++++-
 4 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b2d7d3540ded..d7f5471edf8f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2239,6 +2239,29 @@ Kernel parameters
 
 			idle=nomwait: Disable mwait for CPU C-states
 
+			[ARM64,EARLY]
+			Format: idle=wfi, idle=yield, idle=nop
+
+			idle=wfi: Use the WFI (Wait For Interrupt) hint
+			instruction in the idle loop. This is the default and
+			allows the CPU to enter a low-power state until an
+			interrupt arrives.
+
+			idle=yield: Use the YIELD hint instruction instead of
+			WFI. CPUs supporting simultaneous multi-threading (SMT),
+			can continue executing another thread when the current
+			thread reaches the idle loop. This will make the CPUs
+			eat more power, but may be useful to get slightly better
+			performance in some applications, since the CPUs will
+			not enter a low-power state.
+
+			idle=nop: Do not execute any idle instruction in the
+			idle loop. This is useful on platforms where WFI
+			misbehaves, leading to system instability or loss of CPU
+			state. This will make the CPUs eat more power, but may
+			give slightly better performance in some applications,
+			since the CPUs will not enter a low-power state.
+
 	idxd.sva=	[HW]
 			Format: <bool>
 			Allow force disabling of Shared Virtual Memory (SVA)
diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
index 05cfb347ec26..018bcc812d45 100644
--- a/arch/arm64/kernel/idle.c
+++ b/arch/arm64/kernel/idle.c
@@ -11,6 +11,28 @@
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
+#include "idle.h"
+
+enum idle_mode idle = WFI;
+
+/* User can over-ride above with "idle=<wfi|yield|nop>" in cmdline */
+static int __init setup_idle(char *s)
+{
+	if (!s)
+		return -1;
+	else if (!strcmp(s, "wfi"))
+		idle = WFI;
+	else if (!strcmp(s, "yield"))
+		idle = YIELD;
+	else if (!strcmp(s, "nop"))
+		idle = NOP;
+	else
+		return -1;
+
+	return 0;
+}
+early_param("idle", setup_idle);
+
 /*
  *	cpu_do_idle()
  *
@@ -26,8 +48,13 @@ void __cpuidle cpu_do_idle(void)
 
 	arm_cpuidle_save_irq_context(&context);
 
-	dsb(sy);
-	wfi();
+	if (likely(idle == WFI)) {
+		dsb(sy);
+		wfi();
+	} else if (idle == YIELD) {
+		dsb(sy);
+		asm volatile("yield" ::: "memory");
+	}
 
 	arm_cpuidle_restore_irq_context(&context);
 }
diff --git a/arch/arm64/kernel/idle.h b/arch/arm64/kernel/idle.h
new file mode 100644
index 000000000000..350b758ea215
--- /dev/null
+++ b/arch/arm64/kernel/idle.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KERNEL_IDLE_H
+#define __ARM64_KERNEL_IDLE_H
+
+enum idle_mode {
+	WFI,
+	YIELD,
+	NOP,
+};
+
+#endif
diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a..d6fd09466abc 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,9 +15,13 @@
 
 #include <clocksource/arm_arch_timer.h>
 
+#include "../kernel/idle.h"
+
 #define USECS_TO_CYCLES(time_usecs)			\
 	xloops_to_cycles((time_usecs) * 0x10C7UL)
 
+extern enum idle_mode idle;
+
 static inline unsigned long xloops_to_cycles(unsigned long xloops)
 {
 	return (xloops * loops_per_jiffy * HZ) >> 32;
@@ -49,7 +53,8 @@ void __delay(unsigned long cycles)
 		 * Start with WFIT. If an interrupt makes us resume
 		 * early, use a WFET loop to complete the delay.
 		 */
-		wfit(end);
+		if (likely(idle == WFI))
+			wfit(end);
 		while ((__delay_cycles() - start) < cycles)
 			wfet(end);
 	} else 	if (arch_timer_evtstrm_available()) {

---
base-commit: 96cb07bd64bf4d3c8c9159636314c6fbdd9b9881
change-id: 20260705-arm64-idle-param-c27fc0e7ea05

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

