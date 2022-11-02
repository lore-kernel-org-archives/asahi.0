Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31222582
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 14:17:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id t25so45715487ejb.8
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OvsFvC7MAbEsOX8IFvWXL3yuohBpehZrnsumSS6l5Y=;
        b=I94xNZB032xN/I+xFwgS4i1xMTczslDTtHMUVGoshdZ/3RqrcVx6ggSO1gkrF1gjfX
         HKSBKCCRFP9Z4qEjiUmsiuNI1YiJqpJ1t+ucH8Bd0egieDq1dJ94kTcY4WT9Pw82pCI/
         ceAau4TdeCCagvYuTewmK7nvHyHUWj0Eb27ptkWPZpNvDL/GLSK1GQ3DhE2S4d9nBEYK
         8LgPm4QDL6s80i/5BTfLNm/jgp7DtF8Kmp5I5tcRaVuDgjZxT0KgA0eVrod8TB+vh9Zc
         7nbC69J1/ujjz21XwP4fvMs1jXgDwCMXLwORccXtYMeE7mqSiKf8QiaE1voLWuGOPNJQ
         n0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OvsFvC7MAbEsOX8IFvWXL3yuohBpehZrnsumSS6l5Y=;
        b=lwh0jYSQqZW8c96EIzoJ8XxSrLnZt9NxQl7OcHgEXt4cgGob65YfsFJmvBwO2sQDw4
         SUOxX8Vy6+AuU7J4i0/QIjABilE6XABFK+bGH2gd4MDPtGYOc+1xlpAdrK25I8ZjfbFo
         SC7JkJGX2fSQbmQtU1CJvfISxkjLyLqg2woH9ah8f+qr/hshNjjXeY6m0MuPcQVxRYOz
         gHXQy89x8uhGfpY8vrcbdOvBv/G9jM+x4Cw27kaYPo5IUd93TnTRhzJRdWWFitg0tMje
         EGeAuaZTADMYfeZRFOXDkdK887PFfm51eQC/tb5DnMzqTA8ew9GZwBAlED74ClUPrpuj
         I5Rg==
X-Gm-Message-State: ACrzQf2l2Hrc4qocSfN12Lf1lmeRao4rAeG9AyKmyEQKHn67BKvBgzKv
	RfELToqrdgaEsLBQBozCI/M=
X-Google-Smtp-Source: AMsMyM6DJtDJPn0GY0qzDwdPhWqfhXVOLLPpbFKX7ji9TiBh0loGXmAORNtJMyy/1fK9D3LQR0FDtg==
X-Received: by 2002:a17:906:58c9:b0:7a7:dcba:a987 with SMTP id e9-20020a17090658c900b007a7dcbaa987mr23908623ejs.88.1667398644094;
        Wed, 02 Nov 2022 07:17:24 -0700 (PDT)
Received: from localhost ([88.227.60.86])
        by smtp.gmail.com with UTF8SMTPSA id f21-20020aa7d855000000b00458d383a6ddsm5826495eds.44.2022.11.02.07.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 07:17:23 -0700 (PDT)
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
Subject: [PATCH v2 4/4] MAINTAINERS: Add entries for Apple PWM driver
Date: Wed,  2 Nov 2022 17:15:13 +0300
Message-Id: <20221102141513.49289-5-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221102141513.49289-1-fnkl.kernel@gmail.com>
References: <20221102141513.49289-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 379945f82a64..414812941714 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1908,6 +1908,7 @@ F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
+F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
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
2.37.3

