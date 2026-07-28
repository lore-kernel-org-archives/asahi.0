Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD46B41DDF7
	for <asahi@lists.linux.dev>; Tue, 28 Jul 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230903; cv=none; b=EzALljcmcX0mgnhHIij5XLVP69PmdlV5aToSsIG858aSsYJq+6X6whYTXDV05Oyg/xzieAvTpR7mAs+HOnjJqnWrK6FAPAw6ZYmDnLvBXVJZ9khEHOZt9azoLIdo4vVAk5/qZB4JNaB2ZYLX4JMDyrri/8IuqnR2Kv5ClVAb7DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230903; c=relaxed/simple;
	bh=H6pjygtQG/V5utkuQd2IOUdBc7yYoI96jgGjwLdNwf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdk2aDHdsrDlun2rPLpymrjyKKQLgVHK9CGUI9la77CZcQRoL0fNvgqcqh3XQDYrAQh8Ebdp5cnZHDri2kKNU2iJmt0Q4OtiH52GellT1L9i+nA+SpsB/PDoyD51r9UIkEzTTbXV8HqxIu9hPUUWG+y271cysV2pkTg++Jhu5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Vt+CH3Lc; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="Vt+CH3Lc"
Received: by chaosmail.tech (Postfix) id C28631C97BC;
	Tue, 28 Jul 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icTggAy3gbl2+A7cAXhm51k/YneL2/ZKYWfIfpCPKGQ=;
	b=Vt+CH3LcMECPEIqXXHOIbHdkotZRRMc63pzNPd/2DUmBH2dI3DqoZEo8wr9h+HtNxRxLV7
	p3z3tvAcOegKq3omCiiJQSmyMRaT++cg4JAlZmxgijz4+YYhZPEU37isa1dK7geUglOZfz
	q8peczVnmNrNkukR+1I+v1/wtN8FWnQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:08 +0200
Subject: [PATCH v2 2/7] spmi: apple: Validate FIFO state
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-2-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=1469;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=s+zw2P+Wx9EvyJyi9jeYYrUjVBBFmgRieWNPRCaUoyU=;
 b=pbQvEq/RK9U1Pz8LKtkCquVTrltHOLnKjP+XGzoZ6xY8IsIxQZl5MmTbZcng1WfayixOMlDZl
 RJqaeZH5b6cDN2SnRcY6NpOoHeCqLyh06TSqqxcsdnyl2PSAzy1ytFK
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for data before reading the body of a reply, and check for
end of data afterwards.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..b4f442d0b4ad 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +90,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+
 	return 0;
 }
 
@@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+
 	return 0;
 }
 

-- 
2.55.0

