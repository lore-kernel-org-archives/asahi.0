Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF1B20FB
	for <asahi@lists.linux.dev>; Thu,  9 Jun 2022 18:44:08 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id p69so4274689iod.0
        for <asahi@lists.linux.dev>; Thu, 09 Jun 2022 11:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/DfCD3cuDBq5K2klbggsGdSn0HwRJ4iTJrrtYODZosg=;
        b=fy/B0A0szUX9Szogyz2xCFS9B4KdHZ5ccXHQEI46kPtJoHWUsXMJ5GmIu5soyyljOC
         i/v5AfxVNKb00fPw35pl1ObUSxgC/Fci0+Yd740iiiJizW5VkSzK25wDP46GsERPt+ar
         2zeQPU1ev35KNvBj1z5MdOnndycTwRik1GboBYdBunktFewJ+UpartLZhMawejQmcWfc
         lVXBX625tftJskoD2uL9Sd3jJZY0OYDDrD7pPdcAmM80rFlu196vRAo0MpSfowBxyCMn
         V+2XrBIe3kPOlCYfzrMhoq5THdqdn7lnYL5hVve2M4Z7HidBbCDS9JxMrQmWvtCzuuor
         lLUA==
X-Gm-Message-State: AOAM533Um5lJ3hae9igZm/aZu29TkeqfOTOMuovhrZyyX3IO1O510PIn
	zwX2AvFe2pFdKvfXSd2XAw==
X-Google-Smtp-Source: ABdhPJzjXxrVw5MMqaZ2JwPQdzsGl7hU7LgNBN7cipZ1qhkEhsMizNAjdXeJDaJ78eYYlXv4kPrOcg==
X-Received: by 2002:a02:ceba:0:b0:331:bd1c:a97f with SMTP id z26-20020a02ceba000000b00331bd1ca97fmr10014983jaq.216.1654800247972;
        Thu, 09 Jun 2022 11:44:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id q24-20020a027b18000000b003313005be01sm9823472jac.141.2022.06.09.11.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 11:44:07 -0700 (PDT)
Received: (nullmailer pid 4097584 invoked by uid 1000);
	Thu, 09 Jun 2022 18:44:05 -0000
Date: Thu, 9 Jun 2022 12:44:05 -0600
From: Rob Herring <robh@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] dt-bindings: sound: Add Apple MCA I2S
 transceiver
Message-ID: <20220609184405.GA4091342-robh@kernel.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-2-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606191910.16580-2-povik+lin@cutebit.org>

On Mon, Jun 06, 2022 at 09:19:06PM +0200, Martin Povišer wrote:
> Add binding schema for MCA I2S transceiver found on Apple M1 and other
> chips.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>  .../devicetree/bindings/sound/apple,mca.yaml  | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
> new file mode 100644
> index 000000000000..c8a36d8c38ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/apple,mca.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple MCA I2S transceiver
> +
> +description: |
> +  MCA is an I2S transceiver peripheral found on M1 and other Apple chips. It is
> +  composed of a number of identical clusters which can operate independently
> +  or in an interlinked fashion. Up to 6 clusters have been seen on an MCA.
> +
> +maintainers:
> +  - Martin Povišer <povik+lin@cutebit.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-mca
> +          - apple,t6000-mca
> +      - const: apple,mca
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2

Need to define what each entry is.

> +
> +  interrupts:
> +    maxItems: 6
> +    description: |
> +      One interrupt per each cluster
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  dmas:
> +    minItems: 16
> +    maxItems: 24
> +    description: |
> +      DMA channels associated to the SERDES units within the peripheral. They
> +      are listed in groups of four per cluster, and within the cluster they are
> +      given in order TXA, RXA, TXB, RXB of the respective SERDES units.
> +
> +  dma-names:
> +    minItems: 16
> +    maxItems: 24
> +    description: |
> +      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
> +      based on the associated SERDES unit.

Express as a schema: 

items:
  pattern: '^(tx|rx)[0-5][ab]$'

> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 6
> +    description: |
> +      Clusters' input reference clock.
> +
> +  power-domains:
> +    minItems: 5
> +    maxItems: 7
> +    description: |
> +      First the overall power domain for register access, then the power
> +      domains of individual clusters for their operation.
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - power-domains
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mca: mca@9b600000 {
> +      compatible = "apple,t6000-mca", "apple,mca";
> +      reg = <0x9b600000 0x10000>,
> +            <0x9b500000 0x20000>;
> +
> +      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
> +      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
> +                      <&ps_mca2>, <&ps_mca3>;
> +      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
> +             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
> +             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
> +             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
> +      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
> +                  "tx1a", "rx1a", "tx1b", "rx1b",
> +                  "tx2a", "rx2a", "tx2b", "rx2b",
> +                  "tx3a", "rx3a", "tx3b", "rx3b";
> +
> +      #sound-dai-cells = <1>;
> +    };
> -- 
> 2.33.0
> 
> 
