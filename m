Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896A107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:06:37 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o15so11898093wrc.9
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsX8qIp9rpO8WRodTUmbGc5OQkUGmN/oeu3jBtoIxc0=;
        b=UdBuo7yVWfJsCS/+crqzgM98Cx9K36cqPDmHgqs5HTjh407ou9zKe3wHszWBVOS2x0
         tp8IUUodBA6+cmf2Wo7x0y4K5UYz/hGrckwvsaHVR/eoK4uEKJ2UIxe9VYrN+czrje+r
         KsVMIDFDRhEphk+QGL5yY9pjoiSftN2I0lorbyztuxnssLcN2BN7PU6s84TnMeiIgi62
         bA39CfdogHCXNYdueFK6lJr3BpgOALK70ro5UDemnYR6mACG694lrCZGUJA3AjNjSRUa
         Yq8d0WBC5RPgVSiKEi+LvvvDua3HwRWOHsbQy51iS6Teu3YY8aCWVQykWLZap0g+aapV
         FR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsX8qIp9rpO8WRodTUmbGc5OQkUGmN/oeu3jBtoIxc0=;
        b=ldAhUwxW+Tgw8OY0lMmFzkVjWbECgFdyYvSXhih+obAf1Ov9O0oGeKMM/oDBbzwQdc
         Jioxs99UdVO+/0XrwoLrytswyhyzVlWw1DEXaW3/rUzh8oleqFGMQxSi8ub3YpFUZ6gX
         /taS1vAQZRROr1bHGsc6tWKFcf8TukJDrfOXexjr+PxZ5F04gLdpSQA+PxqWhjVkSpV/
         tyH8VnsONvVf7VpS6VkujEwtUQalhQ2x+hp+xA0kqD5hibr1zBCwFRrfyinKXwdyBXef
         qyJN/Bk1gt3xd9h8Syh26Q1n5+oH+VEzXn8sF4CXKoVYuI4MkxKtFF3X3a1qnjAoVyiv
         zoKQ==
X-Gm-Message-State: AO0yUKV2ZB5BXfStUUGWmpbGWHB/Z24DLg66oxZyLeOa/XjV/XFfPlXO
	9rHFCYDwNZ/DdyVoqtiJeXyV7g==
X-Google-Smtp-Source: AK7set9RnJCSFRjjewyvo4/iaXkh3gpUQnXZAmc+jxAOD7qGDVxt7LzHmJt7O73adRuKwyccwE49NQ==
X-Received: by 2002:a05:6000:d:b0:2c5:4c0e:3736 with SMTP id h13-20020a056000000d00b002c54c0e3736mr1675877wrx.24.1676372796220;
        Tue, 14 Feb 2023 03:06:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j40-20020a05600c1c2800b003dc4480df80sm22367838wms.34.2023.02.14.03.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:06:35 -0800 (PST)
Message-ID: <99a912a5-7260-e392-dc10-9518ccd826c6@linaro.org>
Date: Tue, 14 Feb 2023 12:06:33 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/16] dt-bindings: mailbox: apple,mailbox: Add t8112
 compatibles
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-7-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-7-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> The mailbox hardware remains unchanged on M2 SoCs so just add its
> per-SoC compatible.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml | 2 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

