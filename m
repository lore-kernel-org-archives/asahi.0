Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2F256F
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 11:13:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso8710539wms.4
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zxi66NFp5CC1l7OpD7ouzgSByxm59oZ9221dT1nw3vo=;
        b=kVw2MU3W6ROAjXQRHl0MNnZ4lRpbjkZe/E92qaX3GO8JTshSWmDufPtsXfXf+YP9hE
         mP9+UAsj2yuZHFoBvq1Gw1YsZdF64jlyCXxGwUkGLHUGvfRwA5snq04Jo35iL6d0L0RB
         L8V74WRcfHVhwfQa0onB6tlOcDxf0vtshlT3PERNgFa/4nmgBMReKzFnt1WCyNXGuNNN
         6Ht9Hm7ZV/J+YbE7PKNWNckbP6w3LCWU7aa9d3BENrRoyqIiXFZd/cYNK/hjRwoziXyD
         yPV3DCTEDvDlXpS4KILb/13o1kJwCnprbwOnQPvIh6ZKzUEiy1XbC+fK5OA8Ob60o+2u
         xU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxi66NFp5CC1l7OpD7ouzgSByxm59oZ9221dT1nw3vo=;
        b=ecNxSMjKr2lg5GNFaThCmVwLTJXgKfuiBK1Ys5JmD5j0SOY7g43XnZmMXkrmC7fbto
         kklb/HSKxNOH8YS9aaT6UqhqIr0NXN9rqHMBPaaXT8DB4FES7bdWnveXolXGkxSi3vRV
         fpOsXDgtvo01E2ws4WznhJ5cW2Y5aELPyvdRCL/i7iEcVxw1GkVIcqdo9PiRaUh8NN+g
         c/XXC2n3FZBaVBEy0YCZsGjx6O+mR07FPlPZoWQdoyiq+MYD1TkCGiuyNLsjJdPkB2ly
         xd1QQteeiXJrf3foFeaI7u1INdL1zbS234j7SkaWvSqzUaVro4xBXjckRHpnwTkaAqUw
         DfAg==
X-Gm-Message-State: AO0yUKVWNU0JDU4nP1ggUnVQMdFlsVUO8lp2zEdCalzs76BqePtqB9b3
	IUhCCrwxHOpQarpCaZBauxyg3g==
X-Google-Smtp-Source: AK7set8/EdJsZBGPMFMve7u9aeKH1SjT4x6g4xC1zu0RoHPUUa+B1P+u5IhFA6Nf1duG9va8GSYOAQ==
X-Received: by 2002:a05:600c:1713:b0:3dc:5b88:e6dd with SMTP id c19-20020a05600c171300b003dc5b88e6ddmr20915760wmn.10.1676286794334;
        Mon, 13 Feb 2023 03:13:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h4-20020a1ccc04000000b003dc4a47605fsm17052564wmb.8.2023.02.13.03.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:13:14 -0800 (PST)
Message-ID: <198daecc-9bee-a418-ac00-1ba281dc256a@linaro.org>
Date: Mon, 13 Feb 2023 12:13:11 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/17] dt-bindings: arm-pmu: Add PMU compatible strings
 for Apple M2 cores
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-6-cb5442d1c229@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-6-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2023 16:41, Janne Grunau wrote:
> The PMUs on the avalanche and blizzard CPU two micro-architectures are
> mostly compatible with M1 ones. They miss support for a single counter
> according to Apple's PMU counter list.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

