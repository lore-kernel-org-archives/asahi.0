Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4C6AA9
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 16:25:07 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id s15so13304684ljp.5
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z2p2qpeENY/bfLp1CRaMnL2NjhMX1TdPvMFYupAAiu4=;
        b=aRiHGqAVishB//yXk4AeOM7oaXDHuVe5bJ3jfBaYaM2rAZ9httqN5u9zGgSHZLrW44
         TXYosKhUZWsqT70C1o8PKlJB+LEkcV7w2BAgr902JUe6QROqauReVvGwyG1kcd0gNpBa
         n2VKUGikEcwBLMVfzOEPQVt+0jEiEjtsBWlkvygz2gxxRfrbWUYan3pt3wkj5s4JouG+
         lg92jn0SadFM05Qnvb7gygBHFpEEBltx4dpUnQoQoZUy+0uKRwdst0oox3+QI9voI50F
         kJywC2TChygY/oOr2Hdj5XKiE+YMW4aH6MSpecFLZ3dia3IDKlcmAavWH2HORoTIsgWp
         7dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z2p2qpeENY/bfLp1CRaMnL2NjhMX1TdPvMFYupAAiu4=;
        b=dALycNKxVEcZXzRBWqkZZ6050qniUfneWGwrQ7nLF9Qo1iSQn5vmTfrYIJG/uv6GM1
         U02l4PNQLJm8xP4yhkkiZh2/I/5dwGhzl5/VG3iuSVoUro5bM9SJ4fQ/WGT7E5y1WxB3
         kM6VOaoeF5bG8eDMlzAej9ghbBO/zEzWbf27AKS3CQHcWc0T3xEyUXS6rS5ykIf7AKpj
         l374UB+Osti+MDC6enKrXDDT2mQXjGjTZo7SSZg0/zP0f1T7/kWsJQpKHm1S9WX/u3jc
         xdbjeu9M/xQJNP/aFy1Ovml5riBMqfx8dSDyIZq/glTX5K+P0OY55Qu97jup1hsIf/6j
         B2kQ==
X-Gm-Message-State: ACgBeo1EPFyjatDsrRfxS3a2y3Sl5Nqm3HtujHNzUgPqHW17Tq2XbmYf
	pO7SSydm85ZY4NZ5qo8KU8AmMA==
X-Google-Smtp-Source: AA6agR6weCHVEDSehESWY6ZEw5fnjk/M+7jfqaVj7HH4Qunmhzek/56LXlLukCpUJlJl6fQWSyn32g==
X-Received: by 2002:a05:651c:a12:b0:268:c715:910f with SMTP id k18-20020a05651c0a1200b00268c715910fmr857174ljq.484.1662049505589;
        Thu, 01 Sep 2022 09:25:05 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u7-20020a05651220c700b00494978b0caesm460174lfr.276.2022.09.01.09.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:25:04 -0700 (PDT)
Message-ID: <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
Date: Thu, 1 Sep 2022 19:25:03 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2022 18:56, Russell King (Oracle) wrote:
> 
> 8<===
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
>  Controller
> 
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Yes, looks good.

I won't add Reviewed-by tag, because I think it would confuse Patchwork,
so please send a v2 at some point.

Best regards,
Krzysztof
