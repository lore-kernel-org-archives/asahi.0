Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC4137C
	for <asahi@lists.linux.dev>; Sun, 19 Mar 2023 11:37:35 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so36582856edb.9
        for <asahi@lists.linux.dev>; Sun, 19 Mar 2023 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679225853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=CNN+BQW1qwnIWDvTxDCdF3J/x2g//K0JqhfSGQ0F1o+DOFxtJMpexG7Zg2xkstrcG3
         N+bDvSoc3N+PX8xxyOpd4P5FQyhLI7jmL6DiHr17l04ctANkt/h/obwznW6Ey2lYYQQU
         eP2I596H+O3bmLUf6p+46nb/f7yBcuo7lzxfgySwO2BcdcVmDv45qTT7YshpQk33z034
         C3rS/NaL3yaQbNCXzcGPGc5C4/FRf1ebAXvgljWLU1fDQSFe8a8q04Z4NFFYizrr+uiC
         AYnUZxGFufy4sIdurjFrVZbDayiYAgPBKzWOFy1RXzaONpIXOOt6Ffh7VM4DM14tCvBD
         itHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679225853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=Geb1KVR3Zewrra5SNeJpyEMnqWOrspRuAB7YBVcW2YmqXoPZmdzdspQ7tZnEg9RlU1
         JivSlRKR9Zul6kLTTAL1nrx+eXoxutib/U1rQhWfvq1G1MRHYr5wBAC5V1ktvyMY8xnc
         Vy8wnLQXxvDeyE4CqNenjkUflsWkXGF4jvwDYqLfpLkA/fcZtxC4tzOFbDwYYjFAp2BK
         8QVcTH+EsqJcA9WpyI5h1Iq/ADsDMEtLhAYul9BfRBn4ImUsvHvB7Srd3TX49yHHhs/I
         5VPd3UQ65PcGSQ6G93zGhwvIgPVXOnTgmAHwqNFT5mXFSw0MkTv5jOj5e4zIHB07xdOn
         fWUQ==
X-Gm-Message-State: AO0yUKUCFefzmQq7SKRW4nFaC+v7yA9I/Ux/Q6OeptoMzgz2jC6TZNLu
	z68pnuG9VvUcHz3fz/mQ+i4I4g==
X-Google-Smtp-Source: AK7set9U0AOSAuCrrvQlU6ITw/snJRIJElKkSVMThrbqvxYqk0NpWETXKzJ097yOzmwdgjDNpq92Zg==
X-Received: by 2002:a05:6402:c2:b0:4fe:94a2:81be with SMTP id i2-20020a05640200c200b004fe94a281bemr8384168edu.7.1679225853579;
        Sun, 19 Mar 2023 04:37:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id s29-20020a50d49d000000b004fc2a75c6b3sm3408547edi.23.2023.03.19.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:37:33 -0700 (PDT)
Message-ID: <7098b2cb-eba9-ebae-1edc-f4c934bbd898@linaro.org>
Date: Sun, 19 Mar 2023 12:37:31 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
 Florian Fainelli <f.fainelli@gmail.com>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

