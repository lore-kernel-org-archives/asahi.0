Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73733DA
	for <asahi@lists.linux.dev>; Tue, 13 Sep 2022 13:08:16 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-11e9a7135easo31917376fac.6
        for <asahi@lists.linux.dev>; Tue, 13 Sep 2022 06:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gYRvuQ2qdE1v5ZxvpALuLEYAx8HMvTd8N+InKp0h9SA=;
        b=54Iz4gHbn8eLqMmLrXosib7l8FmVo6hfaWmIIMc/4cIr6da774sPJasHVj/XX0y1Uz
         WbSFM0bIXl7CsVkmY2zTPOPqmOmivJg92pQyaqKhtXSdypArWb4FFp0hE8Sfzy/eSfxm
         7TtrBuiT0KrjfPzeMx9AvZmsKYWp2QWQtBamalKXRU2U2UuDYqNB5ddbx4W50isI4uy5
         XdRhELX0EHrY/bzwP5VDEzRHwHmZZDMuFkJkKkc3Y+i3HvlifDmj4RB+NtQyLmGIcALH
         89ZoDqgQso2EZK4NkFdjKdydo0uGOw7IiKnr5C6ZHwz9QacCgg9f/hh3vVBz6u7dUAdp
         liZg==
X-Gm-Message-State: ACgBeo3ku9ctEBIfMhvw+q+PcW3fzqZpcgbJH3yOQKM1T65JpFZBBre6
	Jg+LOQK9c7BHj2jKrqGJig==
X-Google-Smtp-Source: AA6agR543D8vV1CKE1eBM4ij6qnbQIN4icm49CwBYIRIDsP8JddOUmDai/27liOGBenmYu1KFZrc7w==
X-Received: by 2002:a05:6870:ac0d:b0:127:bf92:581f with SMTP id kw13-20020a056870ac0d00b00127bf92581fmr1818362oab.270.1663074495871;
        Tue, 13 Sep 2022 06:08:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h24-20020a056830165800b0063974238a5dsm6077956otr.63.2022.09.13.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:08:15 -0700 (PDT)
Received: (nullmailer pid 3499949 invoked by uid 1000);
	Tue, 13 Sep 2022 13:08:14 -0000
Date: Tue, 13 Sep 2022 08:08:14 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Marc Zyngier <maz@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter <sven@svenpeter.dev>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC PATCH 01/10] dt-bindings: apple,aic: Fix required item
 "apple,fiq-index" in affinity description
Message-ID: <20220913130814.GA3495877-robh@kernel.org>
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-2-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909135103.98179-2-j@jannau.net>

On Fri, 09 Sep 2022 15:50:54 +0200, Janne Grunau wrote:
> Fixes: dba07ad11384 ("dt-bindings: apple,aic: Add affinity description for per-cpu pseudo-interrupts")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> 
>  .../devicetree/bindings/interrupt-controller/apple,aic.yaml     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied with added commit msg, thanks!
