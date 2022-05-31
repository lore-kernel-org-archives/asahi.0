Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97A3D76
	for <asahi@lists.linux.dev>; Tue, 31 May 2022 21:52:29 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1654033459; bh=p4MJ2MU5aVvrjpywhfF56B/Ig6lZU/rzO12jN2Ev3Dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g5Jk/uciX7gjDxDE1DUzZ7qIrovVAY+pyxKg1sRDyCwXPgbsgdVqo6ec9DzSCrfer
	 RHQ/pa8RV8Z0WaGMF+b3L7nDzIK99qtT98YvlTUod+guMo+aGqhoSiK8TjCJp41+SL
	 9Xj0YQr3rHBJExSTCGpOxusSTWFVpq+y9WDsm6I4=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Mark Kettenis <kettenis@openbsd.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v4 3/3] MAINTAINERS: Add ADMAC driver under ARM/APPLE MACHINE
Date: Tue, 31 May 2022 23:36:15 +0200
Message-Id: <20220531213615.7822-4-povik+lin@cutebit.org>
In-Reply-To: <20220531213615.7822-1-povik+lin@cutebit.org>
References: <20220531213615.7822-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register the driver source and binding schema.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6850d079f012..8cd1b4484746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1835,6 +1835,7 @@ T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
+F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -1848,6 +1849,7 @@ F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/clk/clk-apple-nco.c
+F:	drivers/dma/apple-admac.c
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
 F:	drivers/iommu/apple-dart.c
-- 
2.33.0

