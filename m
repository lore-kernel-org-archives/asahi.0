Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF809601B
	for <asahi@lists.linux.dev>; Tue,  5 Jul 2022 19:19:00 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id p9so7861362ilj.7
        for <asahi@lists.linux.dev>; Tue, 05 Jul 2022 12:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HkWyYi1Y3vFcT2PDs2Eyw+VTCUEaA7uXAXTuzJrLtsY=;
        b=MM13D84bl5BurM5yzJwqFlN0tgKdmd9VMqMl03AkllLRHAPA9iVq0gCBxGOsH+u8G/
         AT9dRaLe8WQxaoOvKDyPCpW4+cKbSZL3ne7NI/aVdorBd0e6QZQMsBvmYyq1j73kWYkX
         cQtow3RNx8ambOgMqzTJI/f2F9N1HBxdXZ1yGL0ov/yRdHSt/NYyRLfY0KnRhYyagb7A
         FqH8NwpCVDY3wLDhp1J8XJ0Gl7wxCg/oqBW/qL2ky7tNoKy3L/u2AAuFjjhcEnzO0NDs
         HlSk+grJewIbSkgzljnITdtFCsUqWm9z+popVtz2W1qeb8TFpqsQ/EvWjIZ1nTzTUFKy
         Iykw==
X-Gm-Message-State: AJIora+zLN2TbYqBTWXOsbyKLWXK8XzNSBU3jeAkBfwo7U/oAhAhJ//+
	3qxVaS/nm08LeNMVpavqfQ==
X-Google-Smtp-Source: AGRyM1vdzd9ImcLTIEnKAzJRYqtQ2TsGIfLnVMJa6Wx/iz9Q52vAZPVFFCMS7A72EzjGf+XbRGSpwA==
X-Received: by 2002:a05:6e02:18c9:b0:2da:da9d:2ab1 with SMTP id s9-20020a056e0218c900b002dada9d2ab1mr17158155ilu.90.1657048739720;
        Tue, 05 Jul 2022 12:18:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bm13-20020a05663842cd00b0032ead96ee5csm14880002jab.165.2022.07.05.12.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:18:59 -0700 (PDT)
Received: (nullmailer pid 2471228 invoked by uid 1000);
	Tue, 05 Jul 2022 19:18:57 -0000
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Janne Grunau <j@jannau.net>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Krishna Reddy <vdumpa@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>, Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev, Will Deacon <will@kernel.org>, Sameer Pujar <spujar@nvidia.com>, iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220705130652.433496-1-thierry.reding@gmail.com>
References: <20220705125834.431711-2-thierry.reding@gmail.com> <20220705130652.433496-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v7] dt-bindings: reserved-memory: Document iommu-addresses
Date: Tue, 05 Jul 2022 13:18:57 -0600
Message-Id: <1657048737.387965.2471227.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

On Tue, 05 Jul 2022 15:06:52 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This adds the "iommu-addresses" property to reserved-memory nodes, which
> allow describing the interaction of memory regions with IOMMUs. Two use-
> cases are supported:
> 
>   1. Static mappings can be described by pairing the "iommu-addresses"
>      property with a "reg" property. This is mostly useful for adopting
>      firmware-allocated buffers via identity mappings. One common use-
>      case where this is required is if early firmware or bootloaders
>      have set up a bootsplash framebuffer that a display controller is
>      actively scanning out from during the operating system boot
>      process.
> 
>   2. If an "iommu-addresses" property exists without a "reg" property,
>      the reserved-memory node describes an IOVA reservation. Such memory
>      regions are excluded from the IOVA space available to operating
>      system drivers and can be used for regions that must not be used to
>      map arbitrary buffers.
> 
> Each mapping or reservation is tied to a specific device via a phandle
> to the device's device tree node. This allows a reserved-memory region
> to be reused across multiple devices.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v7:
> - keep reserved-memory.txt to avoid broken references
> 
> Changes in v6:
> - add device phandle to iommu-addresses property in examples
> - remove now unused dt-bindings/reserved-memory.h header
> ---
>  .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:22.7-45: Warning (reg_format): /reserved-memory/framebuffer@90000000:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:29.7-40: Warning (reg_format): /bus@0/adsp@2990000:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:34.7-42: Warning (reg_format): /bus@0/display@15200000:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:9.5-12: Warning (ranges_format): /reserved-memory:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:27.9-37.5: Warning (unit_address_vs_reg): /bus@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:21.30-24.7: Warning (avoid_default_addr_size): /reserved-memory/framebuffer@90000000: Relying on default #address-cells value
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:21.30-24.7: Warning (avoid_default_addr_size): /reserved-memory/framebuffer@90000000: Relying on default #size-cells value
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:28.24-31.7: Warning (avoid_default_addr_size): /bus@0/adsp@2990000: Relying on default #address-cells value
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:28.24-31.7: Warning (avoid_default_addr_size): /bus@0/adsp@2990000: Relying on default #size-cells value
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:33.27-36.7: Warning (avoid_default_addr_size): /bus@0/display@15200000: Relying on default #address-cells value
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dts:33.27-36.7: Warning (avoid_default_addr_size): /bus@0/display@15200000: Relying on default #size-cells value
Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: /: bus@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/root-node.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: /: 'compatible' is a required property
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/root-node.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reserved-memory/reserved-memory.example.dtb: /: 'model' is a required property
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

