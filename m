Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50505EC1
	for <asahi@lists.linux.dev>; Fri,  9 Dec 2022 11:14:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so5516145wmb.2
        for <asahi@lists.linux.dev>; Fri, 09 Dec 2022 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aptsriDL75Ig6gjid308/Jf1kFuZ73/LpGcnByUwftU=;
        b=Tc35s68OF5v/x5JicHtvMLmwSH8H8p5eYTwOaTIPhnSP8L3O4gM+ZWgXAqgbmMWT6I
         +LQ3awlxrnDCU1IkqCWUKc5co5vIituYd4IaOGiXt2GXLJLF4mT3OpErbIfjjbX4jwqa
         ukD5OwKhFtqys/G5DSP1uCXyAT6H6lwqWCEuB2qyIvbM9AMuCKuq+Y1UhNR7OPrGOYzq
         4X3pS+Nns9YEJTxQAsjiXjvu4R4K6db8McQ+uzd641csHEpgzAIr030PogKu+8MuvaKC
         JpnehUiyhcRAA1fTEQIyg2/Krxw9Wn17It8sjZ1tvIr1Wp55h93x9w63jvqWi5usu188
         CEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aptsriDL75Ig6gjid308/Jf1kFuZ73/LpGcnByUwftU=;
        b=fbVPmEn4O24Lsloc/eVp9eZS8k0TxCbD8JbMPvTBoJWFf3yNxRoTMDDi1cZIMD25+v
         d7SkRsBi5jrjaXA5x4aTRgvlSfxz0NOaTjpH8tq1oD6UTF0Oody7kwIsKFMdrdJlJ8Sk
         xB0tdCwBU0RsVP9EqKCft+XB5Zp/P1hwlVPGRdQemKTypjgQ6sYCGZ185dZ57sqjBMUt
         ol1DlvnaXA6qcmAP8LIw+aHR/YVtmo76ld2f8IiJZOyg08n8Of3teTgXZLLTz5Xg+jur
         MYl4vzqRwqjkGg7yx5EzCZaVbn1pg+4a1MO21/+p6mGrs+TN6ZSe4f924B0LTAOzj3zV
         cegA==
X-Gm-Message-State: ANoB5pmEDSSU+Tn/uGzsEGtOwgshYOk0RgfitGM+QP2dHpuKV6tLxUyy
	/Pz8sTxLTc4O+maCbSW05H4=
X-Google-Smtp-Source: AA0mqf6vJvsHf/sOnwWAxNsXK0x2d6BbzHfgigIkSOCuPrOv+Y6tlWVGrIjefUs5N4uvSBIzkS2A+Q==
X-Received: by 2002:a05:600c:4e54:b0:3cf:51cf:91c with SMTP id e20-20020a05600c4e5400b003cf51cf091cmr4503087wmq.11.1670584480443;
        Fri, 09 Dec 2022 03:14:40 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id bg9-20020a05600c3c8900b003c6f3f6675bsm9149366wmb.26.2022.12.09.03.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:14:39 -0800 (PST)
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
Subject: [PATCH v4 0/4] PWM and keyboard backlight driver for ARM Macs
Date: Fri,  9 Dec 2022 14:13:09 +0300
Message-Id: <20221209111313.2701-1-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the v4 of the patch series to add PWM and keyboard
backlight driver for ARM macs.

Changes in v1:
Addressing the review comments.

Changes in v2:
Added the reviewed-by and acked-by tags.
Addressing a review comment.

Changes in v3:
Addressing the review comments.

v1: https://www.spinics.net/lists/linux-pwm/msg19500.html
v2: https://www.spinics.net/lists/linux-pwm/msg19562.html
v3: https://www.spinics.net/lists/linux-pwm/msg19901.html

Sasha Finkelstein (4):
  dt-bindings: pwm: Add Apple PWM controller
  pwm: Add Apple PWM controller
  arm64: dts: apple: t8103: Add PWM controller
  MAINTAINERS: Add entries for Apple PWM driver

 .../bindings/pwm/apple,s5l-fpwm.yaml          |  51 ++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts      |  19 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts      |  19 +++
 arch/arm64/boot/dts/apple/t8103.dtsi          |   9 ++
 drivers/pwm/Kconfig                           |  12 ++
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-apple.c                       | 150 ++++++++++++++++++
 8 files changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 create mode 100644 drivers/pwm/pwm-apple.c

-- 
2.37.1 (Apple Git-137.1)

