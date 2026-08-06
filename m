Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54813F411B
	for <asahi@lists.linux.dev>; Thu,  6 Aug 2026 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009136; cv=none; b=ILwgr4f6ohWHm+Wq6zC15u0ha9kzQJhSLmWT/UsEMAfUHZnxKgz1I6csYuynxTtFrfWNDbECi1jS1mTz1Ccp+FDpOBrbqghiGMoB3qmO9vQdU+zrcGAK60A9JzJovBNVbQ8R+U25zqW+d42LPmcQEDfDNNCT+HNk32WXzmXspDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009136; c=relaxed/simple;
	bh=87xiSp5NbIVEzBkYBz33rdO65pry6dY8g5pN4fFkCBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ddmPPgVniyeDyUAte6IBpnCkhcjArjeE/7mBD7ABat97NGQUs2LsigeouUmU8fsWekQz2mVZjHXN8jmf6V0wz1wBP26NQ/1qp/gSdNu2uuGQxrlmMANjY0Z46DtbVezL5aR78UVIF/MmUBRjhrTT2jVPPmoTQRpOlE1+ma3aowo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=vvDNyI4I; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="vvDNyI4I"
Received: by chaosmail.tech (Postfix) id 4844D1C867A;
	Thu, 06 Aug 2026 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786009131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PmabZA0qSqEuuUpNPi6PV2cpZ3axKCDAeR5lWOl4bmA=;
	b=vvDNyI4IescBUAqWIYsXb4ptEZH69DUkqpOVucTPPisNzBPnZ7449xDptmTP6vFox6Nsco
	73SjQfai9mvA+ktJ7nQttf0fD8YAVPbhSxz4mi8s0plzTCEGE7KIqEDgfp9ILXQhL7BHyX
	bQHViUtapD65bl1242DJJUl+AX+MIN8=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v4 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Thu, 06 Aug 2026 11:37:19 +0200
Message-Id: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PQQ6CMBBFr2K6tqbtUAquvIdxUcpUahQIrY2Gc
 HcLLiSR5c/892ZmJB4Hh54cdyMZMDrvujaFbL8jptHtFamrUyaCiZwpIWlwfU21QaCsZJWViqG
 VJUn9fkDrXovrfPlm/6xuaMIsmBuN86Eb3suyyOfeljdyyqiCNKkh51DoU7qk8w/t7oeApiGzP
 Io1rta4SDiHTJZSVXUOchOHH14wvsbTY7QAEFag0Zk1f/g0TR9oi636NwEAAA==
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786009131; l=2412;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=87xiSp5NbIVEzBkYBz33rdO65pry6dY8g5pN4fFkCBo=;
 b=IRLlQtfIWvRD1dX1xg3VAeUhxCl+m+kK+l6H/RHtVTncY+TqCBYgYLaDFkvAjceGIRKymQ84k
 VDyDvlkJbtSAUfolTHlgpzFSCOjuN/oYo4JPJ/Foyg9Wo0cZPJt4Kly
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 241 ++++++++++++++++++++++------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 106 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 130 +++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 698 insertions(+), 193 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

