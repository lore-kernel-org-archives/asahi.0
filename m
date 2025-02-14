Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E717B401
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 04:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505862; cv=none; b=ISPRTqN/UQbLKcOSX2GAMvQk9OfJBfw7kxmfZH64a/bYqOmOEv2A1INRpcQKlfhiBUFBrzx9/Odgocu22gE1ThcJu8vbwEs/44iI4wkKg7xtNRBBodTXOPGAPvmg0gY/Ryz/msm3tMRsxK0asVI+KfF8/jaAatJFnBEgBwrgdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505862; c=relaxed/simple;
	bh=mtPz4s+4egQ0jOh3GQAGAPwNPBPu0BZnd8qj+UMcZso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngP2c7Ak5gG8Oo/MPMZwiZRGigcfiocC0BKShDJH0dHNOYhD4CNNZhcp2gxGD84v61wIhkLm0q6UpweLzN2bICw7eH5pqWpJ0I5eDeFczkRxb38rjq7Q10RhYdt20ai+vgwJ/IPZHr4dYxeuCQG/er6Ir5W71i62lBuud8q7JqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W01kBVle; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W01kBVle"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c4159f87so22224485ad.0
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505859; x=1740110659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=W01kBVleaBhvHo2/GRB5huoeYfgQYTyQ+HGrdJI8clhSdfjuDMebOQ4lxVqaDsklHw
         UpIDalZQlvbERgENe6/Paii6YbwsEJPUhx44ywDpWlrDQG7A+S+KEpXCss0UErh5b0G+
         MMXwFbi6xJQ1Rm4NTguwQa9rmSlfwrUCCl9wvq9X0Vjbc4ls9oSBe2QCLg9fqsgBI3uW
         mdA614LU9U4qEV6hWgMPiLsSz1+QY/WdZnXeg48ugDlu+4TN/kEdfiqu9k7uPMq2BUeg
         xry+r6v57oMGCMScd08UzBjThiypCC1Dc9l6xbCSGi4q8UIrPOVvDbiZcxVAjpx5dUTG
         pwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505859; x=1740110659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc4uCqsleGcCsKVC2kCtafnEyIcpxj+3QblkARK4r2c=;
        b=IvyhRSbB022MZpSnKfn6veJcMYDyoLNpG2e7bnooxreUd6sfx/AUKKVvVXVda7tUGQ
         RHTRZHCXXARf9DKSJCRVKt79rVLrsYJaVUoMVVRpkGjCCRIBMOOBu1VQyzOU83ln4bWd
         81rfujyEUCnMYE0fW4JtLKJISMoYM98a4Q6nTumaxe/FTRAv1+9Pkwg4ct5NP7/02TUS
         SEMAViO/diMmoi31lJfYQTBdv+OKx2Q9ANIUIrY/kkmyQ/ebnj8jBxaYyeH8P92sIsDX
         u+RZ0RCv6gMFH1nMzI5eOFw3fRdAShAxVrNVGZZm3P5dRbHro6LV2ieBbqHO3lAux3qm
         WzYw==
X-Forwarded-Encrypted: i=1; AJvYcCVRwxiKUy8f/y2B5j2Ej3671NhRQg+mYvDwj8XUcQ0gH/F/+65HIaUe+Ym0VV2b9qieUiI/IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtrrGhUIbsJnki3egwDRBkkp7gKMm9rXJPgIz4toFLP/BU4xb9
	+3YZWt+uD/Si94tDR0y0TG2LIxV+Jnw+dUQewtITsb/aWt9sIMoa
X-Gm-Gg: ASbGncuL0RsbLmf33M+D+WUgbGHtnOmKAZkc8T+DtJFJzDF0Bap4v7WTj5ciBWffijm
	JF3X7M6dER6dc78/Isbetcgeni8qw1HuOekdVKpvsnBBzTuKQCWZ1cvRUrP4LAW8Eug+maFLoXl
	Nmp9D+5D/QEGGGcAycmYP7H/SXB6XdeYC0SlTvA/bnUsJnQF64BrQl+KUD56i6aTs1y1ShK+Z23
	uRo93qc9xDCJXF2ScBFFJ6c1nCmtXo79t03AtcR/nfVVuBThWbK0nCRyeImjXZlRLLsKzhdh1xc
	E7kuxdEkkepM4UU=
X-Google-Smtp-Source: AGHT+IHkN1crcRx1umsgU8oqxNqZWEWNVP7TrG7rSyx2t22hQspF82Y6IBy/bUusVKbjj5NHW6Qt4w==
X-Received: by 2002:a05:6300:614a:b0:1ee:1bc6:2341 with SMTP id adf61e73a8af0-1ee6b2fe438mr10767975637.15.1739505859444;
        Thu, 13 Feb 2025 20:04:19 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
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
Subject: [PATCH v6 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Fri, 14 Feb 2025 12:02:14 +0800
Message-ID: <20250214040306.16312-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
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

