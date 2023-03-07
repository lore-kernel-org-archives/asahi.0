Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AFABA36
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 17:33:17 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u5so14898922plq.7
        for <asahi@lists.linux.dev>; Tue, 07 Mar 2023 09:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYuh0nFD6NwJIy6fdJnMZv8jO7haLudDJ7hSHLvipCc=;
        b=N2sFEe/DZOOTmqQ2KzWbAd49gMYYEl4qwuPAnxCNlwsSipJ8FFFI+ST1vElZCapdAs
         cPmu+dy2+lyzcCJ2JNdQ26ckeV4hwzFjK6OSbM+hXMZRbio5Fh2cHzjlpwMbt/XkbaS3
         jwONdr4SDUyNegp3VWRHtXioT2NcyzSecpSZzS0JNoYY7XxURKSZkUZt4ODxMeSoEXLF
         pzIldFU6uiBLhu4k9yqIcbX9k5NDnqkaTUbQwnOV6/xHaANYJnA5ShLR8Mmq1mTIlw/Q
         oPQfsf3ksa9STouiRNdQq9w6/V5Fh7zIBKTjhL513ErYBJewsXw2iMYxEQZOKYkqlkZ8
         J2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYuh0nFD6NwJIy6fdJnMZv8jO7haLudDJ7hSHLvipCc=;
        b=kmzxGnGQaCxdAXKCDYs1fjvjg2kYo24YUuF2GVF+mIzbI01jNSFbpQELEZwo0aJSAV
         q4yhdSnJzbUX6bVAa/DWtr2ZuJa9W1mliZEeuv/xTAApF9tvDLCdgfXA4CvWdbAakBo4
         ea0vuaevVCD5wTTmwOAN5GHoY0lQab2YK1WWlmn7wGKQfRK3f5NIFT50ggYi2tuRmW2G
         jzbzAV5KGpczUVSnveSfcpLclJML8V8gJ89vMqr0YTPtBFnBdv600/yu0zRgdFEOV8pS
         x6pFnA5dh6LExRzHWk+reO0ncAog0x0Tmnard/1IwPXezoBCtZ/8ihhbV4nrOq1oljd6
         CysA==
X-Gm-Message-State: AO0yUKWQfxT90aEx83f7Vqfb/jAnQtGXjF8oTwDR2iHP8myPmVkXxxJg
	ErHixMwvZii6ypPV5u7AYznopg==
X-Google-Smtp-Source: AK7set+kdtB7oESn7B1ADnlc2IIgT0MPiKeaKW9YLHpupL+avmlsX8ulisLCF4jrX2uLwkMDBwFDsA==
X-Received: by 2002:a05:6a20:1607:b0:cd:ed5c:4cd with SMTP id l7-20020a056a20160700b000cded5c04cdmr19219207pzj.6.1678210396664;
        Tue, 07 Mar 2023 09:33:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:33:16 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v17 6/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue,  7 Mar 2023 23:02:30 +0530
Message-Id: <20230307173231.2189275-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307173231.2189275-1-apatel@ventanamicro.com>
References: <20230307173231.2189275-1-apatel@ventanamicro.com>
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index fcd6145fbead..20cec5e7cdbf 100644
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

