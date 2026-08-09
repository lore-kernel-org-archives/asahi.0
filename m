Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7136896D;
	Sun,  9 Aug 2026 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277772; cv=none; b=E+/AQB0cHMqM+TRyvSl3HWzhDbVie8hUN/F6kt+JN7qelE38SF7qEema8MntdBouQLaMd2KxeKFAzRYEa1n+Uri4rtUnSmk9VMIsNzDo+0SvzfPTUDnIIrhvvYp2h/KCPUu6XU4+3zSWj0gHWiokNtmj4ZVqG1KuKG4btPUPA4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277772; c=relaxed/simple;
	bh=DsfiHmyqE8aSbXZkKzysnOzPgwXdCEsx/VkGP4SjgGY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gFOm3EqIm0i0N1NOpUfaoegJXkpTtXxDnHPh/X4SYrBsoq/aVihCILIIYjEVyX7640D4r4MJgzpyyo8rwup5AlWwq4cyKPiSNvHHIYgc+esYNb3yxoprT/6ESdmx90Nili4djlG5PkoLPq9mCjD9uh/oMvgfgNgooVBW1vq5TfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHvG7ffx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHvG7ffx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDEB8C2BCB9;
	Sun,  9 Aug 2026 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786277772;
	bh=DsfiHmyqE8aSbXZkKzysnOzPgwXdCEsx/VkGP4SjgGY=;
	h=From:Subject:Date:To:Cc:From;
	b=bHvG7ffx4zCV6lD3MAyEaAiqpO3wOwofvKCX9mFS8M64HD3zdkSQm7S/5a2cwX4dH
	 Ft82oryuR+q4xIcKwleSVi3TDuJt7oY76bkpaJNL/+EVkaRCbgg2kE8Gcgk9m2pyUD
	 Uhp/J7zJkken2KF5p7i0/aALXA5q12r3FEuFC2WrP6EPUSLLla+xBviAwrTZh1bn97
	 W30pw3z9On31TdvQjz0JFgriAEb1bsPTNZZgoXIQo2gt2h32L2qCJFRjkBdDDq1iqs
	 t4cTxhzkvKAhEZwc16Zpq8njHaoCMF/C9kzUzI/IfMrKTF7Wh2bR1s+eZ19vFBslmM
	 +piDTDHc1obVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C829DC5AD5A;
	Sun,  9 Aug 2026 12:16:11 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Sun, 09 Aug 2026 14:16:01 +0200
Message-Id: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5EQBBG4VeRWk8l7RLBq0xm0d1+lAXShUjEu
 2tj+S3OOUkRBEpNclLALirzFJF+EvKDnXqwtNGUmaw0lanZFexl5gDFytbmnTOFs20NiskS0Mn
 x331/r3VzI/z6POi6bpQn5XNwAAAA
X-Change-ID: 20260809-b4-cio-reset-aa3fb04bad9e
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=DsfiHmyqE8aSbXZkKzysnOzPgwXdCEsx/VkGP4SjgGY=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZFfnNE7VrLuzN3HSpcd7HbKeSfunzERAHGT7IqlUftb
 k2q2X+yo5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCR2bMZ/inFntr83liqw2Vz
 lcvuzVtPyOsfF9WeGTK/gs3hbJj060aGf3aC/m2r9k7aHmm35T5XvO4t0/VbyrKuCh17qXYgL8H
 pCQsA
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
Sven Peter (3):
      dt-bindings: reset: Add Apple SoC CIO reset
      reset: Add Apple SoC CIO reset driver
      arm64: dts: apple: Add CIO reset controllers

 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |   6 +
 .../bindings/reset/apple,t8103-cio-reset.yaml      |  74 +++++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-apple-cio.c                    | 182 +++++++++++++++++++++
 10 files changed, 301 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260809-b4-cio-reset-aa3fb04bad9e

Best regards,
--  
Sven Peter <sven@kernel.org>


