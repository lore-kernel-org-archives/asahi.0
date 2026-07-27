Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19C41D62D
	for <asahi@lists.linux.dev>; Mon, 27 Jul 2026 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168594; cv=none; b=lG1LxFJsbBTzIWc2SZkHW+3lnc96U+VhQxEXvxyxQGRkePWMbcXJ9csVVGgObGF9wVV/I2G/yzi4GARC/SXwpUzN9E40Ol0RDMa+Pfu1xLi1u/quHuxd+8dPC/yUk+tylt/JdrA/r92t0DsZYF2YSfl8HoRhxpZK2X/8gw6x0O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168594; c=relaxed/simple;
	bh=fMLAl8TbIzZK9hVkjbVOO1TXX3kATog6ZvDnFGAi5HY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=obFkqkMCGpWhvbM1pXvozuIyq7DiGFuqEsZ1BMQ4pMcHntvDUIXBCRaCHD9djnGB5J95rS9VSGj3frlGbUWjpqr9JS0BW81YbF6HxQSr7mHpl5jeIldWc1UVqLh7ZJa1LCS/jh63eCQTd5xXMFx2bp91bmL84gTe2JCCRz1ZGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=AvYi4nsY; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="AvYi4nsY"
Received: by chaosmail.tech (Postfix) id D24AB1C9733;
	Mon, 27 Jul 2026 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785168589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ydesar5FhHHx6/l8d459cx4/lILciil7MkfZ2W+d/r0=;
	b=AvYi4nsYdg+8rPMAeUTGdQ/hBEXZpP1/yd2VC+9PA2kBWv25YGJES4JLsedWf0Loma+ftg
	YExfdHoyxEeWQ4vc0BSLz8OT6CO/T6vP+duF5iH2PEnHOdTKxmZYmQLeVsWoezxtoBkbMe
	BNCQpyYHupLE24Bhk34KgjFA600OLyw=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Mon, 27 Jul 2026 18:09:27 +0200
Message-Id: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBAGX4Xs2Zr+BBBPvofhUMpW1iglbW00p
 O9uwavHyU7m2xUCesIA52oFj4kCubmAPFRgJj3fkNFYGCSXDW9lzSItI9MGFeMdH2zdcrR1B8V
 fPFp6761r/+PwGu5o4hbYjIlCdP6zjyWxef+6STDOWlUuo2qEOulL+cSFp6bHMaKZoM85fwH8R
 vaVuQAAAA==
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785168588; l=2034;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=fMLAl8TbIzZK9hVkjbVOO1TXX3kATog6ZvDnFGAi5HY=;
 b=Gcs82Q0qCWdzvny+1xz06Sqbmh4SciYkQsRSMzeZylcmns2VWf5jQjM0ILfBwELKtDwesAVZk
 2w96FSSuXCRCbClpBHYwED4Ay0OurB1jXNkTmmoHV6qGe3T1p8XpwcL
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

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 ++++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/tipd/Kconfig                             |  20 ++++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 240 ++++++++++++++++++++++----------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 104 +++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 288 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 675 insertions(+), 194 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

