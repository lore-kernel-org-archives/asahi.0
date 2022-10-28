Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2382F56
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 17:54:45 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id c23so3940229qtw.8
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 10:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPPPi5v6XuLB3813cqcFBuR57ngCmvkcFB0jTGQyiig=;
        b=MtUAzGVb7iDR7Oyu4rO0rQnr0CDw4RrVC6fi5JNA7E1JYz4QUhrfTwZ7LT81G5F78S
         4DqjtVFwDvlSWdH/IxpMEkYOVu4Ptw+o554zDvnnAVBDypTzLi8aamLaq0iNRAUBN+7s
         0dPZ6TydUDC/UZJoGx8hyF6yZKQSlm6kLdoPQ5ZBDV+kCRL5WtzZMas6BsZlnpPrxio+
         BGkvwnxY57bLnLV83ik68NmD8t1lwurBEhyFlSVktAjDU1jOo965kGYPAjGTvc8X5RO5
         xRw7K0QibSG1T15JTUfFhM6bDIZMG5GyGCBKm/CC4RSWnO/LrSh9tPjqkO7GBBS4GYK1
         vTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPPPi5v6XuLB3813cqcFBuR57ngCmvkcFB0jTGQyiig=;
        b=2VzEQOOlJqD8B3MkX7K3WfTWOVivif9CIvdbFLT1fBPcZK4wPx5xST8Aknl9THbi0f
         c5olubSbCyE3vddvq1cYWXM2kx+IiONEThrqIsCLLPpTUYIVexAAuUNJhINtqnEm54OU
         f9odCII3Aa0r6RuNf1zUiTQebTswHD5RP09SAiLRTQYJusch43+GpM/b0xJHdFZ4Fwnj
         FAdFZiM4Wi7m/So58pVJpBbNhE+JLxrPwpOMRv7KVK5XWa40e7OFOYU8BTIbYxURDNj2
         rgP1Sd91diXLRtawFptH0jbAHxbPS+SBKPMi8wTgbOGmE5/8/XdDM2MskcKDB9LWJKmn
         z63Q==
X-Gm-Message-State: ACrzQf2OzcVBq6TmPl8mKakrxLD96ZEfrhd/E4Cv+CPIzNtpreCop0vF
	PAAvdQNShw+nLaKZiffFbBagkg==
X-Google-Smtp-Source: AMsMyM4YYymK8nVKNzn3BsrohpPL4lv5XFK9f/hpOwucaO1bp0vfJ0Co8mIT/DF3/5QGSVcLmXdDIg==
X-Received: by 2002:a05:622a:44e:b0:39d:c1a:3282 with SMTP id o14-20020a05622a044e00b0039d0c1a3282mr601872qtx.75.1666979684180;
        Fri, 28 Oct 2022 10:54:44 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id d13-20020a05620a240d00b006f0fc145ae5sm3488976qkn.15.2022.10.28.10.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 10:54:43 -0700 (PDT)
Message-ID: <02523fe5-bf99-9891-d00c-347893d5dabe@linaro.org>
Date: Fri, 28 Oct 2022 13:54:37 -0400
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/4] pwm: Add Apple PWM controller
Content-Language: en-US
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, thierry.reding@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221028165215.43662-1-fnkl.kernel@gmail.com>
 <20221028165215.43662-3-fnkl.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028165215.43662-3-fnkl.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2022 12:52, Sasha Finkelstein wrote:
> Adds the Apple PWM controller driver.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/pwm/Kconfig     |  12 ++++
>  drivers/pwm/Makefile    |   1 +
>  drivers/pwm/pwm-apple.c | 124 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 drivers/pwm/pwm-apple.c
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 60d13a949bc5..ec6acb368073 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -51,6 +51,18 @@ config PWM_AB8500
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pwm-ab8500.
>  
> +config PWM_APPLE
> +	tristate "Apple SoC PWM support"
> +	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)

Why this code cannot be build on 32-bit?

> +	help
> +	  Generic PWM framework driver for PWM controller present on
> +	  Apple SoCs
> +

Best regards,
Krzysztof

