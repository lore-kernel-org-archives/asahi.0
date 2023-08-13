Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71426FA6;
	Sun, 13 Aug 2023 15:22:36 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bf1f632b8so501009766b.1;
        Sun, 13 Aug 2023 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691940155; x=1692544955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U72ij9H7xly/POAmuR9nZYqDM563QnNZZvNrcGFMct4=;
        b=Q3uvwX+W38PXuccnalF83pEuAl0sXt0s0GtTBY/WJuv6AG0oG3EQBjR4HStycfv6HC
         4LrvSgwnC5C+IrdaZS2HT8jx+7+oxrTLX5x/uvG1w9mrOL8OsddMgHxXyqRTzgIp6Wx1
         j8U5CXH2HSTnXUL9kkWRElcSSBRYeRxeJgydXojH8QBRvfj823ForbSoWBHDiHT5NQO9
         LFad+1AEVusqHj8+Zg5HgdAh2gVcGuImQoOXrixHF0DoSLxTvDZN3lzl04rIUBJgMhiS
         ppD6iFlzhDISDFqgP1DIjSE3+PmaliegaYnmruWtcMEDGpTLhI8an9NQJ6T8M91mek+C
         gx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940155; x=1692544955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U72ij9H7xly/POAmuR9nZYqDM563QnNZZvNrcGFMct4=;
        b=Y1qC6SJNlQUe7gDjt9/Ka0KbFde5FEGsECRJowkjJ7KMV3/aIeAUywpupbbKuw5KnQ
         rIaO/P3sM95hXIJ19zn4gRxiZ/ELNuSQLb403Vp4zNvTnVlX9EdzlztTF02y/8IyGgRr
         MVfpAYCOazUsOptKfGqsYamxxGqKdBxfmxIuOI1MyOEbPDT2tKTF8AQkywKl0AUVxu9e
         QGLvQ8+NAwcxb9GV6z06xA0lkM4TTxHWkUn8usG6y0Z58/VVxo+b4SwW7xuxY99sBUfu
         +OClQj6pUxAQFFAdXERtVYJL310rScJk055/j7D7apUrBJWzHaP2BrfuIAGo81pjC+Yq
         ANfQ==
X-Gm-Message-State: AOJu0Yz5SP3g1WEk36DLthL2WjnMOm3a1EWnB5zkbAVen4D0OVYVqSQ1
	Ph2aEgl8YZJmh/NJU0XUnwk=
X-Google-Smtp-Source: AGHT+IEq8lcT27+3KXWyXugbFwqrq92P97+ZW1qmGMQsqWgCVvad8+1JiyLdlFsV4rDaqfoiy0EtMg==
X-Received: by 2002:a17:906:5a57:b0:99a:e756:57bf with SMTP id my23-20020a1709065a5700b0099ae75657bfmr6293953ejc.7.1691940154549;
        Sun, 13 Aug 2023 08:22:34 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id cd19-20020a170906b35300b0098e42bef732sm4632902ejb.183.2023.08.13.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:22:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: perex@perex.cz, tiwai@suse.com, claudiu.beznea@tuxon.dev,
 lgirdwood@gmail.com, broonie@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, peda@axentia.se, lars@metafoo.de,
 nuno.sa@analog.com, povik+lin@cutebit.org, wens@csie.org,
 samuel@sholland.org, robh@kernel.org, u.kleine-koenig@pengutronix.de,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev, linux-sunxi@lists.linux.dev,
 Ruan Jinjie <ruanjinjie@huawei.com>
Cc: ruanjinjie@huawei.com
Subject:
 Re: [PATCH -next 3/5] ASoC: sunxi: sun4i-spdif: Remove redundant
 of_match_ptr()
Date: Sun, 13 Aug 2023 17:22:31 +0200
Message-ID: <2691934.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230811071426.2343133-4-ruanjinjie@huawei.com>
References:
 <20230811071426.2343133-1-ruanjinjie@huawei.com>
 <20230811071426.2343133-4-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. avgust 2023 ob 09:14:24 CEST je Ruan Jinjie napisal(a):
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-spdif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index ff18d4113aac..c2b55d2e5fe1 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -718,7 +718,7 @@ static const struct dev_pm_ops sun4i_spdif_pm = {
>  static struct platform_driver sun4i_spdif_driver = {
>  	.driver		= {
>  		.name	= "sun4i-spdif",
> -		.of_match_table = of_match_ptr(sun4i_spdif_of_match),
> +		.of_match_table = sun4i_spdif_of_match,
>  		.pm	= &sun4i_spdif_pm,
>  	},
>  	.probe		= sun4i_spdif_probe,




