Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44BE2597
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 07:51:55 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9659c5b14d8so1120331666b.3
        for <asahi@lists.linux.dev>; Wed, 10 May 2023 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705114; x=1686297114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sZ0/8EovSIVbd5AFaZe/dkBXV3RZ8rTX6k+VIL7rd4=;
        b=e8aIWPr+BEmBTl5Ja69WLppVzCkVAIOoaeeLgvNObfsN5wQLd0YAml7nw0+qZZ1PL0
         UhF4FR8wKNwb5HXVNUyseHYPaBkEAeO7I/Fxw6hZUFeJpydOvePJPb3ohp35suuHDCDw
         QvriOZSDJQisEEvPVNim3W3+0bbGHdkjYz7Ow/qbIRoNUY9s/D0K37beZDaxvOGvSe2Z
         d/uMqO1NFUBNKT78u0Pa0RhJVplJ9pAEbSvb2QFXSUf80a/FgeoIAnjNOYIFhaQzEXyI
         9FMCHwN/C7evyXJOj0YgwPkbIythdN5/kPMzgqqhpY33OCfXu/NL8PDj+89GRNQPZNbO
         Zi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705114; x=1686297114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sZ0/8EovSIVbd5AFaZe/dkBXV3RZ8rTX6k+VIL7rd4=;
        b=jn+Z80oW8krM1CEArJIPrS/qeCSdnXyo7aXMIG3yRpcuLI/gZ6icW+3st102QgxWEe
         tZmCRPPJcoIYmqp8T9cHh5p7Vl+xX5PbAfzVVWViFiFOeg7H8ofeS8PoH4LTcDQx9IV5
         HncHdvS3pLc3tbOKBC3jJi2DlwkfrbgXyDVvPgt/ur5HGd/H+0PUa7/dHZHJx5Fe+NSs
         gyJQOER4vd8F/fJ+GyKsiPqcG6kPq85dJ+2OCfMTfo7jQ3PfkmRubMsjSS4dYj3QrG+q
         G3Z0gSph7RBqjldWVlj4/YWxZjfvMBlYuzOb9ZeKWrrQIkgP2VL6av7Z+kZO6E4FqM91
         vYVA==
X-Gm-Message-State: AC+VfDzZS29KfijiudA7stpahTl4ftiT6x/D+IgCsmj3c2QKZB2xVYY2
	33TUopB+wxzbZGlE8H+MscONnXrc/tuL0iCRX1E=
X-Google-Smtp-Source: ACHHUZ6exavcj5UmA9VcbxCwK35ZHL+3F10nUmd/jcwMNBcB51eEB2rJ74He9CSe0YwNB+NB6rHmmA==
X-Received: by 2002:a17:907:8694:b0:96a:1c2a:5a38 with SMTP id qa20-20020a170907869400b0096a1c2a5a38mr1858388ejc.11.1683705113851;
        Wed, 10 May 2023 00:51:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id lf23-20020a170906ae5700b0094ee700d8e4sm2309055ejb.44.2023.05.10.00.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:51:52 -0700 (PDT)
Message-ID: <f38b984c-e49a-0686-a907-5d86ea93d7bc@linaro.org>
Date: Wed, 10 May 2023 09:51:50 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509-marxism-plug-759c99ac601c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2023 20:25, Conor Dooley wrote:
> Hey Martin,
> 
> On Tue, May 09, 2023 at 06:38:27PM +0200, Martin Povišer wrote:
>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>> mono amplifier with digital input.
>>
>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>> ---
>>  .../bindings/sound/adi,ssm3515.yaml           | 66 +++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> new file mode 100644
>> index 000000000000..19b7185ae8e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2019-20 Texas Instruments Incorporated
> 
> Copyright here looks a little odd, copy & paste from the TI bindings you
> send patches for earlier, or intended?
> 
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/sound/adi,ssm3515.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> 
> Drop the quotes on these please.
> 
>> +
>> +title: Analog Devices SSM3515 Audio Amplifier
>> +
>> +maintainers:
>> +  - Martin Povišer <povik+lin@cutebit.org>
>> +
>> +description: |
>> +  SSM3515 is a mono Class-D audio amplifier with digital input.
>> +
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/SSM3515.pdf
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - adi,ssm3515
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  adi,ana-gain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2, 3]
>> +    description: |
>> +      The value to be set in the ANA_GAIN register field on the codec. This determines
>> +      the full voltage span of the codec's analog output.
>> +
>> +      To quote the datasheet on the available options:
>> +
>> +        00: 8.4 V Full-Scale Gain Mapping
>> +        01: 12.6 V Full-Scale Gain Mapping
>> +        10: 14 V Full-Scale Gain Mapping
>> +        11: 15 V Full-Scale Gain Mapping
> 
> Putting register values into the DT does not seem correct, although
> I know nothing about sound and will have to defer to Krzysztof & Co. on
> that front.

Depends whether these are really voltages or something else (e.g. gain)
just related to voltage.

Best regards,
Krzysztof

