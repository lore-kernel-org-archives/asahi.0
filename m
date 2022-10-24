Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6364A
	for <asahi@lists.linux.dev>; Mon, 24 Oct 2022 04:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hector@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 86C4B4249A;
	Mon, 24 Oct 2022 04:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1666586384; bh=Ll3nZx9A+ehUPc37begKWfofxpkHxbd5hBsp2PqJ+08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pJxdBSGaqM1cH6OcyMx4XZSVH21f8MKmZAeode/RxTRonmYbCbXIwn7VeCh0i9sTI
	 m3tqnIxuCqNBDJkqWDLtM1/LWRHaXh1zdyMDmsWUjt598YmYIYs/4dsv5vy9hXltwJ
	 NMr1GV7/L/8+AyhM28gDP6rtAxMRaA7t8jqPBoTG7eVRcMUSFvCvZFEf9BXEepFnlL
	 K2NIgOUKC+WjUyIjjU1Z8kWALC90SPR9tP03BHItesbxTGQggmNSYhPtSz5+F6uzj+
	 sk7H7TOaHaxZjZcB7lQIHcB+p62w2Y9cilQ/JRr9+pMMeceIoFPDBHN+WPMTjSYwp1
	 hCNQ+n/+RVNgw==
From: Hector Martin <marcan@marcan.st>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] MAINTAINERS: Add entries for Apple SoC cpufreq driver
Date: Mon, 24 Oct 2022 13:39:21 +0900
Message-Id: <20221024043925.25379-2-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024043925.25379-1-marcan@marcan.st>
References: <20221024043925.25379-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This MAINTAINERS update is split, as usual, to facilitate merges via the
SoC tree and avoid conflicts.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..6783f5263b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1897,6 +1897,7 @@ T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
+F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -1911,6 +1912,7 @@ F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/clk/clk-apple-nco.c
+F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
-- 
2.35.1

