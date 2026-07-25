Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E118A93F
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987294; cv=none; b=f2gKV1PnkGJ7rQYDCB6GP3S6lFkmlkb+qp/73zGNthk40vAVvR9JKMyPD3EcV0Gc0fMvTNDibutUtIMA1V2MMiI+JKBjv8RDkq1r1dbUlIItVVDy6YZy+z9lenwqv/9AEgIzjb9cZWVuCZgZEiyd+Ymb+reIYaqgPNS5IJbaOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987294; c=relaxed/simple;
	bh=JcVhJYDXJ29DM6q/DGhCD0k1FkRv5FLa1IeNLYu00uU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ViXz90z+8/3DETIpqpHbGZ7q93xk6wdY907CaYeP0ysi1OrdIhAuEiVpF9QrULdiABmXjkzlLH3B5aYbhfSvSAaMMHuXLSUV6CFImgedZAub5IJ7lBKjcsHDOagbBsgZlv1/M+/6MR5G5OcWNwkL8qmRlAt5FHj/VaZGCOKK5s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=KQff2g4/; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="KQff2g4/"
Received: by chaosmail.tech (Postfix) id 9E89A1C867B;
	Sat, 25 Jul 2026 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I/8nGZ3kme0kRjU0reoPml5u6qqgUq5INVuMdCZUNFE=;
	b=KQff2g4/5xB2tuH9oBhaH9B2LVNEBaJWelgAD5T7FLHKibSLXWHSsgaPzzZHLwHMlVPB4W
	WnaNEcJSJ6eAou7oCFQRDvRx/h0gIZUnGVZ7NHGv+/q15yOoOf3ANz8C1SUEz/dTn4CAXW
	dQE0T/71GptZRfOwmL3/rfoaSLyGjas=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/7] spmi: apple: Additional commands and interrupt
 support.
Date: Sat, 25 Jul 2026 15:47:57 +0200
Message-Id: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDUZRSWuIhYtg5H4SQeRiLsrl
 t/ivQuEPJNAGV3g6WDhZQ5I4giawc49KW6DQaM2WOhcbQbTU8k6sSoyk6LrEocWIQSrp47Pb1b
 Vv2V3IzXbe4D7fgCVwv6tbgAAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=1323;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=JcVhJYDXJ29DM6q/DGhCD0k1FkRv5FLa1IeNLYu00uU=;
 b=GmINXHiFj9rrwrh8pxjnL6ytD060L+MXm5s/38fjKXFIk14Vv3FqSUm3tp5H5N3onvPa8/nPc
 Lwqk8dW+tIhCu0obO8IiD8b8nC7HIe8EuGKMEy2vktg2xCDnnvv5i+1
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
 drivers/spmi/Kconfig                                   |   1 +
 drivers/spmi/spmi-apple-controller.c                   | 367 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 353 insertions(+), 29 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

