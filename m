Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA617F
	for <asahi@lists.linux.dev>; Mon,  1 Aug 2022 15:23:42 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id h145so8610066iof.9
        for <asahi@lists.linux.dev>; Mon, 01 Aug 2022 08:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=h+EaozKCPOAR4Pt7H3+DF41E8A2I4TARDu5JctlsAKc=;
        b=NMPsd3ByUl55/9ICwMM59nYqJZqEkeORgL4o4lwbm/3LOAWy5D56qyPjSUlpdCD78B
         cFMtt8ftvfaEQdeOr22uaYiGXqZcEZw0KI3FL+pURyl5/rA2W1wKrEZWBWPoghLHqL4M
         Jl7XWpzIA7ll8LItM6UYKrwcoYfAIzUbuFKtDV4n10pclGIZIZcYBS5BIEdRtAFbglIs
         vOuX4fpFMalFx/qTdLsL7lgCQTlwxLg3orbWecSR04QITyZtsQ69bIrbEI3S2tKtd1hd
         kLpajWyJ34yNqLzQwqPH9KnFdDFbzN7hI9Tt4Mn4OTocVU6bfjrZeN6iPGaF3Rgies39
         s79Q==
X-Gm-Message-State: AJIora+zmma4mnW8l6DY0lJ8Q33N4D2C9+U3aHzOP4hiU+pSeKthUIiM
	O20XtWU+hYM9dp9fUIVETg==
X-Google-Smtp-Source: AGRyM1sbtEtvoAfQUhoXHdTBPOIKR4FoungfLRb+EiLPBcmuQIEkA8rGIIDK77b+f14A5MTJsKzOXQ==
X-Received: by 2002:a02:cbcd:0:b0:33f:6f8c:f4a6 with SMTP id u13-20020a02cbcd000000b0033f6f8cf4a6mr6450682jaq.300.1659367421281;
        Mon, 01 Aug 2022 08:23:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y8-20020a027308000000b00339c4e447e2sm5384819jab.151.2022.08.01.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 08:23:40 -0700 (PDT)
Received: (nullmailer pid 1045598 invoked by uid 1000);
	Mon, 01 Aug 2022 15:23:38 -0000
Date: Mon, 1 Aug 2022 09:23:38 -0600
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: net: Add generic Bluetooth controller
Message-ID: <20220801152338.GB1031441-robh@kernel.org>
References: <20220801103633.27772-1-sven@svenpeter.dev>
 <20220801103633.27772-2-sven@svenpeter.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801103633.27772-2-sven@svenpeter.dev>

On Mon, Aug 01, 2022 at 12:36:29PM +0200, Sven Peter wrote:
> Bluetooth controllers share the common local-bd-address property.
> Add a generic YAML schema to replace bluetooth.txt for those.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> I hope it's fine to list the current Bluetooth maintainers in here
> as well.
> 
>  .../bindings/net/bluetooth-controller.yaml    | 30 +++++++++++++++++++
>  .../devicetree/bindings/net/bluetooth.txt     |  6 +---
>  2 files changed, 31 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth-controller.yaml b/Documentation/devicetree/bindings/net/bluetooth-controller.yaml
> new file mode 100644
> index 000000000000..0ea8a20e30f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth-controller.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bluetooth Controller Generic Binding
> +
> +maintainers:
> +  - Marcel Holtmann <marcel@holtmann.org>
> +  - Johan Hedberg <johan.hedberg@gmail.com>
> +  - Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^bluetooth(@.*)?$"
> +
> +  local-bd-address:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 6
> +    maxItems: 6
> +    description:
> +      Specifies the BD address that was uniquely assigned to the Bluetooth
> +      device. Formatted with least significant byte first (little-endian), e.g.
> +      in order to assign the address 00:11:22:33:44:55 this property must have
> +      the value [55 44 33 22 11 00].
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/bluetooth.txt b/Documentation/devicetree/bindings/net/bluetooth.txt
> index 94797df751b8..3cb5a7b8e5ad 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/bluetooth.txt
> @@ -1,5 +1 @@
> -The following properties are common to the Bluetooth controllers:
> -
> -- local-bd-address: array of 6 bytes, specifies the BD address that was
> -  uniquely assigned to the Bluetooth device, formatted with least significant
> -  byte first (little-endian).
> +This file has been moved to bluetooth-controller.yaml.

There's one reference to bluetooth.txt. Update it and remove this file.

Rob
