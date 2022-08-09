Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616615AC
	for <asahi@lists.linux.dev>; Tue,  9 Aug 2022 08:40:12 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1660034408; bh=ocENm80MLW5PFFZzg4otiD+/O1XDTvMnr6yPMkKdupI=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=ZI5tbbVAk8aEHnffQ8NGMg5OJj0LvJlOP9dZhS378eclIt12/zkCM2QGsS8RwymIU
	 2BqgLJ/prI99QcthrBWHWNDXeWO18k4vjBgehVgE6/fNGhl+uSl68aF2KKNU5Rl7Gx
	 l8dBKAp3/sAd0ZWjiH3JVm4rQ09O8PdaTKcjTbcw=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Apple MCA I2S transceiver
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <8ce59940-f559-35cb-5f86-37399da166a1@linaro.org>
Date: Tue, 9 Aug 2022 10:40:07 +0200
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 asahi@lists.linux.dev,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DCBCB694-F5A3-4E76-9518-89E9A1A4AB55@cutebit.org>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-2-povik+lin@cutebit.org>
 <8ce59940-f559-35cb-5f86-37399da166a1@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



> On 9. 8. 2022, at 10:15, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>=20
> On 09/08/2022 01:41, Martin Povi=C5=A1er wrote:
>> Add binding schema for MCA I2S transceiver found on Apple M1 and =
other
>> chips.
>=20
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
>> +title: Apple MCA I2S transceiver
>> +
>> +description: |
>> +  MCA is an I2S transceiver peripheral found on M1 and other Apple =
chips. It is
>> +  composed of a number of identical clusters which can operate =
independently
>> +  or in an interlinked fashion. Up to 6 clusters have been seen on =
an MCA.
>> +
>> +maintainers:
>> +  - Martin Povi=C5=A1er <povik+lin@cutebit.org>

(...)

>> +  dmas:
>> +    minItems: 16
>> +    maxItems: 24
>> +    description:
>> +      DMA channels corresponding to the SERDES units in the =
peripheral. They are
>> +      listed in groups of four per cluster, and within the group =
they are given
>> +      as associated to the TXA, RXA, TXB, RXB units.
>> +
>> +  dma-names:
>> +    minItems: 16
>> +    maxItems: 24
>> +    items:
>> +      pattern: '^(tx|rx)[0-5][ab]$'
>=20
> Use consistent quotes (everywhere " or ').

OK

> Describe the items because otherwise you allow any order. The list =
will
> be unfortunately quite long, but still readable enough.

Well, I would assume the =E2=80=98dmas=E2=80=99 property as described =
above has an implicit
natural order, and the dma-names are tied to it. You order it like the =
other
per-cluster properties, and then within the cluster the order is fixed =
to
'TXA, RXA, TXB, RXB=E2=80=99 (maybe the word =E2=80=98respectively=E2=80=99=
 thrown into the description
would have made it clearer).

Anyway that=E2=80=99s just discussing my assumptions. I can roll out the =
items list
for =E2=80=98dma-names=E2=80=99, if that=E2=80=99s what you mean. Or do =
you mean explicitly describing
the items in =E2=80=98dmas=E2=80=99 too?

>> +    description: |
>> +      Names for the DMA channels: 'tx'/'rx', then cluster number, =
then 'a'/'b'
>> +      based on the associated SERDES unit.
>> +

(...)

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mca: mca@9b600000 {
>=20
> You called it I2S transceiver but isn't it also actually I2S =
controller?
> If yes, then the node name should be probably "i2s".

It=E2=80=99s a peripheral you use to transmit and receive samples over =
I2S, frankly
I don't know the nomenclature.

>> +      compatible =3D "apple,t6000-mca", "apple,mca";
>> +      reg =3D <0x9b600000 0x10000>,
>> +            <0x9b200000 0x20000>;
>> +
>=20
>=20
> Best regards,
> Krzysztof

All best,
Martin

