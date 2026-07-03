Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF93A0EA5
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082679; cv=none; b=KClg5P8WD9tr4YFILJrpZgCelyvcQINxm4cfpQezgCkCdguGTbYQj3lFK9UZ5/wiwtw53/BYb588mmM1osKBaEYbbV6U5mPQ3OW6EbKsbrJ4VUpu5Y0lnh+LiUYPCM/FBxvqgWUOwbKOQ4i5R7omh55tt/6KvZ9O4YwxiGYcKC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082679; c=relaxed/simple;
	bh=8D7Po7SCptGVEHm0r1MA8F5t/rLXTgEyoB3RxAxQRVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cV1fRRC0Nn/eSrjHCzeGKFmpgqc3NCfTkV13cgT1K9ojF4mLHlKkRBQ2KD9qBL13hPU1zlp74htFWD1ayIel/IfgaAZ6+Ko3F0bbzTwx4yjjskJXEfIwVRaEh+gKYfu/Y/pyEeq6g37S++MEBrXO9Qwg57YcpxQzB2GsyCES47Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=fD0bWHtD; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="fD0bWHtD"
Received: by chaosmail.tech (Postfix) id 61AC31CC21E;
	Fri, 03 Jul 2026 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783082669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8sQSDqAelniprUW0bjLh4r7TPdrV1wyI0a++eXewKTc=;
	b=fD0bWHtD56p8eHPQqsgumvfj42tKkzjKFtun/Ui6JnVvuo3KeE5/XJTfv8TYl9UG4OTV7c
	ENIt18XZMj3CVi3508IJK3cMRCTsf6GaaGGwHTBJnQcaj76xnIpqqYgrIjM8oN7MR0G1y5
	TKIJya7jhsnnPE5ej/jB2AFU2XnJXiQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/3] soc: apple: Add "PMGR misc" power controls driver
Date: Fri, 03 Jul 2026 14:44:10 +0200
Message-Id: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4XM2pq2Womu+A/DogwDjJFHOkg0h
 H+3xa3Lk5yce1cQCkwCt2yFQAsLj0MEe8gAOz+0pLiODFbbi861VVPfBtWzoPJksKpdhRZziP4
 UqOH33rqXP5ZX9SCcUyAZHcs8hs8+tpjk/esuRml1bnTu/MlfHZoiPhml9/w8zoQdlNu2fQH3x
 RwUuQAAAA==
X-Change-ID: 20260702-pmgr-misc-ae1cbd5bc2c7
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082668; l=1706;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=8D7Po7SCptGVEHm0r1MA8F5t/rLXTgEyoB3RxAxQRVM=;
 b=e3ZFilP3ziJzNDOl7lwPRWQtPWYiZ5G7wAfzdU4XPb501CsLWgxMMUj2XHpsqfs0+DPbrs0Ly
 fzzPfCV5UPwAkaC2yglrcnQKXYlcPbgI60fspd56MPuzJFdeX7Wu3y1
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
 drivers/soc/apple/apple-pmgr-misc.c                                    | 179 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 251 insertions(+)
---
base-commit: e5d9690657844a2645a518cdf838206f6daf513e
change-id: 20260702-pmgr-misc-ae1cbd5bc2c7

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>

