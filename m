Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5EB367
	for <asahi@lists.linux.dev>; Sun, 18 Dec 2022 05:15:40 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id gt4so6161111pjb.1
        for <asahi@lists.linux.dev>; Sat, 17 Dec 2022 21:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TArwYxCFrSBrMRpJqgmbgk8qp38LFtviL46odPa8HP0=;
        b=n0GNyffens8/NKaM1FOU4yqHmtgfe1jSd3RsgG9MqBZ4bhFCl8Qx1XifAXmB8kh5dr
         ir4ZJBpQjcWXbOHjpA+GWcfjFbxEtA5YNbUFIClPc/pAzRUEc1ejows4Flh7FDBZRjGn
         oyhY76hXzL3BJwpyjLJNK3sg/kEp+PNxsSee5TJItKcQDTUo7JBlOCnOFbLkSAbP3uJT
         I5jy/EFuFIs+VrEm0qR0GbvwFE4R+Sfbd5UmuDfnKbQm+4criyedNgrtnnMUkV+/PFLi
         3UGnehmrTIF0IGjWvFieIsPhig2MUn0U6izUTJSD+hZYu3KwiUC18vOHJYWgQUyt6hZV
         tung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TArwYxCFrSBrMRpJqgmbgk8qp38LFtviL46odPa8HP0=;
        b=nk8CUHirJtbQWpPamCK5l6uaaQvUZmBe0S53bYWKohNcuGGh4qYWuDW7hxDcF5MnLh
         TbkQUpNavytZkoBiEtODBGONfCg1Fk6A2n1mEy9PawOAW1n3ULzof5SWmyKaCrFKQfO+
         YhVA/Wqsznz7BgFDcPtvllZi5mdWS4+uzm2gTdvl6YbC/dBJgpwHAodxHfDKrz+xXV0a
         KeRJAfO8ovKDXiAb2aSuN0Jqv9GUsjtgFLpJl7urRrbOhD1TNhV+soepSLT8eITqGnrN
         8r0ulalnFXsMer8rRRtCNAqACztO5WA2zQMgv4ieI1uplrbmHMFqsBBLla4pVTfSyrp4
         R3hA==
X-Gm-Message-State: AFqh2krNIc08nMiFoB2jv2iec4by/X1klIQq8JCTlhfkOmR4Xx7gYzi3
	aYKNmx0quyWp7yJc1i3RHRyLyw==
X-Google-Smtp-Source: AMrXdXuNVbYLh7TKzoAhPuPhm0MMGvfsIawvYs2+VupqLnEWB3SzvYdF3oVJnrGFYn4tSZQWIed1ng==
X-Received: by 2002:a17:90a:840f:b0:223:aa36:9580 with SMTP id j15-20020a17090a840f00b00223aa369580mr4212952pjn.25.1671340540199;
        Sat, 17 Dec 2022 21:15:40 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090a6ac100b002139459e121sm7002417pjm.27.2022.12.17.21.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 21:15:39 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	asahi@lists.linux.dev,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 4/7] KVM: arm64: Always set HCR_TID2
Date: Sun, 18 Dec 2022 14:14:09 +0900
Message-Id: <20221218051412.384657-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221218051412.384657-1-akihiko.odaki@daynix.com>
References: <20221218051412.384657-1-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always set HCR_TID2 to trap CTR_EL0, CCSIDR2_EL1, CLIDR_EL1, and
CSSELR_EL1. This saves a few lines of code and allows to employ their
access trap handlers for more purposes anticipated by the old
condition for setting HCR_TID2.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/include/asm/kvm_arm.h           | 3 ++-
 arch/arm64/include/asm/kvm_emulate.h       | 4 ----
 arch/arm64/include/asm/kvm_host.h          | 2 --
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 8aa8492dafc0..44be46c280c1 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -81,11 +81,12 @@
  * SWIO:	Turn set/way invalidates into set/way clean+invalidate
  * PTW:		Take a stage2 fault if a stage1 walk steps in device memory
  * TID3:	Trap EL1 reads of group 3 ID registers
+ * TID2:	Trap CTR_EL0, CCSIDR2_EL1, CLIDR_EL1, and CSSELR_EL1
  */
 #define HCR_GUEST_FLAGS (HCR_TSC | HCR_TSW | HCR_TWE | HCR_TWI | HCR_VM | \
 			 HCR_BSU_IS | HCR_FB | HCR_TACR | \
 			 HCR_AMO | HCR_SWIO | HCR_TIDCP | HCR_RW | HCR_TLOR | \
-			 HCR_FMO | HCR_IMO | HCR_PTW | HCR_TID3 )
+			 HCR_FMO | HCR_IMO | HCR_PTW | HCR_TID3 | HCR_TID2)
 #define HCR_VIRT_EXCP_MASK (HCR_VSE | HCR_VI | HCR_VF)
 #define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK | HCR_ATA)
 #define HCR_HOST_NVHE_PROTECTED_FLAGS (HCR_HOST_NVHE_FLAGS | HCR_TSC)
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 9bdba47f7e14..30c4598d643b 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -88,10 +88,6 @@ static inline void vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	if (vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
 
-	if (cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
-	    vcpu_el1_is_32bit(vcpu))
-		vcpu->arch.hcr_el2 |= HCR_TID2;
-
 	if (kvm_has_mte(vcpu->kvm))
 		vcpu->arch.hcr_el2 |= HCR_ATA;
 }
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 45e2136322ba..cc2ede0eaed4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -621,7 +621,6 @@ static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
 		return false;
 
 	switch (reg) {
-	case CSSELR_EL1:	*val = read_sysreg_s(SYS_CSSELR_EL1);	break;
 	case SCTLR_EL1:		*val = read_sysreg_s(SYS_SCTLR_EL12);	break;
 	case CPACR_EL1:		*val = read_sysreg_s(SYS_CPACR_EL12);	break;
 	case TTBR0_EL1:		*val = read_sysreg_s(SYS_TTBR0_EL12);	break;
@@ -666,7 +665,6 @@ static inline bool __vcpu_write_sys_reg_to_cpu(u64 val, int reg)
 		return false;
 
 	switch (reg) {
-	case CSSELR_EL1:	write_sysreg_s(val, SYS_CSSELR_EL1);	break;
 	case SCTLR_EL1:		write_sysreg_s(val, SYS_SCTLR_EL12);	break;
 	case CPACR_EL1:		write_sysreg_s(val, SYS_CPACR_EL12);	break;
 	case TTBR0_EL1:		write_sysreg_s(val, SYS_TTBR0_EL12);	break;
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index baa5b9b3dde5..147cb4c846c6 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -39,7 +39,6 @@ static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
 
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
-	ctxt_sys_reg(ctxt, CSSELR_EL1)	= read_sysreg(csselr_el1);
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);
 	ctxt_sys_reg(ctxt, CPACR_EL1)	= read_sysreg_el1(SYS_CPACR);
 	ctxt_sys_reg(ctxt, TTBR0_EL1)	= read_sysreg_el1(SYS_TTBR0);
@@ -95,7 +94,6 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
 static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
 {
 	write_sysreg(ctxt_sys_reg(ctxt, MPIDR_EL1),	vmpidr_el2);
-	write_sysreg(ctxt_sys_reg(ctxt, CSSELR_EL1),	csselr_el1);
 
 	if (has_vhe() ||
 	    !cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT)) {
-- 
2.38.1

