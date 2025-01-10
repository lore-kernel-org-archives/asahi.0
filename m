Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009E20B81B
	for <asahi@lists.linux.dev>; Fri, 10 Jan 2025 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506425; cv=none; b=ci4fqL390K6qXlUoL9Dftrspizbcmc0fE+iWx1YkskK/F19zwg3H6gfIrHNliosGlwX5IyOzGD1BpXsW8rr2D5b89pjuMr+ohkUUP8otE+/riz99cLOxdrpyknABLaSG/H3vSaLwGmh15BM+VP+p/M4UmLRCLdXvOVYGeZq3ebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506425; c=relaxed/simple;
	bh=K8dfshyj3v7VHM8Mlq3EcNpIciIC+CxZDJ9dS3SUv6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0nzY0SQXbvT3YUPvOWklJr4WDFEVLfsOoui3YUEJ/f/K+qaRDP4WpD9+fNQiwoE/Kqv4VnqjF0pn42gyOwfdz34+cddjhtiMfP3KYRhi45eEM10nXJx2fxi5aku95T1SZ51ER1VY1xWpQsNAmNEb8OrYL5iGoHnV1UbGwOhUrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbtepw1g; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbtepw1g"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215770613dbso23236145ad.2
        for <asahi@lists.linux.dev>; Fri, 10 Jan 2025 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506423; x=1737111223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
        b=bbtepw1gJ4i6B1VjhnC6nNlINPx4OQs0Uxg+Mx9a5Ooj0E+RneaRg7czYresj3JkhT
         +WNpwqsc6eeyTtY9efRqkCwqYl/YfnK7KcpIgVEAzArd1Y7W+0N8HquK1U0hGvL4m6j7
         l9xMJKEn4lIsqmQHB+8Py15XnERc442Zi9OrBBAmaFfDiCH0QNwKWObHuJxDCJsIlE2l
         Kp3tKI0LX7U7wqlcSTbaXN/flFm674YMgkMlJVk5T9vxl38HDVQYe0mpGAp0vReL/F+4
         uWWttLdei+rYODLr3gQ3bS04ADWfHMqLfz+j5lfURLr6IUx5bmQZHQCLnHjoLkclYPT/
         YvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506423; x=1737111223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6D+Duy2KSB23Y0Rvwa3w0ojen1q7SpzhhAe7Fua6DI=;
        b=R6wLom9PC/HPIFAo1P2W7qCj/pUFsjxAZeg+ilqo4zKLLZ+52hE/fcTe/HoJwfgsN+
         FYQ4Wh2BiMMFVI/Gtrt5l90SM3vjUDhR+SP2UYvGshtIcq0tdznWBWbWlyxSViY9iUNx
         qngJy7Ubyybj79QogkLxfwCs4wuoNXbPu3f6Dx4Mydd2nF0SdtJt7bg8Pn1e2CGL5MPd
         tMF8S/Qrxcf8J4MUUlLaN8byvVkt1A3s0DjvwuV7srn5bSyhI8YwpRjQhU8xMbDkh7bh
         9rFIOWWlp3VlZa1iuwTeMepy8N8DwHlYcd/8rdcqn831XvH83LOVEqwH7uA4Q3LTmT0p
         gSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsIct2vfw/iTFJWX6fNF6HoXLIwSbJo/0F9vsgKtNlMYZc/jDTgNg1qQW5h4humuqoxsKxgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSOrEc2hI6LkI/y1asvQDrwWJtPUrd4BH0gMT9OmIdm3oovdLx
	UnptFEDcA9fsolHFmMnYMh8MI5HE134xOr6mFgt4R6sGd2MW4+zZ
X-Gm-Gg: ASbGncuHWqo/bPtChj5JZEbHldyqNHGZJSPmkoZOIb7hDFysCaTw+h38B9MtrkDp42n
	SBQ53kNa2PrCKTTEWjk5Jow00CBU8tUIOVQg/nD/3flwhCVSrhBUcwyBf9gvZ/z6536tGmxawJy
	avzqPdZGwAZiPPwMja0o9zyKTS8Kg/0ypHi/IZ2ZF7GYa5QpMd6bdDj4nZ2xCqFOhHksr9glqcn
	FrJNnzZLAtJC51RBlWSeGhYPS5G5t573zRPtW3X+/mHCMKa2P5HeCtGoA==
X-Google-Smtp-Source: AGHT+IEXc3zedWc5CeLrQUkadcVEzJk8eqcEuyttO1WR8DTZLahGcQx2U529vW48eyEGuwRsZNX9tw==
X-Received: by 2002:a05:6a00:2c86:b0:71e:e4f:3e58 with SMTP id d2e1a72fcca58-72d21fbcf06mr14713527b3a.17.1736506423154;
        Fri, 10 Jan 2025 02:53:43 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Fri, 10 Jan 2025 18:52:06 +0800
Message-ID: <20250110105304.71142-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..67ad74f987c8 100644
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
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1

