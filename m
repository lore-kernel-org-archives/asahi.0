Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BFB1FFC72
	for <asahi@lists.linux.dev>; Fri,  6 Dec 2024 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506101; cv=none; b=WYbIxZqwuPgKHG7pfMgp1VGVPAELWsq+jnRYoQ629y+AgczCMbilP+fiQOOKcJPLZGSLKOVeLE6k8cZlENikSlvR89Ti+5saYCasK6kJj8cUjMHtLbECJ3iKJ3jRtFF/WR2A+F8cJibbdhTDd3XCV/kpEa6Pf9u+Uvy9ZnWEfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506101; c=relaxed/simple;
	bh=V1gxC+7pFmhwcsVRYLSmWj0bXwQS8MKVVfihUEUE05E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bv9v7fkmn76OeroGFFwXB9dpJhJb9nB81NN+aOzmwbWK6nJ2hwCT1/6mY5YNt5T6Q5ctAcL0R1mBrgJ7Nx1LQTtLDLczNOFvhpl5s97Rpun+Sx5D0m3gGpDB3Jey8xoej535enZCoMXea/22P4+tf7WKZ66EOu9E81NTuQ8eQJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfcMy0YW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfcMy0YW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2155157c31fso18517155ad.1
        for <asahi@lists.linux.dev>; Fri, 06 Dec 2024 09:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506100; x=1734110900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=JfcMy0YWl+ECm368aH6MI12HMPABaadA73CgMBkApSSpNsbmL2woQOpZl+RR0X2idX
         6ylDlIWiaYvcV5t77FVPWsq0grIFDtOAtcPt+PK1LjuicIynyNUAWLp2DFZyw+n97A9O
         j2X3l2byjGmCbmMW7T8t33EgL0wiTbcrPiDqtef6GgrVHpc0VwG7TzVy/eumkR/SU00R
         5yoBUw2r9niE332CPdVTn7N9aTENWJHQb5iz2xNWZgqGLaf/4+anh/BypcOxEowvKqte
         xfP7Xli4GjM6x26ZOYwOY/q6wirb8LODTkzIbWLfPfXMddsrIVjd1AhtcKXJlqF43jhQ
         vg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506100; x=1734110900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=bmNfVE7OvvUjFKLd0Y040QMNhZiNPOR0xNvIO9nS0N0V5YA9YmudM6UyKbU8BiCpgf
         UGzRdMPNQIm/ygEUiEhHndf1Epge0cVYDgBF3RNmON18OlGIXQiVxRQT8lvNuOnuwQ77
         /As49XSIr374DCwcIGBAkXUvdDB6DteD859gMeMR8UdSmh7AhG0uyrOrGPVws/f2/qAY
         RDieSng4XH4u1Xe58Ltrn8BXdvcm6NGyMKoMrpd22VA0GjI8azE3BhNgN4Gj6jdWNBGt
         MIlUvwPTFtnnsUETeTXVTUKtW/P4ZOJ93s8LrhagXhcnsxT2veJwxePdf9rLGcMlsMYD
         jlxA==
X-Forwarded-Encrypted: i=1; AJvYcCWJtjVlv9mG0y7KuHH5SkPKLqL9YOmxg/JwLZy8kdQ2+Nbl/piSy4Dho8xcGYhH19x3pQXbwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDDxEz/R2vRdpJooX2myoIBz5CxHmz4jEQRxNqbdd7MSTCuQdD
	8Y88VOxK1lPG7Y0/xuT+7/qzP0edndjKfd7Vyrnu/uSCaZfVwJh8
X-Gm-Gg: ASbGnctlvIDcXN9TnBkLHA0N7Surj3o4jywYhwd+U1GoffURWnAFWCS1w+BosexywfW
	5rDEVaYClGEFMB78y3DC8Za1MS/uS/jhEiS4daOFbN3XtJ6V5ZPnoeT+F64do877ItasgegaU0l
	tqGFJzKs1kfIVHVFpsLGybDIC0mZO9ihHCQ+UMfPlotC0t5KEY4A53lgde/kBLEtYBDOaZOZML+
	rQ5tthsHWFDG90ruigSPPFqbraq+c0dSYZ8V8Zq2a/mnTvFqd10sI7zX0mnqSUX
X-Google-Smtp-Source: AGHT+IEVb+55XJwsVSf3sPuxfD1Q4oPqF1cheGO9d/Bp3KK/wuSlgII2poZhwuZv0OaHB03V7/rOhA==
X-Received: by 2002:a17:902:e3cd:b0:216:11cf:7b1 with SMTP id d9443c01a7336-21611cf2958mr46087885ad.15.1733506099695;
        Fri, 06 Dec 2024 09:28:19 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sat,  7 Dec 2024 01:24:35 +0800
Message-ID: <20241206172735.4310-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..36de76bc6fd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2204,6 +2204,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/video/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1

