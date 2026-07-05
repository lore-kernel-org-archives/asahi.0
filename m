Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6036C0AC
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239407; cv=none; b=rud2wkP/vVqblpox3dKFt2nPnuJVpo2P0ggecWjCJPEYawZFFMjCtwrxXTGDAJ4Z0akpAnZI3TYj32hdZIMhv8rQiN13vrXN5exN/8YWjUVMqRgvl3lWK5JRKPTn8dnKkmfD/yiouzZeBD86MB1HXDBYn18OG3SGy3EhEJ58IPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239407; c=relaxed/simple;
	bh=e9CoEDwG1cbuQpb5x6xSuH1axeei/ZWdFetHF10wjzw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qxYSzUwLHDjzN97qZKTOghwQVgjKQtkYX9AqqvgMnouDV6k2OimM/NizVbpLqc80N1V0w2k37VJ52AAY3UOGZEv54NmULxGImrqLU5rJCMsGclbI7ZKgfHtkMRvXfytHQusZwlofNScwyl/m/STBdK9MN5nBHLkC+RhW1SiWZyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=KQIf+CAZ; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="KQIf+CAZ"
Received: by chaosmail.tech (Postfix) id 9EDFC1CC21F;
	Sun, 05 Jul 2026 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783239398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pDLQdHX5gTGLk/qcwUj+BnQvTh2X825nYYdv1sm68gE=;
	b=KQIf+CAZQgI6mEIjvqCmqeZF5EZhfYn7NN+F/meU5c8aKwoehil0dFMYAhcFy4NOb+IKh9
	6Sgt4AfMXK33gzOU+QiHhrZwrd5OS6CgyDJUnkVwxe2g0JZhJIHRV4nqfIXZl63fglHPWA
	+MTI9agFqYOGw88gsbDzPkHTQKwH+DE=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/3] soc: apple: Add "PMGR misc" power controls driver
Date: Sun, 05 Jul 2026 10:16:29 +0200
Message-Id: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBAGX4X0bE1bKERPvofx0C4LrJGftNhoC
 O9uixcSPX7JzOwuzKMj9OycLcxhIE/jEEd+yBh0ZmiRUx03U0KVohKKT33reE8euEEJttYWFFQ
 s8pPDhl5b63r7bv+0d4Q5BRLRkZ9H996OBZm4f90gueBFIyptcnPSIC/xk9H3hh7HGaFjKR7UX
 s/3ukq6VaU1UoA2xY++rusHe0iBjPgAAAA=
X-Change-ID: 20260702-pmgr-misc-ae1cbd5bc2c7
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239397; l=1926;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=e9CoEDwG1cbuQpb5x6xSuH1axeei/ZWdFetHF10wjzw=;
 b=jKItj/3tDyZFn57sHoVKW4ElnRhTcuHnatqYe3oFAnkxL9uFJo8h5ghENN7SPn+8kJ4Fzhxge
 dEssGlepPjQBonZ1R45SUGLF0O4PxztxG8ey+LAXNxAX2XlUb3CEqMI
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
Changes in v3:
- Remove ability to probe only one control, it is not used anyway
- Allow building as module
- Style fixes
- Link to v2: https://patch.msgid.link/20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech

Changes in v2:
- Error handling fixes
- Reword binding description
- Link to v1: https://patch.msgid.link/20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech

---
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Sasha Finkelstein (2):
      dt-bindings: soc: apple: Add Apple PMGR misc controls
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |  45 +++++++++++++++++++++++++++
 MAINTAINERS                                                            |   1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |   7 +++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |   7 +++++
 drivers/soc/apple/Kconfig                                              |  10 ++++++
 drivers/soc/apple/Makefile                                             |   2 ++
 drivers/soc/apple/apple-pmgr-misc.c                                    | 181 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 253 insertions(+)
---
base-commit: e5d9690657844a2645a518cdf838206f6daf513e
change-id: 20260702-pmgr-misc-ae1cbd5bc2c7

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

