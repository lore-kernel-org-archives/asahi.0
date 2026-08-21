Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDC377ED9;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327147; cv=none; b=rMJH/wIW9MDmWPogzoWbfPAj5td5u3ssoeUL1ucdwXpp8oHKDNm28CuojwRoOJy5O+NtPsiPbMXSfNXciXNf+eOIGbHKwDBEb7ao+YtTsg//7hn0yb7WIAGUzR129GPUHG+ffXkU60zXSOhw+zf9Zc64j/1xBQ9fc2I9W/XSW34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327147; c=relaxed/simple;
	bh=Co3rtpcICbG7MUsR5ETBefuCQJYk/RF+cMq9PmdIX1c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=um+Tf/3MXD5waK9aLlZsVOeU9iZiz70tIAvd/5yd0vqwTuFOyvqpSePBZTyX+sKklG3m+jMRhGDByOwJrZ1GnHMxp7075JSfW75ChUoHv4kXFeBjxIIRr0JuASTjXwYci6vNFQvvm6E6Bp/0CwfutCKwQK6LYpr8jZCmI5u7cW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsW0d08B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsW0d08B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84860C19425;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787327146;
	bh=Co3rtpcICbG7MUsR5ETBefuCQJYk/RF+cMq9PmdIX1c=;
	h=From:Subject:Date:To:Cc:From;
	b=EsW0d08BK3tO/pkeuFSan4xgyf8lg3zwZ4FeyaUDuSHoNqpqtn+us4AimuvEdHYEw
	 0qIbO+e/f44ipw8Vi1U3JhlW5u+XwpujzmElHw9Ph8oMdB8xFlZLFoHAFWyx/bES3k
	 p4wDgiHAvQv7ahSZxDeXm0vEasvCmCTd9rdHQdGVyyVOxtX8dMGiDMs1q5a63IKGRe
	 wi/Zi5uqCJjzey4Cn0qoOlPE6paNqLdGZrh1Jfd4DNyKx/ULRAIOkKJiP614ZjfqUV
	 VnZ5OAF2T61Sim/LBCr8lK9F3Tng5ClevYJ0M0Hh5rKrZidM052G2uYw1nrK+Gij5D
	 GqTlfb6Mkh8jQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ED5C5DF93;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH v2 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Fri, 21 Aug 2026 17:44:53 +0200
Message-Id: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhCGxFX3sOwaGGAUUPJFImG9
 O4WXLt8yfvvrxBImAJcshWEFg7sxwTFIYNmsGNPyG1iKFRxUmdVoTPYsEehQDNaqzunjLNtRZA
 mk1DH7z13q38cXu5Ozbw1NmPgMHv57H9Lvnl/0kuOCk2ndVmWbeWMuz5IRnoevfRQxxi/58YnK
 LsAAAA=
X-Change-ID: 20260809-b4-cio-reset-aa3fb04bad9e
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2703; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Co3rtpcICbG7MUsR5ETBefuCQJYk/RF+cMq9PmdIX1c=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH0eJJ158ufD1h7UJG9u4HT4z0ndbf7vB+Jxz+T03Be
 7/KAoF9HaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJvJvOyPDqdOYOpn26Tx6X
 dPK1v9pUr3Zx+pY9irVsvVZz5fImdR5hZPjqf66mLs3z+1Jx1ZUpdwItFvn7bnw7dVe11yYL/aS
 5M9kB
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
reset inside the power manager that has to be deasserted before their
co-processor can be booted. On t8103 and t8112 each port comes with a
dedicated register page while t600x and t602x use a single register
with one request bit per port shared by all ports of a die in the
middle of the PMGR MMIO region.

The first patch adds the dt-binding, the second one the driver and the
last one the device tree nodes for all SoCs. This will be used by the
upcoming USB4/Thunderbolt series to start the host routers before
booting their co-processors.

Best,

Sven

---
Changes in v2:
- dt-bindings: move the t600x example with the PMGR sub-node over to the
  PMGR binding itself where it can use the correct number of address
  cells such that the unit address matches reg again (Conor)
- bail out of probe when no match data is available (Joshua, sashiko)
- explain why neither a read-modify-write nor a delay before polling
  is required for the shared t600x register (sashiko)
- fix a copy/paste error for the M2 MMIO region in the dts change
- Link to v1: https://patch.msgid.link/20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Sven Peter (3):
      dt-bindings: reset: Add Apple SoC CIO reset
      reset: Add Apple SoC CIO reset driver
      arm64: dts: apple: Add CIO reset controllers

 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |  12 ++
 .../bindings/reset/apple,t8103-cio-reset.yaml      |  61 +++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-apple-cio.c                    | 200 +++++++++++++++++++++
 10 files changed, 312 insertions(+), 2 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260809-b4-cio-reset-aa3fb04bad9e

Best regards,
--  
Sven Peter <sven@kernel.org>


