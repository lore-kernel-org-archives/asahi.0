Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F961547E2
	for <asahi@lists.linux.dev>; Sat,  7 Dec 2024 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576706; cv=none; b=NvDEECTIwNKIpwPxnt8ItBCH1T6OkZHhNBhRbp9TV9LihVWZW3afPFGjWv+A29nrvbiB/jCXuMyjYJxW7OLOawjUqN9UyPl8eDoRSn2XYvZwgoRzBqdUF56Pk6kAPoesU6OeyiS79I8ki4ry0eGZ1lNVAcTIjHuPXqBaeDWxcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576706; c=relaxed/simple;
	bh=V1gxC+7pFmhwcsVRYLSmWj0bXwQS8MKVVfihUEUE05E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBQIZSPIhPlaGVUFwPrjfIZkaW8lO87V/xKOycolRoLqJybBYaRjiTQV24spJ9cckAQ0B2cqpx+XQgrebU/eeF1axFsvP5zSmj2DRa8LtPPOSgpCbMmzfA35uQ0Nwxye0otphjeOd7eX6YMftZSdFzv53g19t/m2hRp4eblQezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6Cccu4l; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6Cccu4l"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fc88476a02so2675618a12.2
        for <asahi@lists.linux.dev>; Sat, 07 Dec 2024 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576703; x=1734181503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=J6Cccu4lpoyYUyeFEQ41NuGRKCU+vdnkgn73lhrK4ZeN76vyU7B0YLsx+RaCGu5u+F
         36d5ZJ8UsMffbIOx9hu9FFeSKAJ0vckrXclTF3L/A60Mp7ubH1KlwieLpslJ/JgnzhOq
         yDe4LBO/U6aynarBznQXX+5PBhQgKYox4xfkgx8IuuHJoIi+k6p8izguYX8aJ7P/E83O
         0xBtwCeVWSE5wVAawe6H+ZLTp34qGvmPRTh7viu0Iq8qZCdpIOsah8mhu90FBBaGUStZ
         JXYLpbv+LIDtcuM+UGFY6Wc8/V1dbqW/zdNSfOeTH88IXW4IDieloVGWGxQIKVSFuDlA
         rtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576703; x=1734181503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFVSrkNiEMMJAigz7OiMiNZjcf3pYxRxO/MhDZIhBgc=;
        b=OoXmnrVT8OdYaRBp0P50LLCYm4ZdflPHYdJ6bk4SoKKmtVgPhqjvKWDvbRaiYmgp9T
         U17PPrw1R662YVlwVUOdOoAIMWWmiEnd5qnrjbtfl/BpZDn4ZsEsCS2jbpRO1yTzb/lr
         odxhw0xmA5ywSjZWFyYyqCighYan77MnNHB8OU91fn7VV7hJACGaIvUVcVVD9yKbUqok
         8103Syo1rCQRX+YJEaxoGPbpgnNAhvjdE2dZ+zx9NNfyUb0DlStz8kE5kVKgAR6Vp5nP
         RoTQhIpqcRrnDFEs3TmnoGciouOn/n3oZbXYLRvR/tZpxMP++Cc8mITN7VeUkPndTjK0
         Unlw==
X-Forwarded-Encrypted: i=1; AJvYcCWmQzWOfICcRdxhNRUJIHGysXrFkYoRxvYkZmWmelVsy/rXsZ2jL321QDI5euwjg7BUZUWsKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcJyDxSdzQ9IWI6B9zR1B99/7DvvUj/OPs92O8X4zHxUIDrXv+
	Ugn3xZelzg0m/KpmjP99/BTkAAWFRttC8CuU71L/Eq5gv68X0uAL
X-Gm-Gg: ASbGncsghTSPoOM27+sR7PGnV8QuEXinNDXsN2ANxBGwJtnqvHg+SpQCiNXVUtfgl1t
	wEDQarS5rm+1MMu8Ie+h1+iXJ+D6BaS8UK0UlSINktJpxAEbWOA2sW26a8LzUXnGjrEw7dHvo5b
	oC53j2okCMuqQ81po+L7rOIIBsxGXcUQgekc8bamqCM3dCGEGICvqyLMRnqxuyORtqAlX9/JKaw
	SB77kI2lrOtNIGME20bE5W14I2+89TTY2uqOmb1JMeMh4l/ARF2SQBSPJOlfuFU5g==
X-Google-Smtp-Source: AGHT+IH0D/Yd8zXEABvPSshTZ5GdofWvmFimE7bz/L0Dg8+hzOe7KfKe6Ge/tMmMUKD8ETbyZzILpQ==
X-Received: by 2002:a17:902:e80b:b0:215:97c5:52b0 with SMTP id d9443c01a7336-21614dac17dmr93533435ad.38.1733576703350;
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:05:03 -0800 (PST)
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
Subject: [PATCH v2 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sat,  7 Dec 2024 21:03:16 +0800
Message-ID: <20241207130433.30351-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
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

