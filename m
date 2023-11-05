Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAE210B;
	Sun,  5 Nov 2023 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImpqfBdm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ccce410660so2150835ad.3;
        Sun, 05 Nov 2023 11:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699211109; x=1699815909; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=c5aJnbwY/RGv4IwQ+W4JxKXW6o+bXcs3kEPisirKZZU=;
        b=ImpqfBdmZPqiALvRPTbUtYg+61PHd3WEPCRj+vRtIjeJBdA7IjAJT3iVn+/ZycIuWp
         hwO0oYrMmXONwGOdXSFsrhKkQFA9Om6hki0fVzvynhvHHPYbg+Lhsvzxob2XUqC3Lf2W
         BLRCG+kY6EOdngw8LOMnsO1tWdmWGehBJ/dM/NRUjLW8ZKMkI/mUNuqrPn/tqqajW5nm
         NlNPf3Lr5DLHVFbIkqQo2pn/zcqmL2JZeK80t4+W8X001JdXmlgaDiu7PVK9YEn4Gf2k
         f0TxCFM8fnXnc7jtCmr60LaUzJnbxv+NfMo9nigV5cWWXAwwA4K7zKVYyZqFkApyZf8S
         /hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699211109; x=1699815909;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5aJnbwY/RGv4IwQ+W4JxKXW6o+bXcs3kEPisirKZZU=;
        b=ciUisSVqjGzSpsJ5ji69N66kORvku727Jf56QvBt7YhVSkJ8WOSPJQDVFIU8jsBZqM
         3sYxIVDjWywGh7DkXSPRKr6DC2mlWXWI9PJi1UrfDsdTaNxKXTjKjBIH98hqL7aScMc0
         k9XOTp71Kjrb9SO1f5VhS2DAsQjlGub7qE/Gzh6EgMIt4bUdtLqVugLJQBWGMtn3oX82
         38jw2hN4Ruv5H01sYYwfwKe7oAVIRZGQ5LCzT4PExifSkMqAcaBH3KpN7/mMjLO8A33n
         g6DYcrrRVahcGacVhEEn2+OE9hUW5dRHepZdS/Cc+8hOkcGBpt+CQ8CI2oIRX6dEAdYa
         3sKA==
X-Gm-Message-State: AOJu0YyyR56odyVh9w8ZnDHlrSm5nPTM109WPdsBhbnFMshM/4S8gr55
	C+UHH1N3lzmVIaVjI6/2nVk=
X-Google-Smtp-Source: AGHT+IFjMnoD4qzJp9xw6sci48+8ezy6wjYLj5Xul69GJ2rxOXcCqRM0n9M6XG3tAaH65LT22t1sJw==
X-Received: by 2002:a17:902:f64e:b0:1c9:e765:e14a with SMTP id m14-20020a170902f64e00b001c9e765e14amr28891113plg.1.1699211108997;
        Sun, 05 Nov 2023 11:05:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001c61bde04a7sm4457615plg.276.2023.11.05.11.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 11:05:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d2111a1f-ae15-4270-9946-7e732fbd3fc8@roeck-us.net>
Date: Sun, 5 Nov 2023 11:05:07 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: intel,keembay: reference
 common watchdog schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Justin Chen
 <justinpopo6@gmail.com>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 Baruch Siach <baruch@tkos.co.il>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jamie Iles <jamie@jamieiles.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
 <20231105184154.43700-2-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231105184154.43700-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/23 10:41, Krzysztof Kozlowski wrote:
> Reference common watchdog.yaml schema to allow "timeout-sec" property
> and enforce proper device node name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../devicetree/bindings/watchdog/intel,keembay-wdt.yaml      | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> index 1437ff8a122f..8231dde2bfa6 100644
> --- a/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> @@ -9,6 +9,9 @@ title: Intel Keem Bay SoC non-secure Watchdog Timer
>   maintainers:
>     - Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       enum:
> @@ -37,7 +40,7 @@ required:
>     - interrupt-names
>     - clocks
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |

