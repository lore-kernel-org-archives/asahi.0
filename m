Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDECC081
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 14:07:37 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 33ED326F78F;
	Tue, 14 Feb 2023 15:07:35 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/2] arch: arm64: dts: apple: Disable unused PCIe ports
Date: Tue, 14 Feb 2023 15:07:21 +0100
Message-Id: <20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmV62MC/x2NUQrCMBBEr1L220iyFQleRaRskq1dkBiyNgild
 zf1b94MvNlAuQor3IYNKjdReecO7jRAXCg/2UjqDGhxtOguhkp58ZQ+OpUoPYhS6MWaV+Vk7Bi
 tR+eDpxm6I5CyCZVyXA5Lu57RJG7HVCrP8v1f3x/7/gOYiLCdigAAAA==
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; i=j@jannau.net;
 h=from:subject:message-id; bh=mJePsRmFwyyrddTE6kaIXBmZqaQlble6W87e9MG6Cjs=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuTXU5eVf9vixj/dYdIb08/firYdtHWfYKWckhByJ/WA9
 8bg5VbuHaUsDGIcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACaiZ8HIsKvZxaLr6JaujeUM
 Pw8pNFYq1DzZzunp+melYqhC9qf2NYwM1zZs0nhUplVY0ue1PSqIq+envEjZSYnTrj0rO06eu/O
 QDQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The t8103 and t600x device trees deleted unused PCIe ports. This was
probably done to replicate Apple's device tree which doesn't has nodes
for most unused hardware.
A more accurate description of the hardware is to disable unused
hardware.

This was discovered during the review of the t8112 device trees in
https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (2):
      arm64: dts: apple: t8103: Disable unused PCIe ports
      arm64: dts: apple: t600x: Disable unused PCIe ports

 arch/arm64/boot/dts/apple/t600x-die0.dtsi      |  4 ++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 11 -----------
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 11 +++++++++++
 arch/arm64/boot/dts/apple/t8103-j274.dts       | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 15 ---------------
 arch/arm64/boot/dts/apple/t8103-j313.dts       | 15 ---------------
 arch/arm64/boot/dts/apple/t8103-j456.dts       | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts       | 11 +++--------
 arch/arm64/boot/dts/apple/t8103.dtsi           |  4 ++++
 9 files changed, 42 insertions(+), 49 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230214-apple_dts_pcie_disable_unused-03c08218b8af

Best regards,
-- 
Janne Grunau <j@jannau.net>

