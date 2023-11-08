Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548414F96;
	Wed,  8 Nov 2023 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ce31c4a653so4337084a34.3;
        Wed, 08 Nov 2023 08:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699461663; x=1700066463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsTKu+sClNoAUTcjNBMPlmIKhwCgTQjzIODuh++4wnE=;
        b=C1d5OggfOZiSPk0pjoIVV8W2V9ITyinqx6HDNSrST3GJP4YaM/3zRDRtG8J6iVf0sN
         K5K3hMA2WOv2ScFfDQuow7ITkyeVYbXQ7EWAYVpSllu39sfc8dgROtG+snN0SxiYur9P
         HFJJrnexUUlJ+fDi+6dYzHZDzuXwPrsuTTeoI2q9e9SbqQUmIev1BWiAjcq3zVuqCjL/
         eJjlxtGqN2SeKvLSsRODCnj48RkcnYRD0eqT3IQHYy/8OnZ/j5g+2yUSNjxt30xSCNNC
         4ZoYcaYkC2/cyS4l1lGOkQ8ywmRnUIDqF7/RK6x+AvskaN4Hr2qVjMot/1M2nbLIQOl+
         u9Fw==
X-Gm-Message-State: AOJu0YwSyj6pBF+eFQbaA2vXisL40oeMYW+hcXE8uIw/EiaxouS2ykKh
	CjROsf8iMfNMYmsZIg2o1A==
X-Google-Smtp-Source: AGHT+IFFx+edjIiqB4NK4vBfw8uz7RXBCMyNr1QjwNEmq3uoI7shn3K1VLDSF/eIjsJcWTRm2NjLdQ==
X-Received: by 2002:a05:6870:1290:b0:1f0:36b6:ef26 with SMTP id 16-20020a056870129000b001f036b6ef26mr2036560oal.46.1699461662736;
        Wed, 08 Nov 2023 08:41:02 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u21-20020a056870441500b001ea689d8969sm360210oah.48.2023.11.08.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:41:02 -0800 (PST)
Received: (nullmailer pid 2363957 invoked by uid 1000);
	Wed, 08 Nov 2023 16:41:00 -0000
Date: Wed, 8 Nov 2023 10:41:00 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, Chen-Yu Tsai <wens@csie.org>, 
	Marc Zyngier <maz@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, 
	Jamie Iles <jamie@jamieiles.com>, asahi@lists.linux.dev, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Sven Peter <sven@svenpeter.dev>, Justin Chen <justinpopo6@gmail.com>, 
	Evan Benn <evanbenn@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Baruch Siach <baruch@tkos.co.il>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: re-order entries to match
 coding convention
Message-ID: <169946166004.2363897.10078496065927254544.robh@kernel.org>
References: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>


On Sun, 05 Nov 2023 19:41:53 +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings coding convention, as used in most of the files
> and expressed in Documentation/devicetree/bindings/example-schema.yaml,
> expects:
> 1. "allOf:" block just before "properties:" (or after "required:" for
>    more complex cases),
> 2. additionalProperties/unevaluatedProperties at the end of the file,
>    just before the examples section.
> 
> Re-order few schemas to match the convention to avoid repeating review
> comments for new patches using existing code as template.  No functional
> changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml     |  6 +++---
>  .../bindings/watchdog/alphascale,asm9260-wdt.yaml      |  6 +++---
>  .../devicetree/bindings/watchdog/apple,wdt.yaml        |  6 +++---
>  .../devicetree/bindings/watchdog/arm-smc-wdt.yaml      |  6 +++---
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml | 10 +++++-----
>  .../devicetree/bindings/watchdog/cnxt,cx92755-wdt.yaml |  6 +++---
>  .../devicetree/bindings/watchdog/maxim,max63xx.yaml    |  8 ++++----
>  .../devicetree/bindings/watchdog/snps,dw-wdt.yaml      | 10 +++++-----
>  8 files changed, 29 insertions(+), 29 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

