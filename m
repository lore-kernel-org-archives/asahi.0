Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6672115
	for <asahi@lists.linux.dev>; Thu, 11 May 2023 17:08:28 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50bc075d6b2so16398622a12.0
        for <asahi@lists.linux.dev>; Thu, 11 May 2023 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683824907; x=1686416907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7pSkCu4jw+MIqLM1X/GSl2Ww2yA7vaTQ5eDNYGJp+k=;
        b=J31xoz4Ek1HYwjey22pRfKmWA07NmmCjA8326SQ9D9ewwvDE0Wnx1uKLrJJgoEYrlg
         1GrCv7/iLST7Fra9rl2qVFB/g8kP3GZDQgvu75F8ZzsE3nqCHzO0RNKErHPGyrGtl4NK
         4lMQOMqWzy/aFu3LSOAMcNysSPXuJdZ2bzRPfqGy6yriUl0bJG+tT/HQBjZEj1+cT1Gw
         5ft0pvlLPcF4kcFAZw/Y+ZWgcJAUzwiAvTcltIH4/9zf8TjINCPYi6xqHnzWRKXp8TGj
         FgeIgg5l2Yuy48phBjILEWpgVdLliEjQXo0Praa632cAAVvHtebVjMkDHDANxT8DIURe
         A67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824907; x=1686416907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7pSkCu4jw+MIqLM1X/GSl2Ww2yA7vaTQ5eDNYGJp+k=;
        b=kgDVXvtcW1hd6A411XuYEEoytnnjB8YUJylrZi1+P3hOZOc8hJfBt8Qdjxm/9qUAeQ
         u7/ZFQV8mJZkgNyZP+z/5eZly4J8ijtjByNlor7jonJgS69Li+MgQnWa7VzPmE6npEDq
         H1leVg2WcUyBjVqIPv0FAVhXx9r6gfkoUFAf47/+8BIChV8sCRt9+PZKN/lltkDXYvs+
         /ptLRpgjU9YyzdGLgEbW12Vs59hkP0ZCH14dkdUNTRAB+NEDZZqW5e5iRBHAL987/Gvn
         KVwe2hRp5S542ekkaGkIbnA8UptLzhDrKwHho6tOO1tOqtAP2j2BC/HGo1BryNVW4F2O
         CNKA==
X-Gm-Message-State: AC+VfDz7wGlB3c/4/cS6hIsJ9HIp/TtXyNmGqaPOBym7eVRGrfLTa6eO
	0WUzksKfNXmz7yfRMM57L5f3kA==
X-Google-Smtp-Source: ACHHUZ7Mq8DfwN2CS1Qv3Zb95a/ZqyQv3M1eXU6+CuA4vYkR4lU3I3lNaZpnt0FSbPkEAtWs090WiQ==
X-Received: by 2002:a17:907:6e03:b0:96a:440b:d5dc with SMTP id sd3-20020a1709076e0300b0096a440bd5dcmr5278769ejc.54.1683824906914;
        Thu, 11 May 2023 10:08:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7cd:1be6:f89d:7218? ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090660d400b00965ac8f8a3dsm4264298ejk.173.2023.05.11.10.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 10:08:26 -0700 (PDT)
Message-ID: <47ddf347-f6f9-742d-949a-c7a315dfdf24@linaro.org>
Date: Thu, 11 May 2023 19:08:25 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
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
References: <20230511150546.8499-1-povik+lin@cutebit.org>
 <20230511150546.8499-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511150546.8499-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/05/2023 17:05, Martin Povišer wrote:
> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
> mono amplifier with digital input.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

