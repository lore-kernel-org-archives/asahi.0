Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698A79C5
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 14:13:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d3so32689246plr.10
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=E8TWf5DkaPepHOkkXVQ+z8+CLsbLMAAvnxqIbnjKBZsOqm5DJLf4puRyphTaXyU7A3
         O20QSTl/gD6BfMbEjrMBswkQ2h+vdKWGGbkpnphb7jN+WHlAF8wJ9JJYAhz3yGD5s/f2
         M4qufJ2rkuyfvuEUfC8iBM8MGVWgvY+NJotvQZHFI7YhFe/5Jv6/ZqFn8lwng1OwLSfA
         8S0bJb64BFUYOOnDUHcZ/6iT6d54Q54fwUs5SN3W4qp3X3nnTy+i7Z3IkQucMwzklVhr
         ahzWYcQ9DvTEWEHqAFDrsnEwT9HyIodujAoltPh0wMNEwmdDz4oe7eQQ2rKO3pAP1FuI
         4YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=ZLZzXeWXeBqBjBaXwBhe3ne0G0UjkCjuYxrR6kqc+UoEdSMUqZpvzonuksRPKVgbAL
         KYcxDg1WVb7h1jWygM+0g1A5m8UcTSsdIPn3alRyIzhAns6yBMpIqaj+P1jbniAVBuoW
         F0ex3QJQeLHDaDI20r77OrTFE26YxabDI/GYBnp3oVYYvuDQIGIJTbycQoKoccCWFDMf
         GesvpmPjmT/Bfjpl4iF1iEvurwdfayrn5ibJgHHia97eGeoCaTTzrD219Q2mOUjLLOoZ
         F2RMLYMwz+fLJ8LYYgJYUv+Z/Hf7lDKfcQkBkipt+lqX5kC2PlpyMLMt5KSqWFHCTX1L
         A4Hg==
X-Gm-Message-State: AFqh2krCYm7fyMpN8Ej2PoF0W4CFSDNgaYSojn6I+P/Q4WljcXBdfPYw
	xYLXP/YHhRG2PG3L2iomzDqH4g==
X-Google-Smtp-Source: AMrXdXsuVkKXoZiM/PJQ6X7CsAqviLdEWi7Y0fZ02BkzwCJ5cCR4nkdmJMMRGmSCm2P4swYEtm6ULA==
X-Received: by 2002:a17:902:c386:b0:192:709b:9a6a with SMTP id g6-20020a170902c38600b00192709b9a6amr32164806plg.65.1672755196106;
        Tue, 03 Jan 2023 06:13:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:13:15 -0800 (PST)
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
Subject: [PATCH v16 8/9] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
Date: Tue,  3 Jan 2023 19:42:20 +0530
Message-Id: <20230103141221.772261-9-apatel@ventanamicro.com>
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

We add empty irq_eoi() in RISC-V INTC driver for child irqchip
drivers (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) which
implement chained handlers for parent per-HART local interrupts.
This hels us avoid unnecessary mask/unmask of per-HART local
interrupts at the time of handling interrupts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 784d25645704..f229e3e66387 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -46,10 +46,27 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
 	csr_set(CSR_IE, BIT(d->hwirq));
 }
 
+static void riscv_intc_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * The RISC-V INTC driver uses handle_percpu_devid_irq() flow
+	 * for the per-HART local interrupts and child irqchip drivers
+	 * (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) implement
+	 * chained handlers for the per-HART local interrupts.
+	 *
+	 * In the absence of irq_eoi(), the chained_irq_enter() and
+	 * chained_irq_exit() functions (used by child irqchip drivers)
+	 * will do unnecessary mask/unmask of per-HART local interrupts
+	 * at the time of handling interrupts. To avoid this, we provide
+	 * an empty irq_eoi() callback for RISC-V INTC irqchip.
+	 */
+}
+
 static struct irq_chip riscv_intc_chip = {
 	.name = "RISC-V INTC",
 	.irq_mask = riscv_intc_irq_mask,
 	.irq_unmask = riscv_intc_irq_unmask,
+	.irq_eoi = riscv_intc_irq_eoi,
 };
 
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
-- 
2.34.1

