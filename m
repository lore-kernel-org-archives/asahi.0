Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06972565
	for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 07:32:29 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id ek18so82653702edb.6
        for <asahi@lists.linux.dev>; Thu, 23 Mar 2023 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
        b=w3awquQKTHeWDx/yCfCfHfdrLUAb+7cmTUbCxlDsTXtHqnC/KTdLvanL3T8U7h9Hn+
         T2KyJY5oy1yPQyU6mzgUZh1CzH88VAPkqy8k2SW2SwKq45G6DggQbSFKp7id0BSjS8Rp
         VoHzkI+PUoz4dQKhOTIWOYjtIUHmYVlbCNMKTKatuW6HXvZvM2uiVdheYJwhuBaoVv6r
         XUFm0HfHybe27otwo9wNuL61H0cKrxmMAqzuTsillUtZ3oANbuyNtcnMhqKcUnzq/u1/
         nw9/mhXmeh0zZJ/KOLNvHLyQee+sIyAd8AbaOqnSeke6JK3XQ1qUndFUTGYQb65Q7Z6P
         x2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
        b=NtRmSKYnrSX05T5/DEbaG7QExSGF+MCWV2q0K33m9p27JBRylJw+12AXfDghF0bDhU
         uKrvoqrEdaBiuI6cOXvNWc9okDLOXKgb8KzGk3sLUsnbjcXlhqf4YfcEQi7T0bzVttyW
         WCGQEq/HN7H40XtN4zJxC5E8AeRAL0fShPXS3GjaKoVRpA9nh4pPalGMVpeJoRxiyZcb
         k45Wq/Q7hDxPldbfUEXkuZsMe+IYc11hWOxKMiONYAQpoX3gW1ZwyMqGqCJTwopx27uv
         IlSWKTaAv3bK1ULwks9nfiVBEi+8XnAc1ZeXompvfPFWZ/ixMvRhIUeXsl8cQtjCut2L
         31cQ==
X-Gm-Message-State: AO0yUKWyTNEfJ7asEGQZ/wSmpYbxv+a1GFDF4srH4cfXYdx7Vo9SRTpX
	Ki0JbJQP4dUnU0VYkSgPRwxBbA==
X-Google-Smtp-Source: AK7set/JB2xOMNVpHVZoowg3tmnBogfsihGn8UMB3eRY9FKEh8TiRmePaafNm/r4PfEQeqBy+Y5BPA==
X-Received: by 2002:a17:906:1152:b0:930:c417:1ad2 with SMTP id i18-20020a170906115200b00930c4171ad2mr9679120eja.65.1679556747895;
        Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id v19-20020a1709067d9300b008cff300cf47sm8240016ejo.72.2023.03.23.00.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Message-ID: <8fe6ee60-b8e8-e2d1-881d-544e12a7325b@linaro.org>
Date: Thu, 23 Mar 2023 08:32:26 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Peter Rosin <peda@axentia.se>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

