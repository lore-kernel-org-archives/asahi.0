Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF17F8;
	Sat, 18 Mar 2023 07:55:59 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eh3so28513513edb.11;
        Sat, 18 Mar 2023 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3mb1pjia0IgyxNYtGaBW063L8X9ZIfqHcxc0T2DSoE=;
        b=fBX72+jPi22mNWR0n66lXXvwXHTQxcM41cjOKQOFBjpMqwvJXTQARhbixvvPdkkpyg
         iRz5F1olqpPnPEhjzGsE8uRjUIq0KObfvNgQ33aXB16Xe4mdr88HqTAATKyBFPncUXHN
         pAHvLgLybu/xG4qaqSDaGPMBl4snRJTmMwG7ZAjPV0ZmxqwZwUqiR0DLEKcbQ+k4MgFm
         uLv/UFLAxju66WskNVs6KYpSK7pn8sxPIhpX3kVxZGAwHr4Yi+Sx1ojZX8mCwCAtaHdg
         cFHHoFp3LRvH0s2K5dzSmzksNvnh5RF5z5TITUuf/CxXcgImrBy6REOAOt+P4G3p7ZrF
         qT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3mb1pjia0IgyxNYtGaBW063L8X9ZIfqHcxc0T2DSoE=;
        b=xhd+gyRtXuZAtJal5oO7XROEemeBYjsPRjG72sgQTCXOLMGTtK0djYOC6kc1lRK0V9
         FMUxdFqs+r80EQ1ixpn/KE5qYSiMdRDYJqcfd5i3AsuogHisI+eK/wDP2q1xmizc0IQF
         e4cImW7fbX63ErU/dnQLM5HcoDtGqtWHcd6mV+E7QbeCwPpDUUpfRB8IrOxy84OPMbSy
         PxO0uA1ONKqyGtEztPQWCfDsqmxb/HcDKu66xTvVr6JL5JmVMp5Jbw1s7ZNW/hArSAL+
         +ni96mU0wb2wIw+PX/DakplDEdGdQ82ubq0cRhhHm2W9hfgbHB+d1csMdM56oeu0rrv4
         HCxw==
X-Gm-Message-State: AO0yUKX8w+3m1gcaabbx7L+jd6eNwcYXzFFSX1/+4m7iacoD6CqGw0HT
	0NI7ZEMIUyiwmjutH+nHmCo=
X-Google-Smtp-Source: AK7set+YGRH+NdfCv25lT4gzGUwF+d+mhdcmW8UIiZ6tl7LF/5aTRoQ3LntLinj37gw5RiBcrUdU9w==
X-Received: by 2002:a17:907:2bc8:b0:931:2306:f363 with SMTP id gv8-20020a1709072bc800b009312306f363mr2055699ejc.21.1679126157741;
        Sat, 18 Mar 2023 00:55:57 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id xo10-20020a170907bb8a00b008ec793ac3f4sm1850916ejc.192.2023.03.18.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:55:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: watchdog: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:55:54 +0100
Message-ID: <2672483.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
References: <20230317233643.3969019-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 18. marec 2023 ob 00:36:42 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-

for allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml       | 2 +-
>  Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml          | 2 +-
>  .../devicetree/bindings/watchdog/faraday,ftwdt010.yaml          | 2 +-
>  Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml | 2 +-
>  Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml     | 2 +-
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml    | 2 +-
>  Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml      | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)



