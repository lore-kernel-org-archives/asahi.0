Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B4320A04
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987298; cv=none; b=mer9iDoJu9hyOwajKdw8TG1xM73vPdxY8bbHkYJGvopVbNFA0XBd+1JyOZsm2tbb3Gr7kXNMx5JGGFWGPCdomIa5gda8SdvatE56UTOn0HT7AyBM0AeT16iGNG0sHQKtqLn926WxjmtuQYJEHKlBOwbrZUUOAMPiAPfCpmomHXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987298; c=relaxed/simple;
	bh=H315w1lb8qLA4UebeC5eJbTcpnzEh+UunkXtsmNcK0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rE+CC7VdUqMJ698ZudTIE9FTDuYJvfcOX+1BS9JhcXqFI2QpJHy5VvMLoRNn9VVAtfOmyyIykZKVfuCkjTvcH0oRIC+VffygAMN00qGqFRdENrrK/b2EWUIqKEgcI0aMsGF2wDn5JifIo3EcaHB2QF8J0F+77twD2b7xrENyzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=E7Rqa7EV; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="E7Rqa7EV"
Received: by chaosmail.tech (Postfix) id EA9481C89DA;
	Sat, 25 Jul 2026 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNyhXkUmw0itH+0BymTsdz7Nkvxt9OLSlnHtolV7POs=;
	b=E7Rqa7EVQMPTP287VA20Qzd2/SWQ16U4vyiKrAhqZvAJDA6NwWgukhGCcbQ7kaCvDXYXkd
	+tiu4tuJ7+TOJeaWyoINegyA+xWsfy00O+eSgrDFI7mIr8Bc6wVwxRgq5Q2Nn0cFiK54Iv
	G0085dD+B1+EwzG2WHXGGzoVipQy2IM=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:48:04 +0200
Subject: [PATCH 7/7] spmi: apple: interrupt controller functionality
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-7-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=6871;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=9qspmyWvz++p2+jhctT4jbqrDjFjvxRZSed7JlepAt4=;
 b=RVASvHzIYUNmCm4GZhnQBMNb7wvQz1n0wPG00VeLBSplS56aM3sGZOSOkGBSjmznH5vcu/kOy
 yyG0g6/YuWEAhRPn22H0uVpTjdQslm+u/InNvmDcW83FRBKVJ1UPC0Q
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Add support for interrupts sent by slave devices.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/Kconfig                 |   1 +
 drivers/spmi/spmi-apple-controller.c | 149 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index a80cf4047b86..c9eff3d470a1 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -13,6 +13,7 @@ if SPMI
 
 config SPMI_APPLE
 	tristate "Apple SoC SPMI Controller platform driver"
+	select IRQ_DOMAIN_HIERARCHY
 	depends on ARCH_APPLE || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index d627187b3ac0..13b48fd66aec 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -15,9 +15,12 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 #include <linux/spmi.h>
 
 /* SPMI Controller Registers */
@@ -47,6 +50,9 @@ struct apple_spmi {
 	struct mutex fifo_lock;
 	bool fifo_rx_irq;
 	struct completion fifo_rx;
+	struct irq_domain *irqd;
+	raw_spinlock_t irq_mask_lock;
+	u64 irq_mask_cache[SPMI_IRQ_USER_SIZE / sizeof(u64)];
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -228,11 +234,123 @@ static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
 	writel(readl(reg) | BIT(irq % 32), reg);
 }
 
