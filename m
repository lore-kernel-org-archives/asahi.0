Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C72256F
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 11:11:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id he5so614801wmb.3
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9F7cJax0QH/QZaBK2YDN758lsvYWSdX4ohNIeUxAEAM=;
        b=SVA4Dj5Xuyr9HVEH0lvTiL0cMIi+LvPIeX86RcDpd+cPeDOhEjxwaaZwt3SPcz7TWG
         8ChGY5xRhFwZAgmccT85G0O19W34h7jaMBg1Udvnl9wEzPNLYBhnSdrzd0HoGVJ/AEBa
         nx9+E8qh3R3ttfHLlZisIn38JBhH1vHdZCkTBKS508cPMFM5G2GkqTYtsSsEV22GVZBv
         roSImdoCRaLJ+3MqOcU+I9I47t0h+VbRUXdgyWEe0qnjxr6nda5tW1KnlrJ00M632ORp
         Tz+3YzbRI7KcoayGIR2bYZEZdZtBLQfj2RRQtwPt8Nz+bRJURmx92RETNDLEmh1wn6g+
         todg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F7cJax0QH/QZaBK2YDN758lsvYWSdX4ohNIeUxAEAM=;
        b=qVofReSKstIiEdGwXUUVWpwTiASGZktVE/0FW26RcRYJ8iQNeL9M1pLXTqsT4nIT1H
         FKXrs8/mc8KnyCkrUwMkHTa95mCtWbDcEIUYcK9W6C1N0nKC5mG5B+6io7WzXpyYZwER
         twuGIdjnU+beUZwBucxSumWERq7tThcsNNlHr9I+Y2p6RpnriFQjhqpbZahub2y4taS8
         QivHhw/SEfAjGpMn3E8RvndpQ8M34b64wnIDGMdWJSlnlJWRb3xiAOEEHo8Mz7vUut3/
         FqNnY+LQ7mC+4d/SxuV3ZZVSruh+BpsSRTKbyT/v3wv3Q8eadXlGg7KxvNy/tDl9bOeb
         lYnA==
X-Gm-Message-State: AO0yUKXJzqPxDVqDmOXLL0ofuIBkgdoyKvEVZHYEp2rdSTipcARN+nqM
	xMZwMjzC8l6GYRnG9eFkaF3tBA==
X-Google-Smtp-Source: AK7set9Ifw0+tELdcUwLkSrgoYRSHeB+Wjh3bsRxKQ7ICkMhR+qYAHJfbsSS0fGi6pKvYn6YyOEvjg==
X-Received: by 2002:a05:600c:502b:b0:3db:2e6e:7826 with SMTP id n43-20020a05600c502b00b003db2e6e7826mr22764706wmr.5.1676286682837;
        Mon, 13 Feb 2023 03:11:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b003dc41a9836esm15156957wms.43.2023.02.13.03.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:11:22 -0800 (PST)
Message-ID: <942dcc16-9d7a-2f7c-763d-47515030931c@linaro.org>
Date: Mon, 13 Feb 2023 12:11:20 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/17] dt-bindings: watchdog: apple,wdt: Add t8112-wdt
 compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-3-cb5442d1c229@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-3-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2023 16:41, Janne Grunau wrote:
> The block on the Apple M2 SoC is compatible with the existing driver so
> add its per-SoC compatible.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---
> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.

Same comment as before, that's not a valid reason.

Best regards,
Krzysztof

