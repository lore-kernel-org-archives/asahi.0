Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257EF79C5
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:12:34 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id m4so32714526pls.4
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 06:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyb5UZmjqbSglyHq6r1Nzt+FNrL5pLsd5/wqWYrsn7o=;
        b=MVCVmUrIbO1VkHOy6G+ik1NaYZi10V9JE3tWLEE5t0WPN2ARSCJeDL5nyw82EO2+jP
         79mMWBQGUpAGirreRy2IrdhtviwOutMfQ3L2eFBgg1XoeU4WyFKzc/Dn1Qj3BOgv7gzA
         uCHoxqSoHIFFLACljAcNgIbp5YCEtPz6AFbgzVmRCJAs0M1PXq9NbECEK7Sy3hyW92/n
         xEAsv041ydx14RDSQ+VmsCyOlppIziyB5acUx4+f/jbFSj7YXiUR+G3U/YvodN6Ta+jC
         mFCfdxkWfZy92koSHui5p97vZEcjYFjDaXb0GKkr8yB3lacxzTtlEg3aDFoFHeC0NDr4
         hQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyb5UZmjqbSglyHq6r1Nzt+FNrL5pLsd5/wqWYrsn7o=;
        b=tmNIpdFxaq42a+3PtbSvui6KT2GWpbDgfVEDrCkPSTNsY3N5EhzZW7x8kt5oiAEjmw
         FO17+w/VWpZ5qQu2ZYOq79S4XNOfQ6S/Mybne7Gn/F5m3guzycuAjoPQrFKzF5xSEhsM
         NwRa9iRmqAnpj6vSdemyQYqbV+3C3cYpFp/PjCXVj0poc1Nj1LFKLfYwbZ3i1MzB3nJ7
         aJxFPI25Gjm1qWkEv4ntyQtwJiPlYOF/nn8y5sMoFZ6qhDd5nXYigxF2GcjOV/wjT4Ob
         QtWCMGo1bxyB/8UvZU8kGnU+nl54X0hz+mVFzJKLagfThM1ynf3AP5ntRJT31B4XV03t
         PMdg==
X-Gm-Message-State: AFqh2krmOVlLnwhTCKuJea3iwCGdJdDuwzUvWtlX8YN5ykfGWe2uwdqC
	ikbTuBVJUvJ7WdAMmPOtIeWyNQ==
X-Google-Smtp-Source: AMrXdXt9XAL8mDZKeKxm0HEUIYZpawBW2fTvd+ApDH2SU0c1SSvMhmWzoEOvZWdWMeM+TnIVtL3Rjw==
X-Received: by 2002:a17:902:f54a:b0:191:327d:ddc0 with SMTP id h10-20020a170902f54a00b00191327dddc0mr70794879plf.21.1672755153390;
        Tue, 03 Jan 2023 06:12:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:12:32 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v16 0/9] RISC-V IPI Improvements
Date: Tue,  3 Jan 2023 19:42:12 +0530
Message-Id: <20230103141221.772261-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to improve IPI support in Linux RISC-V in following ways:
 1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
    specific hooks. This also makes Linux RISC-V IPI support aligned with
    other architectures.
 2) Remote TLB flushes and icache flushes should prefer local IPIs instead
    of SBI calls whenever we have specialized hardware (such as RISC-V AIA
    IMSIC and RISC-V SWI) which allows S-mode software to directly inject
    IPIs without any assistance from M-mode runtime firmware.

These patches were originally part of the "Linux RISC-V ACLINT Support"
series but this now a separate series so that it can be merged independently
of the "Linux RISC-V ACLINT Support" series.
(Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)

These patches are also a preparatory patches for the up-coming:
 1) Linux RISC-V AIA support
 2) Linux RISC-V SWI support

These patches can also be found in riscv_ipi_imp_v16 branch at:
https://github.com/avpatel/linux.git

Changes since v15:
 - Rebased on Linux-6.2-rc2
 - Added Reviewed-by and Tested-by tags to some of the patches.

Changes since v14:
 - Minor fixes in commit description of PATCH3 (as suggested by tglx)
 - Don't disable parent IPI when CPU goes offline for SBI IPI driver and
   CLINT driver in PATCH4.
 - Include Apple AIC driver changes from Marc Z as PATCH9

Changes since v13:
 - Included changes suggested by Marc Z in PATCH3
 - Use chained handlers in PATCH4
 - Added new PATCH8 to have empty irq_eoi() in RISC-V INTC driver. This
   avoids the unnecessary mask/unmask dance at time of handling interrupts.

Changes since v12:
 - Rebased on Linux-6.1-rc7
 - Bring-back the IPI optimization in ipi_mux_send_mask() for PATCH3
 - Call ipi_mux_send() for one target CPU at a time in PATCH3

