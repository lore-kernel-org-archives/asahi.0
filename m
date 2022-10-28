Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB512916
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 16:52:54 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id f27so14342634eje.1
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRbtjzgGY79KT/za/x8o0WGQEAKstEUc6+ZUvLa/3WE=;
        b=Rm1QgOjAFiI7XmFUhmPEZeVtIvOd4SWpfjF8UQiJEDSDLZL7F2M6r9ByqbGV/JByp4
         Gv+fkWsQJ88UVp2YtPZeQqKxuaVRxYmvpr30scl035igGDXPVadrzYMtHmEdSv4lgSnq
         vm1cQURGqu5jG05rh321S9jyPgK1mI/l2VZM9FPwNqay2EfePWJDExQClNkSqrI6KBQp
         +hVA6dgfE2iRfo3JkqkWF9HBGcLA2Qm+v6n3eJLHLuWfuttfiILkbnPESeUi+fZwJtno
         SvVb60STbZAD5X2utynPoFPNFvBtl2VmtWBDWcD/7tARz8FbcSVwSnt+I2dVgP4qUxg1
         WZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRbtjzgGY79KT/za/x8o0WGQEAKstEUc6+ZUvLa/3WE=;
        b=RKGsu2pbha+VHqlu/tjTWolYbZmYsS6T2+6sMA9aSbtQZlzDbobuSe0FLrDIs4jfYy
         8MUd1YwB1gsgJfdj2hB+Z6T6WatGozxXSTAZhu5GAj0kPNUn7+sONmgjTtGRJyMryiyH
         oNOGQ5EmBYt5ESvmqyefsqkY/8zrwUl03us7Vaf0JXcv8QBZB4QkC6k8IsWbFfJQJxhW
         8u6dvAGjSsgqW6v7M6/6ju3sfKV9WEf5AJqMq4jwGJVQUgoA7Vc5jryrdInAu1W4JrlF
         zExafFZmvBOnHMLLrHP82+eIW2Gzl/3nNCe2rrkzQz/pTOtZgHHYGaYwTmt6e639cgZz
         25hg==
X-Gm-Message-State: ACrzQf3RttNaD7cYj59qNVaT0s5Vde8QNhKHxUhXBOfVAPHdgEhl8kQ7
	iyJAf9/kiJJzm11+aCukgKM=
X-Google-Smtp-Source: AMsMyM7gsqxktKkco3+PcK41044g4dHIYIHKTgAqQdmLcpGgPUnZd0RVuxuYWimJn9kPdH4HvFGBLA==
X-Received: by 2002:a17:906:3111:b0:7ad:a7fc:f3e8 with SMTP id 17-20020a170906311100b007ada7fcf3e8mr243112ejx.518.1666975972737;
        Fri, 28 Oct 2022 09:52:52 -0700 (PDT)
Received: from localhost ([88.227.58.131])
        by smtp.gmail.com with UTF8SMTPSA id x9-20020a056402414900b004589da5e5cesm2952990eda.41.2022.10.28.09.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 09:52:52 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] PWM and keyboard backlight driver for ARM Macs
Date: Fri, 28 Oct 2022 19:52:11 +0300
Message-Id: <20221028165215.43662-1-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for the PWM controller present on ARM Macs and used
among other things for the keyboard backlight on those laptops.

The included device tree patch also hooks up the keyboard backlight using
the pwm-leds binding.

Best Regards.

Sasha Finkelstein (4):
 dt-bindings: pwm: Add Apple PWM controller
 pwm: Add Apple PWM controller
 arm64: dts: apple: t8103: Add PWM controller
 MAINTAINERS: Add entries for Apple PWM driver

 Documentation/devicetree/bindings/pwm/pwm-apple.yaml |  51 +++++++++++++
 MAINTAINERS                                          |   2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts             |  20 ++++++++
 arch/arm64/boot/dts/apple/t8103-j313.dts             |  20 ++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi                 |   9 ++++
 drivers/pwm/Kconfig                                  |  12 ++++
 drivers/pwm/Makefile                                 |   1 +
 drivers/pwm/pwm-apple.c                              | 124 +++++++++++++++++++
 8 files changed, 239 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-apple.yaml
 create mode 100644 drivers/pwm/pwm-apple.c




