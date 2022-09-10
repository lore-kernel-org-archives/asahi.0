Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A60EA2
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 09:57:37 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id r12so3277048ljg.10
        for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=di6y3lgL6/Xwh2roDgO2ozbIM7NNb7UpCHSHi5LvIPw=;
        b=v1ZsmwYhAOLWCYJGiD4erYR6547DZJ093JWddRfMKa+6UG/8SzlI5P0GLbCMAhpgrJ
         eSXXKaVTEgZ384CqQsmzLJR4iKzMTo+ujoKwt2fAt1kGToyTWJblorHFZd+L45r9Cqux
         lWy97doHSajiQVb5Rvx7qH+YlmZbyWpw9IxV9MUXQ2XqU84sGMF4dcpgN/dMsTHsvj1G
         nnhqsujVHDbHU4jbtLukt31MxGyRvS9BVPBaTj0bK81RfJgf42ZjonE6nwGkM011muPa
         E6tG5Rziv9mNNmoDjCO0fV73BKpJhoUH0gPnS7hAnEL/Of9J3dtKXsNnFV2MkYI66L+V
         mC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=di6y3lgL6/Xwh2roDgO2ozbIM7NNb7UpCHSHi5LvIPw=;
        b=S93XOyoaCfdPhA+j++ld9PQLxDX+wwOicGuLikNHYP62IE8FVQwfsqQzvXyNrGZclP
         6C3OYVOdo9url9liyDQAaUnDRKl4ZYhSULNifwd0dVZa1spuzT4sS/VV0W1AObc685by
         IbNTqCy86CWORRdUk7CqPSRawz8pjMh/7ou5Jj+k3LAFfAUuzQpeUMjUKi/PpUl2FV8I
         BweTdyx1eUHzfkgecgIfclYVbWzMPSKrLCflnZjpCIPXu6lPEse0nz3o+epHpKZt0RkL
         TayiZ6wYvPIa6HbAlyZSGVqrYUsGK9PZmSBo9eH5xtvk7Nz8ppBrP06TiRKrH8LGqe3z
         vDUA==
X-Gm-Message-State: ACgBeo3DUs/iVvxw2CAj/yFNWoTlfmFeAz5kfP6vgEcWuaTQvbPFEwYh
	zFClG7qEgvThrY9bV9yS4rfuMQ==
X-Google-Smtp-Source: AA6agR7DRUR5XLupdHg1UbHTPQ5Xex+5uNKR5iPQ66OKB5h91llG7taDqAAzraAd9ke8GLL9hjpb9A==
X-Received: by 2002:a2e:834b:0:b0:261:a7a4:d2d2 with SMTP id l11-20020a2e834b000000b00261a7a4d2d2mr4838421ljh.175.1662803855741;
        Sat, 10 Sep 2022 02:57:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k28-20020a05651c10bc00b0025e00e0116esm283955ljn.128.2022.09.10.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 02:57:35 -0700 (PDT)
Message-ID: <25b42684-1bee-b7f6-a89d-ed0b0ea7428b@linaro.org>
Date: Sat, 10 Sep 2022 11:57:34 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 04/10] dt-bindings: arm: apple: Add t6001/t6002 Mac
 Studio compatibles
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-5-j@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135103.98179-5-j@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2022 15:50, Janne Grunau wrote:
> This adds the following apple,t6001 platform:
> 
> - apple,j375c - Mac Studio (M1 Max, 2022)
> 
> And the initial apple,t6002 platform:
> 
> - apple,j375d - Mac Studio (M1 Ultra, 2022)
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> 
>  Documentation/devicetree/bindings/arm/apple.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> index 8d93e8a6cc18..b34e56b9dc59 100644
> --- a/Documentation/devicetree/bindings/arm/apple.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> @@ -19,12 +19,14 @@ description: |
>    - MacBook Air (M1, 2020)
>    - iMac (24-inch, M1, 2021)
>  
> -  And devices based on the "M1 Pro" and "M1 Max" SoCs:
> +  And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
>  
>    - MacBook Pro (14-inch, M1 Pro, 2021)
>    - MacBook Pro (14-inch, M1 Max, 2021)
>    - MacBook Pro (16-inch, M1 Pro, 2021)
>    - MacBook Pro (16-inch, M1 Max, 2021)
> +  - Mac Studio (M1 Max, 2022)
> +  - Mac Studio (M1 Ultra, 2022)
>  
>    The compatible property should follow this format:
>  
> @@ -79,8 +81,15 @@ properties:
>            - enum:
>                - apple,j314c # MacBook Pro (14-inch, M1 Max, 2021)
>                - apple,j316c # MacBook Pro (16-inch, M1 Max, 2021)
> +              - apple,j375c # Mac Studio (M1 Max, 2022)
>            - const: apple,t6001
>            - const: apple,arm-platform

Blank line.

> +      - description: Apple M1 Ultra SoC based platforms

With this:


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
