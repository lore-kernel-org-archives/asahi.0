Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB61107B7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 11:05:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso13365440wms.5
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 03:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNBhJ0tOhfi/vHNTcvJXw08dO+3KSrahBNfcSUxMtoc=;
        b=AzynnouBDnUGerZIkvLHlXoq0VZkFyG0YBE/jACjBlUZ8En8vkUF7Aa9AMML3ewl5J
         49zYz0QxyUU1PrjvTA37g/WQa6ocbPL6q2EWWcIAK92+eq+KXMiJ+G8mmR0p2m3WGPtx
         Puz7DIXNHM0PoDR5okibCZ74cHzPhSJBRKLgsnQfyq3oGjzIPo5R/Xw4jHujdvlyTKnT
         4b51q/lGHQU7nCQaPRjSeJ9/oELfiUEK0+hzp1oGcTw9fVcOeAESGnuM2SNtiBwwkEBg
         TS0BOD8zkmnTaEAr7EFFnwtpoxH7mZwTX3a+x48v6TqPXv9hK2bmjStqXZHhjSb3NIaD
         B8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNBhJ0tOhfi/vHNTcvJXw08dO+3KSrahBNfcSUxMtoc=;
        b=x+WraQQlKM9Uia5FSlEZzp8GsVAoGVmik4JwEpJnS74iOo41h+q0ZEuAqxJ3xdIETp
         Pi2tEwU0jSVlYkiWmj7pGLQTj+zlJ/2b5PMcc6A2eYQtU7bj8ez106Ry0apXHa8ThYbI
         z/B4eX02Rr+ixxHvIw5rRZ7ftQO9iZaeHPcf+e8qQix/QDttBUAQX0dzxFfMyogMORQ4
         Cbb+qWyYpwPyMZQTU1pyW/IPOx20TVWrDBybxyeAIH1Rb71EEh3iIUVSBWgC8S5tZQzL
         gVwHuHXN4hSYs8pBb75/aHRxh+s2WtZ7OwikCvNXF0guLVpX1Pc13+KfbFlwx/NYX0tB
         3pLw==
X-Gm-Message-State: AO0yUKXtXi0uqTB7AMiZqGZ/V+LkC00t2v3KjdyFQsqkWV2jlIVuaaR+
	q8eCvxcPLkBEFV0/L0rvpsrVCQ==
X-Google-Smtp-Source: AK7set9o1NajK3wOegZGGAnKe1bRI96qHdhuWZYcWWmn/Xhf1p/yhYU6O2ERJUojXAD+ReolOfv5Fg==
X-Received: by 2002:a05:600c:554f:b0:3db:1f68:28f with SMTP id iz15-20020a05600c554f00b003db1f68028fmr1637801wmb.24.1676372712664;
        Tue, 14 Feb 2023 03:05:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ja13-20020a05600c556d00b003dc4b4dea31sm15922668wmb.27.2023.02.14.03.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 03:05:12 -0800 (PST)
Message-ID: <71f39f45-c649-f497-c913-eb4c183febc5@linaro.org>
Date: Tue, 14 Feb 2023 12:05:10 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/16] dt-bindings: power: apple,pmgr-pwrstate: Add
 t8112 compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v2-0-22926a283d92@jannau.net>
 <20230202-asahi-t8112-dt-v2-1-22926a283d92@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v2-1-22926a283d92@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 12:03, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> Add the apple,t8112-pmgr-pwrstate compatible for the Apple M2 SoC.
> 
> This goes after t8103. The sort order logic here is having SoC numeric


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

