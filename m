Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60D23237A
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916946; cv=none; b=T1wXaQmIxV6CX9F2AFd8UOXSt5S1kKHvQb0AOvv6+/aZbCWLSneRj1V4UTbs6yD0pwquRk4Ro7hY4iCzyLeZiab9RMkjmiN4Z9WFHYDuyGVtgOEXVh8/f09iwRE01mHe5WlYaA4MpP8QsAZlzGCAH/IXmR4W8/pkQ5J3hwUdANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916946; c=relaxed/simple;
	bh=pK3f5fCpUmizu3Cy6++UnM5omz/TBo2leaTtg+du6wI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTCjwLYGJMY9VDWxTayUZFXYoJKdz6pQ6uCPaUAZ8xnkN/l257NR1xLidsDPg5tWoIFZf6lWo08eq5u0BTwekVT4izaCDadedBPs7l5xdvcUwoO5MLywhtO/QSzx9pCpzSbkh2ibXnHgaSttT3fpglzk94Siub6SU3rHk2aiVus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTELK7su; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTELK7su"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21680814d42so11265285ad.2
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916945; x=1734521745; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=gTELK7suZYOkLEmsmk2LA9TfFwOTFQ5hSOK+vHuKLW/mRnTEypsjDJ/kCNG8ZFbrcL
         xSsoOsVcTApt3g1E15zzeo4FvYFWSgU54LKLUdZSiL5L7rA4WkR/Kvyv9eI0opfE9ppN
         VPqVw9tuN1bN2T7sTPJ/LQytbSAd+HEiq7LtzL/dW7kbH7TJeEQv+n7Y6mvdu/wH2NOw
         jfWbab31N/0/PNHsGeMcS5me+CTvIKUo8lFP/3vx01DaauOgneKtoqRwjExHR27mF6j8
         k3km4s8bFKn1ipcu3KPYCSBKuPdPrLScyYtEplLi+lUKJvmPcxzy5ufjUzhtACFWGmvq
         Dxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916945; x=1734521745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=wLtH0NlWzgFEnf6CyQ6aQzJ+2vBGs0xHpKu3BGPUQ241hLuS1uDp76KQXxF26wKX6Y
         dGSlPVTxQpNa5xtF5gLZqsm26cn+0vpAwQWIeW5TIzLfClsD73S9Pi+BCgvuLC0QwMzl
         3VZtYkFRuhptYg/xbFFXVsBvIPCwt8dijMbxBEtxbJlct3DGOjUubLO7UU39IvgiTeO9
         SKnh+hH0RKpgIbXzjAZT/WkGYU550vPpfivkG6J5nJOCLlUu+sBmJuzimX5PK3T7LGPe
         N6fhMA2EDveI1T0MWXOvxpamXGi8BvlLQjxjY7icZcF3vucoGFYKmuloLtJDYTSswswr
         EF7w==
X-Forwarded-Encrypted: i=1; AJvYcCXOLpJRA1PPetPpZHYEPm/XugSS9hZe4AI2PxgC4wjgK6LnmDBvR80J6J1YcLqMycD+9npsHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtlMEjGyfbMDouoXtv876HIWp6nBZWsVcJ9B93vCNqtaggthjz
	Abo0j+BFkwTtcEOOiuEs9qFD6gSOUlPfdsm2obzWEQAqAK307t6f
X-Gm-Gg: ASbGncvGN22DfoIdZ3Yb+NPjrr5jhYHARrhg4YMZWlkNyGvG5jmffl4i28mz/6FLHvx
	3oQ08Jj4OUFiCZJmKPdUQSFDJyr02tDo/rxTR5+x5k7CY0wayBbyuvP5JROH8rSuSVqdVI90WDx
	5DKktoYzXsezXGSb1BnNqoU6FrWd2s5DF5fDr2BwrV4xHdDW3supWYYgSeQ3u6Ind1aBuKj5wS1
	znrqlgxqTaA7wohPKzNG47T/+UMxJDFw6HZiJUtvQas6MHQgsQZnA7YH/Ah/E/K10YzHw==
X-Google-Smtp-Source: AGHT+IHPAoO6sweD7dzjHfcotRsgZIyMZdFaVq66RcEqv2cWXKrGq8y5aDUwVllnUENLHzeU5YMTvg==
X-Received: by 2002:a17:902:d2c5:b0:216:2f91:92c7 with SMTP id d9443c01a7336-21778393b92mr49397375ad.12.1733916944690;
        Wed, 11 Dec 2024 03:35:44 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:35:43 -0800 (PST)
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
Subject: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Wed, 11 Dec 2024 19:34:39 +0800
Message-ID: <20241211113512.19009-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
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
index 17daa9ee9384..3a7dec3f9a5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
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

