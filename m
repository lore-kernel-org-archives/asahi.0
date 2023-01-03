Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CC79C5
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:13:22 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so31210039pjo.3
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 06:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tA+HY8C9FhGSClROg8ZMyX/bN+ae+//jUNHibPXNHtk=;
        b=e8S/eCAuJpO1vq0OTgX0MCq6k8FTGDeMflkER6JG9mzjFQBwQN+ux9kJ5KvRgCWvCI
         zmDac8Fykb468GOgbi3eEypP4PfnjYissLl2oscCEN2pKKsLzW50qzmQVgp9FHvH/T+d
         JoO7TkceGYpYB05CPU4IGVpNvpfgYg5myVJkA1faR6r5LwVDteuF3UyuiB//1Eoii4Lv
         aDIV3uinCDiy6NhBRijPat60fllKkSiQNaLeglOzEFbTjVwfzfvV49i9TIbu19/k+o2k
         CCsYlcgYZARsVHXmTpphgjSXo8wjsXSbYKb69+r7/yZ1+ToQMgbGf6HqkGX7VwhrCyGJ
         qVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tA+HY8C9FhGSClROg8ZMyX/bN+ae+//jUNHibPXNHtk=;
        b=HWKU1EFBbZmMAkBP4B6PXFPMo0WwRiojTSrUgKZ6aaWVfpy04cCO8LvTTaeAXvqlOu
         yBWuw5ddZSJgVSXAfR+PfGkUgze7h8uZywIPJNL9ZlxC/iGf+HJDR89KKm0rPoY8EymR
         KH4qxvsopLC6e0mHuYg9gX9axa4hQvUSnNfLhEu63gF/nI9WHXnIss9f0nFwO8Ltx3MT
         nP0YwIcsdJC2p7zsdc9Xcu7THxBjiDMjrnORdQHbOvkajSvHcYPXKlUFdPuL/hfAEuAH
         WCvsunwUwby6OXm3RrAOHo2O79cFZZUx5lJX1Oyp8aL5P8Pd4m45GF/XtBgi2mpoKRjV
         pOWQ==
X-Gm-Message-State: AFqh2kp5L7k7KW5g8NClw31DfMS0EwuLzUqgZbjSzBqUFeM0raYmdMRR
	MWCOGxihhSIe3Wtn6WKPM0Vh+w==
X-Google-Smtp-Source: AMrXdXttulaHXcvtyTZblGi3ROW8f6QP7p+1BvSxpVJOFGVwEIZH9pfk0MjT85E2Exag8m8UG17POg==
X-Received: by 2002:a17:903:251:b0:192:9369:b2fe with SMTP id j17-20020a170903025100b001929369b2femr23780552plh.38.1672755201511;
        Tue, 03 Jan 2023 06:13:21 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:13:20 -0800 (PST)
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
Subject: [PATCH v16 9/9] irqchip/apple-aic: Move over to core ipi-mux
Date: Tue,  3 Jan 2023 19:42:21 +0530
Message-Id: <20230103141221.772261-10-apatel@ventanamicro.com>
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

From: Marc Zyngier <maz@kernel.org>

Now that the complexity of the AIC IPI mux has been copied into
the core code for the benefit of the riscv architecture,
shrink the AIC driver by the same amount by using that infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Acked-by: Hector Martin <marcan@marcan.st>
---
 drivers/irqchip/Kconfig         |   1 +
 drivers/irqchip/irq-apple-aic.c | 161 ++------------------------------
 2 files changed, 9 insertions(+), 153 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0e3a7749d87c..9e65345ca3f6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -659,6 +659,7 @@ config APPLE_AIC
 	bool "Apple Interrupt Controller (AIC)"
 	depends on ARM64
 	depends on ARCH_APPLE || COMPILE_TEST
+	select GENERIC_IRQ_IPI_MUX
 	help
 	  Support for the Apple Interrupt Controller found on Apple Silicon SoCs,
 	  such as the M1.
diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index ae3437f03e6c..eabb3b92965b 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -292,7 +292,6 @@ struct aic_irq_chip {
 	void __iomem *base;
 	void __iomem *event;
 	struct irq_domain *hw_domain;
-	struct irq_domain *ipi_domain;
 	struct {
 		cpumask_t aff;
 	} *fiq_aff[AIC_NR_FIQ];
@@ -307,9 +306,6 @@ struct aic_irq_chip {
 
 static DEFINE_PER_CPU(uint32_t, aic_fiq_unmasked);
 
-static DEFINE_PER_CPU(atomic_t, aic_vipi_flag);
-static DEFINE_PER_CPU(atomic_t, aic_vipi_enable);
-
 static struct aic_irq_chip *aic_irqc;
 
 static void aic_handle_ipi(struct pt_regs *regs);
@@ -751,98 +747,8 @@ static void aic_ipi_send_fast(int cpu)
 	isb();
 }
 
-static void aic_ipi_mask(struct irq_data *d)
-{
-	u32 irq_bit = BIT(irqd_to_hwirq(d));
-
-	/* No specific ordering requirements needed here. */
-	atomic_andnot(irq_bit, this_cpu_ptr(&aic_vipi_enable));
-}
-
-static void aic_ipi_unmask(struct irq_data *d)
-{
-	struct aic_irq_chip *ic = irq_data_get_irq_chip_data(d);
-	u32 irq_bit = BIT(irqd_to_hwirq(d));
-
-	atomic_or(irq_bit, this_cpu_ptr(&aic_vipi_enable));
-
-	/*
-	 * The atomic_or() above must complete before the atomic_read()
-	 * below to avoid racing aic_ipi_send_mask().
-	 */
-	smp_mb__after_atomic();
-
-	/*
-	 * If a pending vIPI was unmasked, raise a HW IPI to ourselves.
-	 * No barriers needed here since this is a self-IPI.
-	 */
-	if (atomic_read(this_cpu_ptr(&aic_vipi_flag)) & irq_bit) {
-		if (static_branch_likely(&use_fast_ipi))
-			aic_ipi_send_fast(smp_processor_id());
-		else
-			aic_ic_write(ic, AIC_IPI_SEND, AIC_IPI_SEND_CPU(smp_processor_id()));
-	}
-}
-
-static void aic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
-{
-	struct aic_irq_chip *ic = irq_data_get_irq_chip_data(d);
-	u32 irq_bit = BIT(irqd_to_hwirq(d));
-	u32 send = 0;
-	int cpu;
-	unsigned long pending;
-
-	for_each_cpu(cpu, mask) {
-		/*
-		 * This sequence is the mirror of the one in aic_ipi_unmask();
-		 * see the comment there. Additionally, release semantics
-		 * ensure that the vIPI flag set is ordered after any shared
-		 * memory accesses that precede it. This therefore also pairs
-		 * with the atomic_fetch_andnot in aic_handle_ipi().
-		 */
-		pending = atomic_fetch_or_release(irq_bit, per_cpu_ptr(&aic_vipi_flag, cpu));
-
-		/*
-		 * The atomic_fetch_or_release() above must complete before the
-		 * atomic_read() below to avoid racing aic_ipi_unmask().
-		 */
-		smp_mb__after_atomic();
-
-		if (!(pending & irq_bit) &&
-		    (atomic_read(per_cpu_ptr(&aic_vipi_enable, cpu)) & irq_bit)) {
-			if (static_branch_likely(&use_fast_ipi))
-				aic_ipi_send_fast(cpu);
-			else
-				send |= AIC_IPI_SEND_CPU(cpu);
-		}
-	}
-
-	/*
-	 * The flag writes must complete before the physical IPI is issued
-	 * to another CPU. This is implied by the control dependency on
-	 * the result of atomic_read_acquire() above, which is itself
-	 * already ordered after the vIPI flag write.
-	 */
-	if (send)
-		aic_ic_write(ic, AIC_IPI_SEND, send);
-}
-
-static struct irq_chip ipi_chip = {
-	.name = "AIC-IPI",
-	.irq_mask = aic_ipi_mask,
-	.irq_unmask = aic_ipi_unmask,
-	.ipi_send_mask = aic_ipi_send_mask,
-};
-
-/*
- * IPI IRQ domain
- */
-
 static void aic_handle_ipi(struct pt_regs *regs)
 {
-	int i;
-	unsigned long enabled, firing;
-
 	/*
 	 * Ack the IPI. We need to order this after the AIC event read, but
 	 * that is enforced by normal MMIO ordering guarantees.
@@ -857,27 +763,7 @@ static void aic_handle_ipi(struct pt_regs *regs)
 		aic_ic_write(aic_irqc, AIC_IPI_ACK, AIC_IPI_OTHER);
 	}
 
-	/*
-	 * The mask read does not need to be ordered. Only we can change
-	 * our own mask anyway, so no races are possible here, as long as
-	 * we are properly in the interrupt handler (which is covered by
-	 * the barrier that is part of the top-level AIC handler's readl()).
-	 */
-	enabled = atomic_read(this_cpu_ptr(&aic_vipi_enable));
-
-	/*
-	 * Clear the IPIs we are about to handle. This pairs with the
-	 * atomic_fetch_or_release() in aic_ipi_send_mask(), and needs to be
-	 * ordered after the aic_ic_write() above (to avoid dropping vIPIs) and
-	 * before IPI handling code (to avoid races handling vIPIs before they
-	 * are signaled). The former is taken care of by the release semantics
-	 * of the write portion, while the latter is taken care of by the
-	 * acquire semantics of the read portion.
-	 */
-	firing = atomic_fetch_andnot(enabled, this_cpu_ptr(&aic_vipi_flag)) & enabled;
-
-	for_each_set_bit(i, &firing, AIC_NR_SWIPI)
-		generic_handle_domain_irq(aic_irqc->ipi_domain, i);
+	ipi_mux_process();
 
 	/*
 	 * No ordering needed here; at worst this just changes the timing of
@@ -887,55 +773,24 @@ static void aic_handle_ipi(struct pt_regs *regs)
 		aic_ic_write(aic_irqc, AIC_IPI_MASK_CLR, AIC_IPI_OTHER);
 }
 
-static int aic_ipi_alloc(struct irq_domain *d, unsigned int virq,
-			 unsigned int nr_irqs, void *args)
+static void aic_ipi_send_single(unsigned int cpu)
 {
-	int i;
-
-	for (i = 0; i < nr_irqs; i++) {
-		irq_set_percpu_devid(virq + i);
-		irq_domain_set_info(d, virq + i, i, &ipi_chip, d->host_data,
-				    handle_percpu_devid_irq, NULL, NULL);
-	}
-
-	return 0;
-}
-
-static void aic_ipi_free(struct irq_domain *d, unsigned int virq, unsigned int nr_irqs)
-{
-	/* Not freeing IPIs */
+	if (static_branch_likely(&use_fast_ipi))
+		aic_ipi_send_fast(cpu);
+	else
+		aic_ic_write(aic_irqc, AIC_IPI_SEND, AIC_IPI_SEND_CPU(cpu));
 }
 
-static const struct irq_domain_ops aic_ipi_domain_ops = {
-	.alloc = aic_ipi_alloc,
-	.free = aic_ipi_free,
-};
-
 static int __init aic_init_smp(struct aic_irq_chip *irqc, struct device_node *node)
 {
-	struct irq_domain *ipi_domain;
 	int base_ipi;
 
-	ipi_domain = irq_domain_create_linear(irqc->hw_domain->fwnode, AIC_NR_SWIPI,
-					      &aic_ipi_domain_ops, irqc);
-	if (WARN_ON(!ipi_domain))
-		return -ENODEV;
-
-	ipi_domain->flags |= IRQ_DOMAIN_FLAG_IPI_SINGLE;
-	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
-
-	base_ipi = __irq_domain_alloc_irqs(ipi_domain, -1, AIC_NR_SWIPI,
-					   NUMA_NO_NODE, NULL, false, NULL);
-
-	if (WARN_ON(!base_ipi)) {
-		irq_domain_remove(ipi_domain);
+	base_ipi = ipi_mux_create(AIC_NR_SWIPI, aic_ipi_send_single);
+	if (WARN_ON(base_ipi <= 0))
 		return -ENODEV;
-	}
 
 	set_smp_ipi_range(base_ipi, AIC_NR_SWIPI);
 
-	irqc->ipi_domain = ipi_domain;
-
 	return 0;
 }
 
-- 
2.34.1

