Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73D3E8325
	for <asahi@lists.linux.dev>; Mon, 15 Jun 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526108; cv=none; b=eVUu0Rs1mv1W2LyII5b9QSkza9vob5Adnf+/z/LrCsqyUnfmX+cEJfXDMdu25MwFXCmgNjkAG61s0N0JzlKFQBGCInr27r01WJgqWACtrIksmrUPhjJogJ/rQBoq/PEUtZfUn/R77m6FbXL+8tYQ9BZn7dK8Gom6a3XC7BmuZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526108; c=relaxed/simple;
	bh=7zStEBmR/EvAgeNckE6cJcQuq1IEF5JFAGtm0vLCGOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MpMFvWEHeWAT66QS27S/jvdFExwGgKeD6QwE3RqzZNpCZ1Vu2N00acX+0dhfcqiUhL+iwiGd1TDynHd0jrzD/EabaVd/PG7kK/3s82y+aGE3HEzoGDaHoDpGZ6JWXrPtxuzoObrzJvLpRjjFrgizREraZne+QT7cHjK/O8I2zo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=Dqpy43pt; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="Dqpy43pt"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1781526104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3XbqPMmmgy6VWdEaI2vPGHNP6bqegSEfdLO8/gxKAxE=;
	b=Dqpy43ptSttKZTy08nju6S9r7W252xj1cgDotmdWEFbvA1TJsdGr6XRTRfW1RHPzTpN/c3
	N39X8QtqjnGfP3PpyPy0GbLYqbbPVjzmQRJm9hmd1Gms8gjS2T66syzY9SoNJRGiNLaRx1
	U+3FHP36cl1Y0EeUhvlBtgqWkNB3QGs=
Date: Mon, 15 Jun 2026 14:21:36 +0200
Subject: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAE/uL2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDM0MT3fK0TN3UoqLEktJcXfNEyzRjA9M0MwPDNCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgB85gi5bwAAAA==
X-Change-ID: 20260614-wfi-erratum-7a9f305f601f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>, 
 Yureka Lilian <yureka@cyberchaos.dev>

Apple Silicon CPUs can lose register state in WFI, leading to crashes
in the idle loop early in the boot process.
This applies to any previous Apple Silicon CPUs too, but is worked
around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
during m1n1's chickens setup.
This workaround no longer exists since M4.

Add a workaround capability for replacing wfi and wfit with nop, and
an erratum to enable it on the affected CPUs if the workaround using the
sysreg is not already applied. Leave the decision whether the sysreg
workaround can be used up to the earlier parts of the boot chain which
already configure the Apple Silicon chicken bits.

This alternative has to be applied in early boot, since otherwise some
cores might enter the idle loop before apply_alternatives_all() is run.

Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes since v1:
Restricted the erratum to EL2 only, since in EL1 we'd expect the
hypervisor to trap WFI and handle the erratum.

Tested on M4 and M4 Pro (which now sometimes nondeterministically
crash later during boot).
Successfully booted on M3 Max with the SYS_IMP_APL_CYC_OVRD
workaround disabled in the bootloader, as well as A18 Pro (which,
like M4 / M4 Pro, doesn't have SYS_IMP_APL_CYC_OVRD).

There is probably a better place for the SYS_IMP_APL_CYC_OVRD
defines, which I currently put in the middle of cpu_errata.c, but I
wouldn't know where.
---
 arch/arm64/Kconfig               | 12 ++++++++++++
 arch/arm64/include/asm/barrier.h | 19 ++++++++++++++++---
 arch/arm64/kernel/cpu_errata.c   | 21 +++++++++++++++++++++
 arch/arm64/tools/cpucaps         |  1 +
 4 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..8c8ff069856f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -453,6 +453,18 @@ config AMPERE_ERRATUM_AC04_CPU_23
 
 	  If unsure, say Y.
 
+config APPLE_ERRATUM_WFI_STATE
+	bool "Apple Silicon: WFI loses state"
+	default y
+	help
+	  This option adds an alternative code sequence to work around some
+	  Apple Silicon CPUs losing register state during wfi and wfit
+	  instructions.
+
+	  As a workaround, the wfi and wfit instructions are replaced with nop
+	  operations via the alternative framework if an affected CPU is
+	  detected.
+
 config ARM64_WORKAROUND_CLEAN_CACHE
 	bool
 
diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 9495c4441a46..f72eddc7c434 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -20,9 +20,22 @@
 #define wfe()		asm volatile("wfe" : : : "memory")
 #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
 				     : : "r" (val) : "memory")
-#define wfi()		asm volatile("wfi" : : : "memory")
-#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
-				     : : "r" (val) : "memory")
+#define wfi()							\
+	do {							\
+		asm volatile(					\
+		ALTERNATIVE("wfi",				\
+			    "nop",				\
+			    ARM64_WORKAROUND_WFI_STATE)		\
+		: : : "memory");				\
+	} while (0)
+#define wfit(val)						\
+	do {							\
+		asm volatile(					\
+		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
+			    "nop",				\
+			    ARM64_WORKAROUND_WFI_STATE)		\
+		: : "r" (val) : "memory");			\
+	} while (0)
 
 #define isb()		asm volatile("isb" : : : "memory")
 #define dmb(opt)	asm volatile("dmb " #opt : : : "memory")
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 1995e1198648..8c9a194eddc4 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -309,6 +309,19 @@ static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *_
 	sysreg_clear_set_s(SYS_HACR_EL2, 0, BIT(56));
 }
 
+#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
+static bool has_apple_erratum_wfi_state(const struct arm64_cpu_capabilities *entry, int scope)
+{
+#define SYS_IMP_APL_CYC_OVRD   sys_reg(3, 5, 15, 5, 0)
+#define CYC_OVRD_WFI_MODE_MASK GENMASK(26, 24)
+	if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
+		return false;
+	if ((read_sysreg(CurrentEL) >> 2) != 2)
+		return false;
+	return FIELD_GET(CYC_OVRD_WFI_MODE_MASK, read_sysreg_s(SYS_IMP_APL_CYC_OVRD)) != 2;
+}
+#endif
+
 #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
 static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
@@ -1009,6 +1022,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.matches = has_impdef_pmuv3,
 		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
 	},
+#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
+	{
+		.desc = "Apple WFI loses state",
+		.capability = ARM64_WORKAROUND_WFI_STATE,
+		.type = ARM64_CPUCAP_SCOPE_BOOT_CPU | ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU,
+		.matches = has_apple_erratum_wfi_state,
+	},
+#endif
 	{
 	}
 };
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd4..bbf8c15d79b0 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
 WORKAROUND_SPECULATIVE_AT
 WORKAROUND_SPECULATIVE_SSBS
 WORKAROUND_SPECULATIVE_UNPRIV_LOAD
+WORKAROUND_WFI_STATE

---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-wfi-erratum-7a9f305f601f

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

