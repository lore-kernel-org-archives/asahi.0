Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7FB23645D
	for <asahi@lists.linux.dev>; Wed, 26 Aug 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741616; cv=none; b=RFiEAoxjs80MQQ5ZDeJKBf+2uOLedgdF0992ny/Y4U0G4QEetgApuob0OxtybIn0uhzXJ5VLd0bV2J4WA2XGROagFxTlnCe0YXG0k1BdARsUgnnkOiqY/xMoC9lMklW3df1NjBumf1AfV10bfE4mhD56VmQzTs5wI7N7w/7cCBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741616; c=relaxed/simple;
	bh=+Nm/GOdv7sAy5pNIxnamaskmo0BNDubXQZQmnNJ/oU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tzIVnScR+rQxFJJGUYMhfuWjW3FJxIy9L6+zLCpee3pMHqfb5vSTUYwRsav1MsfTffU5MnbN5S+UaArnOsePn/9xT31DYPH083bNSx/ywTkZI2fJ7BSaSeaWjbdmS1pm1jgzkWQE34AEdT0Iyx3l9ED4ZvuuYFDG/l7YjBSoVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=P0tonfCE; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="P0tonfCE"
Received: by chaosmail.tech (Postfix) id BC8521CB862;
	Wed, 26 Aug 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787741582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AWLz/nx/HKW4l1MsmrOvAL31GIJPVq9zkyA7xVp6kj4=;
	b=P0tonfCEY8CQIPzuHFbedZAz1sASaNl7V2heq5flYm92JTd3od0V5E+qhkNifvm89W7ha7
	hQ2v74ZBSqOSUAFmDZATgsfcOXpNdkno9CjF+SwoN8c+uJUljtdvbY4ysspCs6vdNrSNF5
	xJefk9dYJgUC/w3JqmyyeSyOt0t3+M4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v6 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Wed, 26 Aug 2026 12:52:56 +0200
Message-Id: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Pz07EIBAG8FfZcBYDDAOtJ9/DeODPYDG63ZTaa
 DZ9d2E9iLHHL8zvm+HKCi2ZCns4XdlCWy55Ptdg7k4sTO78QjzHmpkSygirkK/5ErkLBFyMwie
 0ghKOrM5fFkr589b19PyTy4d/pbC2gjYx5bLOy9dt2Sbb3FHvJrngFupLBCNhcI/1krm8u/x2v
 1KYWCvfVM9tz1XlEjSOaH00gIccfvkgZM/rx/gAoJKi4HQKh1z33PRct+PHAdFLFKPUhxw7rv5
 sx8pBaU0RfAyQ/vF9378BW0gRn7UBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787741581; l=2748;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=+Nm/GOdv7sAy5pNIxnamaskmo0BNDubXQZQmnNJ/oU4=;
 b=5v4h96Y8mqlUwq5S3dXU0kOJBkEhi7ujShT5XKrhHBAv/bKLjugB087hLtxVsF1llNGcVS4re
 p0GXWVOH2uMCuvMt+tr60XAlXRFteswN9aSXD8Gf2zZhv1gsoCvvijt
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
Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

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
 drivers/usb/typec/Makefile                                 |   1 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 247 +++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 705 insertions(+), 196 deletions(-)
---
base-commit: 3d9eeb336131bc5a174367c384fa00c15c8744fd
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

