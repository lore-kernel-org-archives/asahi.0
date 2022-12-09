Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CDFEC1
	for <asahi@lists.linux.dev>; Fri,  9 Dec 2022 11:15:21 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o15so2984000wmr.4
        for <asahi@lists.linux.dev>; Fri, 09 Dec 2022 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JfIhBQiQdRpJMfaCFXCAzBv7sjvzS5wkmaXDYOimOk=;
        b=Zp5F6wCUXi/NJ5uICZTPFEcbi34g+0A3QfRXWirxcrW+E7C+H+3Z1wJBw1CZTHoloO
         nlStbGVm0QBJwDYhOXYliWTDQ1STgZuE7xoT8ZaRVs9Pj+/vGauGo4cbPkj5rfCUY05v
         4XfJCuClQCJeKa2TW69A6uWQJnsViD9v/XOX/UUkrmrkrvDw3/H06sGJ+gFN0cVhCEN8
         rza5IxNBZ0p2mPE+iF3MTRbkAPZZaRuUsdClqu2iQUuhKO5ZtnhEXpGM1AAUq5FSfTC0
         NVU5GchDzQQlL61lY1nbWnsimHWuDLPKiyppeDOxFndFRVuGBaY+/h6Q0jowunthFDwU
         opSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JfIhBQiQdRpJMfaCFXCAzBv7sjvzS5wkmaXDYOimOk=;
        b=rOFeGXwRp5wRn5L+xgxpYi+TYuPQi6C++DAR+hTpqwNiqvzTJZlMg2jh/YwztJiKjz
         Xz/2JyiUh51SUq/+QfF0R9g7Y4lSLNvywj8ew4MRqsBmDDf0gWQ8c/YRbjlCyKh9zOY+
         Ag7QljZvgcgpdwjc/PYEGV0VkD0eKum9rIfZYwySEN6EEKZcs7O2zp+uR4IrON1WAlCw
         M9Ppq/YwIu4CiIa2ljatXOl3SpYaB1UU8R+offWbmSxJyG0cpzYd73MLkfJHI8bgj6II
         jMuR/9HPGDC5eLyDdEu2uqmkXKJtkoXzaMmN5HcKhweiWx05mmeO2ti2AmvmqOmPMKRM
         3ZUg==
X-Gm-Message-State: ANoB5pm58yiRpjMbOoAF8DsSgiuG8GR+ZuIeS2DsPHcK2jkegGkAscLg
	dKJ4w+NjKpcX2n+RSnOzW4g=
X-Google-Smtp-Source: AA0mqf4VhywMBEJArePJwdgHoqHlWBtuDafXIyolh0KxoMBFXwbj7kqLPN5MxEL9ZmMltqgPJCZu1w==
X-Received: by 2002:a7b:c358:0:b0:3d1:f882:43eb with SMTP id l24-20020a7bc358000000b003d1f88243ebmr4237490wmj.10.1670584519963;
        Fri, 09 Dec 2022 03:15:19 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id m188-20020a1c26c5000000b003d1d5a83b2esm7580068wmm.35.2022.12.09.03.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:15:19 -0800 (PST)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: thierry.reding@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Subject: [PATCH v4 4/4] MAINTAINERS: Add entries for Apple PWM driver
Date: Fri,  9 Dec 2022 14:13:13 +0300
Message-Id: <20221209111313.2701-5-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221209111313.2701-1-fnkl.kernel@gmail.com>
References: <20221209111313.2701-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Acked-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1daadaa4d48b..86a8265c8e42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1908,6 +1908,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/pwm/pwm-apple.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/clk/clk-apple-nco.c
@@ -1921,6 +1922,7 @@ F:	drivers/mailbox/apple-mailbox.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
+F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
-- 
2.37.1 (Apple Git-137.1)

