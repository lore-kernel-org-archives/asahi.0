Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465812CA4
	for <asahi@lists.linux.dev>; Thu, 12 Jan 2023 12:17:59 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id n190so14941211vsc.11
        for <asahi@lists.linux.dev>; Thu, 12 Jan 2023 04:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3tzazKC6UXrwpt+mRZpio8Zio90a1gncXEmmy1/qn/g=;
        b=QXlPITpkSBUCEI5PoA2+D1w5R31w2E9UbHxWtXDXbfYMorSMtVl2qN3Z8MMbrMJ5aW
         Yxvk8A51ReEndAKVQumpL4ikqZwUwsv4dregUnMnYam1vBf0PoX4hkl5Lkgygw93FdGJ
         rIJGCOvloN+aBmV5R4zCbSLkkKOiyAN6iBa+9GUQaFTWyDXil5fE89pF+oBjAcbbxqiF
         hVho69zfR+sXxEKp3Z9rze+N6V1bpWljabVNqaSMzL1Hn9AlWVPtC25ZYrHTBjiUd6PK
         4G9VKoUnCqFy/24KFbTkI5g3UGwqw+43eOLotgOJC3PfnomJZjSL56Ee2KysnE4/+85t
         a15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tzazKC6UXrwpt+mRZpio8Zio90a1gncXEmmy1/qn/g=;
        b=VclFGI/BFID0lyf1jpW6nDsflNB6/+Es7G1WnASUC2qyoZHUDxf3em7kDw/FDXJnKh
         +1YZEZQtbui40WRkC3DaeRXgnYSl/IbxDQT6E5aFsNW/mGDk4kQAUs62m7PNG4tKTbC5
         Yczs2sAJexFPERi6X2XgDKaFGhVTorvrr1HWfttC1lZHWTXmvFapV4xfAPDdBR5Xq3Om
         9w/B/Pn0AMN2+uL0ADblHCVt8SBnsp6/ZJJ25TeD+STGYwZnssd3JNlqklm7s/xKzmlA
         Fzs1BvVTrlxO8JOx5hqPgyYVxjPa/Ufz/O/vRB7/4sckxfP+Io3zbmZUrkzGWCmCr0m7
         CL8Q==
X-Gm-Message-State: AFqh2krSOCdpXjWEdf/dtcV1yr7QBRG+n+Yp4X2iJGXxw9H+ZNrF5uhk
	GaFVWauOsWWZJ+VGuCSkQFXHU05SZy2vt/M07G9IgA==
