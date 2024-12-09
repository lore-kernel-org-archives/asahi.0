Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171E21519F
	for <asahi@lists.linux.dev>; Mon,  9 Dec 2024 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731183; cv=none; b=O/9wSTlqDlV18rNTa6V3pkr4bQWWtMV/SgdC7BKMiuBEkA3oGM4/eq/1WJQ2EgRdlgDli39LWadYWS4P8m5EE7RM5aaZS6fnf9oWczWKPNLwUMBuKcVbaHWrn6ZO10XUauo2ehiFr7/QoL5A9+unMFnmR8fbFu54PQytXCVzGco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731183; c=relaxed/simple;
	bh=pK3f5fCpUmizu3Cy6++UnM5omz/TBo2leaTtg+du6wI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PeB7tYAzgh+m6nPXlCigMKUM7NCJgGT77dMbK2JseUAi7apIeHWjrfHsylCyvNxXJT5RqqAH5p+2OTdclnbI3eMYb9dVInIBJQdG0LHNThfSdk/WlJMY473eL9a4G4eQhQaful99GpBUMU7kPKUWak9ZOfH5oqquoq88OGwMyBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMYruFU2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMYruFU2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166651f752so530315ad.3
        for <asahi@lists.linux.dev>; Sun, 08 Dec 2024 23:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731182; x=1734335982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=BMYruFU2dIQLsE30GNzcNY82L7+WtfDxszxE3TBE0v/ADOETYmJU7+bGGhp6dpqL0s
         //qFYSY6UEwZyrbBV97ioUZs/bL0hzRJ3SJ0n7nfAXw1/joK2/MJLIZgss9SGENr1Q/x
         iuJnLvOontzUipYlQJuOi0wIHmhKyVmSiBQYmlTPpImvJCyQoEc2qUgWf7uwnEtrObVx
         BNRKDW/GY5S5g1qNADvH+JaWPMc0a3LU3jdlv+qY5HMZ/61L9wn5ydOPkKXK7/Sa/b+L
         3pSFtJgmXXbkdeJHh9JDoydH3W01Xl+NHhAGr6hYbgKv9hTuWasNrkCvrYhCbw0ZPPJz
         YUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731182; x=1734335982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll6kImbemzHgzysNRe/B4ZjSKDdlmM1jCI9QSTOFJgQ=;
        b=tzXdn3CoLJ2OJbPaTQOqRKQdePrAdvlW4jp0TdG3WeUIDzyJEeXDe0wXNg5xtvTfms
         3YHdDIXoCryrgiD/V4F8ayCxtdm+IFnxSPPM77sbt+kE/DGONoa4uAUeXT4Zs5mev3vy
         dYpteDJyK/git9bY7LVD+iL+oxFjTvEDoKZlG7+YUlWzoRay6F9N4CSKjCVzSnJcQKAQ
         tgSb4/sZiRKnm9Mjp8nW0WIYOvW+Ca1v1oV0grAedDlCWzLM6V52hBBsw7hI8GdaLywH
         CVerihU5hlfZQrKDWvm0056YZcRhoNwlNpr8G2h8PW5skQ0UiLRoVnBhgGJvSKmhDQO/
         Wv/A==
X-Forwarded-Encrypted: i=1; AJvYcCUsx9/LyR1jQk+S1PNdDDUmiWmx/Ki+50kssXw80WlW816IdaXHwnG8QwwBZ+B55Bt/izQskA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtb8uUmz5gOl2vrJbNB7ZOR79c1NXkUF0JrtvkEstZNHYYYhwY
	dzSy5aNNrc47whIbo39QtOMaAv+lnpPN9DVVplXwnlBRoTBFXzVI
X-Gm-Gg: ASbGncvjRF2ZKNieaI9whcTlKPUkD9mskx1oX7adWjyLjjiv0uLZts8KGC2JWE8bgPf
	I9yg+clooNCNiorPhOGpkALlWZ1hfY2NLhoiIh2U26kYpEYCpVLtVIvjwq755HL/94AsZPTqsPT
	NOptTjqRTmwWOaHSb8tMGYKhv4V/gAG0x/7tLuFyBLOZ2V6ERUui28aZvSOSBnQ1rQO3DUdOhbL
	K68RtHR4QWvXDUaLxRKq23wuY+GqnyFqWRz/LJNPaPH7wYZHgjfpVVRQ4zjHk+i0g==
X-Google-Smtp-Source: AGHT+IFLVJdXcJEMtQbEGzS9QEogjBccTI97+be9Pi/cjDczopusFs1mLg5QF1GGPSTJZ9o91Yk57Q==
X-Received: by 2002:a17:902:d4ca:b0:215:3fb9:5201 with SMTP id d9443c01a7336-21614dd1b11mr167697985ad.44.1733731181698;
        Sun, 08 Dec 2024 23:59:41 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:41 -0800 (PST)
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
Subject: [PATCH v3 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Mon,  9 Dec 2024 15:58:35 +0800
Message-ID: <20241209075908.140014-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209075908.140014-1-towinchenmi@gmail.com>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
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

