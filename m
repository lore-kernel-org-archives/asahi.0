Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAD2F7EF5
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987298; cv=none; b=jmEzyfpHrYbp9tX6DGGtYTl+qCyzZIMrSdqSAeAC5V+ZogPPlTyjeFkQLQMaDxLosPeiUffDHquYypsNHACclSDt73ZaUf1/TgcU/5irNdehvT1h9gIcd06pgeTKcyGaao+8PlSNz4FRTS6Q504F7Ie8qSXBm55CjLyr2TB0pPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987298; c=relaxed/simple;
	bh=r0FsqJvWDd2UGYCRd/e4lOeXaFDyknB6twEzTndskp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQf/qYqTWtNtQZYOjOqaBGK11cAVQ8MrSdITEnBj/QV9hyShQH9oJPvowryOWlwxYEZmlD/sQV0yVL/YzzSI58jYUmltc+REfKGpWnwhlyOzjUiqWUhbLbdKonZAyW4ZEFQoL+9zIBOP9igzaPZKLCHxcOuMnjH63kYx6p7psMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Mga+HXgZ; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="Mga+HXgZ"
Received: by chaosmail.tech (Postfix) id 699491C89CE;
	Sat, 25 Jul 2026 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOEGBPj9wdiW2j/Jxo2hUYrDiU/CZnzQIqSAqmVHv+E=;
	b=Mga+HXgZx+8JJveqlZZrpB1KkuiOKAm2X8Y7E9xZAAKzVmN1oF00enZEhEGF6dwmi7dif/
	eHWOUsD/2VdJOkt5fuIbGE3p+wMYaXsh/HUN95cpNS3IY94197bU22o1JhrOigG4sJEE2Y
	kt0lzrZHpjJDXnvF7nlPDo52V5zPzNw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:48:02 +0200
Subject: [PATCH 5/7] spmi: apple: lock around FIFOs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-5-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=2615;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=2qgrnGCpOEesoQxzumLBAIJ6PZsro+tCragOJF7RrLM=;
 b=yjKT/ZwlZdbSTSzYb0LgSssHIETLtaCHX3M+W0nzBUVmztu+Dwd1eGAYdhabQkDvyUAJMXDAw
 GelAE7K1FzND4wMhTa7Z86b/UoXRcJdfYmjAHZNqiZLS89KjqOwPAMS
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index d69d16665ce8..d8509f027df6 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -35,6 +36,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -73,6 +75,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	ret = mutex_lock_interruptible(&spmi->fifo_lock);
+	if (ret)
+		return ret;
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -86,7 +92,7 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
-		return ret;
+		goto out;
 
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
@@ -94,7 +100,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
-			return -EIO;
+			ret = -EIO;
+			goto out;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
@@ -107,6 +114,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
+	mutex_unlock(&spmi->fifo_lock);
+
 	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
 		dev_err(&ctrl->dev, "command not acknowledged\n");
 		return -EIO;
@@ -116,6 +125,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		return -EIO;
 	}
 	return 0;
+
+out:
+	mutex_unlock(&spmi->fifo_lock);
+	return ret;
 }
 
 /* Send a raw command with 1..16 input data frames */
@@ -181,6 +194,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0

