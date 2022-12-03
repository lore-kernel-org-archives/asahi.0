Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2E7B
	for <asahi@lists.linux.dev>; Sat,  3 Dec 2022 06:47:26 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id cm20so6850752pjb.1
        for <asahi@lists.linux.dev>; Fri, 02 Dec 2022 22:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=O1HUEM1kuxlKgxDRZksTgkWxBmPSc8Nvnep6Fo8qupSeofGZxZUQZdS8cTjKMT/FB/
         /6w/3YB0RPnYvp+juqh71xwtrmU59lnIqNM+yI9s8p4QBfPcTiyKSNtgFvehf3aSag3T
         B1tOvPMsZih20BjojFJO/eAZn1wsgQ05BiwtQk3ypqOv6ViBTAU+7OcD0/ndsTTcabYo
         heP4OgXUBec8BfIe/9OMRANYtA3Hckw989gW1Bt94m1AlPzNYWFIL2J3BlfLZIC6fE+O
         d36vn8TnQ448DpYT+ooFjEH/shzIJNtuqtbIB/ORunx8GrtpTbz+0l3suOxftXeq2V/S
         29xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=rn9r0qmnHtjbVL2TbUNkG+I+Ya+Tp6L4Tar8djHitlgfyWiNMm4VrMRdVZt4bonF+Q
         DanCLRf8xDzXJjJUmxvvb7JfjuN5NG8i0P7ZlJO29XjZMjt7EhHwRfBoSRAljYWiSrlJ
         /7Pk0MmxdxL/U0n9mdx0oamfy/ZfgwxqCP0dDFSPRJvQZhrePUew9PtC5ZsZMfwES7ra
         UM20Up8QqRkSJ/n8/KRkKDSjCdVeJ7Dv8xccLImDIgcYoJd6izoaTt4AyVFghXNLfNVI
         4WLr/w83WT5JgzLxrggcaDEoq2hQrnuVSAVjA0oLYGHe7S0omouEDFmuvqIFVgd7fqbF
         AGCg==
X-Gm-Message-State: ANoB5plhu2OubFKjlRU95vruE7KCYIgMJ1bOlXCaWtimzSHM4WMPZXrN
	v2JzWyDq48W+1ubCn/xCEIpMsg==
X-Google-Smtp-Source: AA0mqf5KzIZeHr4Df/4XED36JfSJMBY/dITpOcWof+TBmvy8B1PfZ/Aa0huOQwFFhzU8hz5N03WIlg==
X-Received: by 2002:a17:90b:2541:b0:213:30c4:e803 with SMTP id nw1-20020a17090b254100b0021330c4e803mr83420155pjb.209.1670050045998;
        Fri, 02 Dec 2022 22:47:25 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79471000000b00575c8242849sm6102091pfq.69.2022.12.02.22.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 22:47:25 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v15 7/9] RISC-V: Use IPIs for remote icache flush when possible
Date: Sat,  3 Dec 2022 12:16:27 +0530
Message-Id: <20221203064629.1601299-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203064629.1601299-1-apatel@ventanamicro.com>
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 57b40a350420..f10cb47eac3a 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,7 +19,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.34.1

