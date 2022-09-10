Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0FEA2
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 09:54:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id f9so6072757lfr.3
        for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nGB1eH+3YKYlQxfebPcTH9aYOLxz9Odp7+V7DTmi6rw=;
        b=KG/jKE9eJLKyuIo+VLF+hq1v8WKbwaXb2CB1x+cN8rYSxuBllbtpxwMbLrWm/bT04T
         WyLoDnIwu9X16TJVAU5mu4aAt7Fbb4vcZB/oTh8QRqtka9TGeSCOwxlXeGzOH14P5pr8
         OJ/WHW0lBYpXRx4viTTTdK2bbFawt1Q6EtDqTHn0JkbXzI3Aso62XbbGKBVVJPp1Qi5p
         hZOmJkS2XrYb4AnC0YO6CF0QE2VNpYepl797Z4WAl+LB+tRYHKKoMY/SVQRKyvvPBVMG
         m9dIvgBYfZV1alxD7ivNobc/rA0lBaq3hhCOYPiewSUQNFeYsumvlKxTp7M0NN5DQUqL
         w9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nGB1eH+3YKYlQxfebPcTH9aYOLxz9Odp7+V7DTmi6rw=;
        b=x7412cX7IcTXFb/N6kzxogpSwNNKYTVMnq7oU2p5XJsrRiyd4IIzt1sLedyfAX2Lfk
         vevKog0YVFizU/OcYR8LvZzXIiK04nyCEofpCVpf8Ik6w9LuwOFsxuv2CwLHo9w/KkwV
         zjq6XG/Kuim+MN4OMHRVmOgXnzz41nPBbZyRErRIAysKSu90cQCxGAzItDkxQK5Xfd9/
         0LhiuLIWhkK3X/4tux0HIMfD/J3nSbb7CVu764ciFd72bRJrYomgFh+a7L3VO25ofclh
         xcqhcguZztGTa2lDi7Lw76mkobaVi5UPZbOO0yg81tmlWc5CuEvOyBgzbK73mVQIhKwV
         huKg==
X-Gm-Message-State: ACgBeo3j5vI3xgPPLyD3ohI/9DL5fTMp81veCaiq7Q9XynCaFGcgAPBJ
	2RKQtfWhe9wmAv3X78HL/k9pZg==
X-Google-Smtp-Source: AA6agR6yKiJIkOeCvvAjvFniHPVqzLuNpnS2U7oFcUbfk1Gf0CX7xdQoS/kkXI97ntqfaPtR7++x8w==
X-Received: by 2002:a05:6512:b8b:b0:498:f32a:3c1e with SMTP id b11-20020a0565120b8b00b00498f32a3c1emr3186445lfv.123.1662803643026;
        Sat, 10 Sep 2022 02:54:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z14-20020a19650e000000b00490b5f09973sm208638lfb.92.2022.09.10.02.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 02:54:02 -0700 (PDT)
Message-ID: <7055eeb7-0ca7-37f2-7e7a-3880a8f0323e@linaro.org>
Date: Sat, 10 Sep 2022 11:54:00 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 01/10] dt-bindings: apple,aic: Fix required item
 "apple,fiq-index" in affinity description
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Thomas Gleixner <tglx@linutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-2-j@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135103.98179-2-j@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2022 15:50, Janne Grunau wrote:
> Fixes: dba07ad11384 ("dt-bindings: apple,aic: Add affinity description for per-cpu pseudo-interrupts")

You miss commit description.

Best regards,
Krzysztof
