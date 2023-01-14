Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562E80A
	for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 13:26:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id e3so14178724wru.13
        for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g99//iPDMyFvy/+oL6QKSbCjazZl6KWjaU9oRhSg69A=;
        b=Qb7HH+w7rp3xAgJR1Gpka6RuRPxxIMArkq/4xD/AB7fEVE8B4m4GoBFgPabInQxP24
         DGKmJ/RNF0ofRA7EbLR0FltGrB0oHAjOS952ahiUaA38sxS7zJrL2y8l2OYlP+VKnFIT
         vJ1ieL8AhvquLoVyYHMJBg7Xmpm04JT+ACxPHRx0NxnznlK+xp9RYCtHVV5jkg4660Px
         kAMLrBX8wbiXOeAquft79WbwSiVN9BahjAa7fPabLMo/IvpAGKUK5cENcc8V4A4eatUx
         gxjTdBq0YBJQMDbYt2tI1JFiKb8lC3y4azvtL/dxpPBoeGosZO296wLAxZSPk5joGCb4
         qaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g99//iPDMyFvy/+oL6QKSbCjazZl6KWjaU9oRhSg69A=;
        b=2DNNElmCvswwZYDOJx+ZiGmHQ1BMmV53b/WH8kDZH9gk2maOf2T/ZhoaoJZxID4L19
         sNw3+9JI8e+XLNDtrWP5op3Rpj8fFCazyJD7nuyThRBor6GqhAstCbRiO+7r+OKJxYQf
         tpYJQQy9pCTTX0bekuh5D0IoZdgTAjg3UV8VnaSkryorkz2rCBR6V2VqXR/XbODCT0df
         w7J4OU8KZ2YXX/rH1aDLzle626FGC+TeDMvsvZz6bLOdGMvU+jG9z5TddzDAkwi0ScKW
         +jmZ3hVaMXGvFr2VLNqf1hqQECXlzND9mQMmgIHEcSbI839L9/c2RwsAkvRdixjuRLdN
         K7Mw==
X-Gm-Message-State: AFqh2krbTgLZMDCEOxDOIh5hBgKP/yzzK+tBuKXaRoAYa8ycUVoqsLQ4
	ycZ8XfR4ISzX/g0DSwPXlzE=
X-Google-Smtp-Source: AMrXdXsBc/LGTR4mKUdrY1ifZw+/ZCsvICxAoo41zGYSM6mx6uQfPVXS7JeG3YiQyGR7HodrV5+GWQ==
X-Received: by 2002:adf:f44f:0:b0:2bd:c6ce:7bf9 with SMTP id f15-20020adff44f000000b002bdc6ce7bf9mr10462091wrp.33.1673702789767;
        Sat, 14 Jan 2023 05:26:29 -0800 (PST)
Received: from localhost ([176.234.9.57])
        by smtp.gmail.com with UTF8SMTPSA id k6-20020a5d5186000000b002bbddb89c71sm17643370wrv.67.2023.01.14.05.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 05:26:29 -0800 (PST)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
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
Subject: [PATCH v7 0/5] PWM and keyboard backlight driver for ARM Macs
Date: Sat, 14 Jan 2023 16:25:03 +0300
Message-Id: <20230114132508.96600-1-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the v7 of the patch series to add PWM and keyboard backlight
driver for ARM macs. No significant changes this time.

Here is hoping that this time, the paint on this shed is up
to everyone's standards.

Changes in v1:
Addressing the review comments.

Changes in v2:
Added the reviewed-by and acked-by tags.
Addressing a review comment.

Changes in v3 and v4:
Addressing the review comments.

Changes in v5:
Added t600x device tree changes

v1: https://www.spinics.net/lists/linux-pwm/msg19500.html
v2: https://www.spinics.net/lists/linux-pwm/msg19562.html
v3: https://www.spinics.net/lists/linux-pwm/msg19901.html
v4: https://www.spinics.net/lists/linux-pwm/msg20093.html
v5: https://www.spinics.net/lists/linux-pwm/msg20150.html
v6: https://www.spinics.net/lists/linux-pwm/msg20190.html


Sasha Finkelstein (5):
  dt-bindings: pwm: Add Apple PWM controller
  pwm: Add Apple PWM controller
  arm64: dts: apple: t8103: Add PWM controller
  arm64: dts: apple: t600x: Add PWM controller
  MAINTAINERS: Add entries for Apple PWM driver

 .../bindings/pwm/apple,s5l-fpwm.yaml          |  51 ++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi     |   9 +
 .../arm64/boot/dts/apple/t600x-j314-j316.dtsi |  18 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts      |  17 ++
 arch/arm64/boot/dts/apple/t8103-j313.dts      |  17 ++
 arch/arm64/boot/dts/apple/t8103.dtsi          |   9 +
 drivers/pwm/Kconfig                           |  12 ++
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-apple.c                       | 159 ++++++++++++++++++
 10 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 create mode 100644 drivers/pwm/pwm-apple.c

-- 
2.37.1 (Apple Git-137.1)

