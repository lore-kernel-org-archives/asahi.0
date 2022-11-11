Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2E24F4F
	for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 17:34:04 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x2so8572159edd.2
        for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 09:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcLz+JLectl4eq76JetIRN2RIxjnki5yQTvjxWRfAgM=;
        b=D9eruaRgsUTg63mWpBsgzufnU+S1W0EcOItzcOWKFcDN4Fj99yc9qisypftFtx/Ou1
         12/wvgaiKsjgrVniAsiC5abbCGEaX2luQRIC3lz8eStkPcrWtowlAkXozzcYRAPAyKJ7
         zl6V0DJKSeAGwM1v+S3fJCR0XUpxoyoVqncMj+mtLB0oDajxjVwy1H4VB6MUHx1Aa2lx
         WUHFNwp6siYTeAIINk2BhlHRA+446txsPaIN8KMo0fN5GYnDMMMtJRqKZao7/iRT7KoS
         5vg49szXKtScm8SjxfDxNDIXk9Tw5v2gN9wVXSEoqVin7PwGFaWTCR3IviOZQZYQKSxM
         DHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcLz+JLectl4eq76JetIRN2RIxjnki5yQTvjxWRfAgM=;
        b=pNPNFn4/nOJ4wX2vQbvJJcRlMyyKn9O0qa2JJEJdkB+h4grzLT9rX/ks85lCEmM27x
         FipV8h9WP+nufcs7YnxmRD5ywc7dUvpm9xvf6OcG9RsBaE2Y2teYecWFr02c6O6G+1zE
         LBHF6kmLiTjjd3dt756GIPK3yYYzRVdKtu38Pxbt9IA/9XLgBHjBzBkblL3lNvWBqeot
         HpXbWND/IXh1+M6BLuglkpx0vqS2f00IzmQrp10NBH4yxYPr9kKjVmQ7L4aCXBnfr7Ja
         hqtKJDdng+HY8HefFTH3U7QVw2mi2dScYSRz5+pU6PnR7tcqiBKBvoxOjNcTTK6k90rc
         GBcw==
X-Gm-Message-State: ANoB5pn/ocO36swu4sKdfv2DLwR0pnD9nfWuRI5nNPQOCjg2uHc5oUY3
	/kIv3yiVuvg7YkmqIksi5kE=
X-Google-Smtp-Source: AA0mqf4ckoin6dGD/x5XJtdvqAL0YTD5HKpohCb+EetbuAAk3yn/kZAu0w6RnZJIPV0/UUtoMLBHRA==
X-Received: by 2002:a05:6402:1bdc:b0:463:7312:a94 with SMTP id ch28-20020a0564021bdc00b0046373120a94mr2496485edb.178.1668188042536;
        Fri, 11 Nov 2022 09:34:02 -0800 (PST)
Received: from localhost ([85.153.204.139])
        by smtp.gmail.com with UTF8SMTPSA id ku21-20020a170907789500b007ae1ab8f887sm1138089ejc.14.2022.11.11.09.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 09:34:01 -0800 (PST)
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
Subject: [PATCH v3 0/4] PWM and keyboard backlight driver for ARM Macs
Date: Fri, 11 Nov 2022 20:33:44 +0300
Message-Id: <20221111173348.6537-1-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the v3 of the patch series to add PWM and keyboard backlight
driver for ARM macs.

Changes in v1:
Addressing the review comments.

Changes in v2:
Added the reviewed-by and acked-by tags.
Addressing a review comment.

v1: https://www.spinics.net/lists/linux-pwm/msg19500.html
v2: https://www.spinics.net/lists/linux-pwm/msg19562.html

Sasha Finkelstein (4):
  dt-bindings: pwm: Add Apple PWM controller
  pwm: Add Apple PWM controller
  arm64: dts: apple: t8103: Add PWM controller
  MAINTAINERS: Add entries for Apple PWM driver

 .../bindings/pwm/apple,s5l-fpwm.yaml          |  51 +++++++
 MAINTAINERS                                   |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts      |  20 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts      |  20 +++
 arch/arm64/boot/dts/apple/t8103.dtsi          |   9 ++
 drivers/pwm/Kconfig                           |  12 ++
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-apple.c                       | 127 ++++++++++++++++++
 8 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 create mode 100644 drivers/pwm/pwm-apple.c

-- 
2.38.1

