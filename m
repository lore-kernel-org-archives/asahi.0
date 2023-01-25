Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8746B5
	for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 15:11:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id fl24so698120wmb.1
        for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 07:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTaBsHHaxY4hxEZyw1070cz+vHDzIdLfWWrgADCbRU8=;
        b=BRnb5DYVXtWCtvc3qdQxtfQDSxjmp+yfOM2pXEVaEXc37OixGwC1jFBPFhmKTx4PoM
         cphL1s7CofBvz5JRbnWE6RQqU6B4RL5Umhs+nBBVGb+ijp8jDNNvX5ik1SUFv9XCg1BF
         nuNwfWqorONjLl4u53U774sFsM/0aCGUxeRaILHFFBh5SbBGYExmc/Lk52S9RAgt7m4z
         5H8oQszL77/msmmj8xT9qURuXzeNvUYbdIqW4wgm4N3ci2pRXIOfanmDlu3loqIzIEzs
         wXoD8IBN/nCKqB1owFuvw267FFffKotZDSwEPcp1M49ubhfphBeY+axb5FSCnGPNSZyn
         eycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTaBsHHaxY4hxEZyw1070cz+vHDzIdLfWWrgADCbRU8=;
        b=EgVsbsk5NffjbZjN/fmbhqYlIMD3orxUbKv31h9TVpJGZhXXufkNJGJpmqLPQbsTA2
         g1g4DLzW6l/0dxxvC9wfMYX/XwcV9zP9Vt6BDpsZKr5lmmnD7w4X+clC2n09JJM/opTd
         jGRxsLeWf+ZLXMXkOtLMr5S5wj5Cd+r5S6HZLImAVepwuzhJ1LcIg0HUKsWfahY8QCv0
         JZH4OOfU58tB3+H9NTf3fA0c8rFhadjQRNhXq6x75geaU7OumNcLicqlSSZSrKt8rU8X
         4kDOMdObeKY5gah3Nsxg2fB5PTChuP9Kv6a11uK0rBPzO6UO1tmm0fEPabRHUgZZf0/h
         qG4Q==
X-Gm-Message-State: AFqh2kqvwzc1BWYJo49mc1ZcwiU/KEI5mLIZi7Vfb28mqXqyrzejQWes
	FltfYvie6SoWUx0VjUtsU3f6shX+ayw=
X-Google-Smtp-Source: AMrXdXsVMi89xiI+4LxZntiDgxj2YfyHgKghAGbA2sAo4gVujJ7zwlCxsirbMUpVHQC35a6Lk+uuNA==
X-Received: by 2002:a05:600c:1d22:b0:3d9:6bc3:b8b9 with SMTP id l34-20020a05600c1d2200b003d96bc3b8b9mr32542581wms.9.1674659474298;
        Wed, 25 Jan 2023 07:11:14 -0800 (PST)
Received: from localhost ([82.222.96.52])
        by smtp.gmail.com with UTF8SMTPSA id f39-20020a05600c492700b003dc0cb5e3f1sm2003392wmp.46.2023.01.25.07.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:11:13 -0800 (PST)
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
Date: Wed, 25 Jan 2023 18:10:41 +0300
Message-Id: <20230125151041.55483-6-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230125151041.55483-1-fnkl.kernel@gmail.com>
References: <20230125151041.55483-1-fnkl.kernel@gmail.com>
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

