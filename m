Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D524F4F
	for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 17:34:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id 13so14167287ejn.3
        for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNL6IfTe0wzPq8NWBK/D96/5y8l3oPapGeg3sP1iP80=;
        b=ZiUNfWdS+2kgkaKJuTKbf+3zGC6VlGeB9T3IBZAioQZkrkhbJwmO60/IQP7d4odxOd
         UQ9P/NHEflrVY3Um9feS1Tq2bYLLXYUUmZOpTPgtpvRLA1a0cCvcG8zFNIWOKIwtyApR
         kmw9g2Yj5pzFx2qaZzl2VuzjXA859mMBprMcsy+6rpX8mUKZO2UIi29+pX5+5QinRPnt
         te6I9Y0Vl5WvYvNH/QQfWUziOp1hqe1GBkRFVW6YDYRjTnAxRe6pblWJkitt61N++Q8W
         Yky075tee/8i0S7Jdvfa0RullX4+2DxdfuZRmvF2rrsmNWbH72mRmHlzDHiA+ltP6EE2
         TFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNL6IfTe0wzPq8NWBK/D96/5y8l3oPapGeg3sP1iP80=;
        b=EjnZKKp8FwDfTdm1u0jE2xkYlcFGGoReHdCxfo06ZiBiJsDuQKct/08RTs2vYtBqi3
         I6i4g5vjB0+q+qpwXM8tZhWfpWlrSMq2NfNpQLRddjEUzrS4CjMpSP87eMfxf+ars9xw
         0yD2KZOftwQXSc/rxyTz0p/LyjSEIx3KzgdBKZcjzNXoti0LmW2uTyNkWzoGv+VJ8F0f
         +jb2IQ2VpFblVBuQzQ2LbOwK5b2HRwSBdBH+Wt1x9w1sDt/SOoHzF1PYYpF/EMV5UWuS
         wVv7L1QMa+xo70gtqoW0slSlKl/uputeSc6vxnH7jNXWXD86I+3EprrpBxQP+ed7Nv0v
         7UdA==
X-Gm-Message-State: ANoB5pkhJFf92fDoEDv8PJ2GzEt543gFVhMnJ1SUx6GbcVV7xbQ4di8+
	7hngi2PqUUQWg8jqUtRf5Dg=
X-Google-Smtp-Source: AA0mqf4WNUX8D3AJJ+yKFXFkOeOfQnJkafQvX4JqhdEVmSHraQl66sol6L5QnsfhPdMBvLHU7ww+uQ==
X-Received: by 2002:a17:906:2852:b0:7ad:9f03:fd44 with SMTP id s18-20020a170906285200b007ad9f03fd44mr2722601ejc.73.1668188063262;
        Fri, 11 Nov 2022 09:34:23 -0800 (PST)
Received: from localhost ([85.153.204.139])
        by smtp.gmail.com with UTF8SMTPSA id lb21-20020a170907785500b0073dbaeb50f6sm1072867ejc.169.2022.11.11.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 09:34:22 -0800 (PST)
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
Subject: [PATCH v3 4/4] MAINTAINERS: Add entries for Apple PWM driver
Date: Fri, 11 Nov 2022 20:33:48 +0300
Message-Id: <20221111173348.6537-5-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221111173348.6537-1-fnkl.kernel@gmail.com>
References: <20221111173348.6537-1-fnkl.kernel@gmail.com>
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

