Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C5C17333D
	for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470859; cv=none; b=Zzu9pq2hGcNGfqOoX2y9kPEqGMQ31WEv0xWovLc8F1cMlhzN8L5dFVV/3C8iG5FeFYbIGToubvzD59bZ4iJO7MV9IpfNDFrPMPnuUq34mxtQzrC0xfAFrozpprbU+KVJ29/hFpQ/AFfRVmn76KA/3+R6MiI8HTfNJCZl+wj/7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470859; c=relaxed/simple;
	bh=YYeDbhIsCX0ErJFbadBI6Svg8sUwSIAIaRJnDZ+vcPE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxPC8INwmtZgEKXnF6EPR3iJ9/Lb/AD3XpWeXWWLRjixBgw4h9Ld+msTve/RqTEg0dvwNsuiQ1KiOyNu6b1kka0vAjhXz7qWNhzcZIOCr+1JQMi4DqTjb/ewYOO4F/URXW+Xnc1+MYFFK4GivV1kfPfIufmJ2r/nsZDCH4+pIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzRUR1IS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzRUR1IS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21669fd5c7cso107668115ad.3
        for <asahi@lists.linux.dev>; Sun, 29 Dec 2024 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470857; x=1736075657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
        b=VzRUR1ISxbDzCom0JBRrHsvRxFJHmGpjFOg6+e5RVL01MxpPYzHDkwR3mCQ1RIFLcL
         NXDQVlj35zF3gP5fY3/Z/wyWg2GQLKx5iyRW/ewCM+x2vdGBPcq+r6XfT52vb3lDF/vb
         olW4fWqvXephYqf2+bY6XAs7+w369n8QAqpdyRdADRysifY+XQ2FAeQXOtu7VBfZsryN
         i1Xxlvep+8yuiR1WhTUNg0Adpua2qPyccNB28JkmazBy2/Ab+mhJIJOr7LT7Jgh/q86g
         eNQ2JOrDWPpnR6vLnayCZQJpXxJ3ahfnR/n5Rh4dZ3ixocEHEg7yDE4Vo26GmskShyRo
         frqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470857; x=1736075657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
        b=kiLE184NZUzKPmfBlgXRheoQmLZdmq+TTQX28GCm3LvMYFj9GhoDXu1VlA9SPqSSVa
         Cj+W9q64kUH8XNtd2Skvk8LKg53QangCF2oyd+I0Mq3jpzjbhXtt9dgaoNniM+LdpqNd
         8tqltqqRAxi/sVfs0JJi4aTFO5lX0NI12HCzgBSPXuPIS7ZIWNAPGdFUV1EqlOW8cH7g
         n8adt/Hbtdk3W62Ngbd0Fc8T3xe7V4mqvLVikF/F1UAoGeydk/Zuzzwp87h6OKIZBj+T
         9B5NXZOpwNfu6plkK5/r/Umvh2PwwbMKdqWLQBp6nfHSlnisX71exH4LMoBY21UP/H/b
         Ji8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6aXPpdrFw8jQaUaej+QQejnHN/Y0KAb5ZDpXSry5kkv0HKj3AQd0JTx5cDMDAa8shIbUViA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRRVPuHjyuastABVstVjhn5peXooWx/kJYpVY3gUFk+Iu2UPqn
	cBgIpWfmRQOjEIn6onvCgjRG6Zx+vcirKnv2L2jHQbIGDdc9fuKa
X-Gm-Gg: ASbGncvos++qQR5qbblCC6rZn/Kt6AUX//nSom3+vrnMM/Ku0XnxJH0RlOogjwQsOjp
	g/LuWNDCKHbcmcLCIVwqiKXz06h45ovwSMG4tPF/tkMAMQtqd6DyBooLEqWcoTLDm+MfUH2xzMx
	YN2f58DkPpoj9+e73Wf/lZQKHhcwWUTRuX9usBQ6ZqjN/Jc24/uKzmAW+iiMvlg77ctW5LYmBDt
	XMpZr9bQa6774kdt6E+uiLsOayFeD4nqM3m1l8+mxsjtHegktjcI8vIhA==
X-Google-Smtp-Source: AGHT+IHj1y3F1X3HGHzS3Px3LuQKUEyT2NVI7IfSKzHwkiIrQ3sJyJpJf3UtrIia+cnNqjNTX6LRiw==
X-Received: by 2002:a17:902:c412:b0:216:4972:f8e0 with SMTP id d9443c01a7336-219e6f2ffb4mr459732985ad.44.1735470857377;
        Sun, 29 Dec 2024 03:14:17 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:16 -0800 (PST)
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
Subject: [PATCH v4 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sun, 29 Dec 2024 19:11:19 +0800
Message-ID: <20241229111322.4139-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
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
index 910305c11e8a..54a6c8ca7017 100644
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

