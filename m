Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B67107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:07:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so11255505wmb.2
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/x/rsjIfX8cVukRoZpVMj8ulC9usfl++XExw7IzCvjc=;
        b=z5Vcg/uSLCCZaJnJRo/G5NZMMB9MEiYsaWxXG5fr4lJut+jv/Do/KA16eAC5Jz8nwA
         KBMeNVcgAzL6UC/EyTCOgn68JLJF+Lhh56qEJCT8DhVSSShSOLSjiZVo6vQdXsgqumX5
         1L2vNXJbljI1KS3ci7c9FZMKI1Ja+0+bfzAUpoPaIdYg7S2hY8QhO6hWbq3bFY6ztEkM
         Vjg3aXW5Mno8XyOqs1grcrRRrNO46nikPBkPTPFkZ2BiRHVeV4r/cHZjnq0zUry8I4js
         ibcZQRx3nTWKve7Qr23PCeItZzkQkH32b5RzTpD2o02doYNkRyMGwnhJsk7WoZd+mLxa
         n2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x/rsjIfX8cVukRoZpVMj8ulC9usfl++XExw7IzCvjc=;
        b=oFFgSuaj33G+bcf+fvky2N1i1R23Q2YMd64X2ksHulFp9M4SoEAUUDomvwJU2mOU1d
         PGu++ltU5NmkatcYV2kuuxj+RWhOV3xiOGNuZNGrlFSldAdY/qPUygNxeX+XF9yjY18c
         rbtbtoMjrx0O3TOjBmu0hNAu+WPTwpAlYs1ZikeQDglYYvzfjYcX5wKyKVbxg1vTFlLT
         5kGHXLsrLQsG+nkM6DCSkQkyknuc9mS7A5sBIQxCI5J6HFUn/40nwlC62sudpO7RMlgD
         YPvyaW+PI7WgBHd3vhWzUd08evYQ1B5w+06ElVjZVANnzLsOQyH9wWgQGfXPyIINbMdT
         5GDg==
X-Gm-Message-State: AO0yUKU7J0cOZp96PNcpJl0V+5zDf3qI4ZEZF/afmmkcgpg8hhTV0x40
	ZKI3ueP82MyRGStuOhzr7uSlZg==
X-Google-Smtp-Source: AK7set9qqr12nSUuP1wmFNr7OQjf99rGM4R11LsGYRErJneSzpeH7Fy04rihSaD/pkp7ikEazUr8gg==
X-Received: by 2002:a05:600c:1817:b0:3e0:c0d:75d8 with SMTP id n23-20020a05600c181700b003e00c0d75d8mr2329271wmp.23.1676372822579;
        Tue, 14 Feb 2023 03:07:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003e11f280b8bsm14906852wmo.44.2023.02.14.03.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:07:02 -0800 (PST)
Message-ID: <57ff2267-93ac-2c31-9c6c-a752a8807eb1@linaro.org>
Date: Tue, 14 Feb 2023 12:06:59 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 08/16] dt-bindings: nvme: apple: Add
 apple,t8112-nvme-ans2 compatible string
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-8-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-8-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> "apple,t8112-nvme-ans2" as found on Apple M2 SoCs is compatible with the
> existing driver. Add its SoC specific compatible string to allow special
> handling if it'll be necessary.
> t8112 uses only 2 power-domains as no 4 and 8 TB configurations are
> offered.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

