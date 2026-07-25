Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1912E8DE3
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987294; cv=none; b=kQ94IfGZZ1xJAQd66NWJFcNxxAq4o6ROcuvhomZNrti1UB+ixMToQ6C8jggRhJWNjoEkZACJrE27Jw+vMgsJ668RHb0BC4ynUDxb7Zd/J8bRMmlZWGfCXxUQPmNk1FPQVb2pBvIJ//vgkhskN7Z0vF7Ks6tr5vOVlwaGBV3oI0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987294; c=relaxed/simple;
	bh=v9uz/6CyK5SDwLJ0zK0QzfpMd30KsgGTpyngmFAVg7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D14oonFXbVoaNeowDwqBIWu0pcAVyAGgGPDKBnENFMah18LetxJZYF6sX8MnJXnufveDvI51tewR+O1m+Qodzvlj8RODUxITORlfo7l6GSQFvJHDzEU1dSl68F+15so5iHcWnhTNvOL+EGHqmSUnC2u+b/On26Y22GOp1ZJeJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=pNo9SdLI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="pNo9SdLI"
Received: by chaosmail.tech (Postfix) id D4C391C88A2;
	Sat, 25 Jul 2026 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRCyJhKmgjg66kLbX3RBnUaQOgA/k0/qwf94Ozl2Tmg=;
	b=pNo9SdLILGaqsR2Z5Aq7X5aRH+wwt4XZlKegzc8jAcUSyjOmK2s+Mxd1kfWZwAsBD+7y9+
	LFYLImbDbtNdEZlupoOMKIGe1pWy+tFYGhNYQwRroPctepk9mDOVH+aY/FFE/PRXtU8tSE
	Au9o3oR7QLlsNPDD7eSG9SQbvLFKqLo=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:48:00 +0200
Subject: [PATCH 3/7] spmi: apple: check transaction status
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-3-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=2593;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=FxzixiMwZvH4JsrnMoHytW38mlptE8J09z7GD40ugz8=;
 b=ZisiSY2IwtgUKexVXUt8xDaj/CDy4fZcBNxGNoMPAcULP2gs8HjreuQdbbfNOeTXvrUOOfx++
 xaI/+NQZRSmDn4SgrBRDpznHv9dyWCv3teoK/fKPztmDirgyOBbSdy8
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for parity errors and missing command ACKs

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index b4f442d0b4ad..4678a9e5270a 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -22,6 +22,12 @@
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
 
+/* SPMI_RSP_REG reply word */
+#define SPMI_REPLY_FRAME_PARITY_OFFSET 16
+#define SPMI_REPLY_ACK BIT(15)
+#define SPMI_REPLY_SLAVE_ID GENMASK(14, 8)
+#define SPMI_REPLY_CMD GENMASK(7, 0)
+
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
 #define REG_POLL_INTERVAL_US 10000
@@ -62,7 +68,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
-	u32 rsp;
+	u32 reply, rsp;
 	size_t len_read = 0;
 	u8 i;
 	int ret;
@@ -73,8 +79,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard SPMI reply status */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
@@ -93,6 +98,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
+	if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
+		dev_err(&ctrl->dev, "some frames failed parity check\n");
+		return -EIO;
+	}
 	return 0;
 }
 
@@ -101,6 +110,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 {
 	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
 	u32 spmi_cmd = apple_spmi_pack_cmd(opc, sid, saddr, len);
+	u32 reply;
 	size_t i = 0, j;
 	int ret;
 
@@ -119,12 +129,15 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (ret)
 		return ret;
 
-	/* Discard */
-	readl(spmi->regs + SPMI_RSP_REG);
+	reply = readl(spmi->regs + SPMI_RSP_REG);
 
 	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
 		dev_warn(&ctrl->dev, "FIFO has extra data\n");
 
+	if (!(reply & SPMI_REPLY_ACK)) {
+		dev_err(&ctrl->dev, "command not acknowledged\n");
+		return -EIO;
+	}
 	return 0;
 }
 

-- 
2.55.0

