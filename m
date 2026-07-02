Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01147ECCE
	for <asahi@lists.linux.dev>; Thu,  2 Jul 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994017; cv=none; b=tVs0BHYWsAi6DzlEGrpQOUl1AvaznCiPXoE3VrcJ5ZLW06S4NypR1xf3ox7nk/SBg3uhXCwv2ct1Sfd8yLf4NnFu4Rz5wsg3x2SC1Oaglz0+HoewZZADf1H38GXx7t+2pSb/wXKzePhvXWyya/XvnLuhPdw6fJRVYE19IgH6O7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994017; c=relaxed/simple;
	bh=jUlZSi3Y3F/0QuIxjuAl+t+pHRC3h/ygSTf4tVgbRFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dhhDfj4KiJaIemWs2h4V8/vyydWlboUeKr/rkqUSmL3Sx90KT34iVln3EbRL/B4cPmqSeEnIUN9e3SpT3W/mnAoPXxpAk0nP0MWaMYSYs+9dfSs/v/gc9lAT4fRgWUcOMdL7Xl7A5FE82Ls2InJW5+kTPPkSlCA5b3tbLZhzXhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=PvRN39e2; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="PvRN39e2"
Received: by chaosmail.tech (Postfix) id 347FD1C888A;
	Thu, 02 Jul 2026 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782994005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SQNpC2MoYnLQAl/v3dxVQexz4TEZdGqYDZch7PZVNZg=;
	b=PvRN39e2OtdyoOiqOOVP2E/XParelVBDKN6Tf444vbUXewXfCOBlZnpohD/6T1W3NOmIe5
	dJjT9qJqYMm5oDZmrOLvAh9YMZkHL3re6DIqUkSHUu9VMy1g2An0m+js2RnSAjbydVV8xM
	T33OvLIxpDx1AYgRkKBZGHH3NJdd/ac=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/3] soc: apple: Add "PMGR misc" power controls driver
Date: Thu, 02 Jul 2026 14:06:25 +0200
Message-Id: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBSA4VfRubbaViivIhd2HBxltIPU8u6Gy
 6/+/ghCgUmgziIEOll49QkmzwCnzo+kuE8Gq22pK23VtoxBLSyoOjLo+sKhxQpSvwUa+PpeTft
 bDjcT7u8A7vsBoLwa2m0AAAA=
X-Change-ID: 20260702-pmgr-misc-ae1cbd5bc2c7
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782994005; l=1550;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=jUlZSi3Y3F/0QuIxjuAl+t+pHRC3h/ygSTf4tVgbRFg=;
 b=24ErvKIbhJOk782EuxDOBxCg4INtj7JZ+kfwYzPQK38zAqwbYHrJ+KabRgYh7yB2Mirj5Qif0
 Z2vR12trINkDRcS8Vcb7pzaWD7AtPvbEmZ9fFceWRCi171ACZ57jl1N
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Certain Apple SoCs have additional power state controls that are using
a separate "misc" mmio interface. Currently this includes the fabric
and memory controllers on pro/max/ultra SoCs.

This series adds a driver to put those in a low power state when the
machine enters sleep. The power savings are SoC-dependent and are
around 1W.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Sasha Finkelstein (2):
      dt-bindings: soc: apple: Add bindings for apple PMGR misc controls
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |  45 +++++++++++++++++++++++++++
 MAINTAINERS                                                            |   1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |   7 +++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |   7 +++++
 drivers/soc/apple/Kconfig                                              |  10 ++++++
 drivers/soc/apple/Makefile                                             |   2 ++
 drivers/soc/apple/apple-pmgr-misc.c                                    | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 249 insertions(+)
---
base-commit: 59574e5978abfc2ce1c194ea0200eb6fc718d8ce
change-id: 20260702-pmgr-misc-ae1cbd5bc2c7

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

