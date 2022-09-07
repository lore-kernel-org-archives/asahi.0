Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA3A5CA6
	for <asahi@lists.linux.dev>; Wed,  7 Sep 2022 15:47:58 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1278a61bd57so18487623fac.7
        for <asahi@lists.linux.dev>; Wed, 07 Sep 2022 08:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=P9M7/bzZ0ZMw/d0qpnlcd3bSu1NtUDhgwC52m6jfjak=;
        b=P+RFXbIM/ZfYq46pKhDDS9/5LlbsW1vVfERHj1acwPEPd7wPlmQqjQ3ty2RWWNfjFc
         mjawty2TGghQZIHPeeK6ZMNWsnv7fgX4tmN/U7Sr6oNB9G0+6cyU0mPUzEE3tw4InHL6
         gwRpMZYP8VR1sPWv10+AuOxsEe3voCMDnYP1eXLHsCGWE7hWnMXQf6GQhWGE08eCMBvj
         v7UZoSRBgq7Al5dJcpZZOrhVWO1Q7bmQbp/dpyYTn4JavDlr6ipUe4pELMqHPNkkD8Yb
         4hJx4eTSQxpIgAeevklivGBP7/DkHoHCzhV711D8hJxWyz3huPs73wgNln+MvNtUs1ZX
         znYg==
X-Gm-Message-State: ACgBeo0+0yQkKFXQQNxS+Yed4kgM9V1e09YoRMDJvLpNd623X4HePW+l
	F8ulUn+OPiusg3NJj/EzYQ==
X-Google-Smtp-Source: AA6agR7V8XXJWCZA66/vmCNdtFQHBPBeY7vIpPYKBM+iV7v+1t93G419nZX9b4Lu3VamSExZLcbo0Q==
X-Received: by 2002:a05:6808:1489:b0:344:7ff8:54e8 with SMTP id e9-20020a056808148900b003447ff854e8mr12233447oiw.195.1662565677655;
        Wed, 07 Sep 2022 08:47:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bm23-20020a0568081a9700b0034480f7eec4sm6558187oib.12.2022.09.07.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:47:57 -0700 (PDT)
Received: (nullmailer pid 3514416 invoked by uid 1000);
	Wed, 07 Sep 2022 15:47:56 -0000
Date: Wed, 7 Sep 2022 10:47:56 -0500
From: Rob Herring <robh@kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Hector Martin <marcan@marcan.st>, Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Rafa__ Mi__ecki <zajec5@gmail.com>, SHA-cyfmac-dev-list@infineon.com, Sven Peter <sven@svenpeter.dev>, van Spriel <arend@broadcom.com>
Subject: Re: [PATCH net-next 01/12] dt-bindings: net: bcm4329-fmac: Add Apple
 properties & chips
Message-ID: <20220907154756.GA3505310-robh@kernel.org>
References: <YxhMaYOfnM+7FG+W@shell.armlinux.org.uk>
 <E1oVpmk-005LBL-5U@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oVpmk-005LBL-5U@rmk-PC.armlinux.org.uk>

On Wed, Sep 07, 2022 at 08:47:46AM +0100, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This binding is currently used for SDIO devices, but these chips are
> also used as PCIe devices on DT platforms and may be represented in the
> DT. Re-use the existing binding and add chip compatibles used by Apple
> T2 and M1 platforms (the T2 ones are not known to be used in DT
> platforms, but we might as well document them).
> 
> Then, add properties required for firmware selection and calibration on
> M1 machines.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/wireless/brcm,bcm4329-fmac.yaml       | 37 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> index 53b4153d9bfc..53ded82b273a 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Broadcom BCM4329 family fullmac wireless SDIO devices
> +title: Broadcom BCM4329 family fullmac wireless SDIO/PCIE devices
>  
>  maintainers:
>    - Arend van Spriel <arend@broadcom.com>
> @@ -42,10 +42,16 @@ title: Broadcom BCM4329 family fullmac wireless SDIO devices
>                - cypress,cyw43012-fmac
>            - const: brcm,bcm4329-fmac
>        - const: brcm,bcm4329-fmac

If you respin, this compatible can be combined with the enum below.

> +      - enum:
> +          - pci14e4,43dc  # BCM4355
> +          - pci14e4,4464  # BCM4364
> +          - pci14e4,4488  # BCM4377
> +          - pci14e4,4425  # BCM4378
> +          - pci14e4,4433  # BCM4387


Reviewed-by: Rob Herring <robh@kernel.org>
