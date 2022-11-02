Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8552582
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 14:17:13 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r14so26678200edc.7
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tx9qzuOwx4JUlHp6FkZ/5WKZ4d6lYz+D1HQa2LD1tA=;
        b=EsCUjDCGvuVNc+ZigO1adhkMaFllrxPwJiMmH/+MVP0eLnT14RddOwiZVy7TvY1/qS
         TzksJ+8HrWbW4EVKdWXNmisIHRooHPtEA6sn7edEUQan2h5aE6kGfmye558mnGqb490m
         mmNXHOBMMLIS9MGKcRcVMIpIryB8zXz7brhX4cSYbY8bvBL3nBA2HtJDiP9yJjz603Mc
         ZzzgTlKg6SFs29tlhcNttEaAdWKteOQ9lUF89bGqD6ApUTgKQvTTivquO3oDYSIyFm+f
         IzVGEV+lJt7hVD2uSnsrHzTNwmqdZjEM8xsU9Q/RVATUb3MJZtio9IiyFqQvnoaFcDHv
         sANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tx9qzuOwx4JUlHp6FkZ/5WKZ4d6lYz+D1HQa2LD1tA=;
        b=RprKRA8fecdCpx14dZ1Kt9CzY1HN2Yby+7RfCqIeIaU/xI3MoXt8UFMBOHEJ1O5J2j
         UJl6/dGDSz3iDSZ6ZesyuiLWWn/YBEkuoSdGf8YxhnONFklg90AUwKK7oqlSeiRNor3C
         VsFPkIyp6xw72q3EL1iRJpX7J3HXzl83rSE25EQDTcC1u5tWOabwqzTXCELPmLeqmM08
         mFU2/EtO53amRRbUNktFJL9yE8aI6Caa/V8KC1K7W8gIc1Pw+C1P+MskvhX/zqgCBpas
         ocvrcDHZAG/IL5HxEXeIjqYLnqPbng+GCtzDqWgiC/WGCceD/C4ydKfWEwAesp3hZchM
         Gibw==
X-Gm-Message-State: ACrzQf0qFH5zc38gffOyMCOEPsq2pNuwAp8mlaquUxpbVstnFWs318Gn
	NHVyJ4jh8TrUuW21CHsGzkU=
X-Google-Smtp-Source: AMsMyM7uhvWm2LP2gaUwQPtrSbRrlDUn+5GMSQB+lMctsBGZd4XE5wBj+rMs0BWRyxi2RkLDFicCMA==
X-Received: by 2002:a05:6402:2937:b0:461:32aa:32da with SMTP id ee55-20020a056402293700b0046132aa32damr24299542edb.78.1667398631862;
        Wed, 02 Nov 2022 07:17:11 -0700 (PDT)
Received: from localhost ([88.227.60.86])
        by smtp.gmail.com with UTF8SMTPSA id my15-20020a1709065a4f00b0078d38cda2b1sm5376305ejc.202.2022.11.02.07.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 07:17:11 -0700 (PDT)
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
Subject: [PATCH v2 0/4] PWM and keyboard backlight driver for ARM Macs
Date: Wed,  2 Nov 2022 17:15:09 +0300
Message-Id: <20221102141513.49289-1-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the v2 of the patch series to add PWM and keyboard backlight
drivers for ARM macs. The changes from v1 address the review
comments on that patch set.

v1: https://www.spinics.net/lists/linux-pwm/msg19500.html

Best Regards.

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
2.37.3

