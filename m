Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7592045A3
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583559; cv=none; b=dugFtrH9koKBuR4XQSyWD2J4NXx9NXvE2aCPsJTmtzDo/prssL6e1n8ofamZE9aXVOFwKTsgWPfOxeD+jEnZfxcaALeG6EeHIneeTwnXmpn4w0GTHITnGjV6a+NJ8lQL/SBxzELuO966MIyyrRv5Yk/jdl5L3xzxJjNrw89Wt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583559; c=relaxed/simple;
	bh=mtPz4s+4egQ0jOh3GQAGAPwNPBPu0BZnd8qj+UMcZso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8xj1O1d5JkEzlDoiDvM2uFDLCTydrGcwYwmcktf/5g3BoYYo/fXog1QwaFUHpdqVsumcPdaC9zrRoWwIpSbtn+jVEe35M3WHg9xQso5vylX7tXGxhdLhiptrBVI4pEv6gmRM36j0fmRkGOy2ryZIpagH3he3Vv8V/UIjuRMEQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHJhjqt1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHJhjqt1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2163dc5155fso73704985ad.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583557; x=1739188357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=AHJhjqt19T4yup4Ki2UjyOb8tWecBYtg9pzc+zKSdQ95CDBoBvs3GT91UVPNiujhwQ
         8BaszxU/rvbtf8Miv78FakOj0rFFBzkxanxoa8MtIVrV3pe4xnQW8/ClLF/GBzAYsZ8/
         2K1o4kJrFKGatQIFXV9SH3WlHjyCehDDHaHIVz/2Q2h979AUSUfK+ggftSIqqtIKFrDD
         jXc/qNTXWJYTekL9kV7X/gt8wj/Hg4i71q58vi+6/o3LatgnE3sh6xCYhDVQ2GBLaYeM
         4lLd7X0sg1DyBzAhxgnHymcHyTmymYa1v3KpXoVcBKYAOl+/Obuu6HkM8jdoGaQQURRI
         rIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583557; x=1739188357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=Y0a+UuEAkoWE91stIPmjy2qtUXMEpNGl3t+BysfcfQR3ltcjZeAVlsA4MGTpnlu1IC
         v5z3MPZJ3wk0LRxY3eEB10WXmZJlnCkvY+4AsGWdnX7eMakoSuw5LWlC62D3Aqg917xp
         e38Sb+aj8c/zdct8SxsykzjNnfq6dtYRrNpHGOR6Mr2+1pbkumhe/wfrz6onkPyfvlAu
         a7Qq4toRsLC7Ig4UQr7Rb74j214IRxEzGBeK4Yjtqi+4I5WoU8jHLNmUyOENJnhodEqY
         ZmGWBpCyAWJlVeflnr6Dy7WY7FzN+035KZDmw9KHk+KJjULvf8xrs4dweCsh2s6iSlv/
         xYrA==
X-Forwarded-Encrypted: i=1; AJvYcCUAs/qwjZfazU964H/uTcRXSQb14ZgrFHAGtZkBeK+4Zv33e7WZRyhQ7e6sKkY9xdO0DG7vmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzc0rf4YZ0PVyA1blxg9Jq9NxdxEJBbr9fQ/iK/1PxLJut/RjX
	hpFJHxIKJK+VfSpU/tCR66p+WXCDrm/TgmUVqF2++tpqZgBQSUCE
X-Gm-Gg: ASbGncth8mY+w6QtLNhvGfBGEi5UnbolgxcJKFquer7OHTtoXVBT5u5D1oQyKSTni4e
	MRvAsNiaw++av4W+HU/QJ0ZAplgbShsW0gTTj0M+dPi1UJZf0anpZuVout9ef1XTxyOkvZ862IJ
	UksJ5rcBlWgghE9BqyEtcqKhmFqLk3MDjSK8HzyP2+KuEUVeFVK0cp4OylEVaeucDYSQlSdUdTv
	9JjKEUjKYKtB4icVC5HaCzE24OoRARBGFapy0I1oJQcTxyrAVvAxp1ARRUNN+QpwmDScSd/VfLJ
	8t+DocMnayLNg/iM
X-Google-Smtp-Source: AGHT+IG9OzjbgkvCS8tq7nwliRQ7D0GE7eIK1YFb7OgjbU/H0UhSsEr4jVXSBegVQdOpNlym0wtPBw==
X-Received: by 2002:a05:6a00:4642:b0:725:f1b1:cbc5 with SMTP id d2e1a72fcca58-72fd0bc26c1mr38178820b3a.3.1738583557299;
        Mon, 03 Feb 2025 03:52:37 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:36 -0800 (PST)
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
Subject: [PATCH v5 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Mon,  3 Feb 2025 19:50:34 +0800
Message-ID: <20250203115156.28174-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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
index 896a307fa065..a576324807f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2228,6 +2228,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2253,6 +2254,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/apple_dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.48.1

