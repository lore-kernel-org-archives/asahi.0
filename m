Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1ECF9FB
	for <asahi@lists.linux.dev>; Tue,  9 May 2023 18:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDF4C433D2;
	Tue,  9 May 2023 18:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683656717;
	bh=0P/k6mebKZTKYnXCl/aQwO2Tc3wNx/KJH2Q7j52kkjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SFaU8+6jHTK+YTVoiam0qnoU0UqChEOTWM6zhet5hN42+pyCNQXmBwHxBAVW/oVsx
	 mVkgpqL//w9LIIOsQmE9+r5V+BRGPGeqFq3tzi0BC634vU3hFiYF+U+Uui7kTZbkDx
	 SKOsv9HIvDBtvjF+CG31kXP5I0V1RnWWPvYV1cUR+adIu8dfZPt/pA/yCmd+xL0uXj
	 mkH3n/nPdchaFgEYGDy2mPYeKQKJRnqDrbxhTxpjYi2JMbf65gk6HeX3sB9qi2Egla
	 rm38Q8srjrejq/MPnD+J1ksGovBPH8o+8P+SHY4ZaTiFS11v3+ykqp73Uh71I2gwpA
	 0LdA7mBfcnh4g==
Date: Tue, 9 May 2023 19:25:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Message-ID: <20230509-marxism-plug-759c99ac601c@spud>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tXg5GVPl27ExK2ga"
Content-Disposition: inline
In-Reply-To: <20230509163828.86003-1-povik+lin@cutebit.org>


--tXg5GVPl27ExK2ga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Martin,

On Tue, May 09, 2023 at 06:38:27PM +0200, Martin Povi=C5=A1er wrote:
> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
> mono amplifier with digital input.
>=20
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> ---
>  .../bindings/sound/adi,ssm3515.yaml           | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml b/D=
ocumentation/devicetree/bindings/sound/adi,ssm3515.yaml
> new file mode 100644
> index 000000000000..19b7185ae8e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2019-20 Texas Instruments Incorporated

Copyright here looks a little odd, copy & paste from the TI bindings you
send patches for earlier, or intended?

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/adi,ssm3515.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop the quotes on these please.

> +
> +title: Analog Devices SSM3515 Audio Amplifier
> +
> +maintainers:
> +  - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> +
> +description: |
> +  SSM3515 is a mono Class-D audio amplifier with digital input.
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/SS=
M3515.pdf
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ssm3515
> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,ana-gain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      The value to be set in the ANA_GAIN register field on the codec. T=
his determines
> +      the full voltage span of the codec's analog output.
> +
> +      To quote the datasheet on the available options:
> +
> +        00: 8.4 V Full-Scale Gain Mapping
> +        01: 12.6 V Full-Scale Gain Mapping
> +        10: 14 V Full-Scale Gain Mapping
> +        11: 15 V Full-Scale Gain Mapping

Putting register values into the DT does not seem correct, although
I know nothing about sound and will have to defer to Krzysztof & Co. on
that front.

Cheers,
Conor.

> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,ana-gain
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      codec@14 {
> +        compatible =3D "adi,ssm3515";
> +        reg =3D <0x14>;
> +        #sound-dai-cells =3D <0>;
> +        adi,ana-gain =3D <0>;
> +        sound-name-prefix =3D "Left Tweeter";
> +      };
> +    };
> --=20
> 2.38.3
>=20

--tXg5GVPl27ExK2ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFqQBwAKCRB4tDGHoIJi
0pp5AQCfS8Mv3YefCZm1yQhkJ7tPH2BC/U/0KKONa1u5T0DbyQD+MTbNkTLycV/c
kTuzd+ntH5LiR3vjV1rILXA9XLIoEA4=
=ycLO
-----END PGP SIGNATURE-----

--tXg5GVPl27ExK2ga--
