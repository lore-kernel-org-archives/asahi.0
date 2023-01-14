Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8946D80A
	for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 13:27:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id ja17so16889046wmb.3
        for <asahi@lists.linux.dev>; Sat, 14 Jan 2023 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTaBsHHaxY4hxEZyw1070cz+vHDzIdLfWWrgADCbRU8=;
        b=KctgwPQpH9xCpSLXM53WC9mTpWK1PvFlynHp8iRqG1lMsjo9sB0rthg2CEF3rP3g8x
         Kqe3/qO1CLVN8Z2AvbJDYtDjapoCrmExuuzBLKv7pVcKYONevudbuMWCF8BJtCTR7yjy
         USX/U2WQW5J7PEnziHq82Ap8Mp9RV/W9vU/Avz3c6gr1Y43Zoa56txbi/NkoVU13SBUu
         OKxMoo0XNfBDFgaLDSnqcMvEWOsTQgrn/UBFrXjNT6+/JDVmM0plvZGYy33x3YffaA9D
         seqkCoyuB0bByMSTJOOTf4t60p3RNtEmWPz33zGfpIZNmvBPw2Mp24rzi9cJiwvUdPyP
         8Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTaBsHHaxY4hxEZyw1070cz+vHDzIdLfWWrgADCbRU8=;
        b=OfHMoMEjOQao5An13GIV0CsbaYkjAplf10lkVmaRSg13PgIj+/YlNwpEKKRjgcDmZ3
         MpHWoUPgBLZRj8N9uyg6DUwdEG2I8SuXZBaaoNiIuLPHcU/J0ppYpiiogUOEhmNpOjun
         gDV3WEpLjYuSsUZ3TkXdnkqZrkT09gqfrF3iCkLvL4WA6TdAf7NBjO0Jf12Zp2r9gNn2
         6yfRDr9ArM2nuwKxJThSnKNMlYompXsnw7f+E1TYDeWaIso2iUhBAUGSZ2g9G0O9m3+S
         mP32hRt2r1IfQPH7B8rMZ4srffJ6vbWI4qSBOkQsKesPYimCGfIfCPxTiuZDCbJjOFGz
         3vMA==
X-Gm-Message-State: AFqh2kqf4UA5vEJ+qCSYhzDLan+4Nxuxix2d1SQW+XsEMu1coTygha3z
	LeDRlfwU5r/Wk0PZ004Z1ho=
X-Google-Smtp-Source: AMrXdXvxfcjO16Tfd57a8sefzot+ClnnfVVEzMxceMSpSs34TyOgYWX9y5BdDeILBBdMcapToQTN0A==
X-Received: by 2002:a05:600c:3584:b0:3d9:719a:8f7d with SMTP id p4-20020a05600c358400b003d9719a8f7dmr54674605wmq.35.1673702834802;
        Sat, 14 Jan 2023 05:27:14 -0800 (PST)
Received: from localhost ([176.234.9.57])
        by smtp.gmail.com with UTF8SMTPSA id l36-20020a05600c1d2400b003d9fb59c16fsm16415818wms.11.2023.01.14.05.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 05:27:14 -0800 (PST)
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
Subject: [PATCH v7 5/5] MAINTAINERS: Add entries for Apple PWM driver
Date: Sat, 14 Jan 2023 16:25:08 +0300
Message-Id: <20230114132508.96600-6-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230114132508.96600-1-fnkl.kernel@gmail.com>
References: <20230114132508.96600-1-fnkl.kernel@gmail.com>
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
index 7f86d02cb427..75bda5ab704d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1970,6 +1970,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/pwm/pwm-apple.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -1985,6 +1986,7 @@ F:	drivers/mailbox/apple-mailbox.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
+F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
-- 
2.37.1 (Apple Git-137.1)

