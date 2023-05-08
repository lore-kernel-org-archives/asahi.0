Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F25BA93B
	for <asahi@lists.linux.dev>; Mon,  8 May 2023 09:36:33 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso8367200a12.3
        for <asahi@lists.linux.dev>; Mon, 08 May 2023 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683538591; x=1686130591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gQynKHq/j0rouitkQ61mRMZDG5anZgmqsztbwdlNZc=;
        b=DymGYpSMNyruICBmlBVGENxrUAxCQg/9cXLgCRaamSdE/dEF2PWDcI2NMgDIRJyj0k
         AiDSeiLGwe73bHrNxQwjuoRCedlA2Yal3AQs/a4zdKuNhJDj6FOpRSWRybzpa3q9yppa
         +6MwAuSI8a26ybP1A3zGDXHJ/8ehNfai1ak7usI0MarlRYSoOOKoX3CP++uMCQHkckTB
         6/TfU7klsLFfkBTZylAh3wU4x8ZIoNloePBOYGxoc8QRhqNcfEvKc14v8pEagcyo6SJG
         voc7He/24Y+xohlSkDq2rH+Bz57fvqz51ITqXFlyKTsYLwLADR1wROlLMbTlnGJu1Q2V
         2bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683538591; x=1686130591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gQynKHq/j0rouitkQ61mRMZDG5anZgmqsztbwdlNZc=;
        b=N6VcGNRgks76hKoQ1ArBKAGDeNAfRobl9IzLGpzpemRuB2elLoJsr5y+l0tlKkh+Qc
         fx4g85IBqdkOOUKS2NGY+WW1y5x0IJzBAaxsuEniIFB9wTIFeC5kEfawfQ2iiPrSuHJi
         L6ky+jF9U13bEc0s9LVPQ/r2oD59r5wohhzApREA97iFDoQuuLWSZF1sYSiPtbH2nPx/
         2jL/A0L3qi3OZnGWGZQ4Z6cuU6WSjOLUp8ys3A61TBAMd28CTSFgXYCOkXDnr6oTKCaF
         KMXNX2XSS1sj5AR5Dmc/Y/3NzBsPbltXQQ6sb48YFEeUHIpWx8qnOMLHtALk0UxNLpbr
         STIg==
X-Gm-Message-State: AC+VfDz2ytYDbhzK5Lz+9E6BvKGUSqlUdlrMbbqnGrxRVY4eGxd/UYPf
	biTN3LH+V+60zVhY19GAWTxLuA==
X-Google-Smtp-Source: ACHHUZ5UdACRM4IQ+9A7GHj+UIVY449LpLW4cKn7SLTKxOHi6oMQ6t5zDTtgkejS5Yu2tSpaPeYsQQ==
X-Received: by 2002:a17:906:fe07:b0:953:8249:1834 with SMTP id wy7-20020a170906fe0700b0095382491834mr7734490ejb.16.1683538591535;
        Mon, 08 May 2023 02:36:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id f12-20020a05640214cc00b005068fe6f3d8sm5921749edx.87.2023.05.08.02.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:36:30 -0700 (PDT)
Message-ID: <7fcdfc56-3dc6-b103-afd5-21984940c495@linaro.org>
Date: Mon, 8 May 2023 11:36:29 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND v9 5/5] MAINTAINERS: Add entries for Apple PWM
 driver
Content-Language: en-US
To: fnkl.kernel@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <asahi@lists.linux.dev>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230214-fpwm-v9-0-f3094107b16b@gmail.com>
 <20230214-fpwm-v9-5-f3094107b16b@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214-fpwm-v9-5-f3094107b16b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2023 16:19, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Acked-by: Sven Peter <sven@svenpeter.dev>

Sasha,

You got here report of warning:
https://lore.kernel.org/all/202304041117.YfOAPGQc-lkp@intel.com/

Don't ignore it, but send a new version which fixes it. Since Thierry
was not Cced on docs build failure, he applied entire patch. In such
case it is expected that you will do something about it, not just skip it.

I'll apply the fix from Lukas.

Best regards,
Krzysztof

