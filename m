Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350541;
	b=gWKEm7/C6bEfcKGV/tySZ4Y2shC4Gw0SMXGSVCKsiUpWDWhzwLncH3SvNnYXAxvvIfF+
	 6sWdCLWi/UWtWsTRKmhgO9NffGnuk1Gh8zGgYbnK4N90czosOPdtaSbBhVSuMQlBDpFgc
	 NT6bkFIyb21o5CUsHrxIXSqLeBltQgOva5T/I4grtKSu6wzu57sJpVJVqx7cq6gATv8D1
	 Qp1qq9eBsrZ9Q5rcQ7/YZvBSdBofm7RNAGMwMnnxm8L1lyit4ZOrzZpRyaidrp1K0OSU5
	 FgoSQEQuzYfMYt1/F8jAU7TS6fca75WeY8XpatpsCQTBFP3WClcllaKuwyzRKHbSHsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350541;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=GhoiZszjuN3w5Fm2hunWOX+0BVs+t5B3J+oM03hF67o=;
	b=EmU51xrw+t3AQuSB/Y+9IDPhU1uT/AaNHBTlDKpqA1vqKtesPU7vkvHbQmirpNnWnNCa
	 +5CHm9D89nLWtk79YUy2g5HSVvAfvFgnXfTPi3jYJSPgEFHOatHIF16dHvtOiahQGxhIk
	 DL+l899OPC0bXCJ77JQis7+ZaRl4J8Hz9YImIwkDWjWJ0yxqonZoQupjw4ObdnLfw49FO
	 I93maKdaLF4kI1QkqpPTrE3CrNs8PVOdtF+yHmERKbQlTBTjv3JYN+BChuwng8JXMrYpZ
	 anMDlXywrmFzit5IjLDe/hF7DYMieE2sN/Q4h+awA1ykBnP3xbQ6SB+hqwhrsgUFhTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Id7q+mJq;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B385606A32C
	for <asahi@lists.linux.dev>; Sun, 22 Nov 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B385606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Id7q+mJq
Received: by chaosmail.tech (Postfix) id 801BA1C89FC;
	Sun, 22 Nov 2026 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795350537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GhoiZszjuN3w5Fm2hunWOX+0BVs+t5B3J+oM03hF67o=;
	b=Id7q+mJqZxDW2IhhC6HjWCrhNpLobSTWqg2N+isLR4+23AAIfcxqeH9Fsecwyq1v9gz6Mn
	OVZF+yjOjaJ0Hs7IdtfAyJBQTyLjQsSG8ozzVunHMS2k6HphgW0InzExdj9FXFQl/tfv95
	zIwvmbOzW+iZg+Q2rApP2yrIFQ7KT/4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/5] phy: apple: atc: Add M3 support
Date: Sun, 22 Nov 2026 13:27:56 +0100
Message-Id: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22Oyw7CIBBFf6WZtRiY+kBX/ofpAsapYLRtAIlN0
 3+X1q3Lk5yceyeIHDxHOFcTBM4++r4rgJsKyJnuzsLfCgNKPCgltUhaIYrBjcJSrU6SLLW0g+I
 PgVv/WVvX5sfxbR9MaQkshvMx9WFcx7JavH/drIQUhEddWzT72uhLedLHl/HPbWJy0Mzz/AX9b
 uEJuQAAAA==
X-Change-ID: 20261108-t8122-phy-bc3190cbcfc4
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Ramzi Abdiche <abdicheramzi@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795350536; l=1567;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=Kp01ycWuzoptDIrN7MNAH0bHYDa+M7xuLnzw7lbLukQ=;
 b=mwixH2Ozb3tFta2KKHNovxiS6mmnM39VueS4b6Rb4yJe8pkvZpnXq3bUc+MmuS25VTdYXXFFU
 xvLpJxqeEkNDVppqf/mMJ5IhIjJxyt71j0dekZBwJTGH57JFgQ8u3dm
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The M3 series introduced a new Type-C phy. Add support for initializing
and configuring it. This is one of the puzzle pieces needed for
USB3/TB/DP support on those devices.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v2:
- Split atc.c into generation-specific files
- Improve error handling
- dt-binding fixes
- Link to v1: https://patch.msgid.link/20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech

---
Ramzi Abdiche (1):
      phy: apple: atc: Add T8122 DisplayPort support

Sasha Finkelstein (4):
      dt-bindings: phy: atcphy: Add M3 series
      soc: apple: tunable: Allow passing NULL to tunable_apply
      phy: apple: atc: Add initial M3 series support
      phy: apple: atc: Split generation-specific code

 .../devicetree/bindings/phy/apple,atcphy.yaml      |   9 +-
 drivers/phy/apple/Makefile                         |   2 +-
 drivers/phy/apple/atc-t8103.c                      | 215 +++++
 drivers/phy/apple/atc-t8122.c                      | 588 +++++++++++++
 drivers/phy/apple/atc.c                            | 938 +++------------------
 drivers/phy/apple/atc.h                            | 806 ++++++++++++++++++
 drivers/soc/apple/tunable.c                        |   2 +
 7 files changed, 1726 insertions(+), 834 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-t8122-phy-bc3190cbcfc4

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

