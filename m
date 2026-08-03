Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81CE40D562
	for <asahi@lists.linux.dev>; Mon,  3 Aug 2026 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762182; cv=none; b=hVxlsmF4SUGaOxdVJgEdtv996FphCS67Sv+VkZtU0/SDZ//Zfd0AAeDXY6f24ZjiookNzpjtEEtsihkWmbOtbkH2R+Tb8GbfGjy3wyz9N12B5rZquxwzkbChikTG12zywZwnKrqEcv2Cv3YfT9JKcKtMkWFlKcJ2GrGd4X6P/Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762182; c=relaxed/simple;
	bh=hr+CPR1UU6foBFfCJBFFMf2a4YS6s9byUc55G4Egc6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9gA+0vXIFI6NBQtAtEbhfAIfHtSZ1cBRZPmnasgHbpe7pZ7FlTOhFiKOH1FYJGkCMPUMoznPgfLjOoHuzy1XlVleKjnE4Tpu2yPaM6Rlgz78xzov+DXzIeEBfKiIMi5L8hJjqAhyGdIaxopBmqX5g8vYBrdQAO/jd1RmdIOO3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=pgcbpQmf; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="pgcbpQmf"
Received: by chaosmail.tech (Postfix) id B66C71C8806;
	Mon, 03 Aug 2026 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDdb+CMyRhdTUcdH4qnkn1fyvyG2mS8cNVpb/kFCn34=;
	b=pgcbpQmfckyhAPZ+JzSpP/whzXbnRCKfr/FCLLqBWFcPyFbCNCRGQmo0ZnhBdS2+vw6Tiw
	D6Bokx+NkLOzGs06H4HMQfMI/qiWju8yTZ5OE37diaC/FelEmvTcX5tvySvUXY0gebf642
	U+8hfEbJ/PKtzPGg5/pOv44qd89oSnc=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 03 Aug 2026 15:02:48 +0200
Subject: [PATCH v3 6/6] spmi: apple: Add interrupt functionality
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-t603x-spmi-v3-6-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
In-Reply-To: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=10962;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=SK5uE8tlc22L33jCoq5YmeRc0BeSKCcE8lj1k+A3AAc=;
 b=TkTQHQFmdZyQFviSf6RVgYzzBbSx4BbpBsp4mAU6NpxWs3nxOf6144I7H9gmA/6J0D5tr2hzY
 HKwXew2wDSZCuUbkq2xn9l147ebuJnHbZ3obrrshOGgjV5llkICGa99
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, as that IRQ fires as soon as the reply is
available, which is usually takes a few us instead of the 10ms sleep
interval for polling

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/Kconfig                 |   3 +-
 drivers/spmi/spmi-apple-controller.c | 251 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 252 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index a80cf4047b86..7243863a09b4 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -13,7 +13,8 @@ if SPMI
 
 config SPMI_APPLE
 	tristate "Apple SoC SPMI Controller platform driver"
-	depends on ARCH_APPLE || COMPILE_TEST
+	select IRQ_DOMAIN_HIERARCHY
+	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
 	help
 	  If you say yes to this option, support will be included for the
 	  SPMI controller present on many Apple SoCs, including the
diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 74d4b5d98b11..340d28126b3d 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -11,11 +11,17 @@
  *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
  */
 
+#include <linux/completion.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 #include <linux/spmi.h>
 
 /* SPMI Controller Registers */
@@ -23,6 +29,13 @@
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
 
+#define SPMI_IRQ_MASK_BASE 0x20
+#define SPMI_IRQ_ACK_BASE 0x60
+#define SPMI_NUM_PERIPHERAL_IRQS 256
+#define SPMI_NUM_IRQS (SPMI_NUM_PERIPHERAL_IRQS + 32)
+
+#define SPMI_IRQ_FIFO_RX 256
+
 /* SPMI_RSP_REG reply word */
 #define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
 #define SPMI_REPLY_ACK BIT(15)
@@ -37,6 +50,12 @@
 struct apple_spmi {
 	void __iomem *regs;
 	struct mutex fifo_lock;
+	struct completion fifo_rx;
+	struct irq_domain *irqd;
+	raw_spinlock_t irq_mask_lock;
+	DECLARE_BITMAP(irq_mask_cache, SPMI_NUM_PERIPHERAL_IRQS);
+	int irq;
+	bool fifo_rx_irq;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -55,7 +74,19 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	int ret;
 	u32 status;
 
-	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
+	if (spmi->fifo_rx_irq) {
+		ret = wait_for_completion_timeout(&spmi->fifo_rx,
+			usecs_to_jiffies(REG_POLL_TIMEOUT_US));
+		if (!ret)
+			ret = -ETIMEDOUT;
+		else if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)
+			ret = -EIO;
+		else
+			ret = 0;
+	} else {
+		ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
+	}
+
 	if (ret) {
 		dev_err(&ctrl->dev,
 			"failed to wait for RX FIFO not empty\n");
@@ -91,6 +122,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	guard(mutex)(&spmi->fifo_lock);
 
+	reinit_completion(&spmi->fifo_rx);
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -186,6 +219,203 @@ static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 	return -EINVAL;
 }
 