Changes since v11:
 - Removed ipi_mux_pre/post_handle() callbacks in PATCH3
 - Removed sturct ipi_mux_ops in PATCH3
 - Removed parent_virq and data pointer from everywhere in PATCH3
 - Removed struct ipi_mux_control in PATCH3
 - Improved function signature of ipi_mux_send() callback in PATCH3
 - Used unsigned type with atomic operation in PATCH3

Changes since v10:
 - Rebased on Linux-6.1-rc5
 - Drop the "!(pending & ibit)" check in ipi_mux_send_mask() of PATCH3
 - Disable local interrupts in ipi_mux_send_mask() of PATCH3 because we
   can be preempted while using a per-CPU temporary variable.

Changes since v9:
 - Rebased on Linux-6.1-rc3
 - Updated header comment block of ipi-mux.c in PATCH3
 - Use a struct for global data of ipi-mux.c in PATCH3
 - Add per-CPU temp cpumask for sending IPIs in PATCH3
 - Drop the use of fwspec in PATCH3
 - Use static key for ipi_mux_pre_handle() and ipi_mux_post_handle()
   in PATCH3
 - Remove redundant pr_warn_ratelimited() called by ipi_mux_process()
   in PATCH3
 - Remove CPUHP thingy from ipi_mux_create() in PATCH3

Changes since v8:
 - Rebased on Linux-6.0-rc3
 - Use dummy percpu data as parameter for request_percpu_irq() in PATCH4.

Changes since v7:
 - Rebased on Linux-6.0-rc1
 - Use atomic operations to track per-CPU pending and enabled IPIs in PATCH3.
   (Note: this is inspired from IPI muxing implemented in
    drivers/irqchip/irq-apple-aic.c)
 - Made "struct ipi_mux_ops" (added by PATCH3) flexible so that
   drivers/irqchip/irq-apple-aic.c can adopt it in future.

Changes since v6:
 - Rebased on Linux-5.19-rc7
 - Added documentation for struct ipi_mux_ops in PATCH3
 - Dropped dummy irq_mask()/unmask() in PATCH3
 - Added const for "ipi_mux_chip" in PATCH3
 - Removed "type" initialization from ipi_mux_domain_alloc() in PATCH3
 - Dropped translate() from "ipi_mux_domain_ops" in PATCH3
 - Improved barrier documentation in ipi_mux_process() of PATCH3
 - Added percpu check in ipi_mux_create() for parent_virq of PATCH3
 - Added nr_ipi parameter in ipi_mux_create() of PATCH3

Changes since v5:
 - Rebased on Linux-5.18-rc3
 - Used kernel doc style in PATCH3
 - Removed redundant loop in ipi_mux_process() of PATCH3
 - Removed "RISC-V" prefix form ipi_mux_chip.name of PATCH3
 - Removed use of "this patch" in PATCH3 commit description
 - Addressed few other nit comments in PATCH3

Changes since v4:
 - Rebased on Linux-5.17
 - Includes new PATCH3 which adds mechanism to multiplex a single HW IPI

Changes since v3:
 - Rebased on Linux-5.17-rc6
 - Updated PATCH2 to not export riscv_set_intc_hwnode_fn()
 - Simplified riscv_intc_hwnode() in PATCH2

Changes since v2:
 - Rebased on Linux-5.17-rc4
 - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
   a function which allows drivers to directly discover INTC fwnode

Changes since v1:
 - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2

Anup Patel (8):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
  genirq: Add mechanism to multiplex a single HW IPI
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  RISC-V: Use IPIs for remote icache flush when possible
  irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers

Marc Zyngier (1):
  irqchip/apple-aic: Move over to core ipi-mux

 arch/riscv/Kconfig                |   2 +
 arch/riscv/include/asm/irq.h      |   4 +
 arch/riscv/include/asm/sbi.h      |   9 +-
 arch/riscv/include/asm/smp.h      |  49 +++++--
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/irq.c           |  21 ++-
 arch/riscv/kernel/sbi-ipi.c       |  77 +++++++++++
 arch/riscv/kernel/sbi.c           | 100 +++------------
 arch/riscv/kernel/smp.c           | 171 ++++++++++++------------
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/mm/cacheflush.c        |   5 +-
 arch/riscv/mm/tlbflush.c          |  93 +++++++++++---
 drivers/clocksource/timer-clint.c |  65 +++++++---
 drivers/irqchip/Kconfig           |   2 +
 drivers/irqchip/irq-apple-aic.c   | 161 ++---------------------
 drivers/irqchip/irq-riscv-intc.c  |  71 ++++++----
 include/linux/irq.h               |   3 +
 kernel/irq/Kconfig                |   5 +
 kernel/irq/Makefile               |   1 +
 kernel/irq/ipi-mux.c              | 207 ++++++++++++++++++++++++++++++
 21 files changed, 654 insertions(+), 401 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 kernel/irq/ipi-mux.c

-- 
2.34.1

