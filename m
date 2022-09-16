Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2862F59
	for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 18:38:47 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id ck2-20020a056830648200b0065603aef276so10006741otb.12
        for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 11:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=xo/d/N34lTwigjgh8R+6n/VWTdyA9uD8vMADayXwoxU=;
        b=Fzb4uDix6TWmF5b4rkLK5S7PPRs0B0WmeEO1QpCjlR/iR8X4xg1kPqk78on6XXLXIq
         FaAAjk2Bs/DzvBipADe99uMblzoJxBMBNzpfxEculrOxkA4QHR+HbSsxxB8MN2Lq5gkT
         Afd5zsiYyCc2sCaUdKjgYgEBpL06GOFld6bhG4F6UfQxxLhqtxITjs+3bsTkFF4JR84S
         7gX3jFTN0+o9CkR/e1l9JOO8cn++saFpbti1bpyMLEwjD4GOwobkLZnPaJmmFiQ762i2
         0PsTDq24Jith9kpmF4YWiAxwnSBU75fooHWu21FVonH0NaqYPqOiXcaZve4YBqtTNT2T
         0ddg==
X-Gm-Message-State: ACrzQf1o8YzKycGdQTznWh9alnPWvOcvBQQIr+gyU5q98sTxg/zvMLgY
	2Ca3zjjXRWw13RsEgKZZwA==
X-Google-Smtp-Source: AMsMyM7LURM228JuPzwCGullRsDqUgiNrVGRngnC/lcXYvPwciH2Tsmaug3XlkralOAWGjBBT+qolw==
X-Received: by 2002:a05:6830:244d:b0:655:e902:7e47 with SMTP id x13-20020a056830244d00b00655e9027e47mr2980448otr.66.1663353527029;
        Fri, 16 Sep 2022 11:38:47 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w19-20020a056830145300b0063725d33561sm10214318otp.73.2022.09.16.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:38:46 -0700 (PDT)
Received: (nullmailer pid 1043197 invoked by uid 1000);
	Fri, 16 Sep 2022 18:38:45 -0000
Date: Fri, 16 Sep 2022 13:38:45 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, Sven Peter <sven@svenpeter.dev>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH v1 02/10] dt-bindings: apple,aic2: Add CPU PMU per-cpu
 pseudo-interrupts
Message-ID: <20220916183845.GA1043137-robh@kernel.org>
References: <20220916142550.269905-1-j@jannau.net>
 <20220916142550.269905-3-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916142550.269905-3-j@jannau.net>

On Fri, 16 Sep 2022 16:25:42 +0200, Janne Grunau wrote:
> Advertise the two pseudo-interrupts that tied to the two PMU
> flavours present in the Apple M1 Pro/Max/Ultra SoC.
> 
> We choose the expose two different pseudo-interrupts to the OS
> as the e-core PMU is obviously different from the p-core one,
> effectively presenting two different devices.
> 
> Imported from "apple,aic".
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Marc Zyngier <maz@kernel.org>
> 
> ---
> 
> Changes in v1:
> - Added Krzysztof's and Marc's ack
> 
> 
> ---
>  .../interrupt-controller/apple,aic2.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
