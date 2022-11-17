Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A6F8BE2
	for <asahi@lists.linux.dev>; Thu, 17 Nov 2022 16:59:52 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id b9so3505868ljr.5
        for <asahi@lists.linux.dev>; Thu, 17 Nov 2022 08:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xiNwxzl6a3FLqk1cHzSKAf/wTMMZvGRxsQRMjboQAc=;
        b=ec2Tm8NXWRm0Ewgn0LOGwYlfW4egn/g1bkZ3f6PgKgLau9F9c2Y/GHZgm7Az+7+reI
         xwMcbdRKEimWu7ElM9deIkBLb+1HSw72RNZQ2i8ScIO1kR5/r3tzyyFYPxmrx+2qbUX7
         4Bs7FslKnUqLbuyg5u+ymOlseKdQf8TFh5ELwME3XvadiBRC7TSQUx8GC0u18yJ+FeaO
         TkP4oB0wYwm6vFzyEwKrAfieDKb+vF0jCzGWM3xgxlMvM9wA6/7S7ZYTZG8oyPPmIETt
         sszKtUTXZUFJxD5N0oFWspHCrsZGfceKUZH7gdX7bwbkHntAVpADlGZzr5t32EVzRHf/
         XgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xiNwxzl6a3FLqk1cHzSKAf/wTMMZvGRxsQRMjboQAc=;
        b=NjlgQtwaqhG/X/cLPPCaZlc/StjhTAibNxxfO/EqBVzJqvd7iR3YTsGn0Jtn3NzpMx
         qEOKIKnI+w9Mc/reUh+jpVVNflQ3xFiTNG3YCFLYFriAEFgMYKNjx+bkf24NWM8pOcL7
         Ob7N/IHDvUnPi9IXBbaQhAEDaNT9qPYFiS4x9FS/Sm3Cf9GFgsB2lKNkKkCeXHlKG4Fw
         S6ig05d8iJ4FAx3RNCdgdwPUbs3hj2dYGkl1GV1JjTOqP14XHGp7r2Rpycw9BK8A90eG
         4QcFtTcsm1f+CGMSux45HxmtQHIvNyyX6+2IKluELREsbyFyPBCIaeirjLALZDcyL/4z
         tt8w==
X-Gm-Message-State: ANoB5pno5YcD16TEfLGl76pDqBZ33Xk0t4VipizNQOCmKit/Q+aZoYYa
	FQSojyZ8HQguAV/0tW+GPO8trQ==
X-Google-Smtp-Source: AA0mqf52974ex818Qx2oUR88GJmDRSmA/dU99RAukv1QP6yVE7Ddv9PfGpINQOnSGkwUkXrKQEZU1g==
X-Received: by 2002:a2e:8e2e:0:b0:276:e452:1213 with SMTP id r14-20020a2e8e2e000000b00276e4521213mr1259959ljk.445.1668704390312;
        Thu, 17 Nov 2022 08:59:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f21-20020a2ea0d5000000b002770a7e320esm288684ljm.81.2022.11.17.08.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 08:59:49 -0800 (PST)
Message-ID: <9eae8400-b800-3476-2d42-34a89b0b7b50@linaro.org>
Date: Thu, 17 Nov 2022 17:59:48 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/4] dt-bindings: pwm: Add Apple PWM controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221111173348.6537-1-fnkl.kernel@gmail.com>
 <20221111173348.6537-2-fnkl.kernel@gmail.com>
 <20221116202044.GA817431-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116202044.GA817431-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2022 21:20, Rob Herring wrote:
> On Fri, Nov 11, 2022 at 08:33:45PM +0300, Sasha Finkelstein wrote:
>> Apple SoCs such as the M1 contain a PWM controller used
>> among other things to control the keyboard backlight.
>>
>> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
>> Reviewed-by: Krzyszstof Kozlowski <krzyszstof.kozlowski@linaro.org>
> 
> I assume you got a bounce on this as you got Krzysztof's name wrong 
> (krzysztof.kozlowski@linaro.org). You should have either resent this or 
> replied pointing out the typo.

Nice...

Please do not type my name. It's pretty impossible to get it right, so
instead copy-paste the tag entirely without changes and addons.

This actually applies to all other tags as well, even with easy-to-type
names.

Please resend.

Best regards,
Krzysztof