+static void apple_spmi_irq_ack_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_ACK_BASE + (irq / 32) * 4;
+
+	writel(BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_mask_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
+
+	writel(readl(reg) & ~BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
+
+	writel(readl(reg) | BIT(irq % 32), reg);
+}
+
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
+	clear_bit(d->hwirq, spmi->irq_mask_cache);
+	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
+}
+
+static void apple_spmi_irq_unmask(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
+	set_bit(d->hwirq, spmi->irq_mask_cache);
+	apple_spmi_irq_unmask_raw(spmi, d->hwirq);
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
+	if (args[0] >= SPMI_NUM_PERIPHERAL_IRQS)
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
+	if (hwirq + nr_irqs > SPMI_NUM_PERIPHERAL_IRQS)
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
+static void apple_spmi_irq_handler(struct irq_desc *desc)
+{
+	struct apple_spmi *spmi = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	bool handled = false;
+	unsigned long val, offset, bit;
+
+	chained_irq_enter(chip, desc);
+	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + (SPMI_IRQ_FIFO_RX / 32) * 4);
+	if (val & BIT(SPMI_IRQ_FIFO_RX % 32)) {
+		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_FIFO_RX);
+		complete(&spmi->fifo_rx);
+		handled = true;
+	}
+
+	for (offset = 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset += sizeof(val)) {
+		val = readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+		/**
+		 * because of other masters in the bus, we're going to get a multitude of
+		 * interrupts we're not interested in. irq_resolve_mapping isn't very
+		 * optimized for the nonexistent path, so instead we mask with (a locally
+		 * cached version of) the IRQ mask
+		 */
+		val &= spmi->irq_mask_cache[offset / sizeof(val)];
+		for_each_set_bit(bit, &val, 64) {
+			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
+			handled = true;
+			val &= ~BIT(bit);
+		}
+	}
+	if (!handled)
+		handle_bad_irq(desc);
+	chained_irq_exit(chip, desc);
+}
+
+static int apple_spmi_init_irq(struct platform_device *pdev,
+			  struct apple_spmi *spmi, int irq)
+{
+	struct irq_domain_info info = {
+		.fwnode		= pdev->dev.fwnode,
+		.hwirq_max	= ~0U,
+		.ops		= &apple_spmi_irq_domain_ops,
+		.host_data	= spmi,
+	};
+
+	raw_spin_lock_init(&spmi->irq_mask_lock);
+
+	for (size_t offset = 0; offset < SPMI_NUM_IRQS / 8; offset += 4) {
+		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
+		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+	}
+
+	spmi->irqd = devm_irq_domain_instantiate(&pdev->dev, &info);
+	if (IS_ERR(spmi->irqd))
+		return PTR_ERR(spmi->irqd);
+
+	spmi->fifo_rx_irq = true;
+	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_FIFO_RX);
+
+	irq_set_chained_handler_and_data(spmi->irq, apple_spmi_irq_handler, spmi);
+
+	return 0;
+}
+
 static int apple_spmi_probe(struct platform_device *pdev)
 {
 	struct apple_spmi *spmi;
@@ -198,6 +428,8 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	spmi = spmi_controller_get_drvdata(ctrl);
 	mutex_init(&spmi->fifo_lock);
+	init_completion(&spmi->fifo_rx);
+	platform_set_drvdata(pdev, spmi);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))
@@ -209,6 +441,15 @@ static int apple_spmi_probe(struct platform_device *pdev)
 	ctrl->write_cmd = spmi_write_cmd;
 	ctrl->cmd = spmi_cmd;
 
+	spmi->irq = platform_get_irq_optional(pdev, 0);
+	if (spmi->irq < 0 && spmi->irq != -ENXIO)
+		return spmi->irq;
+	if (spmi->irq >= 0) {
+		ret = apple_spmi_init_irq(pdev, spmi, spmi->irq);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
@@ -217,6 +458,13 @@ static int apple_spmi_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void apple_spmi_remove(struct platform_device *pdev)
+{
+	struct apple_spmi *spmi = platform_get_drvdata(pdev);
+
+	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);
+}
+
 static const struct of_device_id apple_spmi_match_table[] = {
 	{ .compatible = "apple,t8103-spmi", },
 	{ .compatible = "apple,spmi", },
@@ -226,6 +474,7 @@ MODULE_DEVICE_TABLE(of, apple_spmi_match_table);
 
 static struct platform_driver apple_spmi_driver = {
 	.probe		= apple_spmi_probe,
+	.remove		= apple_spmi_remove,
 	.driver		= {
 		.name	= "apple-spmi",
 		.of_match_table = apple_spmi_match_table,

-- 
2.55.0

