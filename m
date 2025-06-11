Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0941E18787A
	for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667614; cv=none; b=cXB++tKFcAuHFC0LBSWJ5ElPJaVipumqMrHV4Goz3JfrdrIRY68f+Gt81nJ3SgBhyhUu/VDYuCaEDSs0F+QQWquMtmdbnnp+yqgO6wxQpxoqqsflwsUEhs2sh6ncJYop1A+1S/pscMDLvTO9RyV9YiwZH6I4FVFf9bB6z/OiPpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667614; c=relaxed/simple;
	bh=a4l2CHrqJdsjNmKQhyuxmXX7as3MmuRLONCmwbTJ5xI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXNY7j3Z21OO8gP2akUQGmVXqDKLNtNk0GnvThLU6QBbLByR0FZHqZ6ZZ50QLA24pWy6LhjdXMqDCyrhi9y7COQrQifRm9+vL8gK1afwwAjuGDgh6GjNfvst16qc8Yyv0JKXekjgl9gtSaz3tuPBG8NCj5m6ca4CoTI+U4pdLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0ZCRbT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0ZCRbT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851B7C4CEEA
	for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667613;
	bh=a4l2CHrqJdsjNmKQhyuxmXX7as3MmuRLONCmwbTJ5xI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t0ZCRbT1V5dmuVIwMEY9Ikzau3JW5DTjSIcQWfl6CCIP87Ji0l2zK3B6HCh3gymN7
	 jDUyYPuxEIBn9qTDHXStZiBkJagm967Oj+i55Aqpa+TX1NlmUlavLLlAf8sjiPJvKe
	 NBM4l8Hzc4DEonxtEfiHYFqKY3cu2KGo2OlT1S4MrxoZ7vyS1S97Nr/AVf58OiAxuA
	 0LaWzAOOMHcOYDvzMXxHmJZcu+yq7P2z/vWuJ7SCNlJ8QsFGMaZyf7gLrgsjbQhqCF
	 r+JYi/KJDrfZd5hMkhB1oeMgDcEDsfJl63raHKXYcU/iWtBsbD4nYI7i4vnHXFw/O+
	 IM9W77M9NfHPA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-addcea380eeso26049366b.0
        for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 11:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX48Il9HE9DVHvaKf6LWnU5eZWqPGkbs6vU+hIpJIsVhQCU1rS5aJkj53pkNWT+3ek/9z0biQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUEfxpF48dpSxGVXaeCx+tC1vyZsdojUh53P4AHC1Ya2MDxMx7
	XTucFB1n1DLKaIQY0+GeEjACQcqQMv/FCqRNi5bQwgy5JaS9fx+/JpA04yX+TakCNQRfpLCXeUl
	ZmlJCadLTLLIUqX7kwWVkdAOxVj2qyg==
X-Google-Smtp-Source: AGHT+IEtiYLqZxPX6vg79k1l4PJrPl4a356jYKlMYVrfSiN34x4GAKFDsw4RbXmE6kLrUUCaPNybODY9V3P09GFhmaM=
X-Received: by 2002:a17:906:6a14:b0:ad8:99cc:774c with SMTP id
 a640c23a62f3a-adea9456cdfmr18086266b.58.1749667612085; Wed, 11 Jun 2025
 11:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Jun 2025 13:46:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Gm-Features: AX0GCFsOeaA5WdIXO14g7zVwNMaCmTI9osasLBHNTNRqJq2RE6YUF5IFXoLClZA
Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:32=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the GPU present in Apple SoCs
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 96 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Docum=
entation/devicetree/bindings/gpu/apple,agx.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..23df3ebd689b1e885eb99ca57=
3343fe7f2d09dc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC GPU
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: apple,agx-g13g
> +      - items:
> +          - enum:
> +              - apple,agx-g13s
> +              - apple,agx-g13c
> +              - apple,agx-g13d
> +          - const: apple,agx-g13x

I'm assuming the 'x' is a wildcard. The preferred thing to do make one
of the 3 actual devices the fallback. Typically, the oldest one is
used.

> +      - items:
> +          - const: apple,agx-g14g

This and the 1st entry can be a single enum.

> +  reg:
> +    items:
> +      - description: ASC coprocessor control
> +      - description: GPU block MMIO registers

Seems odd that the main GPU registers are not first in the list, but
either way is fine.

> +
> +  reg-names:
> +    items:
> +      - const: asc
> +      - const: sgx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  memory-region:
> +    items:
> +      - description: Region containing GPU MMU TTBs
> +      - description: Region containing GPU MMU page tables
> +      - description:
> +          Region containing a shared handoff structure for VM
> +          management coordination
> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
> +      - description: Shared global variables with GPU firmware
> +
> +  memory-region-names:
> +    items:
> +      - const: ttbs
> +      - const: pagetables
> +      - const: handoff
> +      - const: hw-cal-a
> +      - const: hw-cal-b
> +      - const: globals
> +
> +  apple,firmware-compat:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    description:
> +      MacOS version the current firmware is paired with, used to pick
> +      the version of firmware ABI to be used.
> +      Bootloader will overwrite this
> +
> +required:
> +  - compatible
> +  - reg
> +  - mboxes
> +  - memory-region
> +  - apple,firmware-compat
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    gpu@6400000 {
> +        compatible =3D "apple,agx-g13g";
> +        reg =3D <0x6400000 0x40000>,
> +              <0x4000000 0x1000000>;
> +        reg-names =3D "asc", "sgx";
> +        mboxes =3D <&agx_mbox>;
> +        power-domains =3D <&ps_gfx>;
> +        memory-region =3D <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>=
,
> +                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>=
;
> +        memory-region-names =3D "ttbs", "pagetables", "handoff",
> +                              "hw-cal-a", "hw-cal-b", "globals";
> +
> +        apple,firmware-compat =3D <0 0 0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031=
ea3663c39cc8c68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2331,6 +2331,7 @@ F:        Documentation/devicetree/bindings/arm/app=
le/*
>  F:     Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:     Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.y=
aml
>  F:     Documentation/devicetree/bindings/dma/apple,admac.yaml
> +F:     Documentation/devicetree/bindings/gpu/apple,agx.yaml
>  F:     Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:     Documentation/devicetree/bindings/input/touchscreen/apple,z2-mult=
itouch.yaml
>  F:     Documentation/devicetree/bindings/interrupt-controller/apple,*
>
> --
> 2.49.0
>
>
