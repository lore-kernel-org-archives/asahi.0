Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571C2F59
	for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 18:39:19 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-12b542cb1d3so43578155fac.13
        for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 11:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LloOAAh3fMnP4loPWLwVdN2fBYfkgLtJ0iyYP475p/A=;
        b=HxDj9ahtcHYBwCzoRksg+6x3NQM0sTA3iOGVc0tDhHSv4KZt3qKDU4W5YGC/M6gFo7
         hnuFK+Uk0xe2uijfnixL1d+orGApN32g9wsVuWXWmz3ttmgnIj2fhyIcG9bT6KJw4LNz
         /e+TXjpVyU4GE6pWD1h7uZGoLJD3SCBaurWZNZhT7KadnzGcAlpWdrcIxPJT7uUawX2M
         9HtG38UyFxKQTWZzj2kdVcPRx5SIXcon8hO8q+AVOaLkjm2enknyyhdoPb7FKhgAuz2T
         Jusx/tS4/RBCtSk/9ozPBMEiufxa2M1ZJjoyFe2pDwlMRH2SvYX+KjKy8wqumSKEnZiQ
         YtSA==
X-Gm-Message-State: ACgBeo27MRiXYUJCuX8875i1UO/QXNDpo7IPW3ktynUGKq4bfJV8gVE1
	n3XEb+AtjeusizPNs8CwTg==
X-Google-Smtp-Source: AA6agR4rJd3UZwBNHhnMn8U25gn7La8l8lm2O3ldIEUl+kA3gcHdpA10nwvFJdyB9SsWmen12iN1vg==
X-Received: by 2002:a05:6870:2191:b0:126:729a:b1d0 with SMTP id l17-20020a056870219100b00126729ab1d0mr8892314oae.131.1663353558579;
        Fri, 16 Sep 2022 11:39:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r11-20020a056871088b00b0012752d3212fsm3218681oaq.53.2022.09.16.11.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:39:18 -0700 (PDT)
Received: (nullmailer pid 1044162 invoked by uid 1000);
	Fri, 16 Sep 2022 18:39:17 -0000
Date: Fri, 16 Sep 2022 13:39:17 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: devicetree@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hector Martin <marcan@marcan.st>, linux-arm-kernel@lists.infradead.org, Mark Kettenis <kettenis@openbsd.org>, Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v1 03/10] dt-bindings: arm: apple: Add t6001/t6002 Mac
 Studio compatibles
Message-ID: <20220916183917.GA1044129-robh@kernel.org>
References: <20220916142550.269905-1-j@jannau.net>
 <20220916142550.269905-4-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916142550.269905-4-j@jannau.net>

On Fri, 16 Sep 2022 16:25:43 +0200, Janne Grunau wrote:
> This adds the following apple,t6001 platform:
> 
> - apple,j375c - Mac Studio (M1 Max, 2022)
> 
> And the initial apple,t6002 platform:
> 
> - apple,j375d - Mac Studio (M1 Ultra, 2022)
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v1:
>  - added blank lines between SoC entires
>  - added Krzysztof's ack
> 
>  Documentation/devicetree/bindings/arm/apple.yaml | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
