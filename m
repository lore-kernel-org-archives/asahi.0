Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1094107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:07:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id co8so11463889wrb.1
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btXThSxDFxZK9yFheQHZKpa+pCpJcFcWX1GnJ4GQw+k=;
        b=JKyWYWzBJL9pQeyyRqgPthcu2rIWKxUZ9ZXnDLc2B/pB+jL620ziki+w5ko01loJ8f
         q2eyEVTfFY0AjXAJSBX6d7y+p6D4Zy6E72Pg9WzJMlSgiWfshFlwo3skNCp3XtsDSRks
         Zth0TRKglfsuo6R0sBpIVu1KeWwZFQk0avAkggs1Blx3vs1VD9qLutghzarZDiohe69R
         dJavde3UqqsVkM6jI4f/Gk+UTCXAerU8kvfpmhnxhjKBQHbJB391X4NlUZjlTcW+m1JY
         VIpCb0kHgIrUx18lVsUN+31+F3zHndbSQtgtw59LBOQnUaCi4jBQB27hJ0FlKA1O1l91
         FGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btXThSxDFxZK9yFheQHZKpa+pCpJcFcWX1GnJ4GQw+k=;
        b=3FcqljX7ANsnM/WahtAdh7XOQLzyUcEJt1qBVubEpznuaHagI2XqpE2ICbmzCL3gKP
         ndztPnQL6016nEJuqbINh90YGxLfaKjitbGY+whx2uDwAwCoRRyuWcCzA7GunXMqEIax
         i0Rx9afBLJAFzi/i5x3Xr/sW/w2hQXrBKZfQp2dgP3zxJCpAWzlJMSeVTT6cdLYmlaIW
         oZrHLVnEth53w2AVwZ42K9cO1wRRJCkYX9UI8u7YCa3PVLsK0zN/9XbmLas6UAiGnOhI
         1yvQEbE/OFPTTc4wL/vuamdEFBG7AGJKyc3+k5JPWrwRaCfyuxkXNcL9l8qGmTDTPAh2
         KQIQ==
X-Gm-Message-State: AO0yUKX2Lt5XHiRcVLds06OzMXzUL6d2M3+gPZMUcxZ+ut2M68jlAflG
	rnS1XiAlWxYZ6cQ/Rv6cFtJbSA==
X-Google-Smtp-Source: AK7set9Flrtt+XFps8pHOQt7IAszrGHKBKA/eyzXv+xEkmn51U8fwjreLJtis/4+r9SCriQGjYHn6w==
X-Received: by 2002:a5d:5386:0:b0:2c5:5eab:8a8d with SMTP id d6-20020a5d5386000000b002c55eab8a8dmr1735421wrv.8.1676372865366;
        Tue, 14 Feb 2023 03:07:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g4-20020a5d6984000000b002c552c6c8c2sm7212868wru.87.2023.02.14.03.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:07:44 -0800 (PST)
Message-ID: <44be1b40-400a-0e4f-fd68-0acd43b50618@linaro.org>
Date: Tue, 14 Feb 2023 12:07:42 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 12/16] dt-bindings: clock: apple,nco: Add t8112-nco
 compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-12-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-12-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2023 12:03, Janne Grunau wrote:
> The block found on Apple's M2 SoC is compatible with the existing driver
> so add its per-SoC compatible.
> 
> Acked-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: Janne Grunau <j@jannau.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

