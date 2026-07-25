Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7834F2C08CF
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987296; cv=none; b=M7tz3tXbznD3hOHjoD+BXF6QoFrbJ5rfuM9gcSPheMqwnVoeVw9Nmr1dY6Fw+AhAlHIRWLBtK8Dc0zPM4+MQfPZ2WZ3/uHaREvRRQzUsN9LL4+29uJESshgZnyjcQiGm7W8fOGNiFQ/xlflU7pagkTosopS+dsxZnX9oQlHM4PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987296; c=relaxed/simple;
	bh=H6pjygtQG/V5utkuQd2IOUdBc7yYoI96jgGjwLdNwf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUimjKEo+XFf4kkuhm5GOmNWTo57JrSqOTmYx7G7w4DQ8FCNfB82GmQtYuMMigC7r+qD493Rm96UoKWQIQPhVLeIF0uo1hBTqQohD7KfedV8Gef8tBbzUBMn5Bdl2UqyrFPOVrAfBjmRX2dcs3o0Ov5xOBaj2a3hys8kbr+U7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=VRaMVxXI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="VRaMVxXI"
Received: by chaosmail.tech (Postfix) id 1CF7A1C8829;
	Sat, 25 Jul 2026 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icTggAy3gbl2+A7cAXhm51k/YneL2/ZKYWfIfpCPKGQ=;
	b=VRaMVxXIQH/oUVE5NoFqio0JDnmFZzP6DMRU6B/11cHX9pjWe1MDgxcbar2aunGS/w6zJh
	l7K7HrYDkw0x+Fq2iImJN0TRG+jeRA8HsWFuGQJu9TvWdeQIBYt3f68Rn9A84c1/kC1SYh
	rmL8LigIno74Eo0v1XL5BOdozBbVklg=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:47:59 +0200
Subject: [PATCH 2/7] spmi: apple: Validate FIFO state
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-2-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=1469;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=s+zw2P+Wx9EvyJyi9jeYYrUjVBBFmgRieWNPRCaUoyU=;
 b=ZEgDFOgRB3QxgfFZUeoIfQvhkipMQ7Tkku4/hoDMbRU9iYTHjQ9tuqd77r3ImJya7bJluEoGP
 xpi4Ue2XjYFCAzXKyurcbm0YkWZECRaV4cXVlDOcAlS0HpQlWPpFJ9E
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

