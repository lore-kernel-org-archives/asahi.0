Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7B612C
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 07:51:05 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9659f452148so1214742766b.1
        for <asahi@lists.linux.dev>; Wed, 10 May 2023 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705063; x=1686297063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iW7mIjsbeTQgdo4bUMRJvZS21aehBrTgArVIcYbQGoM=;
        b=GXpSk4Fy8gpUVPJnIaKxcZC/u9hWbLTYWvWqlDbTyPJPbFs+Ye8DazCVFswRLh9//O
         XfcpfcIyIqT80xWgGEZ6CneWja769c72qEJQBaSr5UyzZzb0csNnQPoVr9A71nQOh+B/
         vuVOU782ZXln4eWYhEzuVrd5bwsvuPcPuIZVkdtjyRhuWlg7nK+F6CEr2mcZF1lzZ99t
         FUPHwWI+/AEwDvOtRq8dYsHFhRsBf8vUa9AuXYaeAP3s7iE087Xfc8/Kwdd9ecmIrqM5
         LiwAKP3bIQ37GPDupGZwYj83utKlxueZgHHgi3wF4szHq5zw5aI7WLcbmjc4Nat/oNlf
         0uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705063; x=1686297063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iW7mIjsbeTQgdo4bUMRJvZS21aehBrTgArVIcYbQGoM=;
        b=bb6hqBdByRBHuinXLBTpjp7JcwDodiECH951XdEv5hO6icOoKwLpTYjs29xer2GNU6
         DM9bdWlMOp6sAVCXKRIEMneSBWt6j6pq4/TcS3V4s4qe/0+nfIaBe7bPL6c6fR3msF4n
         p1i1Zm6A/nAXvGUtso0vjf5PQgd0YAEIHGFjkOX3C9SM/II75DkJmioYGDesbncrm59P
         faNlyasvcLkp76+35Lxvteary6ARAHY/y3Z5t7klvDIozjMCFVK0JlHajVZ2NBUVXTUN
         cL2r3Qgu+OmIyxxRSVML7IMZ27NdATYEiCqUCA0zPgz46G8e0Z4GHWx6ow5X7443wQAW
         46dw==
X-Gm-Message-State: AC+VfDxf+RAefg8DbsxBKQc/A/iVR9hiUXw0N6b0qYlUbmfEHZ2CGW1G
	tqZ5tWGrBBRAZ0FIa6LyCYfOxSGnDlCxNmXAtmM=
X-Google-Smtp-Source: ACHHUZ7nbBgYEcv+qxcIJPx7vRKcuVTcXzNbXan5YR4QkBuj6NlqgkqEsNt58tGSuzwTXu6/V9z9Qg==
X-Received: by 2002:a17:907:2d9f:b0:969:e55f:cca2 with SMTP id gt31-20020a1709072d9f00b00969e55fcca2mr5883240ejc.38.1683705063246;
        Wed, 10 May 2023 00:51:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id gv28-20020a1709072bdc00b00965cfc209d5sm2353400ejc.8.2023.05.10.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:51:02 -0700 (PDT)
Message-ID: <7b8c22e3-75c1-8803-fb32-097d12fbde78@linaro.org>
Date: Wed, 10 May 2023 09:51:01 +0200
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
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>
Cc: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509163828.86003-1-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509163828.86003-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2023 18:38, Martin Povišer wrote:
> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
> mono amplifier with digital input.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>


> +  reg:
> +    maxItems: 1
> +
> +  adi,ana-gain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      The value to be set in the ANA_GAIN register field on the codec. This determines
> +      the full voltage span of the codec's analog output.
> +
> +      To quote the datasheet on the available options:
> +
> +        00: 8.4 V Full-Scale Gain Mapping
> +        01: 12.6 V Full-Scale Gain Mapping
> +        10: 14 V Full-Scale Gain Mapping
> +        11: 15 V Full-Scale Gain Mapping
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,ana-gain
> +
> +additionalProperties: true

uinevaluatedProperties: false instead, so users can have name-prefix.

Best regards,
Krzysztof

