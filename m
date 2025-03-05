Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77772E3373
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741212213; cv=none; b=l0zyfvOugJQ/2dRmFzUOytbRvsvalP+4TSIxGmXKCRXCfk6RxQ6oz7r+K/Fvv9BGRX15a7HleuvripEqV3VgxsXTHzqiV2hQPa6p60UCq4oI0pMtfAF8CwIdjj6gaGJ1sRzNagI5tyhMMQMnyEY9vidBVNmgLYwERvSYwuXdLH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741212213; c=relaxed/simple;
	bh=AuZX0k4J+y7Fl597Q3qYcQ62dP5uV+mEmKMcR183I8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGzUmKuAjGm9tPy7xDGDZJ0gLIOHzX8MjOisce3760MONZ68PioBYH6UFbAcbuDVvziEZSEfpv2+xT2jmirmf0TdNfVgLR2SxniwXFRj82otPFIlhm27sTkViJTkgERq/8amiwvKwEFYimsTh5U/uQnVQTXOGaGAv1GEgr2e7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3uZLot+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3uZLot+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976A9C4CED1
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741212213;
	bh=AuZX0k4J+y7Fl597Q3qYcQ62dP5uV+mEmKMcR183I8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E3uZLot++NoX1QuGeuB1ywM0iMCW9BY/dUHozSIe6YeMEaBBo+FNkou2slG2sTT16
	 XtrSbn+LHOsUMWCEzOHVMk/oCWHRZO24VGEOekKZ/IO4Qj3b5fcToUZlUNQuZ63kRf
	 MyUm91vjFKVTt7r+PVskaiE3V1lw/mj3eKe8/E24pUVs6adZU1yFry+LBff+QEL//E
	 mtszwk2/AhusFbB8SaPR0qD1gCmH4Ihz6V7odZyhSCI4M3fboFZzGezcE8bdAkFXN2
	 Bkp8vKGFq+015ojJivNycoBbiys1th1vAPplXsmmpiCYTDy94q1ggXBpHyaq9lNKGD
	 bYdv1twsOaJnw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso8726130a12.0
        for <asahi@lists.linux.dev>; Wed, 05 Mar 2025 14:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1bHAS4svqF0vqYXMyQAI0satMyvBSIl0DlCxLHFlEPdXOPqqfpJjeFkWhx9tezQ2CjuLp/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzrnFjW2fY/43Zn3WhQ5OEj49fKJ+dsePyn+IxTk/9U+L8ilvF
	Hj5VGfBV4G4MVwAF7vOB1DfyzGfhkQ/rF39SgajoCjkeXpAqBQUEjMgd+Vo6xe3g63dokyn+o/C
	nTf0F45HcCfV4S4gLaGO/fyisHg==
X-Google-Smtp-Source: AGHT+IEgVRtlsezpX5b++OEHsLeJ5YfSiDLhg2WTfyj9apRylNyWIq49BTWXdchR23XeZP/6kY22w/WIpF8duYPGXC8=
X-Received: by 2002:a05:6402:278c:b0:5e4:cbee:234c with SMTP id
 4fb4d7f45d1cf-5e59f37da3amr3722807a12.10.1741212212066; Wed, 05 Mar 2025
 14:03:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com> <20250305-spmi-v1-1-c98f561fa99f@gmail.com>
In-Reply-To: <20250305-spmi-v1-1-c98f561fa99f@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 5 Mar 2025 16:03:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJU0AqQcVNTJqrHTAu7wDP4bbLC8vPHP-XvdojuS8nDiQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrZJb27R_ZaDMQImLR-ewtli_PZor_H4oY5_eu3nzcS9Zd_Cj-X6G4QAXw
Message-ID: <CAL_JsqJU0AqQcVNTJqrHTAu7wDP4bbLC8vPHP-XvdojuS8nDiQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple SPMI controller
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 2:26=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the SPMI controller present on most Apple SoCs
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/spmi/apple,spmi.yaml       | 56 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 57 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6404af8adec52f4631200c489=
56f4c1695e88a39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SPMI controller
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: A SPMI controller present on most Apple SoCs
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-spmi
> +          - apple,t6000-spmi
> +          - apple,t8112-spmi
> +      - const: apple,spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "pmu@[0-9a-f]$":

Typically 'pmic' is the name used here. However, you should just drop
this because spmi.yaml already defines child node structure.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +    type: object
> +
> +    description:
> +      PMIC properties, which are specific to the used SPMI PMIC device(s=
).
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@920a1300 {
> +        compatible =3D "apple,t6000-spmi", "apple,spmi";
> +        reg =3D <0x920a1300 0x100>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        pmu@f {
> +            reg =3D <0xf SPMI_USID>;
> +            /* PMIC-specific properties */
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0e33544fa373a4978b7dae18c040c..271ff8110df83c2d4fe7fbbff=
fc0a72259460bc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2236,6 +2236,7 @@ F:        Documentation/devicetree/bindings/pci/app=
le,pcie.yaml
>  F:     Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:     Documentation/devicetree/bindings/power/apple*
>  F:     Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> +F:     Documentation/devicetree/bindings/spmi/apple,spmi.yaml
>  F:     Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>  F:     arch/arm64/boot/dts/apple/
>  F:     drivers/bluetooth/hci_bcm4377.c
>
> --
> 2.48.1
>
>
