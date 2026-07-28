Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854A41BA83
	for <asahi@lists.linux.dev>; Tue, 28 Jul 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230904; cv=none; b=bb2i2EBxCPPgWVOrfcfcpuMHKfdZ2XDxbdgEObpZOHs9k0CCuHKil1mPh1iuzS50Iz9ZXACjUTApvd23Sxiv77WLH2utg1IZVgqUmUE5IdYqCPNDom58BzgZk2ihcQ0KWyl9OyJAvUNosBB0m7SSYGlhRlz8AuJsaiWhKJfSlc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230904; c=relaxed/simple;
	bh=VcBkTyBGm0mXprd1XZyY76UJlA2kHyq2iZnDI0ZJd/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCWMyVUFAHBmAtoEgBduO4DkSpf6rUCbZJW93m9x4ek7QiHq0wnbKjNr5aYYWcwazeQsD3DXgDSi7p1YIfaNgKFBz8TWOUn+umc8hvjLvsryNl0DOnkpRbi5eOlbCUg4gF4EffBoA5DIzTdaa36AG2FA6Kr4BWDfHlYlx+18Kug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=PleB1Pws; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="PleB1Pws"
Received: by chaosmail.tech (Postfix) id 48EBF1CA4B0;
	Tue, 28 Jul 2026 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dl81sMPy4/6fdNeQbpXmpPeoD89j1WYL1lvl6stjviQ=;
	b=PleB1PwsmCyQa1BJQMUTVwGSbulSS1cgRuKnluf8dH6B+rcrRt3SgxRS4jU1n8e2Flao9O
	0LJZOp9tpB7qu6ErfBeYtMMF1lZhjE53QUwTMR/sbzJz+vJ2QjCkiXU59qiNNxD4dLLWEX
	32CWrqPmjeyZmHN1QHYjJgz2CT84WSs=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:10 +0200
Subject: [PATCH v2 4/7] spmi: apple: Implement remaining commands
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=6166;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=jOog9+vdIGoQZuVvwR4HhuK249v44PeEHPWP3IATl+o=;
 b=ehRyBeiOyzjfOs0mNl2QSXmDry9OsGVwkXBES/Ldlv2Cs/fo0ZAz+UmWX+QbhrZzwVoeurn7J
 7Pv1Czy64FiCrZXCuT2H0BD+7y1LbKKM16N9Mg1ev2+fUkHwa3NznPc
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Add support for zero write and power management commands

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 4678a9e5270a..aed18b7df15c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -41,9 +41,9 @@ struct apple_spmi {
 	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
 			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
 
-static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 saddr, size_t len)
+static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
 {
-	return opc | sid << 8 | saddr << 16 | (len - 1) | (1 << 15);
+	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
 }
 
 /* Wait for Rx FIFO to have something */
@@ -63,18 +63,27 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	return 0;
 }
 
-static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			 u16 saddr, u8 *buf, size_t len)
+static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
-	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, param);
 	u32 reply, rsp;
 	size_t len_read = 0;
-	u8 i;
+	size_t i = 0, j;
 	int ret;
 
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
+	while (i < len) {
+		j = 0;
+		spmi_cmd = 0;
+		while ((j < 4) & (i < len))
+			spmi_cmd |= buf[i++] << (j++ * 8);
+
+		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+	}
+
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
 	if (ret)
 		return ret;
@@ -82,15 +91,15 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
-	while (len_read < len) {
+	while (len_read < ilen) {
 		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
 			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
 			return -EIO;
 		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
-		while ((len_read < len) && (i < 4)) {
-			buf[len_read++] = ((0xff << (8 * i)) & rsp) >> (8 * i);
+		while ((len_read < ilen) && (i < 4)) {
+			ibuf[len_read++] = ((0xffU << (8 * i)) & rsp) >> (8 * i);
 			i += 1;
 		}
 	}
@@ -98,47 +107,67 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
-	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
+	if (!ilen && !(reply & SPMI_REPLY_ACK)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
+	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << ilen) - 1)) {
 		dev_err(&ctrl->dev, "some frames failed parity check\n");
 		return -EIO;
 	}
 	return 0;
 }
 
-static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			  u16 saddr, const u8 *buf, size_t len)
+/* Send a raw command with 1..16 input data frames */
+static int spmi_raw_cmd_input(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 param, u8 *buf, size_t len)
 {
-	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
-	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 reply;
-	size_t i = 0, j;
-	int ret;
-
-	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+	return spmi_raw_cmd(ctrl, opc, sid, param, NULL, 0, buf, len);
+}
 
-	while (i < len) {
-		j = 0;
-		spmi_cmd = 0;
-		while ((j < 4) & (i < len))
-			spmi_cmd |= buf[i++] << (j++ * 8);
+/* Send a raw command with (optional) body and an input ACK */
+static int spmi_raw_cmd_ack(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			  u16 param, const u8 *buf, size_t len)
+{
+	return spmi_raw_cmd(ctrl, opc, sid, param, buf, len, NULL, 0);
+}
 
-		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
+static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			 u16 saddr, u8 *buf, size_t len)
+{
+	switch (opc) {
+	case SPMI_CMD_EXT_READ:
+	case SPMI_CMD_EXT_READL:
+		return spmi_raw_cmd_input(ctrl, opc | (len - 1), sid, saddr, buf, len);
+	case SPMI_CMD_READ:
+		return spmi_raw_cmd_input(ctrl, opc | saddr, sid, saddr, buf, len);
 	}
+	return -EINVAL;
+}
 
-	ret = apple_spmi_wait_rx_not_empty(ctrl);
-	if (ret)
-		return ret;
-
-	reply = readl(spmi->regs + SPMI_RSP_REG);
-
-	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
-		dev_warn(&ctrl->dev, "FIFO has extra data\n");
-
-	if (!(reply & SPMI_REPLY_ACK)) {
-		dev_err(&ctrl->dev, "command not acknowledged\n");
-		return -EIO;
+static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			  u16 saddr, const u8 *buf, size_t len)
+{
+	switch (opc) {
+	case SPMI_CMD_WRITE:
+		return spmi_raw_cmd_ack(ctrl, opc | saddr, sid, buf[0] << 8 | saddr, NULL, 0);
+	case SPMI_CMD_ZERO_WRITE:
+		return spmi_raw_cmd_ack(ctrl, opc | buf[0], sid, buf[0] << 8 | saddr, NULL, 0);
+	case SPMI_CMD_EXT_WRITE:
+	case SPMI_CMD_EXT_WRITEL:
+		return spmi_raw_cmd_ack(ctrl, opc | (len - 1), sid, saddr, buf, len);
 	}
-	return 0;
+	return -EINVAL;
+}
+
+static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
+{
+	if (
+		opc == SPMI_CMD_RESET || opc == SPMI_CMD_SLEEP ||
+		opc == SPMI_CMD_SHUTDOWN || opc == SPMI_CMD_WAKEUP
+	)
+		return spmi_raw_cmd_ack(ctrl, opc, sid, 0, NULL, 0);
+	return -EINVAL;
 }
 
 static int apple_spmi_probe(struct platform_device *pdev)
@@ -161,6 +190,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
+	ctrl->cmd = spmi_cmd;
 
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)

-- 
2.55.0

