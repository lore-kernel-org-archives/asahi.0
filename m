Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45952F2C
	for <asahi@lists.linux.dev>; Wed,  5 Oct 2022 16:43:37 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id j71so9558365pge.2
        for <asahi@lists.linux.dev>; Wed, 05 Oct 2022 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=tILem83EJNuvIc5+TmcyEmjOuaEfpedRH8xo74px4IM=;
        b=gwPyQmbr7slMOsWZ7Svbjc60E0jzRoQJnXOyA9UlTczLgMCmWVcsB3tt6cKQpOgzQt
         3esZbJKqcEYIkcgl3Lwqn6KM93N7316Rv/YIdpvDuj1fVhvv2Wmd0i+9OtnZNRXEMEH4
         SxMrIkHmu7iZ5Nixr0OcR7v8uceju3Tb7mQ3MthrMXAqC/jGuu/SOBSthKnQdGXVUGOk
         XkrSK1MBD4zviv+WvsDKTRxmJX/uo67/PbgYPKTCz+bV6QCO/7ZdCWOyOpU/Y30fsymu
         0HRXk8pQw0i8grHuI9HLYb+TXKLGd+L833xaufMDqnw3fXAUa5K8RVnYAfMtb3jBPocF
         2TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tILem83EJNuvIc5+TmcyEmjOuaEfpedRH8xo74px4IM=;
        b=WOdraJ0/H3ff+STDidzqAbZOlfMIygtV8kwCSeDeZSUS4CdQA1VA5kouQIUjn+v5Gl
         RRR7SLHoCVXyGt/e+j/r0YEIWDyZsIDwvFO65odNW1ADSwJWm+vmeLG78VSes3kjdtYY
         Xkd8RbIeH0BJbW8qWKp7tRY48F3EiMzS4ZKGc9FfCnPZ59yzTn/n5Mq7+GJn3HvjhvyW
         ik5xtseOCcBdRVbO/gXiE9q6F5Gzc/VA55+qqw1ZBufv2Hg7B3gAOJuW+1lgCM0aJK1x
         QFaSEYJAtFKyANtxlBcrkPRtqZldfxJ2jr5Mrn1w7W4pD/MvAkDTidvX1ixLrqYYIOpz
         dqHg==
X-Gm-Message-State: ACrzQf2utmYlGWRRQ7PahZyxIyVceXtbCJbmJxTXruiAY1kXmhZPmneQ
	A/y3ERMsRyf1Lor79Xoz5H4=
X-Google-Smtp-Source: AMsMyM7kQtyNZhDR0lmhv7RCt2A3DFuUNz9FnAeQRICtLaz6ostG3FIRuQIo4RmdsfYsaVXVbkSc5w==
X-Received: by 2002:a05:6a00:302a:b0:560:950e:afd1 with SMTP id ay42-20020a056a00302a00b00560950eafd1mr332181pfb.26.1664988216904;
        Wed, 05 Oct 2022 09:43:36 -0700 (PDT)
Received: from [192.168.0.106] (155137199074.ctinets.com. [155.137.199.74])
        by smtp.gmail.com with ESMTPSA id g10-20020a170902868a00b0016cf3f124e1sm10595963plo.234.2022.10.05.09.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 09:43:36 -0700 (PDT)
Message-ID: <be98b367-f29f-25d1-de01-be189ae8057a@gmail.com>
Date: Thu, 6 Oct 2022 00:43:31 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 2/2] irqchip/apple-aic: Add support for A7-A11 SoCs
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221004112724.31621-1-konrad.dybcio@somainline.org>
 <20221004112724.31621-2-konrad.dybcio@somainline.org>
 <3398859f-e872-4f1d-8a03-4dcb1e46e010@app.fastmail.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <3398859f-e872-4f1d-8a03-4dcb1e46e010@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/2022 23:56, Sven Peter wrote:
> Hi,
> 
> 
> On Tue, Oct 4, 2022, at 13:27, Konrad Dybcio wrote:
>> Add support for A7-A11 SoCs by if-ing out some features only present
>> on:
>>
>> * A11 & newer (implementation-defined IPI & UNCORE registers)
>> * A11[1] & newer (fast IPI support).
>>
>> UNCORE/UNCORE2 and IPI registers conveniently both first appeared on
>> A11, so introduce just one check for that.
>>
>> Knowing whether the SoC supports the latter is necessary, as they are
>> written to, even if fast IPI is disabled.
> 
> AFAIK that's only an artifact in this driver: It was added to prevent an FIQ
> storm in case there were pending fast ipis (i.e. the bootloader was broken ;))
> when this driver didn't support fast ipis yet.
> 
>> This in turn causes a crash
>> on older platforms, as the implemention-defined registers either do
>> something else or are not supposed to be touched - definitely not a
>> NOP though.
>>
>> [1] A11 is supposed to use this feature, but it currently doesn't work
>> for reasons unknown and hence remains disabled. It can easily be enabled
>> on A11 only, as there is a SoC-specific compatible in the DT with a
>> fallback to apple,aic. That said, it is not yet necessary, especially
>> with only one core up, and it has worked a-ok so far.
> 
> Just to make sure I understand this correctly - we have the following three situations:
> 
> - base: no fastipi, no uncore, will work on A11 and M1 though
> - A11: fastipi and uncore but fastipi is broken (possibly due to HW errata or some bug in this driver that only happens on A11)
> - M1 (or maybe even A12 already, doesn't matter though): fastipi and uncore support
> 
> If we figured out _why_ fastipi is broken on A11 we would only need a single
> feature flag to enable both uncore and fastipi but for now we need two to
> disable fastipi for A11

The previous issues with fast IPI does not seem to be reproducible with thisversion of patches anymore, at least when modifying the device tree to useapple,t8103-aic the device still boots. Tested on iPhone X.
> 
> I'm also curious: What are the symptoms when you enable fastipi on A11?
> 
> 
> Sven


Nick Chan
