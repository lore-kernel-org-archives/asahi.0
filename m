Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58194C6C
	for <asahi@lists.linux.dev>; Mon, 12 Sep 2022 21:12:28 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1278624b7c4so26844248fac.5
        for <asahi@lists.linux.dev>; Mon, 12 Sep 2022 14:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Nip0DqpF4pFkRZH+cZCKwsl/yHMaJf5IoaaXn/QNxSk=;
        b=n2hhFA14q2NmJ6rFWeuHJxOloG0uwuVAFGaJIXHb2KOyPMRlIqLmZhkeCKXcyIRfNj
         Mb9cjsx9UkriciRuFd5KyCJND9k1fXT+g/Pg5gTUomQJWgLi2AyHhoaG8mAfrNHhD8BI
         uVg85u9ensm2ECKD03Jm4o5nYBih+MIWurKm8L9d9xLLTLoStW1c4eLy3dCPnKuswHDP
         /ElL99+H+fHCKTNn0VqXvNK28LEBo/R3vkCap9RXsJMc0WbIyYJXDgD7DtFYzghyqCSR
         XfcJHVR7ZB2AMzM2eh2a9yNPdle4genZGZHk9XPnR6ddVZrNupQkU9DgDkseWii/np+M
         Z4DQ==
X-Gm-Message-State: ACgBeo0kXytMK0QYDxis+aFyO9lj7sxJrXS3yS/vGb134RyfKFVdMCaD
	KCl5oKXM+G9EPegZ49qpQA==
X-Google-Smtp-Source: AA6agR7BL/CQtAyYvQvcr+vIkRvAqs7VKLr+Xu8UpOBsWQGAV67Cg2TMBwDDp3CR4aFgS7C2yCTYNw==
X-Received: by 2002:a05:6808:1996:b0:34f:c809:e298 with SMTP id bj22-20020a056808199600b0034fc809e298mr128276oib.184.1663017147764;
        Mon, 12 Sep 2022 14:12:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c186-20020acab3c3000000b0034484c532c7sm4421093oif.32.2022.09.12.14.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 14:12:27 -0700 (PDT)
Received: (nullmailer pid 1872059 invoked by uid 1000);
	Mon, 12 Sep 2022 21:12:26 -0000
Date: Mon, 12 Sep 2022 16:12:26 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sven Peter <sven@svenpeter.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: net: Add Broadcom BCM4377 family
 PCIe Bluetooth
Message-ID: <20220912211226.GA1847448-robh@kernel.org>
References: <20220907170935.11757-1-sven@svenpeter.dev>
 <20220907170935.11757-3-sven@svenpeter.dev>
 <bcb799ea-d58e-70dc-c5c2-daaff1b19bf5@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcb799ea-d58e-70dc-c5c2-daaff1b19bf5@linaro.org>

On Thu, Sep 08, 2022 at 01:19:17PM +0200, Krzysztof Kozlowski wrote:
> On 07/09/2022 19:09, Sven Peter wrote:
> > These chips are combined Wi-Fi/Bluetooth radios which expose a
> > PCI subfunction for the Bluetooth part.
> > They are found in Apple machines such as the x86 models with the T2
> > chip or the arm64 models with the M1 or M2 chips.
> > 
> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
> > ---
> > changes from v1:
> >   - added apple,* pattern to brcm,board-type
> >   - s/PCI/PCIe/
> >   - fixed 1st reg cell inside the example to not contain the bus number
> > 
> > .../bindings/net/brcm,bcm4377-bluetooth.yaml  | 78 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml b/Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml
> > new file mode 100644
> > index 000000000000..fb851f8e6bcb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/brcm,bcm4377-bluetooth.yaml
> > @@ -0,0 +1,78 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/brcm,bcm4377-bluetooth.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom BCM4377 family PCIe Bluetooth Chips
> > +
> > +allOf:
> > +  - $ref: bluetooth-controller.yaml#
> 
> Put it before properties (so after description).
> 
> > +
> > +maintainers:
> > +  - Sven Peter <sven@svenpeter.dev>
> > +
> > +description:
> > +  This binding describes Broadcom BCM4377 family PCIe-attached bluetooth chips
> > +  usually found in Apple machines. The Wi-Fi part of the chip is described in
> > +  bindings/net/wireless/brcm,bcm4329-fmac.yaml.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - pci14e4,5fa0 # BCM4377
> > +      - pci14e4,5f69 # BCM4378
> > +      - pci14e4,5f71 # BCM4387
> > +
> > +  reg:
> > +    description: PCI device identifier.
> 
> maxItems: X

And drop the description.

> 
> > +
> > +  brcm,board-type:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: Board type of the Bluetooth chip. This is used to decouple
> > +      the overall system board from the Bluetooth module and used to construct
> > +      firmware and calibration data filenames.
> > +      On Apple platforms, this should be the Apple module-instance codename
> > +      prefixed by "apple,", e.g. "apple,atlantisb".
> > +    pattern: '^apple,.*'
> > +
> > +  brcm,taurus-cal-blob:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description: A per-device calibration blob for the Bluetooth radio. This
> > +      should be filled in by the bootloader from platform configuration
> > +      data, if necessary, and will be uploaded to the device.
> > +      This blob is used if the chip stepping of the Bluetooth module does not
> > +      support beamforming.
> 
> Isn't it:
> s/beamforming/beam forming/
> ?
> 
> > +
> > +  brcm,taurus-bf-cal-blob:
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    description: A per-device calibration blob for the Bluetooth radio. This
> > +      should be filled in by the bootloader from platform configuration
> > +      data, if necessary, and will be uploaded to the device.
> > +      This blob is used if the chip stepping of the Bluetooth module supports
> > +      beamforming.
> 
> Same here.
> 
> > +
> > +  local-bd-address: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - local-bd-address
> > +  - brcm,board-type
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pcie {
> > +      #address-cells = <3>;
> > +      #size-cells = <2>;
> > +
> > +      bluetooth@0,1 {
> 
> The unit address seems to be different than reg.

Right, this says dev 0, func 1.

dtc can check this, but IIRC it would need 'device_type = "pci";' 
in the parent. So please add that, and verify you get a warning.

Rob
