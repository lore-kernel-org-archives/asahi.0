Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E003DDDB0
	for <asahi@lists.linux.dev>; Sun, 16 Aug 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876004; cv=none; b=ctj8wf549HW8jmTeFzO4K/7M2G0XbEtctXEWQnwrwGuirQwwjcLDdnmL2Sk2UKR17+xwSc+RpOHNib+sf0Vyt8dRrsecCQB2tZkUNhfocoS/d8yqBUeFOGnHd6IbhfMzrzh05SM7vWv4b5mmXUEQCMxYjuvOuoLhRMo+T1d7Muw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876004; c=relaxed/simple;
	bh=OLyoVPhzaNfTGeXib5DDiwu6l7kkMfxH08pJ8wWb1Ng=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NWk5Z4lChWZ6p006oVeIBazNjP4U4RN2HKBiYTJvpH8aNDfAs6L74JDmLJJiIoo2vAxO9ijsLA2q4r+1nz85c4d+bknzixczEi2wOtvhIKIwvMUdc9olOr05fmjcUV/nhU4JReOhltA119OqXwVPIhLNewbg/aQSbZRitWQ+Yy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=HY3d1Fyu; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="HY3d1Fyu"
Received: by chaosmail.tech (Postfix) id C52BB1C867F;
	Sun, 16 Aug 2026 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786875993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DowHBzYBeYhj8nTjDDpRI3Jvmvggcy6l9lhFppTjGSM=;
	b=HY3d1FyuTBr1lSqaZpRGN5jywrz0NtmwR6pwsxKkH79jt9CdfW2r+zqDEkSNL0d5NxGhqz
	TtGufr1FSN6ZPWSqRPa5yOniFbT0Q9fOVpsKQpWsGHvSQat6CGPLhR9jiOEsPyDpFoaScK
	F9/dwBc2N9xnrTnknkh4wu/3Ih9BQV4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v6 0/6] spmi: apple: Additional commands and interrupt
 support.
Date: Sun, 16 Aug 2026 12:26:20 +0200
Message-Id: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQW6DMBAF0KtEXtfVjAfbkFXvUXVh7HFx1YQIU
 5Qq4u41dFFQWX5p3p//EJmHxFmcTw8x8JRy6q8lmKeT8J27vrNMoWShQBmwSsvRAN1lvl2StJU
 haCO24EAUcBs4pvta9vr2m/NX+8F+XBqWiy7lsR++128TLneHxRNKkIxONdEHFah+KVv6fHHp8
 3lk34mlfVJbX++8Kj5WxDoisK7p0NOfr4F2nor3aFsNJjTo8NBXW7/fX61eO1ShcTYce731+/2
 6eK3Ja+dVRLL//DzPP/Uhu7G7AQAA
X-Change-ID: 20260725-t603x-spmi-74630bf1b0a0
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786875992; l=2141;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=OLyoVPhzaNfTGeXib5DDiwu6l7kkMfxH08pJ8wWb1Ng=;
 b=U0TjqGf0leFO8TPJiqPRrrmUp4br2fyJs6ax/NFVXnMkOPbCYgO/wn1LHcj//ORIlfSAkPxwP
 yfhjiJ/G7lSB4P4B6VOX79P+Sz5jWqbyb8l3aaJp/ZQ28R+JNsY3wWQ
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
Changes in v6:
- Fix interrupt controller teardown
- Link to v5: https://patch.msgid.link/20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech

Changes in v5:
- Style fixes per review
- Fix fifo flush
- Link to v4: https://patch.msgid.link/20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech

Changes in v4:
- Re-do error recovery.
- Fix an address calculation mistake
- Link to v3: https://patch.msgid.link/20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech

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
      dt-bindings: spmi: apple,spmi: Add t603x and t8122

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml |  15 +++++
 drivers/spmi/Kconfig                                   |   3 +-
 drivers/spmi/spmi-apple-controller.c                   | 389 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 375 insertions(+), 32 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-spmi-74630bf1b0a0

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

