Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77733256F
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 11:11:35 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so8332454wms.0
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqQ+Ufbrf2k8hrdzQxSTas6D4N5ZYvZOx0pZJyKbuXs=;
        b=GMvuAV7CLQxe96ZF98vrl+9AZeLQ+vX0LH+oYQNjD1GqvpKQjIbip/8BWkothWNKSp
         3Yc6go/wYd69fSFW8xIgD+0pGefchO04OqfkueK/3RkGUkooe+ED5cLT5aPGnaN8vopZ
         qRSxcNQx45e8ZdUMsAHWbwOCqqDp4gCdXnp7cy9il7xXvsT9Jz6uXRm9qvArUiKY/4eb
         LmAXbiolgLgijR6Z52K6jcABNMJ5r8SE5r+z3DHRfK1T+84d7tYdX7uUPprDqBMJ+U8S
         3HNbzih6fYDhHQz6EDojnb9jFN+SE2D1wVUF41EsOsawDhEwAVBl8T3msAV7Qp4IWKdw
         O86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqQ+Ufbrf2k8hrdzQxSTas6D4N5ZYvZOx0pZJyKbuXs=;
        b=xPUPK+hSA1fbesem63pzeTQZwWCD435fX6+Hv75nLEj+2kh+APmtNuEMF5uBATA+ck
         xb5nEMr0NhJgkn/PJGDTR5LGdXuJdB0RzHvezjb7qEq0qpBuaP+IO9jKXoBwZmJIZvBN
         3Mmlij5nVNNZVKR7TQyoUWuic8KpIkfpjKgBri58dNC51fGiS6sgVPDq/3ukTptc2ArM
         T0JEsRCQU2zHHc82z8OBPz8rsMBhxbqwwzbmVZFYvd20QS3HbbDGhPzjjx9SxN4yo7JL
         VM6DGdBZe8rE2J8Ka6LLSrVFkmMMptMvpmdJujiIps1nHHM+p4p7xV7Fjyd0vNxxxiff
         L9Qw==
X-Gm-Message-State: AO0yUKXpoSY0l4uMTkY3vRwJ3A0avkDI2J5vHY9Q+GbUACYfG+59q0cy
	BI53PaMcryiBWP+HfV6+6Qjh8w==
X-Google-Smtp-Source: AK7set+mjIQ9U9FwzoCkysttHpwwVlWfAcIb6Y3YcixTf6gnCs1ThPx8ely0+6ZyQaFh/CFSlLiVPw==
X-Received: by 2002:a05:600c:3b06:b0:3df:f85a:46fe with SMTP id m6-20020a05600c3b0600b003dff85a46femr22888217wms.40.1676286693823;
        Mon, 13 Feb 2023 03:11:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c379300b003b47b80cec3sm16466893wmr.42.2023.02.13.03.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:11:33 -0800 (PST)
Message-ID: <8c5747c6-0eb4-7314-b343-6d88a38b137b@linaro.org>
Date: Mon, 13 Feb 2023 12:11:31 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/17] dt-bindings: arm: cpus: Add apple,avalanche &
 blizzard compatibles
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-4-cb5442d1c229@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-4-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2023 16:41, Janne Grunau wrote:
> These are the CPU cores in the Apple silicon M2 SoC.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

