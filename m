Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4083C5845
	for <asahi@lists.linux.dev>; Sat,  8 Aug 2026 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188690; cv=none; b=WohPUR50+vBH5nyAv4KL7nQsaqmsg6WDRXgWOZkOpWh0t9Uv1/CEcHq+XEPg9mPVRuUv5IMdk1xh38xRd9TMf3MeFUc1xloPtmo8Zz4xv7CBRCHnzJUfHYAmibmvxOhAmbi4pHaY0kYTd1aT7GJfiUywmzlxLbIvUtgUyKHn5cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188690; c=relaxed/simple;
	bh=h6ymgcV3EFdULvBN7pXvXFtJZciM6qsk6AqGU/0i1j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmVPQTgN0kQ+HpCapH2/3OMx2GnHrlIm0QjRk2KEdh4Y4LvQQbt3oKnDc1BFs7knwMyytcWIv26MS/qlXpf8Cy2roogDHzunaVNpvF3BBm462HudyBSc5zCvLruzFPhjW5T3CFnexo/Up+xIHFraF+e6YpwmX4DolD3R6lAeay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=vuEJ7cjo; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="vuEJ7cjo"
Received: by chaosmail.tech (Postfix) id A61F51C87FF;
	Sat, 08 Aug 2026 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786188681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlhlhN6Ao8cxtOBbRD5JaNyRrKmX5FvsiLtDWtyTEJY=;
	b=vuEJ7cjoXKqNNMWH0FCn/eqYC2vCznEgcBVmnmYIo8tWyBWKQ8cHLnEtfa57MH+psX3Ayi
	L1N8sXh5aetej1FbvDb9LeomNxNRI/IGT6V0DvYCoo2ipQJo9qmuVY+QnGsnDPUFjghdWV
	mU3ww4i9V4U4EhZ8rIEqlZzPan5T5mM=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 08 Aug 2026 13:31:19 +0200
Subject: [PATCH v5 3/6] spmi: apple: check transaction status
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-t603x-spmi-v5-3-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
In-Reply-To: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786188678; l=2846;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=EambuisSIw3s+EavjiZydICr5EUeyWSuYrWkUmgadRo=;
 b=DXG8i3ezPFOl1fR/cw562t4k3z7RnKEsiOi/cX2dwaD7NV19C/A9pCR4nfo7V2POVJb1yIDDH
 GWfh826Q1vSAgEexh4PVty8XiU7Wa3GouRZozfnmapXEukbguWqE7b+
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for parity errors and missing command ACKs.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 15721cb41d5c..b1c127cf5f44 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -11,6 +11,8 @@
  *		spmi-pmic-arb.c Copyright (c) 2021, The Linux Foundation.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,6 +25,12 @@
 #define SPMI_RSP_REG 0x8
 #define SPMI_ACT_REG 0xa4
 
+/* SPMI_RSP_REG reply word */
+#define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
+#define SPMI_REPLY_ACK BIT(15)
+#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
+#define SPMI_REPLY_CMD GENMASK(7, 0)
+
 #define SPMI_ACT_FIFO_FLUSH BIT(0)
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
@@ -66,7 +74,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 rsp;
+	u32 reply, rsp;
 	size_t len_read = 0;
 	u8 i;
 	int ret;
@@ -82,8 +90,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard SPMI reply status */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
@@ -106,6 +113,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		spmi->prev_fail = true;
 	}
 
+	if (~FIELD_GET(SPMI_REPLY_FRAME_PARITY_STATUS, reply) & ((1 << len) - 1)) {
+		dev_err(&ctrl->dev, "some frames failed parity check\n");
+		return -EIO;
+	}
 	return 0;
 }
 
@@ -114,6 +125,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 reply;
 	size_t i = 0, j;
 	int ret;
 
@@ -137,14 +149,17 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 		spmi->prev_fail = true;
 	}
 
+	if (!FIELD_GET(SPMI_REPLY_ACK, reply)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
 	return 0;
 }
 

-- 
2.55.0

