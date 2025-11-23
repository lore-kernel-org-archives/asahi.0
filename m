Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C0220F21;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763932815; cv=none; b=oPqbrikcsyXlE/97f3JH63ZVgIGMqLlbBvFewDFDR2+//pdt35rBseLgsAW3UWIWFp/4Y/F5tKzAIHydACfX+wN14dshTYozyPgEXo6IaHrgtxe7lrApd0TYDz9DAXP+AQxgcqVNyWUttL5XNUeHpqCkfVd0kLuaUnE314QtJMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763932815; c=relaxed/simple;
	bh=LoanKKAnkIpUTY1jemDQ8gy05dpp6akYvg2JStglEpU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U8VUrY3zBAHtCSDG/PekCHxI2Sm/SsYc6lH6GSTnzivEQu5GV+yyXPkOhDIR9442VrTxhYUJtq+N+hj5BXybbde+MdBFXJr5UzZduZdPuHV3X9IeMGTpraNhQlr9pmNmDaXM5NRB2eDAqLHGEpDyshVouDYhDMGJBXHB+8d26Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAG5nrN3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAG5nrN3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7957C113D0;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763932814;
	bh=LoanKKAnkIpUTY1jemDQ8gy05dpp6akYvg2JStglEpU=;
	h=From:Subject:Date:To:Cc:From;
	b=iAG5nrN3R0G9TFdCi2zIXy4MxXsa6qHGTBLRG46b3BVmtcNvLbDCoBaXpPeGCVmM0
	 ebW0vHW6C6K0YsbHrAIL1TcqZgb1ae2hYdvpqsJg2lGlAa7Hz8w0YgZzvd0ZuqnCMe
	 m1k5xNZQCMtFeTw//RStRz/ZkqWOnVKHI9QM70aKR/FzIcusec+JPdcFKNXjKkSMP/
	 b+YybPfxqUsQBcTiEif6UfOI+6r+HB9FSwJvxe67JQX5rTaeINywkE725gedK745fz
	 yPB0V17VDSeonRVbWohSOWadRU0WXsa39jeWO+U1rgh91/JhHVXa1/jHm+82nfMjUb
	 xJzmeQgk6m6Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F582CFD317;
	Sun, 23 Nov 2025 21:20:14 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH v2 0/3] Apple Silicon Type-C PHY
Date: Sun, 23 Nov 2025 21:19:53 +0000
Message-Id: <20251123-b4-atcphy-v2-0-34cc7092b22a@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHl6I2kC/03MSw6DIBSF4a2YOy6NF1/FUffROFC4CGkjBgypM
 ey91HTQ4X9y8h0QyFsK0BcHeIo2WLfk4JcCpBmXmZhVuYGXvMESKzbVbNzkanam2rGTohKqxg7
 yf/Wk7fu0HkNuY8Pm/H7SEb/rT+HtnxKRlUzfcELOGy1ke3+SX+h1dX6GIaX0AfPorb6jAAAA
X-Change-ID: 20251013-b4-atcphy-d6a7c939d417
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2840; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=LoanKKAnkIpUTY1jemDQ8gy05dpp6akYvg2JStglEpU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ6ZyVeu00EdbJs7uqfxeYbVpXWLD6msvOUpWRr3I4jHed
 2mei+z+jlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBE1ggw/HeKk/1QVM1jzvpD
 5dz9qOo3V9YzBZmncNtHKDSZpc9XmcDwP9CXZf2GrIai3S/SKjc8+9vFeuyciXyX+CL26HdaZyW
 OMwIA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

As requested in the previous version of the Apple Silicon USB3 support
series this one only contains the changes required for the Type-C PHY.

The generic tunable support inside driver/soc/apple will also be re-used
for Thunderbolt later but it's fine to take it through the PHY tree
since thunderbolt will depend on that anyway.

Changes in v2:
- Link to v1: https://patch.msgid.link/20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org
- Picked up tags from Rob and Janne, thanks!
- Added additional sanity checks for the tunables to guard against bugs
  in our bootloader (Janne)
- Used struct_size from overflow.h instead of open-coding it inside
  tunables.c (Janne)
- Fixed a bunch of typos in atc.c pointed out by Mark Kettenis via IRC

Changes since v2 of the combined series:
- Link to v2: https://lore.kernel.org/asahi/20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org/
- atc.c:
  - Removed a bunch of outdated safety checks from atc.c that were only
    required in a previous version that did not rely on the dwc3-glue
    driver
  - Addressed Philipp's review comments:
    - Added documentation for struct apple_atcphy (and a bunch of other
      things while I was at it)
    - Moved the mutex guard from atcphy_dpphy_configure to atcphy_dp_configure
      since the first one doesn't touch any shared structures or MMIO
- apple,atcphy.yaml:
  - Added a generic apple,tunable definition that uses uint32-matrix
    and refer to that one from the individual tunable properties
  - Adjust the tunable description to make it easier to understand
  - Limited all lines to 80 chars
  - Used > for longer descriptions
  - Fixed some typos
- Picked up r-b tags (thanks!)

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
---
Sven Peter (3):
      soc: apple: Add hardware tunable support
      dt-bindings: phy: Add Apple Type-C PHY
      phy: apple: Add Apple Type-C PHY

 .../devicetree/bindings/phy/apple,atcphy.yaml      |  222 ++
 MAINTAINERS                                        |    2 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/apple/Kconfig                          |   14 +
 drivers/phy/apple/Makefile                         |    4 +
 drivers/phy/apple/atc.c                            | 2294 ++++++++++++++++++++
 drivers/soc/apple/Kconfig                          |    4 +
 drivers/soc/apple/Makefile                         |    3 +
 drivers/soc/apple/tunable.c                        |   80 +
 include/linux/soc/apple/tunable.h                  |   62 +
 11 files changed, 2687 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-b4-atcphy-d6a7c939d417

Best regards,
-- 
Sven Peter <sven@kernel.org>


