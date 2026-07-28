Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B941F34A
	for <asahi@lists.linux.dev>; Tue, 28 Jul 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230906; cv=none; b=X6FbfweLZUS+/Gaq9FaawjyXeRYbqOW+YPcv7fDaJ3FM73z1g5xulnvNvYCeLUiry6Unj7kNRGmyRAS6sl1b2H7hUXmk4Z9eRqpeaCJat8pWShmi+0C/hqGCkVilB62XzEOnazHq+R7IlYzjkgHRz0yPmiGBhl1bkYhvcx8EHZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230906; c=relaxed/simple;
	bh=TDLjdSqVQtdcDRxpVVpLdo2p3pjRf8wBXZV6WRyLI00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTYSS8MXcSZ4UvDuRpWU8ifxkj45chYC3blGJ+Lbc2I+2rcBHdJcPo3BBwws5tbHv4V8b/XVFMlDBpf8MOhp5uPZ/iVU88R4u6yZMzwx31kIQbijZTrEmEDMnea8fQDxvQGUrJdgx26QJ/duubyazNyahmUb7rknvsNrjnOBors=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=gd+d7JXL; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="gd+d7JXL"
Received: by chaosmail.tech (Postfix) id C20341CA4B5;
	Tue, 28 Jul 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hv2EqRru8gsr8quHPDRzgpJBkeR+4eP5RVLYwkzn1/8=;
	b=gd+d7JXL+1E4NS5E2m/5spYopPlms9vzm8J0AR77NfQbBuwNX4cvFywz+w/cR8sy5tQLKO
	0+Pw7UQPAgYrD4MUlyDTvfKp1vibxml7J/+CJZsE/N10FS/BLNItJccDg+aRD0fK3E2L87
	ULw4BfV/Li2dhyy3sBKBty7fq4oiGh4=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:12 +0200
Subject: [PATCH v2 6/7] spmi: apple: use IRQ for RX FIFO if possible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-6-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=5054;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=X6mvWszaXQokP048a15MW5eztdRhB9OWYPy6+5cHW5Q=;
 b=gTJBQd/e7tygM7NDXeU7Y6MmoMwRYzoS7+5f6e+D6bvFgctCMVbagTm4IqVfDggfh8Dg2jKgG
 0cTUh68Z8zrC3z7I/M/OizHAgPPYyykaBYb6zt+eGhh7a8Y6if3Ijp8
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The IRQ fires as soon as the reply is available, which is usually takes
a few us instead of the 10ms sleep interval for polling

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 2cd4ed1803d4..109c5d2c735d 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -11,6 +11,8 @@
  *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
  */
 
+#include <linux/completion.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,6 +25,12 @@
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
 
+#define SPMI_IRQ_MASK_BASE 0x20
+#define SPMI_IRQ_ACK_BASE 0x60
+#define SPMI_IRQ_USER_SIZE 0x20
+
+#define SPMI_IRQ_FIFO_RX 0
+
 /* SPMI_RSP_REG reply word */
 #define SPMI_REPLY_FRAME_PARITY_OFFSET 16
 #define SPMI_REPLY_ACK BIT(15)
@@ -37,6 +45,8 @@
 struct apple_spmi {
 	void __iomem *regs;
 	struct mutex fifo_lock;
+	bool fifo_rx_irq;
+	struct completion fifo_rx;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -55,7 +65,19 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
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
@@ -77,6 +99,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	mutex_lock(&spmi->fifo_lock);
 
+	reinit_completion(&spmi->fifo_rx);
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -181,10 +205,68 @@ static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
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
+static irqreturn_t apple_spmi_irq_handler(int irq, void *dev_id)
+{
+	struct apple_spmi *spmi = dev_id;
+	bool handled = false;
+	u32 val;
+
+	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
+	if (val & BIT(SPMI_IRQ_FIFO_RX)) {
+		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);
+		complete(&spmi->fifo_rx);
+		handled = true;
+	}
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static int apple_spmi_init_irq(struct platform_device *pdev,
+			  struct apple_spmi *spmi, int irq)
+{
+	int ret;
+
+	for (size_t offset = 0; offset < SPMI_IRQ_USER_SIZE + 4; offset += 4) {
+		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
+		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+	}
+
+	spmi->fifo_rx_irq = true;
+	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_USER_SIZE * 8 + SPMI_IRQ_FIFO_RX);
+
+	ret = devm_request_any_context_irq(&pdev->dev, irq, apple_spmi_irq_handler, 0, NULL, spmi);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to request IRQ\n");
+
+	return 0;
+}
+
 static int apple_spmi_probe(struct platform_device *pdev)
 {
 	struct apple_spmi *spmi;
 	struct spmi_controller *ctrl;
+	int irq;
 	int ret;
 
 	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi));
@@ -193,6 +275,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	spmi = spmi_controller_get_drvdata(ctrl);
 	mutex_init(&spmi->fifo_lock);
+	init_completion(&spmi->fifo_rx);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))
@@ -204,6 +287,15 @@ static int apple_spmi_probe(struct platform_device *pdev)
 	ctrl->write_cmd = spmi_write_cmd;
 	ctrl->cmd = spmi_cmd;
 
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq >= 0) {
+		ret = apple_spmi_init_irq(pdev, spmi, irq);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,

-- 
2.55.0

