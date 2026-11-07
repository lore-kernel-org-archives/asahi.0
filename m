Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083800;
	b=kObIPq9y2PzCGUcHBS5+YNPA0WUF2fLcV0ryd5/yxw1cCa+RUG3yWUaVt1l/lhxmkTsc
	 lsVUJlentwvswB6zaljkMGCs9VkpwcpVctHmeeTMtPzg98MoWXXXlKTgGLD8sk+OLBLYz
	 n5R0BD7e/350VKH8znLtXiFxL1FdzS0s67iJRtMmgO02PuZAsYRahaumDZjEkZsTSaWoT
	 ksvorUD8J6744bHcuwJokwi2X9//OKKt70eUDOwugIdRfBkY3LajgcJo3hAnbFva0HPmR
	 siRjkXJVxvOwyW1hFhbSfpjjItWH5E5fHmBKiRHGpFo7V63cWX2eB+gCbBOvstqjetQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083800;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=m1cywuN9POCHGVkY3HMh/Fn+/naoEZscsamoMt9C/K4=;
	b=tps2tFX0cSzEz8rTTzoIp5jFr8Aie9iwT4FwxrvZ+8bJ4SjoesaC++vaqEkAqHUOCEdZ
	 2cB7UdxqcGhGHBnJFVG/GYBfejA5WJROokvjiMCICGc1u03dx3jXM9Ih2IqajNC5uAQM5
	 TICakYJer9JhB0Y1Qc+tVRZaFwzhXJdAEDSHK0w/DlXigyBu4HG4QIOgCzFRSYnAbatzG
	 7OTzqUq4Tkp4ywWp8KhTWCLvCzRqSNLrjs1idL7qsZun1hYO6OYdEUyGZVpYbZwyx3avz
	 5wMgO+OyO6fx4GS7S9SsKjb1/DrL5hVgaEUgRhUU6vKmCIzsZnPnfKUo0uCMsHsO7cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b="dF/Q0i3z";
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5496606A326
	for <asahi@lists.linux.dev>; Sat,  7 Nov 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5496606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=dF/Q0i3z
Received: by chaosmail.tech (Postfix) id 26AEA1C984E;
	Sat, 07 Nov 2026 20:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m1cywuN9POCHGVkY3HMh/Fn+/naoEZscsamoMt9C/K4=;
	b=dF/Q0i3zig4kCsRUNVXV7SRnJTy/JaqYkyYAtzVy0CjZetGNwZw0mTrQ2B7eh6l0QkXN3V
	4c1+Ipgj8ckiVnl33gyEYVW9KjmslCnCWxl5q/HgD9CSMgzPv8iOYsH8R034nybaSmditG
	KFG2H1ATm6TzimaMHTxM/qDSvkkrdlA=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:24 +0100
Subject: [PATCH v11 2/6] spmi: apple: Validate FIFO state
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t603x-spmi-v11-2-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=3000;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=oo0A5mTyjhQs/shRoCqBQAm46h7YyRWHCbKW2E+1Huk=;
 b=E6Fi/ubY3mpQ6PvfuFKfQiucxMwtWJRy97qI91vrIK3FjwC0qtyiiiiVRcRfITMOVInxCWyFq
 k3pnBU7mOPAAYRL/gCL6kSuu34DX2ngUzBGOsTLFS6RB5Spkx3KSO+z
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for data before reading the body of a reply, and check for
end of data afterwards.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..15721cb41d5c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -21,7 +21,9 @@
 #define SPMI_STATUS_REG 0
 #define SPMI_CMD_REG 0x4
 #define SPMI_RSP_REG 0x8
+#define SPMI_ACT_REG 0xa4
 
+#define SPMI_ACT_FIFO_FLUSH BIT(0)
 #define SPMI_RX_FIFO_EMPTY BIT(24)
 
 #define REG_POLL_INTERVAL_US 10000
@@ -29,6 +31,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	bool prev_fail;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -49,6 +52,7 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 
 	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
 	if (ret) {
+		spmi->prev_fail = true;
 		dev_err(&ctrl->dev,
 			"failed to wait for RX FIFO not empty\n");
 		return ret;
@@ -67,6 +71,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	u8 i;
 	int ret;
 
+	if (spmi->prev_fail) {
+		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		spmi->prev_fail = false;
+	}
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	ret = apple_spmi_wait_rx_not_empty(ctrl);
@@ -78,6 +87,12 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			spmi->prev_fail = true;
+			dev_err_ratelimited(&ctrl->dev,
+					    "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +101,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+		spmi->prev_fail = true;
+	}
+
 	return 0;
 }
 
@@ -97,6 +117,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	if (spmi->prev_fail) {
+		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		spmi->prev_fail = false;
+	}
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -115,6 +140,11 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+		spmi->prev_fail = true;
+	}
+
 	return 0;
 }
 

-- 
2.56.0

