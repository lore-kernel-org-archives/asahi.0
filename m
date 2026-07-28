Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A541F349
	for <asahi@lists.linux.dev>; Tue, 28 Jul 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230906; cv=none; b=vBsAM8aJm1bIWRTTT56sQOPm3raOK6UANhKB39s022CMYzmqQNindP7BplAuqfAQ6nCwJ01J5wG1gZ/uxji062+TQF+AdecUj8dG4qQl9nynFiOYsknTTQNrbx2/pq/UDYCVbEZLfihNy5Guhgk6LhSSxCBfWtRBVbtRRLAUUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230906; c=relaxed/simple;
	bh=trolKAW7WvvZEaPVLUTG/vDQgZvmDbyMh4pp3sLYylU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qygYVNmiz9y7RE2C454CvqZhUkSHlRVN6PCg7mNAP3GpW7uzhvxKvWCSxiThR8dvPBu5uRMhS+pwhlq1omQ27duhItzhkznEBFAC2CnXnmit7jvLyImNrDE3lSX/ujzP8MXpl+AVfVFvC/r0Wcw9kWOq77Ip09qqmvIMGbwRlAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=sidVafEG; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="sidVafEG"
Received: by chaosmail.tech (Postfix) id 0C6E11CA4B2;
	Tue, 28 Jul 2026 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnqhiVTVPifAUYWtiZycC/ZSPcXsJoWNBQ104HXxAMQ=;
	b=sidVafEGZDy150GlCHevn2Y+jXwdmz2G2ZLbFQbFH+4D/sQ0zrtfsi+thcndLdnAU2iJt0
	qgjsEB0cDMoP75NGHQzBBMNnFnLRCjOZovc6AH5CUVx4nH1zAHDPvaRDsbzsPhZ4EESubP
	GAdhCWcmf4z/kcQj8p3qw7auRM0p9k0=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:11 +0200
Subject: [PATCH v2 5/7] spmi: apple: lock around FIFOs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-5-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=2563;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=HIGPdSOyNoSvcvIlT48bLiPi1O7LBdmNtnBM38tbtWk=;
 b=RNPNjndqIZhH/rNXJBspeVICwnnLlnxbVOi8lpZU00YvbGLJcsJH41PIhRA8yaXG2GudGQW8U
 ubNmbAsUBVMDqphYzhF3vLq+V5ZeYcTKEYwuFKWHGWixrykH6xK3eun
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index aed18b7df15c..2cd4ed1803d4 100644
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
@@ -73,6 +75,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	mutex_lock(&spmi->fifo_lock);
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -86,7 +90,7 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
-		return ret;
+		goto out;
 
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
@@ -94,7 +98,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
-			return -EIO;
+			ret = -EIO;
+			goto out;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
@@ -107,6 +112,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
+	mutex_unlock(&spmi->fifo_lock);
+
 	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
 		dev_err(&ctrl->dev, "command not acknowledged\n");
 		return -EIO;
@@ -116,6 +123,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		return -EIO;
 	}
 	return 0;
+
+out:
+	mutex_unlock(&spmi->fifo_lock);
+	return ret;
 }
 
 /* Send a raw command with 1..16 input data frames */
@@ -181,6 +192,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0

