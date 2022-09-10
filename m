Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604CEA2
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 09:54:42 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id w8so6778342lft.12
        for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wZ6pO0qP2lP0EdvfsRwhcpTENHXsz3JcKbr3shUc4TU=;
        b=r0Zo8wGfSMBass6kqxL5Z6VCacDKNMGTgphBS/mfV9+5KJ+d8oQrYJhewxDxn5PlYU
         LyfQOOtMDsTTDXEinR3reqsvsNnlAAZrPt49fPx6cDo+6zmKbSDi8VZTRNAPHs867ULx
         VwG+M3+TwAoCEamKXwzzzoCIc2a86UUG4/F3WuBbZzz3roRjPtEerAz2OJeum0+gfu5t
         AJevs8ewiJ9hQIJn2O6InbGR7Y2GPNkSTrjg4qtmP3KpluVPPLnd8DvL07aPLk9bs4ep
         TccaQudoCNHdc4VgqE35KjFTFz8BoLjBNGNLo7MCebKLiw993gLwCA4y/XPScLxRpMg9
         Uj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wZ6pO0qP2lP0EdvfsRwhcpTENHXsz3JcKbr3shUc4TU=;
        b=nfIv/CkX/yQJ3z0SIJbb2JLERuuNZ65CbizDiwghEOWwcfUM1qvZ9aFfUo9gwGfWRO
         5SqhAzr4HgVDRfxLV9x6EZiAYlz63hU35S9Oah4/sT/buFA4WanRiYWqNUuxN9bbiQkt
         IzxnE3eiKEtOP6epfaEJHO61y3NASyIrCjVxk47pYfdlZ8HC4hxSsbjQZ+atoB5hPZZw
         Iu4mN48gfmizptpl15Zrs6zYZH7pSg0usRW2ClBLzzz5Q7KioalSg386UXLejnFpSOA0
         ZNDOyE3Or7YLrGOMu4qQrxb2qtMJpuhAyZF9l1FX1XhMUPQz281U931T9dt2RxsqkK+i
         Dnsw==
X-Gm-Message-State: ACgBeo0xg+f/jt7et+2lRXjF3BAF6IcJigDesxPZXz2Vx3jrlyKCU12c
	wCeClf2YPIzQCikgCyw5dzVFUg==
X-Google-Smtp-Source: AA6agR4421xFsdbE0xflRQvnyCMglAk40p1nG6802nRC1Pk/i13y8S35zuJxNCMMgWbJdkcDHs5b9A==
X-Received: by 2002:a05:6512:38b2:b0:493:9a:ac2e with SMTP id o18-20020a05651238b200b00493009aac2emr5486129lft.126.1662803680563;
        Sat, 10 Sep 2022 02:54:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k28-20020a05651c10bc00b0025e00e0116esm283118ljn.128.2022.09.10.02.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 02:54:40 -0700 (PDT)
Message-ID: <104fb8b5-03fe-203a-57ed-e4c6616989cc@linaro.org>
Date: Sat, 10 Sep 2022 11:54:39 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 02/10] dt-bindings: dma: apple,admac: Add iommus and
 power-domains properties
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, er <povik+lin@cutebit.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-3-j@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135103.98179-3-j@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2022 15:50, Janne Grunau wrote:
> Apple's ADMAC is on all supported Apple silicon SoCs behind an IOMMU
> and has its own power-domain.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
