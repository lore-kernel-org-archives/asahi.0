Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9020F8B
	for <asahi@lists.linux.dev>; Wed, 12 Jul 2023 19:42:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b71ae5fa2fso67342341fa.0
        for <asahi@lists.linux.dev>; Wed, 12 Jul 2023 12:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689190948; x=1691782948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIaD+R3zG+IeSkSUIKYN7/FjM9J0ujCHdLNlAioODXE=;
        b=I9NrMFNv71nbDBkkb2bhN6OqbX+eRoQiRO3AuxWxTxaXro+Jjwhoen1VDMEl9OtqVz
         gqRfYqZyjjVKViV9+U/Spfor6DD97i5HN1OYw7M0gDy411eTUrL/R9VsEzY/e++cfTOo
         l4DbIe8NE4WG/FoJTr3c4UJWQZiEU6biYmCRIDpddzSNRdbztPI9za51JuCLhsMk1uVa
         ovyxS6Baj9rezP03HVZ+lGtk3v/sVLKmwFz8Gi0lgGX+8m1UhuwwYE2+XhmVD9xhKjUX
         H6qepFNGgT1PeZYvbnJrcRA11X6F9oU9OTlNWa6NpEAvDYCg4cjuuWzlMw0NJYaeD0Yb
         Na8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689190948; x=1691782948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIaD+R3zG+IeSkSUIKYN7/FjM9J0ujCHdLNlAioODXE=;
        b=WLkbVP3rKGjglKvt5w94ZLNbAAV3MyrYJ5FKuLZ1kny96tOPBmrWLmgEP/AKSQcf4O
         cbqifgHgSeB5jvCXhXbqChiXcBSLpr0VMcFfEw3T3r4RprZqfq5da8hxzmXt1zlA4/bo
         7aOS8uJA0q84Y8m79rf+cDpJ4g7O5+VMh6mR11OxMboXg2LliyLJa5F/PsfrDw1T8GgL
         lTTTzoHabBxo44W7RXGDtqcRh3FkJwaYWb916HzZdUnljDvlH4z6+vsm0aVXZmvJM/Uc
         xH6OWagyjk9FjPVoCC8ngl7c7TZq2suhwznrrVz59HbFGEEpmbFOjl/7/Glr6tpsf55x
         Mgfw==
X-Gm-Message-State: ABy/qLZLA70ohSR2jL8UQnCo2Gb98GvKhlmyO6WBqJz1EVIZ3mqON8kN
	TBGCxm1nIPykCB77Fn5/4Ufgwg==
X-Google-Smtp-Source: APBJJlGoL/j2CRXfaB7Onsdnsesrdy0+qIqa9SdRzh/jrIZDLn63/iDHTEz5Bw876Y6VbC/ijnBzrg==
X-Received: by 2002:a2e:9909:0:b0:2b6:eefc:3e4f with SMTP id v9-20020a2e9909000000b002b6eefc3e4fmr17335677lji.21.1689190948673;
        Wed, 12 Jul 2023 12:42:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id cd26-20020a170906b35a00b009929c39d5c4sm2954697ejb.36.2023.07.12.12.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:42:28 -0700 (PDT)
Message-ID: <f4c19365-4006-50f7-6c4a-754c2a87c8ca@linaro.org>
Date: Wed, 12 Jul 2023 21:42:26 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Apple SIO driver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712133806.4450-1-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712133806.4450-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2023 15:38, Martin Povišer wrote:
> Hi all,
> 
> see attached a driver for the SIO coprocessor found on recent Apple
> SoCs. This coprocessor provides general DMA services, it can feed
> many peripherals but so far it seems it will only be useful for
> audio output over HDMI/DisplayPort. So the driver here only supports
> the DMA_CYCLIC mode of transactions with the focus being on audio.
> There's a downstream prototype ALSA driver the DMA driver is being
> tested against.
> 
> Some of the boilerplate code in implementing the dmaengine interface
> was lifted from apple-admac.c. Among other things these two drivers
> have in common that they implement the DMA_CYCLIC regime on top of
> hardware/coprocessor layer supporting linear transactions only.
> 
> The binding schema saw two RFC rounds before and has a reviewed-by
> from Rob.
> https://lore.kernel.org/asahi/167693643966.613996.10372170526471864080.robh@kernel.org

Thank you for explanation. Then this is v3, not v1.

No need for resending, but if it happens, consider naming it v4. :)

Best regards,
Krzysztof

