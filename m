Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DA7C
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 11:19:21 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id k10so12559362lfm.4
        for <asahi@lists.linux.dev>; Thu, 08 Sep 2022 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=iNS4D8S65NtETFVlL5t6U8r/BJqMmTweciJ4EUvTtkU=;
        b=Agb4n/PkJh9KNvgaGgewkPd2pInTS1xvRzqSeJtko+vl6q6Bi/ZF5/0eFTUhkYUbNb
         GPTiGBvmjQV50ga5vDtJxlaiF9jqaRHlq9gWS3h0tKgxPsNEPM/GXQpjcywZYc8o8+Ly
         +f9cFHPsCST7fTQIsPAE8MGTqq4WuGMPkkShwUP1z8Up2boqP2iFCyYxtp/xlNCrZzxO
         yPUUX+MbNB43/GyfKar520l072jW26fqkA5FrKQZs8uAc+i4B4o2fR4Fb1FOwPkxzcsz
         b9Lce2ZYnEvViv+AsYe1N5cqKgMezKtQKy5dKBFxLLFZQ2zLInkCEQRU17vtPzPOBvSS
         fG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=iNS4D8S65NtETFVlL5t6U8r/BJqMmTweciJ4EUvTtkU=;
        b=qtxmH+6BGfVbh5BrIRJ1uepVSJ6qpaDrB6RtZpuFv7MHU6sutSgOiWkVTkwV4IFOXB
         5a2VRR1IqiXgd4yd6SUtOFyzkWcQUAoYubAYbCgzr/dkTZy5IQwuOD6CHsay7y+HxyFD
         xvft1eggwqs57hZn+RVNVVM3lZUyzSlqQvtt0hUhHOVsOfYMi+bl6WK5+E6qVerIhbPm
         TLPvmjxeD3XqY2CfJLS7DVRd+o7YrtuxpmQqwNXkMwWrJ8j8e7/RADyaVJVgCKMPmBaX
         UAmywUSXo7irJ97ww1S2kh/0XCuvjijYP1YfXsDF+RWSnYqu71OqUnXW/S5cfrrao/iG
         6byQ==
X-Gm-Message-State: ACgBeo2IYCgMdtRlP2b7B/ZXI+X33FmEXkxeUMKN6QQHrhPCRlD20wuJ
	jBkIamhbCgJIMk0tUAQtg72LZQ==
X-Google-Smtp-Source: AA6agR69Y8vwmrHUvKObGzWP7Nlk4SetLItoUzeAWtumVSWoKGzQstY7fN7XL6OTB4HvjPFGGx80Rw==
X-Received: by 2002:a05:6512:1154:b0:48b:3020:b29 with SMTP id m20-20020a056512115400b0048b30200b29mr2461897lfg.338.1662635959295;
        Thu, 08 Sep 2022 04:19:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i5-20020a056512318500b0048d1101d0d6sm228678lfe.121.2022.09.08.04.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:19:18 -0700 (PDT)
Message-ID: <bcb799ea-d58e-70dc-c5c2-daaff1b19bf5@linaro.org>
Date: Thu, 8 Sep 2022 13:19:17 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/5] dt-bindings: net: Add Broadcom BCM4377 family PCIe
 Bluetooth
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220907170935.11757-1-sven@svenpeter.dev>
 <20220907170935.11757-3-sven@svenpeter.dev>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907170935.11757-3-sven@svenpeter.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2022 19:09, Sven Peter wrote:
> These chips are combined Wi-Fi/Bluetooth radios which expose a
> PCI subfunction for the Bluetooth part.
> They are found in Apple machines such as the x86 models with the T2
> chip or the arm64 models with the M1 or M2 chips.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> changes from v1:
>   - added apple,* pattern to brcm,board-type
>   - s/PCI/PCIe/
>   - fixed 1st reg cell inside the example to not contain the bus number
> 
> .../bindings/net/brcm,bcm4377-bluetooth.yaml  | 78 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml
> new file mode 100644
> index 000000000000..fb851f8e6bcb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/brcm,bcm4377-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM4377 family PCIe Bluetooth Chips
> +
> +allOf:
> +  - $ref: bluetooth-controller.yaml#

Put it before properties (so after description).

> +
> +maintainers:
> +  - Sven Peter <sven@svenpeter.dev>
> +
> +description:
> +  This binding describes Broadcom BCM4377 family PCIe-attached bluetooth chips
> +  usually found in Apple machines. The Wi-Fi part of the chip is described in
> +  bindings/net/wireless/brcm,bcm4329-fmac.yaml.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci14e4,5fa0 # BCM4377
> +      - pci14e4,5f69 # BCM4378
> +      - pci14e4,5f71 # BCM4387
> +
> +  reg:
> +    description: PCI device identifier.

maxItems: X

> +
> +  brcm,board-type:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Board type of the Bluetooth chip. This is used to decouple
> +      the overall system board from the Bluetooth module and used to construct
> +      firmware and calibration data filenames.
> +      On Apple platforms, this should be the Apple module-instance codename
> +      prefixed by "apple,", e.g. "apple,atlantisb".
> +    pattern: '^apple,.*'
> +
> +  brcm,taurus-cal-blob:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: A per-device calibration blob for the Bluetooth radio. This
> +      should be filled in by the bootloader from platform configuration
> +      data, if necessary, and will be uploaded to the device.
> +      This blob is used if the chip stepping of the Bluetooth module does not
> +      support beamforming.

Isn't it:
s/beamforming/beam forming/
?

> +
> +  brcm,taurus-bf-cal-blob:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: A per-device calibration blob for the Bluetooth radio. This
> +      should be filled in by the bootloader from platform configuration
> +      data, if necessary, and will be uploaded to the device.
> +      This blob is used if the chip stepping of the Bluetooth module supports
> +      beamforming.

Same here.

> +
> +  local-bd-address: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - local-bd-address
> +  - brcm,board-type
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie {
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +
> +      bluetooth@0,1 {

The unit address seems to be different than reg.

> +        compatible = "pci14e4,5f69";
> +        reg = <0x100 0x0 0x0 0x0 0x0>;
> +        brcm,board-type = "apple,honshu";
> +        /* To be filled by the bootloader */
> +        local-bd-address = [00 00 00 00 00 00];
> +      };
> +    };

Best regards,
Krzysztof
