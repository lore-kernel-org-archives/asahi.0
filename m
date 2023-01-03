Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D379C5
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:12:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id o2so27479622pjh.4
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 06:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=ag2VYZdi8sHLadDfTOWomK5QgMIp5UxmtALzG6C+VynD9m/7Y1X1UTRRMNa1SLWudR
         fsKqlD5togrJ6kiHvfsCqE121VmJzDJS4OvJpZT49IeV1uoNPMuy3lPB7mmhACLJ377C
         sSnhYyWZN3HBMbt3l4rlQWsYKweAVSL+AgdyQr6/jobS5f64v+Y/jJTHZopbYCZmGExD
         +ITdd8Wp5MEOBw17CkhiQDkBEdt9hL6zz/QfFan4eCTh4ufZMW+SEW+RirbywdY/cLgc
         mDZt0aeayvg/vFK0p78cMcIs7WgabCpHW+aYgYlFKLMgT2FvmzXhuQgPmfHbNlXLKxTp
         Voig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBh16wlKK1pVBXMjv15TuW7j92X6+xaNPp74Ke5cwzg=;
        b=gRQKhsko4lRDRAJFYSGuZ3IPwer91bjRs+jCiPnf4kMbn2oD22/vU1K4ApG+W1HItN
         uRnxTFq2U1osFZKjhCzvMDJ7uuaKf1iOGkf8zPA77y8jl7XabngCtMhKl0ZQtfwW8rm0
         vaPAwWiz5tb1Epcs9f5n+s8OFouK/Czy0++UVThtFlG1oSkGvCMn3RLUrL6ARLFrY8MB
         cm26Z15gKS9MLcKPxPojrxdPLo6uJQpHrbDmUmzbCKXEpJEHFxpILaiIiOqeRTEwqnRZ
         ogeQytQprxju/4CwyQlxkXWXOR0z57x5LCWm1RzcWXRFFv0WJjyZ7/g57Dli3Fx7GNKa
         f2iA==
X-Gm-Message-State: AFqh2kozpfh0aDXZBv3S8ipAK4ocBZfJyCaPCe8C7BVMDBadgbO2JHgb
	jD0zVT8mlne3hmq82YqvNXX39P9XehNUtlm0
X-Google-Smtp-Source: AMrXdXuLqYi4hbftZX6Ald4rvwIshOeG5B3xI5B05B6I0NSM8AMUySmbHh3I2kBz7X9fDRWmiUfGUg==
X-Received: by 2002:a17:902:b20b:b0:186:7a6b:24d9 with SMTP id t11-20020a170902b20b00b001867a6b24d9mr50119651plr.23.1672755164157;
        Tue, 03 Jan 2023 06:12:44 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:12:43 -0800 (PST)
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
Subject: [PATCH v16 2/9] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Tue,  3 Jan 2023 19:42:14 +0530
Message-Id: <20230103141221.772261-3-apatel@ventanamicro.com>
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

Various RISC-V drivers (such as SBI IPI, SBI Timer, SBI PMU, and
KVM RISC-V) don't have associated DT node but these drivers need
standard per-CPU (local) interrupts defined by the RISC-V privileged
specification.

We add riscv_get_intc_hwnode() in arch/riscv which allows RISC-V
drivers not having DT node to discover INTC hwnode which in-turn
helps these drivers to map per-CPU (local) interrupts provided
by the INTC driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/irq.h     |  4 ++++
 arch/riscv/kernel/irq.c          | 18 ++++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c |  7 +++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index e4c435509983..43b9ebfbd943 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,6 +12,10 @@
 
 #include <asm-generic/irq.h>
 
+void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
+
+struct fwnode_handle *riscv_get_intc_hwnode(void);
+
 extern void __init init_IRQ(void);
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7207fa08d78f..96d3171f0ca1 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -7,9 +7,27 @@
 
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
+static struct fwnode_handle *(*__get_intc_node)(void);
+
+void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void))
+{
+	__get_intc_node = fn;
+}
+
+struct fwnode_handle *riscv_get_intc_hwnode(void)
+{
+	if (__get_intc_node)
+		return __get_intc_node();
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
+
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	show_ipi_stats(p, prec);
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 499e5f81b3fe..9066467e99e4 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -92,6 +92,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
 	.xlate	= irq_domain_xlate_onecell,
 };
 
+static struct fwnode_handle *riscv_intc_hwnode(void)
+{
+	return intc_domain->fwnode;
+}
+
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
@@ -126,6 +131,8 @@ static int __init riscv_intc_init(struct device_node *node,
 		return rc;
 	}
 
+	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
+
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
 			  "irqchip/riscv/intc:starting",
 			  riscv_intc_cpu_starting,
-- 
2.34.1

