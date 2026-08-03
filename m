Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8330F3B994A
	for <asahi@lists.linux.dev>; Mon,  3 Aug 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762178; cv=none; b=uBVxlbZWOBT9+tZxy97NJlcA43hBKNlDhy9LdwaVkhNgIhAm3PhKFM6f69xE0DTxSHjLEmyOmyTkFo8PjNFfJlmE6D62j+ERgBIK7W91h78H6ndaJIIQTnLr8o3koDKtsATMK0LJObDDxdOcfggTU9H+DhkLDNqV1lVLwWRBQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762178; c=relaxed/simple;
	bh=LbwCq3rIvJpT2sFv6/b31enSKPX5tPmZoKP7DcA0pYE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jQh9nE4/87aB2YU+lqE6HAQMPhD6/Ko5qqQDx+kOWdg72aKrbm0qKuqT8gCtvS6oyv8EXhwa91ll7riq6EwUcabAHgtCSOfPSx60LzwhR/c7LBsSF15VE5rH4vxwNIvU5OgC0aNvmWEdS6bsJNandWKlOfe9M1UTf/TCdx+xst8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=cSGJgkeO; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="cSGJgkeO"
Received: by chaosmail.tech (Postfix) id 411991C7E15;
	Mon, 03 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rLrrRSbIZTbnZuCVNXXY71qmUVrSQKkrexlZ7DXMPbw=;
	b=cSGJgkeOR67mE7DL/l7KVWKOnfaCNTrLPi8TrwWwQm7w1HhhVydYs04dE+gpMcqrC84PvQ
	ahH8m7mVSJ+a/oGbqbsT4VVpxIb8KjgkgbcPcpqB3zbtFMDUAZu9eZBXUOSie7ELteOGMi
	OaLUz3bcJIcOrgFfc71K6Y9OEKbrLA8=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Mon, 03 Aug 2026 15:02:42 +0200
Message-Id: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw7CIBBFf6VhLWaAvnTlfxgXlA4WYx8BJDVN/
 12oG40uT3LPmVmIQ2vQkWO2EIvBODMOEcQuI6qTwxWpaSMTDryEihfUlyBm6qbe0CovBTSaNSC
 BRGGyqM28xc6XN7tHc0PlUyEtOuP8aJ/btcDS7m84MAoUmeQHrVreivoUfxldL81971F1JNUD/
 /TrL59HX+cCC80Ai1r8+Ou6vgChdChw+wAAAA==
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=1654;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=LbwCq3rIvJpT2sFv6/b31enSKPX5tPmZoKP7DcA0pYE=;
 b=iKa1RbGdrS/AWnDcQiX2em/5eLcNtzFCH1O/4uGxfggKXXGvnjzX4qXZQOZzG6zf08OXPn6ox
 OPTpZaHoX7lBqBmnYOp/41Lsi9H8SeOvWUpedqm0U9W2uqvXC5zbS05
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
      dt-bindings: spmi: apple,spmi: Add t603x

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  15 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 381 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 367 insertions(+), 32 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

