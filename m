Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2DBA35
	for <asahi@lists.linux.dev>; Tue,  7 Mar 2023 17:32:56 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so17336756pjh.0
        for <asahi@lists.linux.dev>; Tue, 07 Mar 2023 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVwIHEbuY4DYODvnj/1FGLFLezToqvIrfjUoJVxDh6c=;
        b=AoRlJAGBZhMVE7ORktUZ4Da5vRc84ANuvFMlpFWBfgeEeuqVKZFYPt/Y2LiQwQTzp+
         OEhqUD/JXYAyQ83g9fxHppCl96V9W28Oj/4cMr5ioQ3B+3FbnXTQe58N3hU3ZMxXjLIN
         JS3s7Guz4sTEt22+3/V6GwyOs8oWLEQhJUNj04KvVWD0tjYj1V+f0aUsY9b93bhh7w8R
         O/ae2LRMsaNcY8Kl8Twzpih8PNU0QSGHDL0dG86Nn0kAtxMmuqdkKCAiOfafTi3liodL
         5MhM6T+1XWh3JxNRwyvA3PjVs1u/iQqzpnxJrTbe0nK2AhU4bRoQPMD1MdoTf6yD8+2Y
         8mgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVwIHEbuY4DYODvnj/1FGLFLezToqvIrfjUoJVxDh6c=;
        b=w+RfoiwjQBZEN/cdvs6AAvv/y46YpO8X7XY6iyFSt8F8kV7qz0ladpT1FOeQFKAFam
         Zl1BooaCVRWC+394/isszacQ8mMkv/7K+tgpVV4YagRv+33TSJiUBGaf/dXaWtAx/CTl
         AvZgknaNedeB6YODChUKUkyHXfPakOjimDUXWY/m0BYtth8eSq4BZEb9e1EXWOeaBCGl
         DpXyCfc7d4zw8+FQyxu/wa6rF/ADb/EtFnZr339KlpLcKD9NKaPha1fexVvWo1qd0UoS
         FroXilkASVB9q5QIbVWeSR1d8Cp11egHKB19Ve2nO70v+u9xlHrpCSIXBAU/0p6U70gb
         uO7w==
X-Gm-Message-State: AO0yUKVdmCa03RaVeD9EKkWj2LEVCyTmratLIltfw5hXInsmAqhV8M0S
	07cH6nax1L06TF64jbwjPdOcnMbgPhInoh3e7xU=
X-Google-Smtp-Source: AK7set+mMALIkCpoGCc/QT/djFKysG7wSDKrfV8Y/g5bpv2llCyrOJTZXbJEuoziivWDAd/kFl9L/Q==
X-Received: by 2002:a17:90b:1b52:b0:22b:b82a:f3a2 with SMTP id nv18-20020a17090b1b5200b0022bb82af3a2mr16076889pjb.11.1678210375659;
        Tue, 07 Mar 2023 09:32:55 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:32:55 -0800 (PST)
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
Subject: [PATCH v17 2/7] irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
Date: Tue,  7 Mar 2023 23:02:26 +0530
Message-Id: <20230307173231.2189275-3-apatel@ventanamicro.com>
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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

