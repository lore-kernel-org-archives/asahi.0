Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD2107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:07:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so741765wmp.1
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQEgjB8iQrHXFvi6x0HqC3e3NzQlIfRJ2OzEMb4rms4=;
        b=Udkxu36THi8UO2i96oFvDF1wqHJsqvvEHmS1MWF2nsBbpj9L+Dh28tYjmEZ79fMj/L
         uKSlDNLGNUJyqaLdPTRYUtcrzUd/275RFlKPtKUVE9O4f+5Og607jOflfXXvtFM7GJLk
         yB6j+h8ebHokEoA2PC1bH/3Z8d9aC4aIK8sEpQhx3HJREDfy+ETFbmOkwopWVvitrezs
         4SNhG4QOZRD2wWacPrvSaGhdeKp654gh3aonSlFtMgER24NGJWlEixR+NHTkvrakl6Of
         Q3m6D0heF9C6SZCYeXva+GY6e53vrA46YMjaVZumWHFC02RziPWY1hW+7P39kY/UqTtn
         8Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQEgjB8iQrHXFvi6x0HqC3e3NzQlIfRJ2OzEMb4rms4=;
        b=KrjwLlimaa15SwfV28kt9mgEOR3ALSmIONJPEVepwhoalUixtH3VvBMhMJbIMhZBHx
         YVJa8kPxgawaJFyCMXQRxbyhNyjBNIfBq+5j6ykPfJoVfvPfozWl0Vns+OBmxJHtj7V/
         v0I57ZiiYGID6a7XHlwIGuxf8AtilLlIoYviI4+HarDsmqmeZB0klgIJX5mbGAFoxA0v
         Ue1VoJRxHm1LwZnRyuFqUfMyeBB6mPj1Io6+rcaEaZCbwOtVheMTeBvcWjZtvF5W0g4F
         5bTlKH5+cT84lWijvqA5FPCjNe1+vI6GbtH9BrS3Yx43+pJnRoCaWIz6I0YklpAtWw6r
         90Bg==
X-Gm-Message-State: AO0yUKUUXblWJjSc/LGRNxRB4eJvjPbktE7x9t6tAYQmEJPvin0bxYEa
	6kMQoRHBRY21AOXRxl5dbRN8Rg==
X-Google-Smtp-Source: AK7set9q3InICbsdVlrKuHRceOhDenD+ihnnwX6ouwoXU2njIZKLAxGLbZkOECERxjeZWBzAJdNj2Q==
X-Received: by 2002:a05:600c:1616:b0:3dc:53a2:2690 with SMTP id m22-20020a05600c161600b003dc53a22690mr1662902wmn.7.1676372830941;
        Tue, 14 Feb 2023 03:07:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b002c3f50228afsm12516376wrt.3.2023.02.14.03.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:07:10 -0800 (PST)
Message-ID: <6241f548-8c55-b3dd-9b36-425026476653@linaro.org>
Date: Tue, 14 Feb 2023 12:07:08 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 09/16] dt-bindings: pci: apple,pcie: Add t8112 support
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-9-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-9-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> The block found in the Apple M2 SoC is compatible with the existing
> driver, and supports 4 downstream ports like the t6000 one.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