X-Google-Smtp-Source: AMrXdXucRzPqSaF6fjxdoZsnYmh5ovtHrFeYajzaE4TFaByulKl8AaOZpfHGaOX/PwC9fYz+dvd95VOrgKkXOamPiIo=
X-Received: by 2002:a05:6102:55aa:b0:3be:ea71:5aaa with SMTP id
 dc42-20020a05610255aa00b003beea715aaamr10408899vsb.0.1673525878036; Thu, 12
 Jan 2023 04:17:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230103141221.772261-1-apatel@ventanamicro.com>
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Jan 2023 17:47:46 +0530
Message-ID: <CAK9=C2X+BOVxvjkP=SHYywkFxh+4BnAbZ5_uH6rNJ_vB8_3mkg@mail.gmail.com>
Subject: Re: [PATCH v16 0/9] RISC-V IPI Improvements
To: Marc Zyngier <maz@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, Jan 3, 2023 at 7:42 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series aims to improve IPI support in Linux RISC-V in following ways:
>  1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
>     specific hooks. This also makes Linux RISC-V IPI support aligned with
>     other architectures.
>  2) Remote TLB flushes and icache flushes should prefer local IPIs instead
>     of SBI calls whenever we have specialized hardware (such as RISC-V AIA
>     IMSIC and RISC-V SWI) which allows S-mode software to directly inject
>     IPIs without any assistance from M-mode runtime firmware.
>
> These patches were originally part of the "Linux RISC-V ACLINT Support"
> series but this now a separate series so that it can be merged independently
> of the "Linux RISC-V ACLINT Support" series.
> (Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)
>
> These patches are also a preparatory patches for the up-coming:
>  1) Linux RISC-V AIA support
>  2) Linux RISC-V SWI support
>
> These patches can also be found in riscv_ipi_imp_v16 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v15:
>  - Rebased on Linux-6.2-rc2
>  - Added Reviewed-by and Tested-by tags to some of the patches.
>
> Changes since v14:
>  - Minor fixes in commit description of PATCH3 (as suggested by tglx)
>  - Don't disable parent IPI when CPU goes offline for SBI IPI driver and
>    CLINT driver in PATCH4.
>  - Include Apple AIC driver changes from Marc Z as PATCH9
>
> Changes since v13:
>  - Included changes suggested by Marc Z in PATCH3
>  - Use chained handlers in PATCH4
>  - Added new PATCH8 to have empty irq_eoi() in RISC-V INTC driver. This
>    avoids the unnecessary mask/unmask dance at time of handling interrupts.
>
> Changes since v12:
>  - Rebased on Linux-6.1-rc7
>  - Bring-back the IPI optimization in ipi_mux_send_mask() for PATCH3
>  - Call ipi_mux_send() for one target CPU at a time in PATCH3
>
> Changes since v11:
>  - Removed ipi_mux_pre/post_handle() callbacks in PATCH3
>  - Removed sturct ipi_mux_ops in PATCH3
>  - Removed parent_virq and data pointer from everywhere in PATCH3
>  - Removed struct ipi_mux_control in PATCH3
>  - Improved function signature of ipi_mux_send() callback in PATCH3
>  - Used unsigned type with atomic operation in PATCH3
>
> Changes since v10:
>  - Rebased on Linux-6.1-rc5
>  - Drop the "!(pending & ibit)" check in ipi_mux_send_mask() of PATCH3
>  - Disable local interrupts in ipi_mux_send_mask() of PATCH3 because we
>    can be preempted while using a per-CPU temporary variable.
>
> Changes since v9:
>  - Rebased on Linux-6.1-rc3
>  - Updated header comment block of ipi-mux.c in PATCH3
>  - Use a struct for global data of ipi-mux.c in PATCH3
>  - Add per-CPU temp cpumask for sending IPIs in PATCH3
>  - Drop the use of fwspec in PATCH3
>  - Use static key for ipi_mux_pre_handle() and ipi_mux_post_handle()
>    in PATCH3
>  - Remove redundant pr_warn_ratelimited() called by ipi_mux_process()
>    in PATCH3
>  - Remove CPUHP thingy from ipi_mux_create() in PATCH3
>
> Changes since v8:
>  - Rebased on Linux-6.0-rc3
>  - Use dummy percpu data as parameter for request_percpu_irq() in PATCH4.
>
> Changes since v7:
>  - Rebased on Linux-6.0-rc1
>  - Use atomic operations to track per-CPU pending and enabled IPIs in PATCH3.
>    (Note: this is inspired from IPI muxing implemented in
>     drivers/irqchip/irq-apple-aic.c)
>  - Made "struct ipi_mux_ops" (added by PATCH3) flexible so that
>    drivers/irqchip/irq-apple-aic.c can adopt it in future.
>
> Changes since v6:
>  - Rebased on Linux-5.19-rc7
>  - Added documentation for struct ipi_mux_ops in PATCH3
>  - Dropped dummy irq_mask()/unmask() in PATCH3
>  - Added const for "ipi_mux_chip" in PATCH3
>  - Removed "type" initialization from ipi_mux_domain_alloc() in PATCH3
>  - Dropped translate() from "ipi_mux_domain_ops" in PATCH3
>  - Improved barrier documentation in ipi_mux_process() of PATCH3
>  - Added percpu check in ipi_mux_create() for parent_virq of PATCH3
>  - Added nr_ipi parameter in ipi_mux_create() of PATCH3
>
> Changes since v5:
>  - Rebased on Linux-5.18-rc3
>  - Used kernel doc style in PATCH3
>  - Removed redundant loop in ipi_mux_process() of PATCH3
>  - Removed "RISC-V" prefix form ipi_mux_chip.name of PATCH3
>  - Removed use of "this patch" in PATCH3 commit description
>  - Addressed few other nit comments in PATCH3
>
> Changes since v4:
>  - Rebased on Linux-5.17
>  - Includes new PATCH3 which adds mechanism to multiplex a single HW IPI
>
> Changes since v3:
>  - Rebased on Linux-5.17-rc6
>  - Updated PATCH2 to not export riscv_set_intc_hwnode_fn()
>  - Simplified riscv_intc_hwnode() in PATCH2
>
> Changes since v2:
>  - Rebased on Linux-5.17-rc4
>  - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
>    a function which allows drivers to directly discover INTC fwnode
>
> Changes since v1:
>  - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2
>
> Anup Patel (8):
>   RISC-V: Clear SIP bit only when using SBI IPI operations
>   irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
>   genirq: Add mechanism to multiplex a single HW IPI
>   RISC-V: Treat IPIs as normal Linux IRQs
>   RISC-V: Allow marking IPIs as suitable for remote FENCEs
>   RISC-V: Use IPIs for remote TLB flush when possible
>   RISC-V: Use IPIs for remote icache flush when possible
>   irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
>
> Marc Zyngier (1):
>   irqchip/apple-aic: Move over to core ipi-mux
>
>  arch/riscv/Kconfig                |   2 +
>  arch/riscv/include/asm/irq.h      |   4 +
>  arch/riscv/include/asm/sbi.h      |   9 +-
>  arch/riscv/include/asm/smp.h      |  49 +++++--
>  arch/riscv/kernel/Makefile        |   1 +
>  arch/riscv/kernel/cpu-hotplug.c   |   3 +-
>  arch/riscv/kernel/irq.c           |  21 ++-
>  arch/riscv/kernel/sbi-ipi.c       |  77 +++++++++++
>  arch/riscv/kernel/sbi.c           | 100 +++------------
>  arch/riscv/kernel/smp.c           | 171 ++++++++++++------------
>  arch/riscv/kernel/smpboot.c       |   5 +-
>  arch/riscv/mm/cacheflush.c        |   5 +-
>  arch/riscv/mm/tlbflush.c          |  93 +++++++++++---
>  drivers/clocksource/timer-clint.c |  65 +++++++---
>  drivers/irqchip/Kconfig           |   2 +
>  drivers/irqchip/irq-apple-aic.c   | 161 ++---------------------
>  drivers/irqchip/irq-riscv-intc.c  |  71 ++++++----
>  include/linux/irq.h               |   3 +
>  kernel/irq/Kconfig                |   5 +
>  kernel/irq/Makefile               |   1 +
>  kernel/irq/ipi-mux.c              | 207 ++++++++++++++++++++++++++++++
>  21 files changed, 654 insertions(+), 401 deletions(-)
>  create mode 100644 arch/riscv/kernel/sbi-ipi.c
>  create mode 100644 kernel/irq/ipi-mux.c
>
> --
> 2.34.1
>

Friendly ping ?

Regards,
Anup
