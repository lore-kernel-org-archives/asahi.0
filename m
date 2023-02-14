Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B77107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:07:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z13so10699854wmp.2
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82toVAhxT6C/f6FDR+FJ+bR/ZLTWxq3zIs8/EsV1UnU=;
        b=K2NfUwd8vbSgKKPWQqgzyTRM/7v1Y321KoLTZEwzlAT4fmmmTKBxuehUlkvqvb1Yrt
         qakmsTlkyIsoI6tez2qgW97WKZsbtFiGLR6a2nTF3x3fxdKKKkrjNz6Pj7MwKHJcT9uE
         iH/vuoQruLuAK+tf7yvYLQN+7KFfqD6gDag2aMGEGNZdmVxjJT46PR8hCHPDBD1/g/Si
         AFhsBrsXkVSajUrabPPT+xsyHfCGEjuL+K/pOgBJfNrh1tshFCp4XpRjqe9znCDnF0kW
         PywjGiTUswtjY9W/FTk23Xs5aLTPG6qggtscXlqchNvKjN2F9Tsm09yUQdM88T4kAhsr
         pAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82toVAhxT6C/f6FDR+FJ+bR/ZLTWxq3zIs8/EsV1UnU=;
        b=fA7zbWbAA9f2mSdB2pf/QwwnOkgHgXxv9x6MnTzcIafbivuZ7ncmbCjpGiMH7uFPbU
         u2iS+4tXu9qPNa/deiLevilK0QXomNcht0pc2Cr9RjWpVIB1PAhv3zE0sFhtHvbAvxyP
         QfTDxnpf12Atm/UVnkJs4vLgpQx2kAXUa3fx0DydLtBKdLWwYWbcSh4ZkiZTs3TzEoon
         z47Q6YTDDTK0kp+98L9DRPaJ0M+T2GxIZDyMBOayXqiwmSNVWU/11vDr5oUvJfNDvmht
         sxYRL4cYHg4EdmQJTYk1SXmwey4cVXuvujbbBcrhaYg4m8aBuwd/bj+m+ivbvlN9fS9r
         9WgA==
X-Gm-Message-State: AO0yUKUTRSaZRGKmDh85FImC1quGlx5T8wFx8meDhLcmCM2NQrWMIkXe
	fIPP4csT7x+IotvsaceQWIzVIw==
X-Google-Smtp-Source: AK7set+3ZSit6NXnQ+GPXLgIWshYe5YK51/9Z7MUcQUkIr0yT0puTCcVgig2M9L3L62WhZcAQ4cysw==
X-Received: by 2002:a1c:f30b:0:b0:3df:f9e6:2c5c with SMTP id q11-20020a1cf30b000000b003dff9e62c5cmr1622531wmq.38.1676372840771;
        Tue, 14 Feb 2023 03:07:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003df7b40f99fsm19128073wmq.11.2023.02.14.03.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:07:20 -0800 (PST)
Message-ID: <39d7dcad-5c4f-7743-e957-37e55a41e1af@linaro.org>
Date: Tue, 14 Feb 2023 12:07:18 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 10/16] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t8112-pinctrl compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-10-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-10-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> This new SoC uses the same pinctrl hardware, so just add a new per-SoC
> compatible.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