+static void apple_spmi_irq_ack(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+
+	apple_spmi_irq_ack_raw(spmi, d->hwirq);
+}
+
+static void apple_spmi_irq_mask(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
+	apple_spmi_irq_mask_raw(spmi, d->hwirq);
+	spmi->irq_mask_cache[d->hwirq / 64] &= ~BIT(d->hwirq % 64);
+	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
+}
+
+static void apple_spmi_irq_unmask(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
+	apple_spmi_irq_unmask_raw(spmi, d->hwirq);
+	spmi->irq_mask_cache[d->hwirq / 64] |= BIT(d->hwirq % 64);
+	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
+}
+
+static int apple_spmi_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	/* all interrupts have MSI semantics */
+	return type == IRQ_TYPE_EDGE_RISING ? 0 : -EINVAL;
+}
+
+static struct irq_chip apple_spmi_irq_chip = {
+	.name = "apple_spmi",
+	.irq_mask = apple_spmi_irq_mask,
+	.irq_unmask = apple_spmi_irq_unmask,
+	.irq_ack = apple_spmi_irq_ack,
+	.irq_set_type = apple_spmi_irq_set_type,
+	.flags = IRQCHIP_ONESHOT_SAFE,
+};
+
+static int apple_spmi_irq_domain_map(struct irq_domain *irqd,
+					unsigned int irq, irq_hw_number_t hw)
+{
+	irq_domain_set_info(irqd, irq, hw, &apple_spmi_irq_chip, irqd->host_data,
+				handle_edge_irq, NULL, NULL);
+	return 0;
+}
+
+static int apple_spmi_irq_domain_translate(struct irq_domain *irqd,
+					struct irq_fwspec *fwspec,
+					unsigned long *hwirq,
+					unsigned int *type)
+{
+	u32 *args = fwspec->param;
+
+	if (fwspec->param_count != 2)
+		return -EINVAL;
+
+	if (args[0] >= SPMI_IRQ_USER_SIZE * 8)
+		return -EINVAL;
+	*hwirq = args[0];
+	*type = args[1] & IRQ_TYPE_SENSE_MASK;
+	return 0;
+}
+
+static int apple_spmi_irq_domain_alloc(struct irq_domain *irqd, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	int i, ret;
+
+	ret = apple_spmi_irq_domain_translate(irqd, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	if (hwirq + nr_irqs > SPMI_IRQ_USER_SIZE * 8)
+		return -EINVAL;
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = apple_spmi_irq_domain_map(irqd, virq + i, hwirq + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void apple_spmi_irq_domain_free(struct irq_domain *irqd, unsigned int virq,
+				unsigned int nr_irqs)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_data *d = irq_domain_get_irq_data(irqd, virq + i);
+
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+	}
+}
+
+static const struct irq_domain_ops apple_spmi_irq_domain_ops = {
+	.translate	= apple_spmi_irq_domain_translate,
+	.alloc		= apple_spmi_irq_domain_alloc,
+	.free		= apple_spmi_irq_domain_free,
+};
+
 static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
 {
 	struct apple_spmi *spmi = dev_id;
 	bool handled = false;
-	u32 val, offset, bit;
+	u64 val, offset, bit;
 
 	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
 	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
@@ -241,6 +359,23 @@ static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
 		handled = true;
 	}
 
+	for (offset = 0; offset < SPMI_IRQ_USER_SIZE; offset += sizeof(val)) {
+		val = readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+		/**
+		 * because of other masters in the bus, we're going to get a multitude of
+		 * interrupts we're not interested in. irq_resolve_mapping isn't very
+		 * optimized for the nonexistent path, so instead we mask with (a locally
+		 * cached version of) the IRQ mask
+		 */
+		val &= spmi->irq_mask_cache[offset / sizeof(val)];
+		while (val) {
+			bit = __builtin_ctzll(val);
+			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
+			handled = true;
+			val &= ~BIT(bit);
+		}
+	}
+
 	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
@@ -248,12 +383,24 @@ static int apple_spmi_init_irq(struct platform_device *pdev,
 			  struct apple_spmi *spmi, int irq)
 {
 	int ret;
+	struct irq_domain_info info = {
+		.fwnode		= pdev->dev.fwnode,
+		.hwirq_max	= ~0U,
+		.ops		= &apple_spmi_irq_domain_ops,
+		.host_data	= spmi,
+	};
+
+	raw_spin_lock_init(&spmi->irq_mask_lock);
 
 	for (size_t offset = 0; offset < SPMI_IRQ_USER_SIZE + 4; offset += 4) {
 		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
 		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
 	}
 
+	spmi->irqd = devm_irq_domain_instantiate(&pdev->dev, &info);
+	if (IS_ERR(spmi->irqd))
+		return PTR_ERR(spmi->irqd);
+
 	spmi->fifo_rx_irq = true;
 	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);
 

-- 
2.55.0

