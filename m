Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A60107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:05:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id m14so15183760wrg.13
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbZW/ryCmOb+4HZu5OdOAq3/hEZ1xxHDCTWnfkXrY3k=;
        b=by/TofraPp9IUt7aGEfFItarjKGRVgbugjEDMqgg9BTh9gWH5KUIHbjUoZQfCJkKg4
         UvnEnWQHQN4KAaRnkoj1FVN1B+CZI96QiRo6VVEC/vGlwwFcEDoWMm3/JGNAFYXQg7ut
         rMByTlD9Z/0rEXoy+a1Gms5xHQwjhPNMNEDXZ1VhmMPHwEgYZYWrG9DLC0vBPuUD37mt
         m6tz4ES6cWj8HcuatEB3imvwrRGHikaf/B32o6OrHtT4d0yWllceMJh7ZgT/IIh+53uP
         ZHx9W4WNazjJP6zVHmgskgglfbhQYw4k7ZA1F6j6za7cjiYCFHZN7QapCia1ZCFWDj0h
         hH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbZW/ryCmOb+4HZu5OdOAq3/hEZ1xxHDCTWnfkXrY3k=;
        b=Z/r8cNlZD/LiFobpgqHpE2i1s6ywtVQm9+Y8dssLSYJ/3drOX8agdvOiawToQ2ZCfx
         ShKZTUTlOeGlt/Mccbla/DDiCKKJWYiPTd1aB7Aa8L6NEv30/MbUpUWe3vATpa6bmSay
         PgXD25SvzV1Kb9qwLBE/wOUEaAXIZxJzo/MqWHdkNmhAq2Qx/kQ644ENSgkn7dAIrrUN
         XhVC/0N3TZuPW7/QcJ+0b30mOQBvY9Axq6NzFprIce/GDBzQD6dfOMgzTOliJQlY4hFJ
         XScuAew0LecA2owFFtVBlH3oL7uVlSytzU0lLB9pxq+0oFn5vijSqa2bAF/w489L30XZ
         vCRA==
X-Gm-Message-State: AO0yUKWmItaeTYMqRGC6KPk4WKUPfpsStiEHnvem8fN26bgE8UD5Bfsd
	1LrZOwNcMk3hm3j3Fp3cqXAwiw==
X-Google-Smtp-Source: AK7set9GFVvfJyWfFfWIB0CylPjOqIzsEfRgnkP4DRKDeU59YuwV843J9dnTP1qklWxjDrhPRu0eVQ==
X-Received: by 2002:a5d:678a:0:b0:2c5:5a6a:72af with SMTP id v10-20020a5d678a000000b002c55a6a72afmr1968087wru.4.1676372721803;
        Tue, 14 Feb 2023 03:05:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d67c4000000b002c56287bd2csm1721951wrw.114.2023.02.14.03.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:05:21 -0800 (PST)
Message-ID: <2f6b516f-4ab6-6abe-64dc-4ffa6c258c73@linaro.org>
Date: Tue, 14 Feb 2023 12:05:19 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/16] dt-bindings: watchdog: apple,wdt: Add t8112-wdt
 compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-3-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-3-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> The block on the Apple M2 SoC is compatible with the existing driver so
> add its per-SoC compatible.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

