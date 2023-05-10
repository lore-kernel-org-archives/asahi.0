Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475B26AA3
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 07:33:50 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683704028; bh=KX7K3tWMwUSNfSD7Emzei/zBhnBTyUmdhpZWoZTlsNs=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=iSEYaO2/qOoYodN2VM4otWvMXPzcr3UM/htHE9RgNKppQDz60o5VRIVkolATnAH1s
	 /Qi1j/leD7dRVRPPLQrC3rdHAG1tT38xg/DIkBoPeB0hH3NOC5xDpP5Y5jbfy3vbo8
	 9VFLOc+HJ0uuEGg/PEr8hkwnPgtQ70Dd11SItWy8=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <A8647EF5-566A-4B99-9020-772810CB2BF7@cutebit.org>
Date: Wed, 10 May 2023 09:33:47 +0200
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>,
 Shenghao Ding <shenghao-ding@ti.com>,
 kevin-lu@ti.com,
 alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <F12DE31C-E167-47F0-BAE0-C09538C5C3C8@cutebit.org>
References: <20230509153412.62847-1-povik+lin@cutebit.org>
 <baf338a7-1e63-4842-32a1-8f63f850bd2d@linaro.org>
 <A8647EF5-566A-4B99-9020-772810CB2BF7@cutebit.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


> On 10. 5. 2023, at 9:30, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>=20
>> On 10. 5. 2023, at 9:17, Krzysztof Kozlowski =
<krzysztof.kozlowski@linaro.org> wrote:
>>=20
>> On 09/05/2023 17:34, Martin Povi=C5=A1er wrote:
>>> A bunch of TI's codecs have binding schemas which force =
#sound-dai-cells
>>> to one despite those codecs only having a single DAI. Allow for =
bindings
>>> with zero DAI cells and deprecate the former non-zero value.
>>>=20
>>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>>> ---

>>>  '#sound-dai-cells':
>>> -    const: 1
>>> +    # The codec has a single DAI, the #sound-dai-cells=3D<1>; case =
is left in for backward
>>> +    # compatibility but is deprecated.
>>> +    enum: [0, 1]
>>=20
>> Does it? I see playback and capture.
>=20
> I think so. Playback and capture are not separate DAIs.
>=20
> Martin

I double checked, I am pretty sure. There=E2=80=99s a single =
snd_soc_dai_driver,
which becomes a single DAI.

Martin

>=20
>>=20
>> Best regards,
>> Krzysztof
>=20
>=20

