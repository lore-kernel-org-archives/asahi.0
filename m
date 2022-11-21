Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BECA6FA6
	for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 17:45:18 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id s5so17273509edc.12
        for <asahi@lists.linux.dev>; Mon, 21 Nov 2022 09:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNL6IfTe0wzPq8NWBK/D96/5y8l3oPapGeg3sP1iP80=;
        b=dLhwAvRFJe9dchF5SlF7ogMjH13Pn6iK4bxfoIQiE97ocKlAgrKq3Ar3GgtgtJKfGJ
         s/O72OTVsNvv/EiYuci7viuu6cDSVg22gjpQLhVYJHIlvsVhHPTbmiber2ea9U9GrLb3
         JsVBE1OojpPa1oX3NA0Bk1bmjuH/4QGz35S4ErMgIwB7uRJ8VKuFHWGECFZOB1dM6QcM
         u8P32EeuImZq7VHnVYE0Ity0o12rE81sECLWAV5Z+2oKSbokt9Rxkn/lq8ymXNoZORno
         RA/kd0GE//5CNTFYaKh0Ox/dgx1dQYtgjQN1ilhQil8pIApqLdb6WEkjdYHpG+p36LzT
         TogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNL6IfTe0wzPq8NWBK/D96/5y8l3oPapGeg3sP1iP80=;
        b=nHB5E9B5xT2DQz8BOBK+BDKwhgA153RLxC69E73utrYeXw7Jd+dZ69vT8kIk459dQB
         XUfIUsyPa8i5+KvCiMjO/WgrJuXupZ1ZDYx9U8qrTfU0dlmdJ3MjkNLVEQ4bMsO/1ztZ
         M74A4uqowRBDprUVGb7WFN7BD1PDMUEwlTUmWUPatQalzNcrsWwTZY2BmVWbki1qdMgg
         4zViVS5fxhApCTsrV/ZQHIac84YDkn8JUPDCG8irTCEwuxl/drUmkTZFynm9tyQ5BgjR
         oBRDcCvOkCofxWdBnncm1nKMoRRqHvH6t4/f3lBklM4r1OjqhdxUrOw4nFqoFSFgY1Fg
         xJdA==
X-Gm-Message-State: ANoB5pnvqBpmQDtH6AcnVdyeYAuBMtLa4wmXLd0L/8r8gaodLt1o95lm
	aDFwQVIvCMWaF0skX8LSg44=
X-Google-Smtp-Source: AA0mqf5tktH45X/K7WSst1WSDXG6NCTfMsMwbFnE94eu773Cg61+GPcdMqm0ADWd+wNyEsvR1EuCxg==
X-Received: by 2002:aa7:db90:0:b0:459:aa70:d4fd with SMTP id u16-20020aa7db90000000b00459aa70d4fdmr16907330edt.162.1669052717948;
        Mon, 21 Nov 2022 09:45:17 -0800 (PST)
Received: from localhost ([217.131.81.52])
        by smtp.gmail.com with UTF8SMTPSA id g2-20020a056402428200b0046146c730easm5464345edc.75.2022.11.21.09.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:45:17 -0800 (PST)
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
Subject: [PATCH RESEND v3 4/4] MAINTAINERS: Add entries for Apple PWM driver
Date: Mon, 21 Nov 2022 20:42:28 +0300
Message-Id: <20221121174228.93670-5-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121174228.93670-1-fnkl.kernel@gmail.com>
References: <20221121174228.93670-1-fnkl.kernel@gmail.com>
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
index 046ff06ff97f..69f56f7cf907 100644
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
2.38.1

