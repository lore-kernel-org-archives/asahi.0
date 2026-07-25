Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB630E821
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996469; cv=none; b=T1DnV262m4ai04llksohJsSwbSDNSxTgYmEEwQ+jRlDfuEHxt5meOhxxOpeFUE2uAqzA+UTi+H2IGCWl/XN5Fe2klSa/rLqPQShwpwAM6odfSVSCg/3SExdpzc3FYj7fehKY/o121MuJ6sPzJn37BiXQ1LLdcs2Y8cRuc+fe7wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996469; c=relaxed/simple;
	bh=GYWvY5URAkNkQ1kqNOw2smlI2JLCatnep+JhlX9A0gg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qm1ZQkcVlwe8McU27r9Z2CAxKO0N0GqV73fZsUV6fFNpqlL1x2fDxMKkL6+etTMvLwytHdqZk1M7Ro45ILV4MyWEwjkI+rWsbjbnr9ad2ipDwhh3+cvUie4V0/0QPUpe2dEtGhVbSGuizW0MHE2RC6n2EJYFnVeTIw5bKR+Sx9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=rRepT9lL; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="rRepT9lL"
Received: by chaosmail.tech (Postfix) id 6FF811C8684;
	Sat, 25 Jul 2026 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784996464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u1zr8HrJdV/Y3pfey2B5/XTcYM1ZBV0D6sRxUfn6RJ0=;
	b=rRepT9lL2ve9XWMdScLOYZz60oFQXgqWqByzHaGHplnW5vmOV63DpVJi3VmKd3T40xH4WM
	gkMi9CXhgZSN/DZvxmiID70iSDrcuZDxxcIRZ4doR8CGrj0FiLwGZRc3KROcYpmzCTgu91
	XNYVtvBsN5eWPYJb1NyjD0oSBnjic9U=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Sat, 25 Jul 2026 18:20:55 +0200
Message-Id: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDUZlRKuIhZVU8aimhaRiLsrl
 i/5+RdECkwR2uyCQAdHXl1CkWdgZu0mEjwmg0RZYS2V2NiPQhsqBTY4WFUjWdVA6n0gy+f36vr
 fcR8WMts7gPt+AE3TmJdtAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784996463; l=1521;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=GYWvY5URAkNkQ1kqNOw2smlI2JLCatnep+JhlX9A0gg=;
 b=YMosi9qQh+R/gX1yMPeFJxRyRY7C4hDqEbiw1DvZHWQ+b7nhU64ka/wrJ4M30rMCsdXj/uYry
 sHyhlyAf+j4BQRLV66+ITlol2pb5j4YPqexxKOEfCQDn1ViBJwLyDzr
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/tipd/Kconfig                             |  14 ++++++
 drivers/usb/typec/tipd/Makefile                            |  12 +++--
 drivers/usb/typec/tipd/{core.c => core.h}                  | 119 +++++++++++++++--------------------------------
 drivers/usb/typec/tipd/i2c.c                               |  86 ++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 297 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 523 insertions(+), 85 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

