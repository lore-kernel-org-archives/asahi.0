Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F223D0
	for <asahi@lists.linux.dev>; Tue,  9 Aug 2022 08:47:48 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id v2so7440622lfi.6
        for <asahi@lists.linux.dev>; Tue, 09 Aug 2022 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5ZRqoSrGd+BoiYjAKUkI728rotE5kN9fSo4lEQOI+8g=;
        b=e/vdzEJtB1SxPZDhfRGHx30J19/pApV7RI9Lxl4m7eRLimeRmgkEdJtwR7BdT3fM+x
         oDBNdrUKj8TMdURTdwOe4eh9buM5Ow196l0vHWvk//YSyj2pH1Yknob9RfDH/WMimZEK
         BByitWQFDuKFJljHKxEirForcLNpkBSNdM0H00Ov4sQR1swxmH/bR8b0wuMs+G/fQ0hv
         NBb0vYl8GmBq8pDqqncy8CFfCy7hcTiDsEu9hwEo+YRHDsgv+pPNvTyKG9oBS1lcSM/T
         a4/x7RvfqdUgD29yEhrwneZgtIpiImnRa9yS2umOHlVBtnQWXFEZb4kOL1HIUHebCsSz
         N96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5ZRqoSrGd+BoiYjAKUkI728rotE5kN9fSo4lEQOI+8g=;
        b=kVMik3hbqtUUF7wh8dzjtJuN2jxBbHe0Ey4L50o46edaaUmHDIGhXpZP790SJYzMwP
         TVsjPZS2LAqkNGDRAzc2FoSPDi7OuhXLsh1Yi/OVBXthKZfAZKu9jRXNPKcpRfm9i1fa
         H6JL0tUb4EsFrj+c/I7J0BZkgRiX/uGTHdyLOKWYgnOXuWMkLHdFxkulIp3p4x/ABOId
         HwMl3nzBHL4mHPPO0FpO6XE9I2Xhm9aOzK21ezoTBfXqxbFNwExIeNpuVbrgEabkcoZI
         /2Lwm+GESZdDaKblSiyYc2+zEl2aL2TU9eJvuACVCu0uqvb2W/p4I+GSC81XyV9zsPF+
         4MrA==
X-Gm-Message-State: ACgBeo1kBP4WxYAQb1/sapqiqvE6g9OziST0qQtJqFIxTfttJI9ador8
	cEes/5obaqv6qyuMdAR4XP6SUQ==
X-Google-Smtp-Source: AA6agR57Vn8Xw6JF+3882osCvRfCsBG2iGD79k+lEHgjvxuNyg827VQ/Js1yrlfXCIevi5KIpnLazg==
X-Received: by 2002:a05:6512:3b8e:b0:48b:23c6:9b0 with SMTP id g14-20020a0565123b8e00b0048b23c609b0mr8176669lfv.470.1660034866470;
        Tue, 09 Aug 2022 01:47:46 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id v22-20020a197416000000b0048ad4c718f3sm1687682lfe.30.2022.08.09.01.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 01:47:45 -0700 (PDT)
Message-ID: <cbe80ae1-3ae8-eccf-89f7-4506e3f44ca7@linaro.org>
Date: Tue, 9 Aug 2022 11:47:44 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-2-povik+lin@cutebit.org>
 <8ce59940-f559-35cb-5f86-37399da166a1@linaro.org>
 <DCBCB694-F5A3-4E76-9518-89E9A1A4AB55@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DCBCB694-F5A3-4E76-9518-89E9A1A4AB55@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/08/2022 11:40, Martin Povišer wrote:
>> Describe the items because otherwise you allow any order. The list will
>> be unfortunately quite long, but still readable enough.
> 
> Well, I would assume the ‘dmas’ property as described above has an implicit
> natural order, and the dma-names are tied to it. You order it like the other
> per-cluster properties, and then within the cluster the order is fixed to
> 'TXA, RXA, TXB, RXB’ (maybe the word ‘respectively’ thrown into the description
> would have made it clearer).
> 
> Anyway that’s just discussing my assumptions. I can roll out the items list
> for ‘dma-names’, if that’s what you mean. Or do you mean explicitly describing
> the items in ‘dmas’ too?

The text description of 'dmas' does not mean it will be followed by DTS
author. In current bindings DTS author can therefore put any order of
dmas/dma-names. Unrolling the dma-names forces this order to be fixed
and validated by dtschema.

> 
>>> +    description: |
>>> +      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
>>> +      based on the associated SERDES unit.
>>> +
> 
> (...)
> 
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    mca: mca@9b600000 {
>>
>> You called it I2S transceiver but isn't it also actually I2S controller?
>> If yes, then the node name should be probably "i2s".
> 
> It’s a peripheral you use to transmit and receive samples over I2S, frankly
> I don't know the nomenclature.

Looking at other devices, it's i2s.

Best regards,
Krzysztof
