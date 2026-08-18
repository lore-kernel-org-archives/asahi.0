Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F22C385D8A
	for <asahi@lists.linux.dev>; Tue, 18 Aug 2026 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078030; cv=none; b=cxMiQVQentCyo2eCq3O7PIhJWYoHvSnmRqJKZtQ0ZP/4g7q0Rzpoc50A8/PKN+zigPp8u3xdjS1z13JrDRsvaCLXEPw6Bbr/HNGsd1t7dJ0DtXePQJDNaWwBHFynKUih6TNiWzClNgKl4mPZHIAEekgX50gdc4Tf/WitB/BGYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078030; c=relaxed/simple;
	bh=XYuuJYoqS1nc/Ig76LtGuulda0ykgYvfrNiveaUCopc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xb1ki9kStkGfB5wt7XD58+xkBFWcgP73tWbuh5xBuuK4yNrt+8iOowu26Jxh9tWU0zENpVKeSGrbkGRZS08SKwzEqtP3KmotmtRzKt1bDALG1y33PYAdRMY/EVRV8Aw4IVXnar59MmPM9FlwEWZkiUPCeUWABzmEk1D/mbrVnXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=BjqPpz/6; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="BjqPpz/6"
Received: by chaosmail.tech (Postfix) id EAEFA1C867F;
	Tue, 18 Aug 2026 18:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787078016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d0KEV76OGPegyGNsYSTZTQjWgelTfSg1ZN+k4Kvqo5c=;
	b=BjqPpz/62ePh60i2uhF7Bm1GB4D8e6JamCSIzJokQBoIjX6ogEGxsZT+Lzhz1ap1odF5Gp
	QeYkjrvws/Mn9S2AyisJXiy8BvnRz2CPrAFvUIQ7WcZuTP/+bjDBttx/LV15Sip/j5f9Q8
	vAV/MJ/MbYNjatuCxraKPAI7KFnNL6g=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v7 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Tue, 18 Aug 2026 20:32:39 +0200
Message-Id: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTU7DMBAF4KtUXmPksT120hX3QCzGf8SINlUco
 qIqd8cJCxKR5ZPme/MerMQhx8LOpwcb4pRL7q812KcT8x1d3yPPoWYmhTTCSuSjEerOy+2SudV
 GCZfACRKsgtsQU76vZa9vv7l8uY/ox6VhuehyGfvhe/02wXJ3WDwBFzwCyTb5IINqXuqWvlwof
 z6P0XdsaZ/k1jc7L6tPWkVMICI26tCrP98ItfOqeg/WoTChBYJDr7d+v1+vHglkaMmGY49bv9+
 P1SMqj+RlAmUPvdl4MDtvlv9IrrFEWlv3z8/z/AO5eGeF+wEAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787078015; l=2295;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=XYuuJYoqS1nc/Ig76LtGuulda0ykgYvfrNiveaUCopc=;
 b=IUyGXaIBkBSNCkn9JDGz9G9EaAaD+rH2d+6AzOZkIWyRLomrbq8MTOPyLfl2dusELtkBnePRX
 Cf5qT0zjpOzDCTFMLvW+8xWiEBoNcKOUBiWZ98mgOontsSPdsAV14nQ
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The SPMI bus has grown additional responsibilities in the M3
generation, making the current driver insufficient. Add M3 comatibles,
support for slave-sent interrupts, FIFO interrupts, power management
commands, parity validation, and fix locking.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v7:
- Require interrupt support on M3+
- Link to v6: https://patch.msgid.link/20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech

Changes in v6:
- Fix interrupt controller teardown
- Link to v5: https://patch.msgid.link/20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech

Changes in v5:
- Style fixes per review
- Fix fifo flush
- Link to v4: https://patch.msgid.link/20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech

Changes in v4:
- Re-do error recovery.
- Fix an address calculation mistake
- Link to v3: https://patch.msgid.link/20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech

Changes in v3:
- Rework interrupt support
- Address review comments
- Link to v2: https://patch.msgid.link/20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech

Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (5):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: Add interrupt functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x and t8122

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  37 +++++++++++-
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 394 insertions(+), 35 deletions(-)
---
base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

