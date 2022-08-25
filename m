Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F17B
	for <asahi@lists.linux.dev>; Thu, 25 Aug 2022 06:13:49 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id l1so26350768lfk.8
        for <asahi@lists.linux.dev>; Wed, 24 Aug 2022 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wlxyyEdyz9YeaP+PKKdOU9ZrYBY0DMAseQm1V42ntwY=;
        b=UPsydeRD7QmyNX/kxeY7lnbMw8ie0nb0OcFrbQmJnaxJ6xd8fOfUaQYv1HClHxFWY9
         6Rnsl+fo0GzF/eGP/wAUkgjfz+5e6Bx6m/c6XN2xIHnuTh2E4N+99ZRmtffu7EpXPqKE
         WZGM2MQLyqUebHOwjMVTRo+BE4arXXFGOiuMkk9LQ3cj8tyKygNyMACti9WBehBXcR3G
         nyoCzs12K4eFrNEz0BLTAQJ3vkgKE5f/52AVZ6Cy+ttumgSp+GTUMbaa46OZbmn5KPF+
         l/8cCWewOQG7ojKLIJoDQPjT1CP44wbuyX12WzJm39iXkLkuYfIwiP7HFNix/58PLeNS
         8a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wlxyyEdyz9YeaP+PKKdOU9ZrYBY0DMAseQm1V42ntwY=;
        b=N64qtZhrbtLSHekSCYYKKbbL9y33PeByLevp2UDVhuxF8i5OK2TCuEp7/mcpEjGn+V
         ma2vLitFhdmG5fJVh2rDaifAWIeHRMf9viOKTlfS7r3c2vg0KZQHaN/5giXDfeN39U4b
         u7tQx5ehAz6CTBbJfLN3t4ePtwTSBuFwl+zB+AXuRGG4EowqiZKd+6ZFXFrDopkUoULK
         6LFzB9k1ROQoUSf3fLCXUaLhMtAmfsT3nB99+FAW+z3TCglunzX0kgC1vI9sQdWqC+ct
         U4Sc4jCT/C42JscxFN6FvYv5NbbU3joHOmimT5NvJ7IALXHAlz2qIV00RVwg/fpXuRg2
         6FHA==
X-Gm-Message-State: ACgBeo1O+mdWLCj4oqwIJ/vmAZ1G01hWfa/T/IoRYeKJw4/D18g5sYPi
	vXgMQCITCeo1h9wJU4jIS0FLJw==
X-Google-Smtp-Source: AA6agR7UqmyD7JRBfuRRmBmdO0IXT/oW/WrgCHd1/0DNqYVZ+wtbYs/xMKgsSXJIPZ4+fxXOwAvASw==
X-Received: by 2002:a05:6512:3a90:b0:48a:fcf6:3137 with SMTP id q16-20020a0565123a9000b0048afcf63137mr605815lfu.255.1661408027387;
        Wed, 24 Aug 2022 23:13:47 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f17-20020ac25091000000b0048a8586293asm323218lfm.48.2022.08.24.23.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:13:46 -0700 (PDT)
Message-ID: <b906210e-6857-82bf-755b-760e33d3a338@linaro.org>
Date: Thu, 25 Aug 2022 09:13:45 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220824160715.95779-1-povik+lin@cutebit.org>
 <20220824160715.95779-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824160715.95779-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/08/2022 19:07, Martin Povišer wrote:
> Add binding schema for MCA I2S transceiver found on Apple M1 and other
> chips.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
