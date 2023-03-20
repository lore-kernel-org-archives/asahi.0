Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B947C;
	Mon, 20 Mar 2023 18:08:19 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id bz27so2403568qtb.1;
        Mon, 20 Mar 2023 11:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679335698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTfm42DRLF/pqyQQSDFQRYTghzUDIMmwNt3uFt+5ZVo=;
        b=BDEvdS3CLR83im0McPFo89WtIVScQY2XOoudmTKAtD+7y6l2VP8PolUya8K44BjpOC
         UNhptTv7tYmCF7587hlCu8wMCjxh3UlzW5YI7dIYr2IqaThnuB5vjuElL/8yFG/TbL1u
         g+bxDQ3cpl37yZ4mJXvqzSkaXlAJmhxktqwjnGEv5/8GcgybHyB88Xjcdb6LcJid2CMG
         Tgr/6vkH+C3QbX1Vx02hmuMBA2JuYYZbfQ3PwVMq/VHZ7xqc1ObultPvPHLmrgbQ7utT
         1YhGEzJpkmML5NEYRh0oX96np+sJT36GRFFdEr3HeaujoCmlj4II5jXEKyIK/wCmGChO
         FKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335698;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTfm42DRLF/pqyQQSDFQRYTghzUDIMmwNt3uFt+5ZVo=;
        b=aB7bsjZPMssHAnHAwTaHqMfhth/IfzFMHE/0rsM4IXZDC+XO2E7kmztBksud9SI6yA
         wiQUKBNY1k34MEOEfnYaIEpiCJkxGaV3yL9ZwzcCX4cN6Fj1nA9WH+Sleqz3+NSw68f/
         yoboCRdY9McBTfCtenAw32B/9WschmIGnnwmcDP8DHcVPBhxL0MkvgHVQ/+/iNlSRUN9
         dncesG05L527K1k+Vu7KLVMI4Mlqv3A8/1wno5KhoO0j9bfRhVsiszkc6Emtb03FB59j
         xeU34elOA6sg3SiHQlB+u2Ma9TD6TylrLGWWb7Vw8MSyQTOiETtTYTqmXETxCZ67Uff1
         rqbQ==
X-Gm-Message-State: AO0yUKVSRzTWPa2nFaTir3RY3I+t2NZr421Xb/gRc+1YeJiXah97m06z
	kP+Veo8+0DlvFdnll2UNqKI=
X-Google-Smtp-Source: AK7set+ZUF3yUcqPxvT5JrSdC2gQaXGTs/LVLEDznrAr6g4pl8nC/T/ix9WBdEtY73cm15/2Ejntww==
X-Received: by 2002:a05:622a:144b:b0:3b6:3a12:2bf9 with SMTP id v11-20020a05622a144b00b003b63a122bf9mr278501qtx.2.1679335698248;
        Mon, 20 Mar 2023 11:08:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id v26-20020ac8729a000000b003e2e919bcf7sm1297578qto.78.2023.03.20.11.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:08:17 -0700 (PDT)
Message-ID: <bbea4d6e-4435-7337-adf8-325c2f534bba@gmail.com>
Date: Mon, 20 Mar 2023 11:08:03 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: watchdog: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230317233643.3969019-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/23 16:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-
>   Documentation/devicetree/bindings/watchdog/apple,wdt.yaml       | 2 +-
>   Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml     | 2 +-
>   .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-
>   .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml          | 2 +-

Acked-by: Florian Fainelli <f.fainelli@gmail.com> #brcm,bcm7038-wdt.yaml
-- 
Florian

