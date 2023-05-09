Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE70174E6
	for <asahi@lists.linux.dev>; Tue,  9 May 2023 19:38:49 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683661126; bh=phU5h8y0oMRwi2ThZZnGKdLtQF3CnRbkMjIYN0/eHWI=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=iMrlfDHQSCycs969tMDE/i71ih4h1OCAaIBdjXCG+X7OlAbzEvK6YBwS3w12gdsnY
	 YG7Aux2+inDEd3XHCTKrxrFa+V9oyf8Lw/xBbA7p1mhWPKzIvUdp2n4fGrMF6gNgvB
	 JngPMVGxtpaTa5f1XA1MHrOww6w+evnSb0GzLG0U=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20230509-marxism-plug-759c99ac601c@spud>
Date: Tue, 9 May 2023 21:38:46 +0200
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 asahi@lists.linux.dev,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0216884B-A6F4-46B0-AEB9-AA16B3F24C8C@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
To: Conor Dooley <conor@kernel.org>

Hello Conor,

> On 9. 5. 2023, at 20:25, Conor Dooley <conor@kernel.org> wrote:
>=20
> Hey Martin,
>=20
> On Tue, May 09, 2023 at 06:38:27PM +0200, Martin Povi=C5=A1er wrote:
>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>> mono amplifier with digital input.
>>=20
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> ---
>> .../bindings/sound/adi,ssm3515.yaml           | 66 =
+++++++++++++++++++
>> 1 file changed, 66 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml =
b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> new file mode 100644
>> index 000000000000..19b7185ae8e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2019-20 Texas Instruments Incorporated
>=20
> Copyright here looks a little odd, copy & paste from the TI bindings =
you
> send patches for earlier, or intended?

Yeah, that must have been a copypaste from the other schemas. Not =
intended
in any case. Thanks for the catch.

>=20
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/sound/adi,ssm3515.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>=20
> Drop the quotes on these please.

OK

>> +
>> +  adi,ana-gain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2, 3]
>> +    description: |
>> +      The value to be set in the ANA_GAIN register field on the =
codec. This determines
>> +      the full voltage span of the codec's analog output.
>> +
>> +      To quote the datasheet on the available options:
>> +
>> +        00: 8.4 V Full-Scale Gain Mapping
>> +        01: 12.6 V Full-Scale Gain Mapping
>> +        10: 14 V Full-Scale Gain Mapping
>> +        11: 15 V Full-Scale Gain Mapping
>=20
> Putting register values into the DT does not seem correct, although
> I know nothing about sound and will have to defer to Krzysztof & Co. =
on
> that front.

It=E2=80=99s an analog gain selection, it just seemed most honest and =
convenient
to defer to the register field in describing of what this property does.

I thought this should be here, and not with the other gain controls to =
be
exported to userspace, since it relates to the supply voltage. You =
probably
can=E2=80=99t select a gain value close or over the amp=E2=80=99s supply =
and expect proper
functioning, so the value here should be the system=E2=80=99s integrator =
choice.

On second thought there doesn=E2=80=99t seem to be any risk of damage to =
the amp
itself, so the knowledge of what=E2=80=99s the optimal value could be =
left up to
ALSA use-case configuration, and there=E2=80=99s no real downside in =
treating it
like other gain controls.

I think I will remove it in the next iteration.

> Cheers,
> Conor.

Cheers, Martin=
