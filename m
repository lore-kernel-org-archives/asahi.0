Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5067A2F34
	for <asahi@lists.linux.dev>; Wed,  5 Oct 2022 13:24:56 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso12596465fac.6
        for <asahi@lists.linux.dev>; Wed, 05 Oct 2022 06:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XblGBiVWunq/5AH0NgRtHm6ev1QmpK3EFUSqh7n0QCs=;
        b=nDxPE7cia+Gis6kmUM/4wTKHX61ZPrFo4UN3bWMxM9Th03s2MpfcMxwvc5PG07gBMY
         nBuLYIeDe1kfYt3okyGU3tVGAPkZ1k5QXJ8CmTm2NVbZXcisPxpoW+b8JVRq92Q53pJK
         rq3KOaI/YgHwyiRU/ENlY3epyHTFC/QmDLMULrSaBRANYA/l7LAP6gGe5WC9hUOPbLLS
         I9RQqCcK+p0VgC4AqFsVsxKchu5RNp67/GGOT0R7CBeJi+/HVz40mC2q+s9JLviln1tf
         7npqeyiX+or9MxRQxXQEkSq8NDRD+5fbaoIqObQvKO3/9j21ZG/Khak1do5UztcXeocB
         rq5g==
X-Gm-Message-State: ACrzQf2k1dc2z/tyBDjxmiwZZd5PhAl3wbcTylFjkWD2Pv6JAix/esHD
	tldOoQmjkj0foC2Vmugqkg==
X-Google-Smtp-Source: AMsMyM4zkR5tqtiek9zvCWt7nguIIlXqUbUFSNk1htu3119sr35KNk94ROL7OzkIy6DikpU9egKzvQ==
X-Received: by 2002:a05:6870:612c:b0:132:a4d3:e0d8 with SMTP id s44-20020a056870612c00b00132a4d3e0d8mr2533657oae.95.1664976295307;
        Wed, 05 Oct 2022 06:24:55 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:5fee:ea3a:4239:ad4:650a:6e66])
        by smtp.gmail.com with ESMTPSA id m125-20020aca3f83000000b0034ffacec0basm4277982oia.15.2022.10.05.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:24:54 -0700 (PDT)
Received: (nullmailer pid 3268023 invoked by uid 1000);
	Wed, 05 Oct 2022 13:24:53 -0000
Date: Wed, 5 Oct 2022 08:24:53 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Sven Peter <sven@svenpeter.dev>, towinchenmi@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: apple,aic: Document A7-A11
 compatibles
Message-ID: <166497629188.3267955.11156012087252607194.robh@kernel.org>
References: <20221004112724.31621-1-konrad.dybcio@somainline.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004112724.31621-1-konrad.dybcio@somainline.org>

On Tue, 04 Oct 2022 13:27:23 +0200, Konrad Dybcio wrote:
> Document the compatibles for Apple A7-A11 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> - drop s5l8960x fallback for A8-A11, now apple,aic is the fallback for all
> 
>  .../bindings/interrupt-controller/apple,aic.yaml          | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
