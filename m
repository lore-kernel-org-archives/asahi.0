Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8241C0B3
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 15:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87B13C433AA;
	Tue, 14 Feb 2023 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676390262;
	bh=GPz86XLDJFtm5sktETv7LGbxB+3BUpvXFZ/fjo1wLAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H2IilQ8RY3chpEp7FKFgkgVdil1YMWadJ1hnv/YIucCkIUcJ2Wdd5Dekg1H1evbFK
	 pLUnjW022LDOgAZxDcT9TbbJoKg7yQPVJmR97K/Mdw28LUqDv9aCoGrTvGcJBlA7Ea
	 nO1qhpUA1nrYU7Crvy2I7ufA+odzm4JSElzXp5zzuMQNUfqgbwcABcsgAd4bbBkq5f
	 16x74tiMsV8FZ9DhEXq/ViJPjzmr35V5aIzIdFo94gkGuivZLBLRFQWcdcTyaOXn+E
	 7HMddXlic2YRY+dbq/A9qTYvyajS4WxmHHa5/n5uIZ9lbiflxZpuVdjISMEHbLrLTA
	 7YX/qBktHhgng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767EBC6379F;
	Tue, 14 Feb 2023 15:57:42 +0000 (UTC)
From: Sasha Finkelstein via B4 Submission Endpoint
 <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 14 Feb 2023 16:57:27 +0100
Subject: [PATCH RESEND 2 v7 5/5] MAINTAINERS: Add entries for Apple PWM
 driver
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230214-fpwm-v7-5-fb0a6bfbd037@gmail.com>
References: <20230214-fpwm-v7-0-fb0a6bfbd037@gmail.com>
In-Reply-To: <20230214-fpwm-v7-0-fb0a6bfbd037@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 - <asahi@lists.linux.dev>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676390260; l=1109;
 i=fnkl.kernel@gmail.com; s=20230213; h=from:subject:message-id;
 bh=GrEUGtM2OJTH5FgLdv6n7LxVKdGyoQJCtx5zNyLu7Uc=;
 b=VbEBD0lmvIFf29a30+kZXONQhIxC/88KjblodB1TNUskgBcgFy1vf9IqyQjp/CqI4WkPwUkG6
 zuu8ZEJ2za5CdHCo5BNB4TRrIt0595zgje25xZPF2h4vWzyVFySJ//O
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=7LFSAJtxIWAs9LzCIyX0sSvCZy2wQTyEIu1zch6o804=
X-Endpoint-Received:
 by B4 Submission Endpoint for fnkl.kernel@gmail.com/20230213 with auth_id=28
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: <fnkl.kernel@gmail.com>

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Acked-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39ff1a717625..96e50defd646 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1968,6 +1968,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/pwm/pwm-apple.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -1983,6 +1984,7 @@ F:	drivers/mailbox/apple-mailbox.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
+F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h

-- 
Git-137.1)

