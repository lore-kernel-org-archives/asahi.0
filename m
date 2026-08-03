Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832223B4E8C
	for <asahi@lists.linux.dev>; Mon,  3 Aug 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762179; cv=none; b=nrKgwaPavrpzicplM5hr1ceJWFaUgUZiHZFLbwYi+0wh4vTvHW8xh9F8+e12pVBcmVbP8pp/evZGMREcSnIrhzZkilepjgJcyfugT27c6bu0pS6qf0HMHwoULXAnX3HlwTcmNmL0HRvFLPesg365NxeHIRnR4sI70WNiWtfKWWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762179; c=relaxed/simple;
	bh=WnSqo5DkKEebqBayu2UDewUn0iMVdFk9k+nwTD4hroA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IF+f/pCc2ET2rT2rAm2sCS99l89EQVPrRlsP9wvPnk0Iu2QfvWGVcYhrQaujFb2TKorc0M+DAtso46TFKhkxtJ7lryIlsJiJlHb9sorV4InOgwr/D4O+fl8V+LwHwmU0aw7+9zkNy0caWkfqnaRBQ9iaQ8LYJ3lTUNm3V7SZ6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=qW9UtaB0; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="qW9UtaB0"
Received: by chaosmail.tech (Postfix) id B1DED1C878A;
	Mon, 03 Aug 2026 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp0o1m5yR2f4Z+ciPm4AbRNRENMEbbSgtEL3uzjlmxQ=;
	b=qW9UtaB03q2/iFqAGH2zC3o7QCw5a8JJLJXwBubWfxvhUfoAkt5rzMHZhnk5tqrZAs8Z+2
	71cPPhBV2hWTTWiHihcHkRAXwROLtV5S9VC7p8DZsPa4lVze5oziBY8rTJcIHMQA9+e5+k
	37g2RoCMXNHpmtmPO39ezYoq+O/iDvo=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 03 Aug 2026 15:02:44 +0200
Subject: [PATCH v3 2/6] spmi: apple: Validate FIFO state
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-t603x-spmi-v3-2-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
In-Reply-To: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=1923;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=PkmvT+O1yoJbmERoyOrzU/RzWX78PMERIonM3LtJq8g=;
 b=K1gkvvUPbxJZxhkWs1UjBnx7EK9MM6PUBsqSP5hIupZQ8BM9IMWmZsNpOrcRJPsxj74o3/Vj9
 /TzUJllIznOAO7wF1bVS0fEpcmaMoBTcfz56M28Jz9yKpoHpiyAIx/1
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for data before reading the body of a reply, and check for
end of data afterwards.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..e037ef914b6c 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -57,6 +57,20 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	return 0;
 }
 
+static void flush_extra_data(struct spmi_controller *ctrl)
+{
+	struct apple_spmi *spmi = spmi_controller_get_drvdata(ctrl);
+	bool warned = false;
+
+	while (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)) {
+		if (!warned) {
+			dev_warn(&ctrl->dev, "FIFO has extra data\n");
+			warned = true;
+		}
+		readl(spmi->regs + SPMI_RSP_REG);
+	}
+}
+
 static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 			 u16 saddr, u8 *buf, size_t len)
 {
@@ -78,6 +92,11 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			dev_err_ratelimited(&ctrl->dev,
+					    "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +105,8 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	flush_extra_data(ctrl);
+
 	return 0;
 }
 
@@ -115,6 +136,8 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	flush_extra_data(ctrl);
+
 	return 0;
 }
 

-- 
2.55.0

