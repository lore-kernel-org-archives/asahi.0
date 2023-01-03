Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24979C5
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:13:11 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o2so27480810pjh.4
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l+i8uOcQCPjKaNrtjuOObll0B7/vooLhOJlMTFIbSo=;
        b=gBGy2J1w2sNV+FKC+CwdJral87hxtnjAvNKrX/I7Kx9XxFh1Rv51fQJYZ54uQYIS4B
         1tNxT5y1i3npT2XnNuRbkMyEQ6UCS60F7ECqvYbv2KKfqlDRWssFgN13KZXsyCnuVW6h
         ac5+UnnYYm1V6/zMXBm26gN2RzGkXdr9TNei2tXCQozIE6IsXk4lhqtYmMGuHOn3Yc31
         OzBdso1OdRcYYWVh6/o8XyArpoMuNJr7DRn1HXlWRCOhHMZLolGVNoF+0SwtbCopui7q
         FqvYYrBqonmUg1ooGXM9ltL6E42vT+Q+jZm8lFncGX3YoCneec+V8bs0a9pHM6/TcMNe
         F0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l+i8uOcQCPjKaNrtjuOObll0B7/vooLhOJlMTFIbSo=;
        b=XcD52Q9D/cKog1or1hinWZTtAS7r7D6vHnYjNNxuEtAD+yh54/l/CdwUGwTmgU62F7
         eakrOkd6Y7UPIh8d8fgvY6bOrSmwOiVwdSnrji0J38mOsTU8EUna//JcZ9iQrNxKIJuv
         TSw3VRpW79OHO2+zYse9C7f4Lk9JBUpqYAYVA9SU2AOGIXIqNVBm4Mawz/oQWkCtRWGY
         CxSIKjWVYMxoUYAR7Ec5NetJynhQClyd2/1KP5/SDQIW5bWp3dekfTpgIj4lXi0bGxat
         RWM0PcYwAvTcFWIzAwBQfvEH199O5TYpO7bC6Kp2ZA4fHwBkIrLxFFSS1aHTCNxqeRwl
         LjaA==
X-Gm-Message-State: AFqh2koY6/l/4o+d/mHyBvAbJncvEFlanz2QxQTPIsQXTKbbP7tPKYxf
	XBJ2iertDJDcWkubc2ciCttAqw==
X-Google-Smtp-Source: AMrXdXs3feqGr1SDeiC+wJOoPhGUm9jY6uwlop6e/pzHdUts4/koTGdcSOhacx6snIxjQ3SET/uLJw==
X-Received: by 2002:a17:902:e84c:b0:189:340c:20d2 with SMTP id t12-20020a170902e84c00b00189340c20d2mr71560778plg.23.1672755190683;
        Tue, 03 Jan 2023 06:13:10 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:13:10 -0800 (PST)
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
Subject: [PATCH v16 7/9] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue,  3 Jan 2023 19:42:19 +0530
Message-Id: <20230103141221.772261-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
References: <20230103141221.772261-1-apatel@ventanamicro.com>
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
index 3cc07ed45aeb..b093727494eb 100644
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

