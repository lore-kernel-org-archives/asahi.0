Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512246AA9
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 15:12:37 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id y10so15083096ljq.0
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qTC2Y70APRJOcps3tf6QOae/fOMCH2muBNa4G8Z6yPs=;
        b=J1TYZkwC0XhQDSfLrkftWdaC2pwGjiDifNnjEa6B86mdUJo0eZRfPaMBgBPzzxGofr
         F3yf0h2RFfn1UocIllVNmkov5IDmsmHAS+/oqBSfSAolxYv6sAb1MpHiL7AHLfEa1yUO
         yvLOzCvHf2tmrljoFBfwLEfMRVg11vAVdq9m2T+kusBJyoomTRhhKFxeHEq5aiHWbcsy
         Prg/gzK2vq10/sIhjXSGa84BIHGYkoiX8GEqJdrbq1Qu1oJhDbBiQiyEQUUgYcLSwJOh
         sP5A9zYPc5h4hrDmyV0RQ9hl5fDfWkD+H71MdExNw1sYta0akN3QuJ5kVeSQCEnBZ6VW
         mbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qTC2Y70APRJOcps3tf6QOae/fOMCH2muBNa4G8Z6yPs=;
        b=LbWeNYfAxX8WlbbFlp1u6dJsZyIsk30c2h/sitlFz4KmQtyCZZZImrNGqOUkUNJClm
         Kc2umZvQB8+Ae63iPgIDACC4LH2eAAHmQeyOsbjTkYpR29NqsYecLuc1vHZVaLulEnjO
         QjBOrJ4Mnq9bsJ2IGlYsScthUTVfacxUJ0k35nRlAPlKXDim6GQfb1f41pE3caxJ149r
         iOrpsO1MZXY4dGlyTUgk6PZUM/LOdFjI7CEdM/24JuIZKEgHrbvRUHc+oOIMWfxZxcYl
         6SL/Yiq+XucLMA9ILuLkS3iRgCoKa7/z2l8hRb7YjJ9N4n12nTwYThqhkN/+3pCeAkVL
         WCWg==
X-Gm-Message-State: ACgBeo34ks3uv7uHhnPyjjVsQmkNvlzq2kReTpywp9PA64oijwE/BR3P
	KI2ahRnHxyZGl77nu5SfyBUCng==
X-Google-Smtp-Source: AA6agR4ugS5tyTwVwYnuIaQklpVkzkiOpqJmaKPSnCGjhxjT9arcAzMb64uBWCZfCu3H+QzZlAfpOQ==
X-Received: by 2002:a2e:a552:0:b0:25e:6fa1:a6c4 with SMTP id e18-20020a2ea552000000b0025e6fa1a6c4mr9388414ljn.90.1662045155444;
        Thu, 01 Sep 2022 08:12:35 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id b1-20020a056512070100b004947fcf0c0bsm912235lfs.281.2022.09.01.08.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:12:35 -0700 (PDT)
Message-ID: <be6cda7d-28ab-6fe8-e0ee-5e448c7696b9@linaro.org>
Date: Thu, 1 Sep 2022 18:12:33 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/6] Add Apple Mac System Management Controller GPIOs
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2022 16:54, Russell King (Oracle) wrote:
> Hi,
> 
> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
> 

Thank you for your patch. There is something to discuss/improve.

> The first two patches add the DT binding documentation for the new
> drivers.
> 
> The second two patches add the core System Management Controller
> support.
> 
> The last two patches add the GPIO support.
> 
> DT updates will follow once the bindings have been reviewed.

...and how can we validate that your DTS actually implements the
bindings? Typical submission includes everything, either in one patchset
or at least linked to each other so we can see the user of the bindings.

Best regards,
Krzysztof
