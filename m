Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940752C9D
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 15:03:33 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id x18so808355qki.4
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zy78pOro/kNGaH6GiKHB1Btqlcj1EjPqbvOYH931OQc=;
        b=Elh+yNpir9fVQH/ZqSBfiGNl24FRuTTs6B2iJO5xtICf02Lftb/tBUCWPDcIlAezKv
         prMSGtaIbjTka4ojowDRQbWUxRqD4OaS0AU7jxtT9KNSWtZYhBDNjCuv6vsC3GuWiDJo
         Sfo0iPKlqgZlzwBeSZNrex4iwr8AusiEpqU5SRJMCbQvSAYP1u3JYiT2mXngOA4sa0Gj
         B985w7XSBFH5sAbNNv9V3qQfWkExTY9svD15unM0ZybnpHS+feMl3caGbQpvAJc36VIV
         YESW61ElTlpJr5Civdksv2QCQt5rnBQ64YBHQVOypRK/5ENzfMvqNfLhAsGFqy7ieGR8
         E2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy78pOro/kNGaH6GiKHB1Btqlcj1EjPqbvOYH931OQc=;
        b=QNAA6iUBqGqjTLebitcaBu9/zmksXsyJYUeZoVhblNfuQr9S0ETuzglkE25VIk0uZq
         98VrcrmJKsIP0Tdb027QC0Rhe49hiSWNpeMmtkkPBb6J1ETb5AWdOvlPifA2CAyAHWX4
         mWrsp94JmaotehhiAmli0LXo5TCetnjghu0xHKjTdiS7WreBOIE2nto0WwqQ4imb/VBG
         5tRlPnxVD5Q1uTE5PctSM0l6UlnDsOC/Kj5wBmbSTzEjEu43iVYc31sVl/Fj7/Kuqv8/
         F/U5V0UoEvX0KRLp8kKdeQcF4YmEAUfFYIYBL8sog8AY2TpMhWMEIA6JVsjoNaUp/wSv
         u0ow==
X-Gm-Message-State: ACrzQf25Qtqwxb3ucO20Wb/w/K68z3RiSRhrvuMj56zfhzrrmpBpHDBv
	UOrpKJp6bcdif/hYWfUuMR15LQ==
X-Google-Smtp-Source: AMsMyM5nABmPNo1XLYdsPzLxGDL/SItBhtuUNMUriLzYSJvmRMWrahFZimJxCAyJWz6ozdsyYVpVEw==
X-Received: by 2002:a05:620a:29cd:b0:6d2:c5d6:6fe0 with SMTP id s13-20020a05620a29cd00b006d2c5d66fe0mr18452610qkp.148.1667401412454;
        Wed, 02 Nov 2022 08:03:32 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id fb24-20020a05622a481800b003a51d65b8basm5786562qtb.36.2022.11.02.08.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 08:03:31 -0700 (PDT)
Message-ID: <54e6c11b-d7f6-bb72-8604-652993b2d132@linaro.org>
Date: Wed, 2 Nov 2022 11:03:30 -0400
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/4] dt-bindings: pwm: Add Apple PWM controller
Content-Language: en-US
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, thierry.reding@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221102141513.49289-1-fnkl.kernel@gmail.com>
 <20221102141513.49289-2-fnkl.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102141513.49289-2-fnkl.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/11/2022 10:15, Sasha Finkelstein wrote:
> Apple SoCs such as the M1 contain a PWM controller used
> among other things to control the keyboard backlight.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

