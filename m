Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F6107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:06:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso11243488wms.4
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UK/C7205cqjtXHN0YFXcPqVqX3FVcOGt0olsnjJ5Yyk=;
        b=CLgo1ipcM0SOZ3IabdPYMw8o2rBkf3OFTn96N/o33hAXz4gmWafi8sAF7sArwncwKg
         8ynnhTpG76ArNnlfoNRT3CXitVksvGo1O198b7k+WbfQNWhYQoLD+wyKsjk7bOxocMvN
         VTxXamd0Piu38SLMWqJfafPsUGmNdnWv443uSQn3dWkG73e70GqfZou6sQ6uTfDh2Zds
         mHZRAYn0y+ADObOQKpHUHZfjNXQBxX2iPjbfAeBzinqKZyToRVQCp9xdlNBRUHTLfs7x
         n5Qv+iiJTZijgOhW1tM9zK28gJKbfjokvfyNrnbMXcljzciBhyl2Gpy3UlsBq62t8HWe
         1I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UK/C7205cqjtXHN0YFXcPqVqX3FVcOGt0olsnjJ5Yyk=;
        b=WgrL7CgsNVxAwndLftlKzGULhPm5vMoe6HYT4b7gRN55wg3euTPFFaFpix2kc1JUQn
         q7jrHLNiDk3gzXuEn73KrZom8X3R0as4yB5E6V7RKGkAzryj3fYfI5wwrOODzoAak7Gv
         1kwTheXHHa+5/eqxLHX0DI6p14mMQ4SSDoVbrtaWwote9jBdmBwXYBthrBoYuQ5moFVs
         T4UAy9rGFdiMrIxHpUAlJTLR9KNno9DJnamHUU0lZb3eisHQ0YauridS6gzffXFr44u2
         gJgkHlg0airgaB2YbdwCe1C64AU0YwT61IpiJNpLlRMHjGVeM0R77kSt8DfmShZYULBR
         UjEA==
X-Gm-Message-State: AO0yUKW/bI8NuoqSecCAyANLsm7Y8Wk+BcygJjHHdNAK+Fvl2RaMj94+
	EDsXCz/mZhpqeyxLHmYg8lVaOw==
X-Google-Smtp-Source: AK7set+WCTmbzixkGjfUeksuhVmxtXE7BRFOvctWQ5bUWqHhYKmxbb7uulPFzP3KWazlMzskbho9og==
X-Received: by 2002:a05:600c:3310:b0:3dc:405b:99bf with SMTP id q16-20020a05600c331000b003dc405b99bfmr1732294wmp.15.1676372787011;
        Tue, 14 Feb 2023 03:06:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm21019728wmc.13.2023.02.14.03.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:06:26 -0800 (PST)
Message-ID: <ae66a024-1901-f7db-e64b-0ceb51131419@linaro.org>
Date: Tue, 14 Feb 2023 12:06:24 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 06/16] dt-bindings: iommu: apple,sart: Add
 apple,t8112-sart compatible string
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-6-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-6-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> "apple,t8112-sart" as found on the Apple M2 SoC appears to be SART3 as
> well. To allow for later discovered incompatibilities use
> '"apple,t8112-sart", "apple,t6000-sart"' as compatible string.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

