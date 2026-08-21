Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9838A437456
	for <asahi@lists.linux.dev>; Fri, 21 Aug 2026 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300802; cv=none; b=nBA+YJ+5joE5MfOaWfNlUfrr6wZmtrUujLvPz01KcABY10iXA0KFtg8znQMs+9kNeQNWu44OZ8w+QqKNN7Ev926DqqNQTCmj7bh1Uig8d5omtR1xNwqxv3/sAsb3/xwBNLIr+50luniyeUyCkgjiZSoDjP9KhUsX86W5tKCzWFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300802; c=relaxed/simple;
	bh=OcJwANzjnbtC7spRiQbQ995Co/XEkiV88Frn1JEIpQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aKO+XZkKkkirPc+jwCxKAi+XgVv34lqWAkS+FSF3gUPMwh3Y2bZL1haC2Nl1yolbf2MmOhroWdwGdxQ86eCwSBKH/fL8x1wUvkPUyzNAOt0UDDi4MT/En0otqK/3BlMFOV4VbgQ14ZMFoTLD8Lkf4bEacd9PggbbGEdpF57TE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=nyFBk2NI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="nyFBk2NI"
Received: by chaosmail.tech (Postfix) id 7FA911C889D;
	Fri, 21 Aug 2026 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787300789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cRXvKJlBvjmrfmlI5acUpwKe8I6Y8Qdakl+yD9gPAuA=;
	b=nyFBk2NIG+IFRstAdqBeInuHzsBzJpkhVCowihjTTjgRtu92ETNhQONfa7ryFp9BBwGgWv
	NiM/MrQmaGzBxr0HcHdeuYIyLQ1CTKzYnhvASjJOW09rtNYavcDt0MYnukAM0xZs+EGq5e
	ezI6zxm4TdzdtJK/zn8bqvBpDNV6LVQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v5 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Fri, 21 Aug 2026 10:26:18 +0200
Message-Id: <20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PQW7DIBAF0KtErEMFDGNMVr1HlQXGQ0zVxJFxr
 ESR715IF0WKl1/M+8w8WaIpUmKH3ZNNtMQUx0sOuN8xP7jLiXjsc2ZKqEYYhXyO1547T8CFFV1
 AIyigZXn+OlGI91fX1/Evp1v3TX4uBWViiGkep8frs0WWua3eRXLBDeSXHhoJrfvMm4zp7OLPx
 0x+YKV8UTU3NVeZS9Bo0XR9A7jJ4Z+3QtY8H8ZbABUUeaeD3+S65k3NdVnetoidRGGlfuPruv4
 CxXNVvnYBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787300788; l=2547;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=OcJwANzjnbtC7spRiQbQ995Co/XEkiV88Frn1JEIpQY=;
 b=bqhzQ6Y3P7OuE3J2rwJ2IiTvx8QIMdCKLG6d4Rqi5ltlARf3q4dQy3K6nNAEdfhwDKamkWTcg
 oryytV1HUIOBMzgRqd39mPwnG3Olu+FfTh5JABytwEo3ISydxbZz2+Z
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
Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

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
 drivers/usb/typec/tipd/core.c                              | 246 ++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 106 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 702 insertions(+), 196 deletions(-)
---
base-commit: 3d9eeb336131bc5a174367c384fa00c15c8744fd
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

