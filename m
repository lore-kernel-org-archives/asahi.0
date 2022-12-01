Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECE71118
	for <asahi@lists.linux.dev>; Thu,  1 Dec 2022 10:49:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d3so1259806plr.10
        for <asahi@lists.linux.dev>; Thu, 01 Dec 2022 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPjVjf+i0nuKjzq4xuTtWcDbzlk974FEzySz6jaQavQ=;
        b=707jnRzZEQf01TpjqN9DSN/NFPM/VMAM0ZKeLKPJRYCiI6ojaLlzyyjRPUpTLHEb7+
         t/85QUAWoI1i3uBqrU+h1j5F4G8R54m7oP3WPD6Z75LxFEs8MFosOJnDoLoJMShEhD6T
         M0uSLQjMILQC+3vSNj7yMjn7Uf63q85nOteYpM/WFq3kNP/C4aTX+hOPClaIklzFJcn5
         9uFkhbiVD8TmmdCAgFtsMbaJH9BYrMzT0ak6Zy/dNho9mC3EqFLBduH3k6r/R8W0Ehwh
         3gwT9d0maH8rr+D9FUCYBsu4HRCMmow03xksU5//CMHjWJ9+r3fRPZkEhMzUnLtP4A4y
         iGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPjVjf+i0nuKjzq4xuTtWcDbzlk974FEzySz6jaQavQ=;
        b=UpwfPk1lAq49eskEWH8yUZlE/FEfD+G7szTBWmGSmziRLDNhpVJOZ/m0yTbpi/+Xux
         U4kKHnCwrS0jGwA/qkifSAnk4L2fdjpySgmFEtMrcFrFknYWszO4CsAzSBWKxCpor0j/
         QZqhGp6oXxNxxrTkXQ5Qq5Jkg/N/PTnukSZVBc7oTkAHQx/jJvpkN2IVtUIehYvJ1rBm
         +8121vlGpKG+05c5USn/gvOq0wTyvpMRAyuuLk+z6gvg3EGeX9z9aLMka7LEMeOyuwmZ
         q4DhWPcSmk0MNuXH36UNapH2e/HtHDkFAi74R96tKK3eveW2ei0qfykGWXboO+kgDoYQ
         2Evg==
X-Gm-Message-State: ANoB5plL1BuBwAhx+f2c7mOcX6leTGJeHet9/AGtvwxikB0Be7klpksY
	MnhtOG+BvMjK7NpvRcfrvtJCBA==
X-Google-Smtp-Source: AA0mqf5Yhsy8Ypvr0GCLP2Zg6ZsUX9UGviILhc7n8Tbc14XMJHu8PCzO14QcWmW7k5EhIGo/uGorQw==
X-Received: by 2002:a17:902:8d98:b0:189:8e39:3c88 with SMTP id v24-20020a1709028d9800b001898e393c88mr19470197plo.102.1669891797955;
        Thu, 01 Dec 2022 02:49:57 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id 4-20020a630804000000b004785a63b44bsm2320580pgi.43.2022.12.01.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 02:49:57 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	asahi@lists.linux.dev,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 3/3] KVM: arm64: Handle CCSIDR associativity mismatches
Date: Thu,  1 Dec 2022 19:49:14 +0900
Message-Id: <20221201104914.28944-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201104914.28944-1-akihiko.odaki@daynix.com>
References: <20221201104914.28944-1-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CCSIDR associativity mismatches among the physical CPUs causes a vCPU
see inconsistent values when it is migrated among physical CPUs.

It also makes QEMU fail restoring the vCPU registers because QEMU saves
and restores all of the registers including CCSIDRs, and if the vCPU
migrated among physical CPUs between saving and restoring, it tries to
restore CCSIDR values that mismatch with the current physical CPU, which
causes EFAULT.

Trap CCSIDRs if there are CCSIDR value msimatches, and override the
associativity bits when handling the trap.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 1 +
 arch/arm64/kvm/sys_regs.c            | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index b45cf8903190..df2bab867e12 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -64,6 +64,7 @@ static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
 static inline bool vcpu_cache_overridden(struct kvm_vcpu *vcpu)
 {
 	return cpus_have_const_cap(ARM64_MISMATCHED_CACHE_TYPE) ||
+	       cpus_have_const_cap(ARM64_MISMATCHED_CACHE_ASSOCIATIVITY) ||
 	       vcpu_el1_is_32bit(vcpu);
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 1f0cb015e81c..181a5b215a0e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -110,8 +110,13 @@ static u32 get_ccsidr(struct kvm_vcpu *vcpu, u32 csselr)
 	 * [If guests should attempt to infer aliasing properties from the
 	 * geometry (which is not permitted by the architecture), they would
 	 * only do so for virtually indexed caches.]
+	 *
+	 * This also makes sure the associativity bits of the CCSIDRs, including
+	 * the ones of CCSIDRs for instruction caches, are overridden when the
+	 * physical CPUs have a heterogeneous configuration so that a vCPU sees
+	 * the consistent values if it is migrated among physical CPUs.
 	 */
-	if (vcpu_cache_overridden(vcpu) && !(csselr & CSSELR_IN)) // data or unified cache
+	if (vcpu_cache_overridden(vcpu))
 		ccsidr &= ~CCSIDR_ASSOCIATIVITY_BITS_MASK;
 
 	return ccsidr;
-- 
2.38.1

