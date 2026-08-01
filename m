Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A6C346A0C
	for <asahi@lists.linux.dev>; Sat,  1 Aug 2026 21:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619856; cv=none; b=TH2HP7vLlSFazUxBGWRoTYrKp57Lzs/XOeCpHokRQFM2kP3oHqtp99r1x+QCPA6E0LmcwoeujyeGICETGltUJVKJLj6LlQW+PrGK7onlWAzAfdjGaOl4RXClq4sU/7sueQQJpN4LtphHv1XNCdcmj+bV/AUWiJRDMsedTwL8KmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619856; c=relaxed/simple;
	bh=MUzHrXbd8n2NCD9Eadg2uDAMQrUrE7yS0G6eYeDPv0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TaG2z70DD6+BH8vLkQ4amPkNE7N9pPsmcWIa5be1GKiuAbUTVyEn0Tin5yfRYdbhbNmfhWh9hBOld2BAcScC6tt/X+CTTWxN4dL74QlovToy6ETPd58gCwgv91X17HaaCvPr5l5siSgPYBriHfHe4wwzGx1lY21xzv4UdT30KWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=hpY3Ti2k; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="hpY3Ti2k"
Received: by chaosmail.tech (Postfix) id 07BBB1C87FF;
	Sat, 01 Aug 2026 21:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785619845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hwPIDXkHOLX2pofkwEoqOv94i7apCAfdrwYcx+PPWXo=;
	b=hpY3Ti2kFDmdXWOiUJdvoAwGQA/Q80DVPeV55NDmAD32OpQ1/MdJSHVAZJnzdaMqv7Hs/q
	b4PDTnvZ1Oaub4mJbr+JlZXNbFc3MKRqcyjCtsArQ6jsJhk2QKhWiIBEUAoRp97f97yCmP
	U0Ql+desJQD6pJ2fO3k38f3CbOsa9PU=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Sat, 01 Aug 2026 23:30:09 +0200
Message-Id: <20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw7CIBBFf8WwFsNDinXlfxgXFKZ2jLYNINE0/
 Xehbpro8ubec2YmEsAjBHLcTMRDwoBDn4PcbojtTH8Fii5nIpiomBaKRhwdNRYkZTVrWqUZtKo
 meT96aPG1uM6Xbw7P5gY2FkFZdBji4N/LscTL7p83ccqolrlxsuLyYE75kyE8DN53EWxHijyJN
 a7XuMg4l3tVK924SqoffJ7nD+D59YT4AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785619844; l=2244;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=MUzHrXbd8n2NCD9Eadg2uDAMQrUrE7yS0G6eYeDPv0g=;
 b=4rMMRI6uvsP8G5nm7hRToUMIg43AAPOr9CMuHWJhUpabTvpG2bg6Pl8Gf3qt43Qh1FBCy4kiy
 /lfancP4YViCftm0RwjT9Kegbyk/5Jyj6xyZ9gJHN2uGM67T6OfMn9g
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
 drivers/usb/typec/tipd/core.c                              | 241 +++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 104 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 297 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 124 +++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 685 insertions(+), 195 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

