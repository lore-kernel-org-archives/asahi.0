Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85FEEA2
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 09:57:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id f14so5844653lfg.5
        for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lygMYUYxRPSYT5H0Ya1zp0m+glPknn5XdqgvO7ucKO4=;
        b=aUTrdmNZNdelst6a64h9mY3uUDJcPU0pg50MSjlAKs5YR5X0wdvf6iNhx0Jjg50uww
         CI00+eYfWq0cYxW9ZmLcyPjCvS3FPRISPPk/wcH4ZtnWpe7EzrcobC+WFGF/8tj2Alf6
         99rfEtVHsO65/G0ljd28gZ0Dr/8UWjV7IzmDAU9ajTJXYimq3wl85+Yla9Z8za9qr2wD
         rA/EYxIC6wYIHLc5RJVWXgLyY5nLct3/nzqiRf+LxFhanQP1eA72BdvXb8DfvgHLBCYl
         7jW5DJqDCodgc4yajpFlxuTg9nl0OunS8AbCmIzGbKeJcm0K45XGgbEIdYqca2CBHz5C
         V8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lygMYUYxRPSYT5H0Ya1zp0m+glPknn5XdqgvO7ucKO4=;
        b=lM22jrEkQC0ghnf5tXR1fNCrLEWhiZ+u3RgdLDE02nH5yReOSGy01mZEImhdffRlL1
         y2WQl5jTiOhtga8p9tGQgsGzMeErUL73KKhjp9K9Wul8WQuwX9OleKxobVuYV7emyAbY
         lZzXvn6jRIV9d8ty+rrU4xMWcxJ3H6uxvt0RmZXBa31kKBe4Axks+kBNDkhNmnDigCLB
         nYqOwy3vUcJbNJST1GGAo34MilfIZXPiorDgUpI31xyQYYHMV1aB2yMdAIfoAMZxxV/L
         tljiCn250nKpk7Yr1oKjfCwcbAbCNAsQDwsXS5ATsJyIRcU97F9d1FrrERzbdkQEd6/K
         J4zQ==
X-Gm-Message-State: ACgBeo1ef5OYHyceuBxXBxsDXtNrkTJRnVDSyjRDWvQAmPVZFxWIjmlM
	UA3Tf/fo0mGGcefV6yHZM4SBrQ==
X-Google-Smtp-Source: AA6agR4iEi9ObHgqEcSaW+6uqCOgJkuRc2bFmxCpEJwBhpNpdXS8KvebgVM1+Z42Z9URFo2Q7JBdYg==
X-Received: by 2002:ac2:4c42:0:b0:497:9dfe:e870 with SMTP id o2-20020ac24c42000000b004979dfee870mr5500481lfk.184.1662803818793;
        Sat, 10 Sep 2022 02:56:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u5-20020a2eb805000000b0026ad058ba51sm289922ljo.45.2022.09.10.02.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 02:56:58 -0700 (PDT)
Message-ID: <82dcf030-dd74-19f6-1069-82f1a6d89769@linaro.org>
Date: Sat, 10 Sep 2022 11:56:57 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 03/10] dt-bindings: apple,aic2: Add CPU PMU per-cpu
 pseudo-interrupts
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
 <20220909135103.98179-4-j@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135103.98179-4-j@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2022 15:50, Janne Grunau wrote:
> Advertise the two pseudo-interrupts that tied to the two PMU
> flavours present in the Apple M1 Pro/Max/Ultra SoC.
> 
> We choose the expose two different pseudo-interrupts to the OS
> as the e-core PMU is obviously different from the p-core one,
> effectively presenting two different devices.
> 
> Imported from "apple,aic".


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
