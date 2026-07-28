Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9F41DDE1
	for <asahi@lists.linux.dev>; Tue, 28 Jul 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230902; cv=none; b=MLBLo8tEBTeA3cvE4HnyME6C3Ge1exq0JXY0lES8afqThCfSiQ3H+jxZlLdGPIcrK0rmKhV2ulnZzOfcjRouLL/DESCmTGcpAa5rNMuYM1+5bIil7EaPT28ty4dxMPp8b06k/kBraJ3G0gEw5xkKEZyQkUvw/MxPGnlR5R/YVU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230902; c=relaxed/simple;
	bh=CB6/xbkMbmzfgAWtMWkK2Cc9Vq1Ar8BpRmf28+xWHck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oKmcOn5d6Sac63M+8QVshDNHLdHhts7OqtgBJqhT5bhxYQe6erP9uBs+LJDTWNwWrsOlIbqKvqQmWR4Qe8bFc8D40gVuTKmmG5yP6d6xePR/SI5/QCFgL1FOiQboZhI8B7SI4MPo3kY50MOPrRlNJEvUA3fnKhJG4cYBP7uNjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Rc+0irYf; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="Rc+0irYf"
Received: by chaosmail.tech (Postfix) id 569D51C9733;
	Tue, 28 Jul 2026 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iJxP9IRcZLDkD6egno92CC8rTp7kO0Iu0E0qgYpJ2ow=;
	b=Rc+0irYf3q5xc2x4/NUhRJahvBipgcx/tfcxEZKqahYRuIzaoMT5PXol3YyWZ4vWxi9msG
	xow/uSg0+2iuHuwWB7qJvLXFxgSyRhi6BO7AvYF0X5oa0hhxHUZTaVo8K9f+RLLfLwxFij
	X1sdR8UmuRlWg2eeiG75WKyuHYgHpe0=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/7] spmi: apple: Additional commands and interrupt
 support.
Date: Tue, 28 Jul 2026 11:28:06 +0200
Message-Id: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBCEX4Xs2ZptUVBOvofhUMoia+Qn3Uowh
 He34NXjl8x8MwsIeSaBIlnA08TCQx/BHBJwre0fpLiODAZNhrk5q5BhOisZO1b5KUuxanSFFiE
 WRk8Nz7vsXv5Y3tWTXNgMW6JlCYP/7GuT3nJ/xZNWqEhbc21cber0cotfBuksv46BXAvluq5fV
 tpc4bsAAAA=
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=1547;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=CB6/xbkMbmzfgAWtMWkK2Cc9Vq1Ar8BpRmf28+xWHck=;
 b=/EIfb2ojZPHuzD3BxGf1/5IkT8GR7QKQRxhUML5ascs1ZsK98OKtyGrwop3My6MqHLwczsdlG
 gqWe3uET3ZHAQQZJYwZUZ9i3jwQqJphEAGpsSfZUHo3rNC3Y4yEIQPk
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
Changes in v2:
- Change locking to non-interruptible
- Reorder irq ack
- Clarify dt binding
- Some data type cleanups
- Link to v1: https://patch.msgid.link/20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech

---
Alba Mendez (6):
      spmi: apple: Validate FIFO state
      spmi: apple: check transaction status
      spmi: apple: Implement remaining commands
      spmi: apple: lock around FIFOs
      spmi: apple: use IRQ for RX FIFO if possible
      spmi: apple: interrupt controller functionality

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t603x

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  14 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 362 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 349 insertions(+), 30 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

