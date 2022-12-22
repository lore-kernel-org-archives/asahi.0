Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62EE291C
	for <asahi@lists.linux.dev>; Thu, 22 Dec 2022 11:43:02 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id cf42so2374509lfb.1
        for <asahi@lists.linux.dev>; Thu, 22 Dec 2022 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBssYKk9hpir98GZNc3X97bkakcTPDPCU4naoK/NGGo=;
        b=XR2eZCbx4dsgBUb6vwlxECw+klSMHSrF09709Wo7wjpVKkuCubKGWmwzrxVQ+Se/8H
         Vfu/0HrD3BqhP4cZere5W/wA33Lkt7qDSY/+IYZoIurqWZ0bMcsqL+XChiHBXj2MqGe3
         LJ3tlZvyoE2QfEgli6XACN/GDykZNIYy4zk2IU7NqyLvb7snekSe0BE2njGJtnu61rmD
         fLBI50uWm7dg5+EuIVQunAnGwGi3SJA12epLTz1y6Za9HxwKChoRlLZKadj2Zy9A6kS8
         gdiMeZUiPFBrqWzi5nmO0BZM1/L/be6tcvXh+vTc2jdz7p9GnIZvoSNJVKj8U/g59NNv
         TrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBssYKk9hpir98GZNc3X97bkakcTPDPCU4naoK/NGGo=;
        b=GBU4P+Vhnnuq9fvg303o19Grolzsdg8JduarqzSphGHzk4W/aQ5lFmeoG7JY/o/wqa
         NJgokwmSsAtJ6+6GJMsodOgZaQCa4eENjeNog6cuulsMBYHG/+fjh/upghnx0Bx7U0gv
         q/zwghIuk3DQLY0KYDApPAMZwDohMVwUwjtAQqIqGXrmv2cw8PhN4U2C8p75+1Xo0sAw
         YKx19VJ6jQ8k8N1g9++Dj7bgvbxX03GIXuLiIwH+4GUiNNq4g+be7GaO8n+C8Ba/zPPf
         Or7ddTJp1PeikdECxBzvK/cD37tPbHBqezJ2a0zUx2GysVpTiOD9sZcF8+vBC82YLjGU
         Mq2g==
X-Gm-Message-State: AFqh2kozeU7BD8nNOA+j+BknTcVrq3LLfsNQ/wmCeFzdDXjPBlxr5lul
	FZS69SJHRxJxJRNmb6A0652fhg==
X-Google-Smtp-Source: AMrXdXvLfKc+k8RmiuBHFNyAQ524e5bDOX3M+swEQ1cHK4veuXqknCBBo60j48VHboDSr5k1MJkAhg==
X-Received: by 2002:a05:6512:b9d:b0:4b9:e305:90eb with SMTP id b29-20020a0565120b9d00b004b9e30590ebmr2140888lfv.13.1671709380951;
        Thu, 22 Dec 2022 03:43:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z1-20020a0565120c0100b004b4b600c093sm45535lfu.92.2022.12.22.03.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 03:43:00 -0800 (PST)
Message-ID: <abeb6ee7-9771-ea0c-fdf8-71f50bd8ac5b@linaro.org>
Date: Thu, 22 Dec 2022 12:42:59 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 3/4] arm64: dts: apple: t8103: Add PWM controller
Content-Language: en-US
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221221210648.2735-1-fnkl.kernel@gmail.com>
 <20221221210648.2735-4-fnkl.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221210648.2735-4-fnkl.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/12/2022 22:06, Sasha Finkelstein wrote:
> Adds PWM controller and keyboard backlight bindings for M1 MacBooks
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103-j313.dts | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     |  9 +++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
> index ecb10d237a05..43f79570b458 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j293.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
> @@ -11,6 +11,7 @@
>  
>  #include "t8103.dtsi"
>  #include "t8103-jxxx.dtsi"
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
> @@ -43,3 +44,21 @@ &i2c2 {
>  &i2c4 {
>  	status = "okay";
>  };
> +
> +/ {
> +	led-controller {
> +		compatible = "pwm-leds";
> +		led-0 {
> +			pwms = <&fpwm1 0 40000>;
> +			label = "kbd_backlight";
> +			function = LED_FUNCTION_KBD_BACKLIGHT;
> +			color = <LED_COLOR_ID_WHITE>;
> +			max-brightness = <255>;
> +			default-state = "keep";
> +		};
> +	};
> +};
{ goes to the top, not in the middle of DTS. Don't add stuff at the end
of DTS.

Best regards,
Krzysztof

