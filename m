Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A6107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:07:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bu23so15195075wrb.8
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=njivcugErf0QzOhhAeetK3MceHXQ4vnJzSNJVLtasTM=;
        b=Z9CiI+lfEedqoDYICCi8f2sGc7JqYmUeRTZLKQpphLSFlk4QgBKj9Y5F2gLqJQormY
         Svyqf8+eBuNcyp26aEjM3fWDSPk47MKifB2N1KLxMZ3hzYy3kajluT7Tt5oTHJrrh+Jx
         tfTwqYG5h1hMTpZRvnLIFD/sXlOYy/yrXLCDalzQqi/pn/XPOCgGEUL4Plmlw5RZNxl9
         pmIEZQuTUFz4PsrZnjX7HvTO4QJrNVtD33Y/QIo51/swXOoommsCe4nIBmcnmumUUaKJ
         oZyfhxkiM1wol/FVHEAnSAbOeLPvXVQ/DHoWTA+Rne98p5GZ72NdoRuBuMk1odduXXKp
         4Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njivcugErf0QzOhhAeetK3MceHXQ4vnJzSNJVLtasTM=;
        b=7TD6c+D5HcD0D1OKDx8HETcU4/BdnRy3shNgYGOGxhFnRzWoCnX72oXpY/9Jc8XbUs
         fAeR8oTrTbx2Jwj5nPmmJbqn7imQgtR4kZCweCAjq9xRAvAVp8qU+jBIe8+cKni5q/+M
         yzEoNkJ8LRp45uJHLpbZz7GhY4JAh4b1ZmbtaVd5J+r3OBHqO4/XBOP+Hp/c/oylGjUx
         98etCyzU2YBq3A1Z3Uequ8QcEwG5/I2DKvsFD7jVhVRzU5sMH8iGj/5cuB/plDx36YmS
         lkqDq2s8s/DtnxCy7cnGhL+6tJPU6J+hn2KpdOZ6/KyGo55GDxhOZx/PAbfDKgtVN8YU
         LqgQ==
X-Gm-Message-State: AO0yUKWLKfRz+Z9AcGIWeWNjOyPKfXJkrwuEo2ny/0b9wjWswjp1fSle
	x3IgYe97qb4cSzst+xlMGhu6Dw==
X-Google-Smtp-Source: AK7set8bi4viGxq7fat55u+ZQGFq+NYv+AijYmbC8wKc0FxIjRBi8GSY6NZMgb28RP/9J6BzH+gHOw==
X-Received: by 2002:adf:f6c6:0:b0:2c5:54fd:2655 with SMTP id y6-20020adff6c6000000b002c554fd2655mr1782147wrp.5.1676372849766;
        Tue, 14 Feb 2023 03:07:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q1-20020a05600000c100b002c54d8b89efsm8709382wrx.26.2023.02.14.03.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:07:29 -0800 (PST)
Message-ID: <e65bb8d0-0e56-62fb-473b-5661751bba40@linaro.org>
Date: Tue, 14 Feb 2023 12:07:27 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 11/16] dt-bindings: i2c: apple,i2c: Add apple,t8112-i2c
 compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-11-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-11-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> This block on the Apple M2 is compatible with the existing driver so
> just add the per-SoC compatible.
> 
> Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

